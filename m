Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3709568579
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:25:52 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92EB-00025N-ST
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o91mJ-00048K-Fw
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:03 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o91mH-0004Pq-8v
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 05:57:03 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso9473852pjc.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 02:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BREgwYiOvCEeIa/yhLtMhZ9xErLR13wbXi2KZC1QjzQ=;
 b=NgiFbY6e8msIWEHpuIPwylDeVBPYVwHyAiwIkiD+vGt6YMndQyQvtxiPHdkIezd4Pb
 SdpKcAB0AIOZl57luVmi6SsgVrBbDOVT3WbJg3SbnFRsEpyIG26ppzvFpA9qkTBDKoey
 hGW7sSVNWNSjdxorekBaWe9fXDkV8E67yvhfaaLSKmq91dpdt5qZ/9K8VjPAFJXMsPj5
 J8ON5d4UXLNIuxFtq+GLSZyt7X1U/A//rIWXrAKGs0p55zsladSdy25teW9Lj+Q1+JrJ
 yfW4WyVnM5cdcMnOgTBaJA0CvSi9x/csSASpJfBYQqDMP+KDz/N93KXBjUMkD7KvhG2O
 txOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BREgwYiOvCEeIa/yhLtMhZ9xErLR13wbXi2KZC1QjzQ=;
 b=aQQz1EoN2u+KVRj0caLtrnXHqRLr+Dx50jNR3gk/mlLirwcYcurTT1WooRv421Zy2A
 s/D9VksZwPCbvPv8FKy1cSWQsKyh70+zLV/ObWonTswECBKz0Wedg4hsFB+qpryze6vq
 Y96EZBeFgBNlJP/tr9q2ESmQ7ezSkAiAfHa7C0tskFJVM8oWlWq00oJH/nIpgllItcpJ
 nC9u8cfcOUN9A+f/Ga67Rf6qR9uF1Q9/QZ4a878oqTKezpNzr+2tZ47yQoHuje4QkZo3
 CdHxxVsV+poO07VMkhV5Grgd4UbbGUS5+qyBi8BXPh5Na1mKmGGJFnG8T7N1btJo805H
 J0wQ==
X-Gm-Message-State: AJIora+7ve5k7sBu0tsL2jckjC9zTw1c5XxTXoNDOUlS3JXMuqVw6Fnr
 ShCWCLVAt53dGNK+poSrSvS3
X-Google-Smtp-Source: AGRyM1v8QKLPp55ybnTYZTyBA98JLg0u4fuOmIJMRi+X7QJTinZ7Fn20A7befer5PI/MYgL1xxDSww==
X-Received: by 2002:a17:903:1248:b0:168:c5a3:b296 with SMTP id
 u8-20020a170903124800b00168c5a3b296mr45695629plh.146.1657101420018; 
 Wed, 06 Jul 2022 02:57:00 -0700 (PDT)
Received: from localhost ([139.177.225.253]) by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016a61e965f0sm17584916plh.280.2022.07.06.02.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 02:56:59 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com, stefanha@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] libvduse: Fix the incorrect function name
Date: Wed,  6 Jul 2022 17:56:22 +0800
Message-Id: <20220706095624.328-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706095624.328-1-xieyongji@bytedance.com>
References: <20220706095624.328-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In vduse_name_is_valid(), we actually check whether
the name is invalid or not. So let's change the
function name to vduse_name_is_invalid() to match
the behavior.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 subprojects/libvduse/libvduse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 9a2bcec282..6374933881 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1193,7 +1193,7 @@ static int vduse_dev_init(VduseDev *dev, const char *name,
     return 0;
 }
 
-static inline bool vduse_name_is_valid(const char *name)
+static inline bool vduse_name_is_invalid(const char *name)
 {
     return strlen(name) >= VDUSE_NAME_MAX || strstr(name, "..");
 }
@@ -1242,7 +1242,7 @@ VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
     VduseDev *dev;
     int ret;
 
-    if (!name || vduse_name_is_valid(name) || !ops ||
+    if (!name || vduse_name_is_invalid(name) || !ops ||
         !ops->enable_queue || !ops->disable_queue) {
         fprintf(stderr, "Invalid parameter for vduse\n");
         return NULL;
@@ -1276,7 +1276,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
     struct vduse_dev_config *dev_config;
     size_t size = offsetof(struct vduse_dev_config, config);
 
-    if (!name || vduse_name_is_valid(name) ||
+    if (!name || vduse_name_is_invalid(name) ||
         !has_feature(features,  VIRTIO_F_VERSION_1) || !config ||
         !config_size || !ops || !ops->enable_queue || !ops->disable_queue) {
         fprintf(stderr, "Invalid parameter for vduse\n");
-- 
2.20.1


