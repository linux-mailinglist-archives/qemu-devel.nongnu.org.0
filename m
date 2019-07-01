Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E771048199
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 14:13:39 +0200 (CEST)
Received: from localhost ([::1]:46458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcqW3-0008Fg-4M
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 08:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32914)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hcqGR-0006sH-Lf
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hcqGQ-000694-Db
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:57:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hcqGN-0005zN-Fa; Mon, 17 Jun 2019 07:57:27 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A409FF9E6A;
 Mon, 17 Jun 2019 11:57:26 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-99.ams2.redhat.com [10.36.117.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75ACF7DF66;
 Mon, 17 Jun 2019 11:57:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 17 Jun 2019 13:57:21 +0200
Message-Id: <20190617115721.27525-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 17 Jun 2019 11:57:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] block/null: Expose read-zeroes option in QAPI
 schema
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cd219eb1e55 added the read-zeroes option for the null-co and
null-aio block driver, but forgot to add them to the QAPI schema.
Therefore, this option wasn't available in -blockdev and blockdev-add
until now.

Add the missing option in the schema to make it available there, too.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 61124431d8..0d43d4f37c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2890,11 +2890,13 @@
 # @latency-ns: emulated latency (in nanoseconds) in processing
 #              requests. Default to zero which completes requests immedi=
ately.
 #              (Since 2.4)
+# @read-zeroes: if true, reads from the device produce zeroes; if false,=
 the
+#               buffer is left unchanged. (default: false; since: 4.1)
 #
 # Since: 2.9
 ##
 { 'struct': 'BlockdevOptionsNull',
-  'data': { '*size': 'int', '*latency-ns': 'uint64' } }
+  'data': { '*size': 'int', '*latency-ns': 'uint64', '*read-zeroes': 'bo=
ol' } }
=20
 ##
 # @BlockdevOptionsNVMe:
--=20
2.20.1


