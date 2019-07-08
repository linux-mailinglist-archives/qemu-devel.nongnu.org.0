Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A86206C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 16:24:47 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkUZT-0008Oo-1Z
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 10:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40008)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hkUTw-0002Bt-N2
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 10:19:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hkUTt-0000id-QO
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 10:19:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43650)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hkUTo-0000Ux-Q0; Mon, 08 Jul 2019 10:18:57 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 52E5B3002738;
 Mon,  8 Jul 2019 14:18:40 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-204.ams2.redhat.com
 [10.36.116.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 492F851F02;
 Mon,  8 Jul 2019 14:18:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  8 Jul 2019 16:18:12 +0200
Message-Id: <20190708141812.3974-7-kwolf@redhat.com>
In-Reply-To: <20190708141812.3974-1-kwolf@redhat.com>
References: <20190708141812.3974-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 08 Jul 2019 14:18:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 6/6] qcow2: Allow -o compat=v3 during qemu-img
 amend
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

Commit b76b4f60 allowed '-o compat=3Dv3' as an alias for the
less-appealing '-o compat=3D1.1' for 'qemu-img create' since we want to
use the QMP form as much as possible, but forgot to do likewise for
qemu-img amend.  Also, it doesn't help that '-o help' doesn't list our
new preferred spellings.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 2a59eb27fe..039bdc2f7e 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4823,9 +4823,9 @@ static int qcow2_amend_options(BlockDriverState *bs=
, QemuOpts *opts,
             compat =3D qemu_opt_get(opts, BLOCK_OPT_COMPAT_LEVEL);
             if (!compat) {
                 /* preserve default */
-            } else if (!strcmp(compat, "0.10")) {
+            } else if (!strcmp(compat, "0.10") || !strcmp(compat, "v2"))=
 {
                 new_version =3D 2;
-            } else if (!strcmp(compat, "1.1")) {
+            } else if (!strcmp(compat, "1.1") || !strcmp(compat, "v3")) =
{
                 new_version =3D 3;
             } else {
                 error_setg(errp, "Unknown compatibility level %s", compa=
t);
@@ -5098,7 +5098,7 @@ static QemuOptsList qcow2_create_opts =3D {
         {
             .name =3D BLOCK_OPT_COMPAT_LEVEL,
             .type =3D QEMU_OPT_STRING,
-            .help =3D "Compatibility level (0.10 or 1.1)"
+            .help =3D "Compatibility level (v2 [0.10] or v3 [1.1])"
         },
         {
             .name =3D BLOCK_OPT_BACKING_FILE,
--=20
2.20.1


