Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522342F5B4F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 08:30:14 +0100 (CET)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzx5B-0000xC-33
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 02:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyV-00055k-Q7
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:19 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:38589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyR-0002VP-CV
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:19 -0500
Received: by mail-pg1-x530.google.com with SMTP id q7so3182707pgm.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 23:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyep80pLtydhA18rk3O+Iv7Kry8flmWm3RYfnDdq1fE=;
 b=2RO/JQTTrUW+yQbTb668i4CstJmZt2fN0nnUMpl6xr7XdSWdOlap7rvKIUIBvx0hrO
 8Yz4uUTqOwfO3UQbkT0fifzvle2dQOcxUirQ5peyZ9Sz6ekccHz70yVEWBK5Fcu9LrMS
 dJ9CuEqmwVdjB+I8kQx9YMnqE8iTeGaFgG42RYJRh8giTxGnImSxQ1n3AiD68rFFoht5
 3TzRPfRkfMTgoq1XSegip5ZKsXcVfZ8f3feYdu22HzYp3PKs0wvYLkdAi6Pa6GCvufBE
 RQG/15uyODtWrLh6ewqnZ6NreAd/7P1ma1ZmVIkDNXzJNfJhwWHHjxRr96kR0WH/63aV
 bpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyep80pLtydhA18rk3O+Iv7Kry8flmWm3RYfnDdq1fE=;
 b=W0y9n7rHwtbqHyBgjxtmSGA2DAK6xMXPxk8picqqidNEEwjw+RsR4+BVY0qgTXG3By
 itedNsPgXAfPVH5aHleg9m4BZsb/Z0SUp3jwpCf9hiZ1PWEB31qYJpDydNPJ1+Z60jF1
 NKDV2+8fsK37r0Ku1AKGU9W/KA2DNgyzO8YrC3ic3Ov8COzvkXKcl5Yd/RJc/zudfZBV
 nHYzAe4m5Ph+FkZRbRtGlv6R47O6GwknD+XVNGxwv9Z29Joj8T/t6m0Qn3DPoaRNdrL7
 J/UH/zmDEjwtB0jISZBKCgjpyR1nsDQH/M+fRzqzlg2VmEOVAibrAoZLA02IwIwyOZMi
 BojA==
X-Gm-Message-State: AOAM5319/tBVg7rPvHFjk3XaYaSEHjyMXCDTTIOznVmIC9wuwV21ehdI
 ugsiFPjfGtuChpVh/TWVhFJ8rg==
X-Google-Smtp-Source: ABdhPJx/ulMqvCdukT7u1eVcBGW/Fr6oQjMYcjlUIuQBujmWN3oP8QgbmE5pdZcGTfKnDgAKD9FXog==
X-Received: by 2002:a63:62c3:: with SMTP id w186mr6197997pgb.83.1610608994107; 
 Wed, 13 Jan 2021 23:23:14 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id i7sm4450323pfc.50.2021.01.13.23.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 23:23:13 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v3 4/4] hw/blocl/nvme: trigger async event during injecting
 smart warning
Date: Thu, 14 Jan 2021 15:22:51 +0800
Message-Id: <20210114072251.334304-5-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114072251.334304-1-pizhenwei@bytedance.com>
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During smart critical warning injection by setting property from QMP
command, also try to trigger asynchronous event.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/block/nvme.c | 47 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index ce9a9c9023..1feb603471 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -847,6 +847,36 @@ static void nvme_enqueue_event(NvmeCtrl *n, uint8_t event_type,
     nvme_process_aers(n);
 }
 
+static void nvme_enqueue_smart_event(NvmeCtrl *n, uint8_t event)
+{
+    uint8_t aer_info;
+
+    if (!(NVME_AEC_SMART(n->features.async_config) & event)) {
+        return;
+    }
+
+    /* Ref SPEC <Asynchronous Event Information – SMART / Health Status> */
+    switch (event) {
+    case NVME_SMART_SPARE:
+        aer_info = NVME_AER_INFO_SMART_SPARE_THRESH;
+        break;
+    case NVME_SMART_TEMPERATURE:
+        aer_info = NVME_AER_INFO_SMART_TEMP_THRESH;
+        break;
+    case NVME_SMART_RELIABILITY:
+    case NVME_SMART_MEDIA_READ_ONLY:
+    case NVME_SMART_FAILED_VOLATILE_MEDIA:
+        aer_info = NVME_AER_INFO_SMART_RELIABILITY;
+        break;
+    case NVME_SMART_PMR_UNRELIABLE:
+        /* TODO if NVME_SMART_PMR_UNRELIABLE is defined in future */
+    default:
+        return;
+    }
+
+    nvme_enqueue_event(n, NVME_AER_TYPE_SMART, aer_info, NVME_LOG_SMART_INFO);
+}
+
 static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
 {
     n->aer_mask &= ~(1 << event_type);
@@ -1824,12 +1854,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        if (((n->temperature >= n->features.temp_thresh_hi) ||
-             (n->temperature <= n->features.temp_thresh_low)) &&
-            NVME_AEC_SMART(n->features.async_config) & NVME_SMART_TEMPERATURE) {
-            nvme_enqueue_event(n, NVME_AER_TYPE_SMART,
-                               NVME_AER_INFO_SMART_TEMP_THRESH,
-                               NVME_LOG_SMART_INFO);
+        if ((n->temperature >= n->features.temp_thresh_hi) ||
+             (n->temperature <= n->features.temp_thresh_low)) {
+            nvme_enqueue_smart_event(n, NVME_AER_INFO_SMART_TEMP_THRESH);
         }
 
         break;
@@ -2841,7 +2868,7 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
     NvmeCtrl *s = NVME(obj);
-    uint8_t value, cap = 0;
+    uint8_t value, cap = 0, event;
     uint64_t pmr_cap = CAP_PMR_MASK;
 
     if (!visit_type_uint8(v, name, &value, errp)) {
@@ -2860,6 +2887,12 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
     }
 
     s->smart_critical_warning = value;
+
+    /* test each bit of uint8_t for smart.critical_warning */
+    for (event = 0; event < 8; event++) {
+        if (value & (1 << event))
+            nvme_enqueue_smart_event(s, 1 << event);
+    }
 }
 
 static const VMStateDescription nvme_vmstate = {
-- 
2.25.1


