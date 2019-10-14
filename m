Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1CED66D7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 18:06:28 +0200 (CEST)
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK2ra-0005Mr-Tv
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 12:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iK2pB-0002p5-5v
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:03:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iK2pA-0006Qa-2M
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:03:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35922)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iK2p7-0006MU-OF; Mon, 14 Oct 2019 12:03:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F218C308FE9A;
 Mon, 14 Oct 2019 16:03:52 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E717E5C541;
 Mon, 14 Oct 2019 16:03:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/15] replay: disable default snapshot for record/replay
Date: Mon, 14 Oct 2019 18:03:37 +0200
Message-Id: <20191014160343.8211-4-kwolf@redhat.com>
In-Reply-To: <20191014160343.8211-1-kwolf@redhat.com>
References: <20191014160343.8211-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 14 Oct 2019 16:03:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

From: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>

This patch disables setting '-snapshot' option on by default
in record/replay mode. This is needed for creating vmstates in record
and replay modes.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 vl.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 0a295e5d77..fce9ce2364 100644
--- a/vl.c
+++ b/vl.c
@@ -1203,7 +1203,7 @@ static void configure_blockdev(BlockdevOptionsQueue=
 *bdo_queue,
         qapi_free_BlockdevOptions(bdo->bdo);
         g_free(bdo);
     }
-    if (snapshot || replay_mode !=3D REPLAY_MODE_NONE) {
+    if (snapshot) {
         qemu_opts_foreach(qemu_find_opts("drive"), drive_enable_snapshot=
,
                           NULL, NULL);
     }
@@ -3066,7 +3066,13 @@ int main(int argc, char **argv, char **envp)
                 drive_add(IF_PFLASH, -1, optarg, PFLASH_OPTS);
                 break;
             case QEMU_OPTION_snapshot:
-                snapshot =3D 1;
+                {
+                    Error *blocker =3D NULL;
+                    snapshot =3D 1;
+                    error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED,
+                               "-snapshot");
+                    replay_add_blocker(blocker);
+                }
                 break;
             case QEMU_OPTION_numa:
                 opts =3D qemu_opts_parse_noisily(qemu_find_opts("numa"),
--=20
2.20.1


