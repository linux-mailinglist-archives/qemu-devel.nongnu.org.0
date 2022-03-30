Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160B4ED095
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:01:06 +0200 (CEST)
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiFN-00025W-L8
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:01:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftG-0008MY-HT
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:08 -0400
Received: from [2a00:1450:4864:20::12f] (port=40628
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftB-0003St-Mj
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:05 -0400
Received: by mail-lf1-x12f.google.com with SMTP id t25so38068064lfg.7
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OE/MsvsxnMAX47sMi6igwm2uGZqPl+rPYnGsx/0bCc=;
 b=jQfVTtFqr12w5H26AkQLSl49X7vgja+pFpWilzxemBPNrC/eOVCNz+/C4AjqwJjmyB
 vRCgSF3Y6DsJngryZ+ZJeyFhgIvwYmrsFpGy8Vq7g8ypSHJdtLbB7J+iBKU3XcLCd/Ts
 LHBRuV9Z+vb8FgW62KMvSxS89wG8zl4Dac+5H6d9JbpYnsS9in1uqrufy+lprv2FAz08
 TmkWR/PhbE2T67d03C/L+FGgHfBgY/DidMNGUNGdMrfAFdoMt7QFOWAKaF0aWEYDNy42
 Vc5JOKSZUrp2ihL9Uefrr+ISDeGFpng/XcvyPgYyzqReNj3P2P4HbTTrQd5qnyZWiMoM
 BrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2OE/MsvsxnMAX47sMi6igwm2uGZqPl+rPYnGsx/0bCc=;
 b=xJcbAOcXW3IIv/LwQtMpjO2mLiqNEhLN6pco0knsQMeJRS9GIB/48nEeELQa50OOe6
 xi8BzLe8bEMjH3fWW4TK06JttoJ5WTOAs9hnF72aYgo30K4Fd4S1Ayo4sGRgfSfkixZc
 izrDjNRs4vr1emJWLVaqocPQgTQ+sYI/+QOkyHlRfV16XllWVtFHHrZBAPNfvwYOztcH
 aKsEfrEgMJNF6ML2XL5WLxSKeVMbkW9Pqsu2tfKNmsm18vtU9SDtKGlkE+di20CWVWwG
 k6i/JQpXbdZgd5Y2QJcifEJYo2Zdtz0FQTbMDRUxbVYTbyR4DJAWgWgcZhqWbacxTY6n
 tmPw==
X-Gm-Message-State: AOAM533C+ObpK9med4aM9fwe1tvgQ2YtaC4D9E6BOhSU8TzqYSztSFYC
 EpqxD18DI4IT64Tsbh9ZkceOPA==
X-Google-Smtp-Source: ABdhPJxlCtFV6JDNhxs4yN45grvQOp3oUWedgshNfnrXX2ijRlOFv3QYeIe1z1Yhs9ZOtrhIH0pnVw==
X-Received: by 2002:ac2:5549:0:b0:44a:6da1:b17e with SMTP id
 l9-20020ac25549000000b0044a6da1b17emr8527342lfk.679.1648675799585; 
 Wed, 30 Mar 2022 14:29:59 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:59 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 45/45] block/copy-before-write: correct permission scheme
Date: Thu, 31 Mar 2022 00:29:02 +0300
Message-Id: <20220330212902.590099-46-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 hreitz@redhat.com, vsementsov@openvz.org, John Snow <jsnow@redhat.com>
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/copy-before-write.c                   | 17 ++++++++---------
 tests/qemu-iotests/tests/image-fleecing     | 20 +++++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out |  8 --------
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4fad564691..90a9c7874a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -319,12 +319,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
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
 
@@ -378,13 +374,15 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     int64_t cluster_size;
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
@@ -444,6 +442,7 @@ static void cbw_close(BlockDriverState *bs)
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
+    .independent_close = true,
 
     .bdrv_open                  = cbw_open,
     .bdrv_close                 = cbw_close,
diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index b7e5076104..23b55ded70 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -131,9 +131,13 @@ def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
         if bitmap:
             fl_cbw['bitmap'] = {'node': src_node, 'name': 'bitmap0'}
 
-        log(vm.qmp('blockdev-add', fl_cbw))
-
-        log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
+        log(vm.qmp('transaction', {'actions': [
+            {'type': 'blockdev-add', 'data': fl_cbw},
+            {'type': 'x-blockdev-replace', 'data': {
+                'parent-type': 'qdev',
+                'qdev-id': 'sda',
+                'new-child': 'fl-cbw'}}
+        ]}))
 
         if use_snapshot_access_filter:
             log(vm.qmp('blockdev-add', {
@@ -242,8 +246,14 @@ def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
     if use_cbw:
         if use_snapshot_access_filter:
             log(vm.qmp('blockdev-del', node_name='fl-access'))
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
index acfc89ff0e..33c6c239da 100644
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
 
@@ -152,7 +150,6 @@ Done
 {"return": {}}
 {"return": {}}
 {"return": {}}
-{"return": {}}
 
 --- Setting up NBD Export ---
 
@@ -196,7 +193,6 @@ read -P0 0x3fe0000 64k
 {"return": {}}
 {"return": {}}
 {"return": {}}
-{"return": {}}
 
 --- Confirming writes ---
 
@@ -224,7 +220,6 @@ Done
 {"return": {}}
 {"return": {}}
 {"return": {}}
-{"return": {}}
 
 --- Setting up NBD Export ---
 
@@ -280,7 +275,6 @@ read failed: Invalid argument
 {"return": {}}
 {"return": {}}
 {"return": {}}
-{"return": {}}
 
 --- Confirming writes ---
 
@@ -308,7 +302,6 @@ Done
 {"return": {}}
 {"return": {}}
 {"return": {}}
-{"return": {}}
 
 --- Starting actual backup ---
 
@@ -343,7 +336,6 @@ read -P0 0x3fe0000 64k
 {"return": {}}
 {"return": {}}
 {"return": {}}
-{"return": {}}
 
 --- Confirming writes ---
 
-- 
2.35.1


