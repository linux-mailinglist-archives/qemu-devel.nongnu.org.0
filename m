Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A21D587A28
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:57:17 +0200 (CEST)
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoeJ-0007gE-Us
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXd-0001HR-1X
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXb-0002NJ-DO
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:20 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l22so17178873wrz.7
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=H/ZcxJebFvV+fJPCaMkPj2jiRtkMtcjbXvy3+aTz3aU=;
 b=pu55oEKeOTa2bxqKN+YN9NvrIJAbjZKCozOkzx2szI8V2uRhKtxINCZtpOOzndgbeS
 /Rb6B92+0vk/oSt0wUeDHUqh66O0ZXHzgJUVQaH+nDNnkK6aTAwMxsCyq0TuXxKus4vx
 ZrJo0BTnNHxs+94jo6K0V4EZfeNhIW7eZdlSXe7PBSz25AnjS5TQfW01g4tN2pLVcvcZ
 Lq3leBAoe3qHFAhne3VbaBo4UN7caDeX0VevsCOwAw3yZISZQRejnZ9tH4iIgvijjY8C
 iaD/Q9uwIpEXhvP7jfD7eS8mHPWne9+DsuiPIdfgROgvevT1cUu2XpAGHS1Y2I0yRwd7
 6xRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=H/ZcxJebFvV+fJPCaMkPj2jiRtkMtcjbXvy3+aTz3aU=;
 b=A6gKm5tdvEZ5bKkGsXSnSN1NohniShFeTWEIehynYbnYLMUVNxVvieC7LxUZuepPxP
 u1kW/XGLO4wy2zTj466J0RqzclFT7VjTKtea0GjzRdOQDRbrww4mB9bm0cPfoK4I/NRE
 v4sxGtGYrXRHGI15Cpsx5Dwoqw+UIcz4CF61btWvUY6YqmLYBYgBrtNfpcrZTdMrLfyh
 o4jxtSWWW6QcLnozihEhlAD51VKlBno72jd7VdHtm0a0rbRierTEHDQsdJPd7gJWC35s
 OAyYW0LyDYiSfvTl3hA1o2LfS+GgriuXMspDtnFXRmHIAr9IZOE7xIo6LqjrGtKt6Mjy
 eddg==
X-Gm-Message-State: ACgBeo0O8HxXT/JtBEG2tQQhMN/m6b1j8dMjTwbJA4klb6w8y3mr/Nrt
 XUy1bAPsuApcjky62vZUTfWtCQ==
X-Google-Smtp-Source: AA6agR7DLPTMtZxpElEkMT8GuJx0RHB3820tAZV4LOh18vPu52jbVAFEaokWe4cQwXSrwlFT6KqDFQ==
X-Received: by 2002:a5d:47a5:0:b0:220:5985:6710 with SMTP id
 5-20020a5d47a5000000b0022059856710mr9084814wrb.633.1659433818106; 
 Tue, 02 Aug 2022 02:50:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d6a50000000b0022069ccb6a1sm4085507wrw.94.2022.08.02.02.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 683021FFC1;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 09/22] hw/virtio: add some vhost-user trace events
Date: Tue,  2 Aug 2022 10:49:57 +0100
Message-Id: <20220802095010.3330793-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

These are useful for tracing the lifetime of vhost-user connections.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/virtio/vhost.c      | 6 ++++++
 hw/virtio/trace-events | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index f758f177bb..5185c15295 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1477,6 +1477,8 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
 {
     int i;
 
+    trace_vhost_dev_cleanup(hdev);
+
     for (i = 0; i < hdev->nvqs; ++i) {
         vhost_virtqueue_cleanup(hdev->vqs + i);
     }
@@ -1783,6 +1785,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    trace_vhost_dev_start(hdev, vdev->name);
+
     vdev->vhost_started = true;
     hdev->started = true;
     hdev->vdev = vdev;
@@ -1869,6 +1873,8 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    trace_vhost_dev_stop(hdev, vdev->name);
+
     if (hdev->vhost_ops->vhost_dev_start) {
         hdev->vhost_ops->vhost_dev_start(hdev, false);
     }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 20af2e7ebd..887ca7afa8 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -8,6 +8,10 @@ vhost_region_add_section_aligned(const char *name, uint64_t gpa, uint64_t size,
 vhost_section(const char *name) "%s"
 vhost_reject_section(const char *name, int d) "%s:%d"
 vhost_iotlb_miss(void *dev, int step) "%p step %d"
+vhost_dev_cleanup(void *dev) "%p"
+vhost_dev_start(void *dev, const char *name) "%p:%s"
+vhost_dev_stop(void *dev, const char *name) "%p:%s"
+
 
 # vhost-user.c
 vhost_user_postcopy_end_entry(void) ""
-- 
2.30.2


