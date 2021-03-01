Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C1329540
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 00:38:50 +0100 (CET)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGs7k-0003li-UT
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 18:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lGs5H-0002Zs-Ur
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 18:36:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lGs5F-0007k0-9R
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 18:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614641771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGu3+Z9S0/n+m3F3rnAp7SxPc33Mr47djnBjXUIToYY=;
 b=drHuTK5AYWvs5wRPHjJ47bvffivDBwbbhhfkDfJ3a2RhJt8kR6kqDzO75y80pkh4fc/VAy
 GfbmDBXqVs4rLMl1s0BrnKjxCu6QAlfopARthCi+7mkSDuOKE1pSiKyggMVvoO8k+BOrkl
 Eodqf5jALbGSAnlD5jMb8mEjN8dDLmI=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-f5ny3P3CM9inG8JXwYQ6pA-1; Mon, 01 Mar 2021 18:36:10 -0500
X-MC-Unique: f5ny3P3CM9inG8JXwYQ6pA-1
Received: by mail-ot1-f72.google.com with SMTP id y12so2181959otq.1
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 15:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yGu3+Z9S0/n+m3F3rnAp7SxPc33Mr47djnBjXUIToYY=;
 b=ocPnrP8OLBMOljQyrWTAGOZom8TE+jduL5gWuoMOWgnMulUQ59h7fGZ4CMP4OmM3jw
 nQwlkPkTeoTW1JJkvfFYD1yf8Ps4QSW4EwXTlGCEW18ExcvO1u/7UX0bpyA4qMOqpeM3
 apEImkEv7ZS0+FiraswHfa45OHyasLKpka2I94V8yqbxg2h0/FO4iKnvjpr3xTPZJdsF
 U3lbJ/x8inM5bhQjStqrgZ3tr9ve9ILniQhPCHBI/xus4eKxZG13He9HYU2hBV8MUCMY
 c6UGXHclJQ2O4g/5HMZ4yucqRt+inu7X28BPbcUaEihHUP3ZQDu+8FbopmCIZtbaQcig
 Fg5w==
X-Gm-Message-State: AOAM532N/o98CFRgEMlRHZmaj8FlXs7Tv/eE+gWqjaDysW289xfpHE/d
 P7NXeRg6R0/j83pqL/7Xsk1mzuz7iuYD1d92yCOsXi4ESdumju6IbrGSlwmIo/yPcWOXVBKAIXK
 BMx3ps4jttVBIZes=
X-Received: by 2002:a05:6808:d47:: with SMTP id
 w7mr1151605oik.150.1614641769753; 
 Mon, 01 Mar 2021 15:36:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxYkvcV1TiITlURM9DbaHVYm2/YFucMjWpYz7LyqfwvqqwAzTJTzUGPYlR1tvAQY58a2aaBA==
X-Received: by 2002:a05:6808:d47:: with SMTP id
 w7mr1151597oik.150.1614641769622; 
 Mon, 01 Mar 2021 15:36:09 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id a12sm4087885otp.30.2021.03.01.15.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 15:36:09 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block: Clarify error messages pertaining to 'node-name'
Date: Mon,  1 Mar 2021 17:36:06 -0600
Message-Id: <20210301233607.748412-2-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301233607.748412-1-ckuehl@redhat.com>
References: <20210301233607.748412-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported-by: Tingting Mao <timao@redhat.com>
Fixes: https://bugzilla.redhat.com/1651437
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 block.c                    | 8 ++++----
 tests/qemu-iotests/040     | 4 ++--
 tests/qemu-iotests/249.out | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index a1f3cecd75..2daff6d29a 100644
--- a/block.c
+++ b/block.c
@@ -1440,7 +1440,7 @@ static void bdrv_assign_node_name(BlockDriverState *bs,
          * Check for empty string or invalid characters, but not if it is
          * generated (generated names use characters not available to the user)
          */
-        error_setg(errp, "Invalid node name");
+        error_setg(errp, "Invalid node-name: '%s'", node_name);
         return;
     }
 
@@ -1453,7 +1453,7 @@ static void bdrv_assign_node_name(BlockDriverState *bs,
 
     /* takes care of avoiding duplicates node names */
     if (bdrv_find_node(node_name)) {
-        error_setg(errp, "Duplicate node name");
+        error_setg(errp, "Duplicate nodes with node-name='%s'", node_name);
         goto out;
     }
 
@@ -5432,7 +5432,7 @@ BlockDriverState *bdrv_lookup_bs(const char *device,
         }
     }
 
-    error_setg(errp, "Cannot find device=%s nor node_name=%s",
+    error_setg(errp, "Cannot find device=\'%s\' nor node-name=\'%s\'",
                      device ? device : "",
                      node_name ? node_name : "");
     return NULL;
@@ -6752,7 +6752,7 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
     AioContext *aio_context;
 
     if (!to_replace_bs) {
-        error_setg(errp, "Node name '%s' not found", node_name);
+        error_setg(errp, "Failed to find node with node-name='%s'", node_name);
         return NULL;
     }
 
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 7ebc9ed825..336ff7c4f2 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -175,13 +175,13 @@ class TestSingleDrive(ImageCommitTestCase):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top_node='badfile', base_node='base')
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', "Cannot find device= nor node_name=badfile")
+        self.assert_qmp(result, 'error/desc', "Cannot find device='' nor node-name='badfile'")
 
     def test_base_node_invalid(self):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top_node='mid', base_node='badfile')
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', "Cannot find device= nor node_name=badfile")
+        self.assert_qmp(result, 'error/desc', "Cannot find device='' nor node-name='badfile'")
 
     def test_top_path_and_node(self):
         self.assert_no_active_block_jobs()
diff --git a/tests/qemu-iotests/249.out b/tests/qemu-iotests/249.out
index 92ec81db03..d2bf9be85e 100644
--- a/tests/qemu-iotests/249.out
+++ b/tests/qemu-iotests/249.out
@@ -18,7 +18,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.
                      'filter-node-name': '1234'}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
-{"error": {"class": "GenericError", "desc": "Invalid node name"}}
+{"error": {"class": "GenericError", "desc": "Invalid node-name: '1234'"}}
 
 === Send a write command to a drive opened in read-only mode (2)
 
-- 
2.29.2


