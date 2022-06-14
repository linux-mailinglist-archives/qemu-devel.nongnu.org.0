Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDFD54A8A5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:20:14 +0200 (CEST)
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yyL-0003dG-7L
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvN-0000vd-AN
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:09 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvL-00010M-SZ
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so8031328pjb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0y2TFEqOSWX2sasE6c7pK+W7e00REmrQJniw6QVW8Dc=;
 b=5xyPIZno/EKK/KLDjARVWlVz/xJxtYxPR3pcI8orrAMrSnGuJQRDFvAAvYEpExUUJZ
 FkGpTfaovgvHeRps8LgeE0CIOykHmpBnuJ8xJLZ0wJeQFga1hFQH0SglBo8G4wx/l/1p
 VB+r6LW+aCTAID426Y+j5dSM9WY0FJQh+n7FKS0ItlqFsXIJu/mP24XX1XkBBHdla6bc
 0XLh2erIcPhqeNEuQ1UH6stu1MPDaT2xOkV2Yj3XgFYCgLKF/cjlNdKmsln1VMjmtitH
 Xw868YveGEVj7sJigOHUceVd7NU8ZMg3i+qTDuD4Y+S0WflY1Mf2yNNC4dAeHmpZLr+d
 4cJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0y2TFEqOSWX2sasE6c7pK+W7e00REmrQJniw6QVW8Dc=;
 b=TojEDWetPSiWXergNdsIrUNiEVBBfmrdT1fG0P4EKVRcu5f/HePYFWnAyRc0hUUR6o
 tfyiIOU2aG3Ws8WdS9aNTh5TNMvBxvk98TADizz12IDbktpeHOoJPUrZuG4S6YW9o3Kn
 QMbQ8RJO0BXluFFbEzCGutziGaor8n/h8ypKag1xi+2m5esxRzzCHZNr23dN0ba5FxeS
 +rwIAwdZ9eKbjtejS8skvEMQHgEjO6GCKt1O2tRMwLzqFV7wxFGCHRyopt3S8R0hDgyw
 KDorc6X2l4o+oolOctkk6gs88YJZlnzayXQMs3sxwyf7C/okLJ9jUPiIHAz1uvWUmAFc
 qAmg==
X-Gm-Message-State: AJIora9w+TkpvTYX2+i+SNF/eQdwqB476MB3A1APudNtWfMcKrG/3tWJ
 l17Xu1dusHTTf15Rh7QHuTyU
X-Google-Smtp-Source: AGRyM1tSShUXaCjYMciRctBom6qzhTde58+KBV9KsgwGK22WLbrPJyNFWOcTZUd1Bl0rAmAXFz+u5A==
X-Received: by 2002:a17:90b:3a87:b0:1e8:8740:43e7 with SMTP id
 om7-20020a17090b3a8700b001e8874043e7mr2582604pjb.41.1655183826563; 
 Mon, 13 Jun 2022 22:17:06 -0700 (PDT)
Received: from localhost ([139.177.225.237]) by smtp.gmail.com with ESMTPSA id
 ch6-20020a056a00288600b0051b32c2a5a7sm6362869pfb.138.2022.06.13.22.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 22:17:06 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] vduse-blk: Don't unlink the reconnect file if device
 exists
Date: Tue, 14 Jun 2022 13:15:29 +0800
Message-Id: <20220614051532.92-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614051532.92-1-xieyongji@bytedance.com>
References: <20220614051532.92-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We should not unlink the reconnect file if vduse_dev_destroy()
fails with -EBUSY which means the VDUSE device has not been
removed from the vDPA bus. Otherwise, we might fail on
the reconnection later.

Fixes: 730abef0e873 ("libvduse: Add support for reconnecting")
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/export/vduse-blk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index 3b10349173..c3a89894ae 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -316,12 +316,15 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
 static void vduse_blk_exp_delete(BlockExport *exp)
 {
     VduseBlkExport *vblk_exp = container_of(exp, VduseBlkExport, export);
+    int ret;
 
     blk_remove_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_detach,
                                     vblk_exp);
     blk_set_dev_ops(exp->blk, NULL, NULL);
-    vduse_dev_destroy(vblk_exp->dev);
-    unlink(vblk_exp->recon_file);
+    ret = vduse_dev_destroy(vblk_exp->dev);
+    if (ret != -EBUSY) {
+        unlink(vblk_exp->recon_file);
+    }
     g_free(vblk_exp->recon_file);
 }
 
-- 
2.20.1


