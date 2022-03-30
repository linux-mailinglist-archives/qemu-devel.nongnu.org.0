Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C514EBF05
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:41:18 +0200 (CEST)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVlN-0003uz-U7
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:41:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJc-0002SD-Fc; Wed, 30 Mar 2022 06:12:36 -0400
Received: from smtp46.i.mail.ru ([94.100.177.106]:54016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJZ-0007zR-Qf; Wed, 30 Mar 2022 06:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=duCgqBfQWvkr73bB/B1h4NEV+jVn17TzbRegznZfUWA=; 
 t=1648635153;x=1649240553; 
 b=nPi7Tppn6MxlWtzBo62321ZArMU476BOtBsirJtk1F8FeHrsxtFXHAlZUq4VH/X8RTCbK65YwScKe7+iXgPHu/LdlHuTuDFpOOa1AVtDVokhkgBTR7yen9CNUWlNSzPahsoP68e3wvriBCwO65kZbSOGABdK5PLSi1RVblU0v34qgei7p8wDKE4TDoV+dlJSdRju3QM5gwu6bpqocZaqXMWp1Q4nGn6gbP5MJI6dfl/bQHRuns7PeL43OFntik9md0TcaB4ujA3PW3yusdRv2D8t1V+nf4EekcnMq9A3GmTK11hAfsUYJFzjzd3dj+M41d1uiHdN4JrzRKqz62c99Q==;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZVJW-00048P-68; Wed, 30 Mar 2022 13:12:30 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH v4 45/45] block/copy-before-write: correct permission scheme
Date: Wed, 30 Mar 2022 13:12:17 +0300
Message-Id: <20220330101217.4229-7-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp46.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB619F76FA1B2E2E286FAC27582EB57AF1A700894C459B0CD1B92FCCCC984F7535C6D8649439DD1E23D1338E05E3556DF6F7B1AE0A5D0512672F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE716FAD50E497B9C14EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063750DEB490C003C9A78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F2D6D5E2530B2A5C32D8EEA1920655EF6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC0AF0D7F32967DADC3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637ECEE170C37D6D741D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F249797B4B1AC1449262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7AB91EFAE5A2C4071B9DB75DF1ED18BF1CE9E1789D5353BE88B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34FD9114F69CA58D1E5804A7BDE9449E477186A6FB7996B774E8BA38E8C7116F79DC5B94B9077D225B1D7E09C32AA3244C7B8880B6E2347D777AF1A9B2704DB0133C6EB905E3A8056BDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+UfjpqO2xsp6g==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEF59FC8FC90DF386951E9DB6389C7A8E403B414F5458D5A60E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.106;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp46.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finally we can strictly unshare write on source node, as all write must
go through copy-before-write filter. For this to work:

 - Declare independent close, so that blockdev-del transaction action
   may detach children of removed node at prepare phase (that's for
   filter removement). We can do it because copy-before-write filter
   doesn't do any IO on its children on close().

 - Support BDRV_O_NOPERM, so that blockdev-add transaction action can
   skip intermediate permission update. We can do it because
   copy-before-write filter doesn't do any IO on its children on
   open().

 - Move to new block-graph modifying API in iotest image-fleecing.
   Separate qom-set + del/add doesn't work anymore for
   copy-before-write filter, because intermediate state violate new
   strict permissions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block/copy-before-write.c                   | 17 ++++++------
 tests/qemu-iotests/tests/image-fleecing     | 29 ++++++++++++++-------
 tests/qemu-iotests/tests/image-fleecing.out |  2 --
 3 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 8aa2cb6a85..0bc97b4a47 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -136,12 +136,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
         bdrv_default_perms(bs, c, role, reopen_queue,
                            perm, shared, nperm, nshared);
 
-        if (!QLIST_EMPTY(&bs->parents)) {
-            if (perm & BLK_PERM_WRITE) {
-                *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
-            }
-            *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
-        }
+        *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
     }
 }
 
@@ -152,13 +148,15 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     BdrvDirtyBitmap *copy_bitmap;
     int ret;
 
-    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    ret = bdrv_open_file_child_common(NULL, options, "file", bs,
+                                      !(flags & BDRV_O_NOPERM), errp);
     if (ret < 0) {
         return ret;
     }
 
-    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
-                                BDRV_CHILD_DATA, false, errp);
+    s->target = bdrv_open_child_common(NULL, options, "target", bs,
+                                       &child_of_bds, BDRV_CHILD_DATA, false,
+                                       !(flags & BDRV_O_NOPERM), errp);
     if (!s->target) {
         return -EINVAL;
     }
@@ -193,6 +191,7 @@ static void cbw_close(BlockDriverState *bs)
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
+    .independent_close = true,
 
     .bdrv_open                  = cbw_open,
     .bdrv_close                 = cbw_close,
diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index a58b5a1781..3ee5e64edb 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -94,14 +94,17 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
 
     # Establish CBW from source to fleecing node
     if use_cbw:
-        log(vm.qmp('blockdev-add', {
-            'driver': 'copy-before-write',
-            'node-name': 'fl-cbw',
-            'file': src_node,
-            'target': tmp_node
-        }))
-
-        log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
+        log(vm.qmp('transaction', {'actions': [
+            {'type': 'blockdev-add', 'data': {
+                'driver': 'copy-before-write',
+                'node-name': 'fl-cbw',
+                'file': src_node,
+                'target': tmp_node}},
+            {'type': 'x-blockdev-replace', 'data': {
+                'parent-type': 'qdev',
+                'qdev-id': 'sda',
+                'new-child': 'fl-cbw'}}
+        ]}))
     else:
         log(vm.qmp('blockdev-backup',
                    job_id='fleecing',
@@ -152,8 +155,14 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('')
 
     if use_cbw:
-        log(vm.qmp('qom-set', path=qom_path, property='drive', value=src_node))
-        log(vm.qmp('blockdev-del', node_name='fl-cbw'))
+        log(vm.qmp('transaction', {'actions': [
+            {'type': 'x-blockdev-replace', 'data': {
+                'parent-type': 'qdev',
+                'qdev-id': 'sda',
+                'new-child': src_node}},
+            {'type': 'blockdev-del', 'data': {
+                'node-name': 'fl-cbw'}}
+        ]}))
     else:
         log(vm.qmp('block-job-cancel', device='fleecing'))
         e = vm.event_wait('BLOCK_JOB_CANCELLED')
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index e96d122a8b..1aed446ccb 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -79,7 +79,6 @@ Done
 
 --- Setting up Fleecing Graph ---
 
-{"return": {}}
 {"return": {}}
 {"return": {}}
 
@@ -124,7 +123,6 @@ read -P0 0x3fe0000 64k
 {"return": {}}
 {"return": {}}
 {"return": {}}
-{"return": {}}
 
 --- Confirming writes ---
 
-- 
2.35.1


