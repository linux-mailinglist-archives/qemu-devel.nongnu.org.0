Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F2EF4E90
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 15:43:45 +0100 (CET)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT5UG-0001Pc-JV
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 09:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iT5RX-0006q8-TM
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:40:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iT5RW-0000DO-Na
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:40:55 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21515
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iT5RW-0000D5-K6
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573224054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UBY+wDrmbH0dOz1gwdflfkjU8AAZxX94aYyKdgHPkGU=;
 b=gynS1Dbm+ZFhg5Pw2buh4Zw6dVBDxDk9vk/A/CyM5tQYEC/OycYylvRwD9TPJV4e6XmvfM
 VDrQTOThpJHQuzbHPCvZO8UdInaMNSi5z+wvUB61PAuGgyrtsM/dDJqYg2ycqKS54n81bv
 otZsvSUCQTKL0Ax0+di32MjULEUg+Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-ZAWdQ2pFNCSgPFOfyW4oiw-1; Fri, 08 Nov 2019 09:40:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96D10107ACC4;
 Fri,  8 Nov 2019 14:40:49 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A91435D6B7;
 Fri,  8 Nov 2019 14:40:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw: Remove dynamic field width from trace events
Date: Fri,  8 Nov 2019 15:40:39 +0100
Message-Id: <20191108144042.30245-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ZAWdQ2pFNCSgPFOfyW4oiw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric noted in [1] the dtrace via stap backend can not support
the dynamic '*' width format.
I'd really like to use dynamic width in trace event because the
read/write accesses are easier to read but it is not a priority.
Since next release is close, time to fix LP#1844817 [2].

Since v1:
- Do not update the qemu_log_mask() calls in hw/mips/gt64xxx_pci.c

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg04720.html
[2] https://bugs.launchpad.net/qemu/+bug/1844817

Philippe Mathieu-Daud=C3=A9 (3):
  hw/block/pflash: Remove dynamic field width from trace events
  hw/mips/gt64xxx: Remove dynamic field width from trace events
  trace: Forbid dynamic field width in event format

 hw/block/pflash_cfi01.c       |  8 ++++----
 hw/block/pflash_cfi02.c       |  8 ++++----
 hw/mips/gt64xxx_pci.c         | 16 ++++++++--------
 hw/block/trace-events         |  8 ++++----
 hw/mips/trace-events          |  4 ++--
 scripts/tracetool/__init__.py |  3 +++
 6 files changed, 25 insertions(+), 22 deletions(-)

--=20
2.21.0


