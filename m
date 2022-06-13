Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD154854A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:52:56 +0200 (CEST)
Received: from localhost ([::1]:58450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jYs-0000Zb-8V
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRS-00033d-9p
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:14 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRQ-0005vg-6Y
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:13 -0400
Received: by mail-pl1-x630.google.com with SMTP id r1so4986183plo.10
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0y2TFEqOSWX2sasE6c7pK+W7e00REmrQJniw6QVW8Dc=;
 b=hoSeOVOMbmnI0lpTHpA+4EFlINclzEXOy49z1vBrnf5cYtH4ouzFdcPE86RnFZQsQK
 goeSwgKJoVTGOOPSoj6q5c4VakkeB7dEqnDSxYYrnXKVNqbbkyMoU5s3GWZcQKb3KZzO
 eDqgVOohzlFbCKJHVnflJtL8xJezyWl6v3/glP7XgMeGSN7/i+94cpfFWrowUFv4kWPD
 lw8L5mOsicXd9AvD3YeESMZlba+sc1o6ySSKNV3OPGVfHjriGlwg9W93pFg/mUIKHnkv
 k5xT+bORb3eiQialUM9+SlnneHc+gue3YD5xP2mNJa+jekb0zpjVpAzRQleBlnTUJZa6
 V4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0y2TFEqOSWX2sasE6c7pK+W7e00REmrQJniw6QVW8Dc=;
 b=oZVUtEipZnvFy+jaSDK0Nwxd4FFgM8EQrtFHOb3/LBMAofM+tJeI81qUr+qDMUvSPR
 BbnKF4EZgFE1PD0+tyma8kaprRpVYlxb09+uc04GGuxITK3WoFXeASJt+mRFgKHDkxTC
 kEhoeShy47UBPAgYtedscWdSADVcNG9owhM7lwFquMTszLEsoz/w/spyvYF1x6NeONXa
 20wrcluLLW+MReUA1mzxXtRi9zEzgnsSCwC4w9D4dm9qo+ncs3rgSD+22zDfsTLKV7xN
 dgf1H31KfWMiw3IFT0U13g0hjSpEEF7UlMkwur3cpfLfUfncd2z/2fzMfEcfg1OELRvx
 W9YA==
X-Gm-Message-State: AOAM533X57rYEsUWmWBGUEm/SVpqHDbkWxBjZU+cqs2k+3/6eEypPIEq
 X+mBwfX/vQB09ZlJoozQIFiX
X-Google-Smtp-Source: ABdhPJw4UoTzkOCLkPWZuj3zHaSDm0uxWtXmNFB6sd6LIl0PyEQxdzT0g7aQ+SCsaINq47J9e27ABA==
X-Received: by 2002:a17:902:ea0c:b0:163:ed09:9e5f with SMTP id
 s12-20020a170902ea0c00b00163ed099e5fmr58561385plg.86.1655124310532; 
 Mon, 13 Jun 2022 05:45:10 -0700 (PDT)
Received: from localhost ([139.177.225.252]) by smtp.gmail.com with ESMTPSA id
 t14-20020a62d14e000000b00519303c55acsm5304851pfl.1.2022.06.13.05.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:45:09 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] vduse-blk: Don't unlink the reconnect file if device
 exists
Date: Mon, 13 Jun 2022 20:45:00 +0800
Message-Id: <20220613124503.156-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613124503.156-1-xieyongji@bytedance.com>
References: <20220613124503.156-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x630.google.com
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


