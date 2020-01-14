Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD513B221
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 19:30:32 +0100 (CET)
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irQxS-0007Ft-O5
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 13:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1irQuw-00059A-Jr
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 13:27:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1irQuu-0004nM-SD
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 13:27:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29405
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1irQuu-0004nC-PB
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 13:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579026472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qvUsbCBwHsJsUUJKf9r/nCGwkSBUDF9AuSLOLzIaasE=;
 b=O7mr2FFLvJpTqVHcYYFb1IjJwGomeNoti6MXhinRqjq4LJPDlJ1jvp1KlKLRXhs6E/zWwE
 cpedoxphUPTmH19knnHw06wn+r4nUZNw4bjr79eHxo8OZ7OWur5F99xZmKyhfw3+NvK0dy
 EK6cO+Nlkjv6WJIU+zZ2xi8kNIn0Nfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-BNbG6bFCOrW-E0-IooQfcQ-1; Tue, 14 Jan 2020 13:27:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A45A3107ACC5;
 Tue, 14 Jan 2020 18:27:47 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-253.ams2.redhat.com
 [10.36.116.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9D645C1D6;
 Tue, 14 Jan 2020 18:27:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] qmp: Optionally run handlers in coroutines
Date: Tue, 14 Jan 2020 19:27:31 +0100
Message-Id: <20200114182735.5553-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: BNbG6bFCOrW-E0-IooQfcQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some QMP command handlers can block the main loop for a relatively long
time, for example because they perform some I/O. This is quite nasty.
Allowing such handlers to run in a coroutine where they can yield (and
therefore release the BQL) while waiting for an event such as I/O
completion solves the problem.

This series adds the infrastructure to allow this and switches
block_resize to run in a coroutine as a first example.

This is an alternative solution to Marc-Andr=C3=A9's "monitor: add
asynchronous command type" series.

v2:
- Fix typo in a commit message [Eric]
- Use hyphen instead of underscore for the test command [Eric]
- Mark qmp_block_resize() as coroutine_fn [Stefan]


Kevin Wolf (4):
  qapi: Add a 'coroutine' flag for commands
  vl: Initialise main loop earlier
  qmp: Move dispatcher to a coroutine
  block: Mark 'block_resize' as coroutine

 qapi/block-core.json                    |  3 +-
 tests/qapi-schema/qapi-schema-test.json |  1 +
 docs/devel/qapi-code-gen.txt            |  4 ++
 include/qapi/qmp/dispatch.h             |  3 +
 monitor/monitor-internal.h              |  5 +-
 blockdev.c                              |  6 +-
 monitor/monitor.c                       | 24 ++++---
 monitor/qmp.c                           | 83 ++++++++++++++++---------
 qapi/qmp-dispatch.c                     | 38 ++++++++++-
 tests/test-qmp-cmds.c                   |  4 ++
 vl.c                                    | 10 +--
 scripts/qapi/commands.py                | 17 +++--
 scripts/qapi/doc.py                     |  2 +-
 scripts/qapi/expr.py                    |  4 +-
 scripts/qapi/introspect.py              |  2 +-
 scripts/qapi/schema.py                  |  9 ++-
 tests/qapi-schema/qapi-schema-test.out  |  2 +
 tests/qapi-schema/test-qapi.py          |  7 ++-
 18 files changed, 158 insertions(+), 66 deletions(-)

--=20
2.20.1


