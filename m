Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF2414C8B2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 11:24:01 +0100 (CET)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwkVs-0002sR-9b
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 05:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iwkUi-0001Th-Sd
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 05:22:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iwkUh-00047F-TM
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 05:22:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47709
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iwkUh-00046x-Qc
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 05:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580293367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jUsZWpTMiZ9biG5SVcZxoAgpjBNr0I0y2cMIXmB7g5s=;
 b=MGihCXGT503rpoYS1pGYOEf6ugAcCVsxYt7a0PNQG6SJaz1mOz9jq21Fx7GRvVNAcb+nLv
 sGUjuisbDLiy06xcpDhGNBMhtKdjnmnDAViExwmmJSHqRtLgxmRgV7sUJbpJ5md276CtJQ
 0mXrlZe9S4nEY27zZLS/Z2x5cFPXq0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-LDNdjhE6OA2XZSImd0fIWQ-1; Wed, 29 Jan 2020 05:22:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03F2210054E3;
 Wed, 29 Jan 2020 10:22:43 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-205.ams2.redhat.com
 [10.36.116.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A01C7C42C;
 Wed, 29 Jan 2020 10:22:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/4] monitor: Refactoring in preparation for
 qemu-storage-daemon
Date: Wed, 29 Jan 2020 11:22:35 +0100
Message-Id: <20200129102239.31435-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: LDNdjhE6OA2XZSImd0fIWQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series creates a QAPI module 'control' that can be used from tools
outside the system emulator and moves some monitor initialisation code
from vl.c to monitor code.

It is split from the series to introduce qemu-storage-daemon because
these refactorings make sense on their own as cleanups.

v3:
- Cleaned up #include [Markus]
- Changed schema documenttion headline [Markus]
- Changes comments according to review [Markus]

v2:
- Removed allow_hmp parameter from monitor_init_opts() [Markus]
- Renamed monitor.json to control.json [Markus]

Kevin Wolf (4):
  monitor: Move monitor option parsing to monitor/monitor.c
  qapi: Create module 'control'
  monitor: Create monitor/qmp-cmds-control.c
  monitor: Move qmp_query_qmp_schema to qmp-cmds-control.c

 qapi/control.json          | 218 +++++++++++++++++++++++++++++++++++++
 qapi/misc.json             | 212 ------------------------------------
 qapi/qapi-schema.json      |   1 +
 include/monitor/monitor.h  |   3 +
 include/sysemu/sysemu.h    |   1 -
 monitor/monitor-internal.h |   4 +
 monitor/hmp-cmds.c         |   1 +
 monitor/misc.c             | 127 +--------------------
 monitor/monitor.c          |  48 ++++++++
 monitor/qmp-cmds-control.c | 169 ++++++++++++++++++++++++++++
 monitor/qmp-cmds.c         |  15 +--
 monitor/qmp.c              |   2 +-
 tests/qtest/qmp-test.c     |   2 +-
 ui/gtk.c                   |   1 +
 vl.c                       |  45 +-------
 monitor/Makefile.objs      |   3 +-
 qapi/Makefile.objs         |   6 +-
 17 files changed, 455 insertions(+), 403 deletions(-)
 create mode 100644 qapi/control.json
 create mode 100644 monitor/qmp-cmds-control.c

--=20
2.20.1


