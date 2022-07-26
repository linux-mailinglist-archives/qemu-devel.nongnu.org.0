Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501D581A71
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:46:27 +0200 (CEST)
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQVe-0005Xn-8n
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQGF-0006c3-8c
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:35 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQGC-0003fN-C8
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:31 -0400
Received: by mail-wr1-x435.google.com with SMTP id d8so21379829wrp.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/ZcxJebFvV+fJPCaMkPj2jiRtkMtcjbXvy3+aTz3aU=;
 b=BIHOIza6CQ9fpueZJUYtrY+GVXvVmKOUei4TpHPySZ6oVyv0LPY7Qs3ltOpq7IQj1K
 Umgd3i7m/uJKXDFTIuLZEYXqoGbzb07fsiDgWR9e8tH1dG31MNti0Kv8vb+NiSs/RihU
 DBgO+SZvcONMaSLQYJgv0KshKJvWuQo4BDmyfilzi/IsSK6q+80FOdFxO0vmNPFoG14I
 Sd4rPKg8uLgUSlLYmntkG9owaF16Lqlj5c2FF5gRZczm/96zpSIbr3u4qLwgAdkwmP7E
 GWWlwiPhMjMnwdBT0qXuBPowfCY0OdpVfKI+UWX51CbUbwVnttAn81BOsowMQDewsgup
 LA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/ZcxJebFvV+fJPCaMkPj2jiRtkMtcjbXvy3+aTz3aU=;
 b=gNzpohKQJFLFF4Io8Mv51VXolLC0AYkZ4bJad+Q/EKAkpyN60UqBZ55oh+8+KfaaSQ
 kIDBlqSd5+WLPCoP/G1ZH7KvBoM3BMnW+y3HNWE13AabpyOwm0qlAo4og6qCLfzr/EG3
 CoCsix353tlYhdp5a7PvfNJ6ESpNhORcQr8SFV6tP4uj8zgAC8bufaRiQKGldHx/9f3p
 a2AUVuvIomuulsChM5tnsdDByk7zhyzlaO9vbqurqxxyc5PoD1sRg8Qm7gjfPT5bK3ry
 HBDvKwucPjFwD2RCsme3Xygd2tJadbvH/gD5UwBAznor1jWe245eg6rc21RGx1ifVEAi
 BLrg==
X-Gm-Message-State: AJIora80eBAdC34ATRHSCAWga32RmvZDvuxOokDco/wrkJWdKJGpsoy7
 DWG9vJGHsFM6TrNWSIZYBdlWoQ==
X-Google-Smtp-Source: AGRyM1tYu8hWyxcIkViPla7QVznJBNH8yiXBbzSEwFklfN3qoJsGCnccbar5+MFZS76kigoUjT6eaQ==
X-Received: by 2002:a05:6000:1f8d:b0:21e:83a6:cf87 with SMTP id
 bw13-20020a0560001f8d00b0021e83a6cf87mr8288520wrb.559.1658863824683; 
 Tue, 26 Jul 2022 12:30:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a5d5291000000b0021b956da1dcsm10679692wrv.113.2022.07.26.12.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:30:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 232BA1FFC2;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 10/21] hw/virtio: add some vhost-user trace events
Date: Tue, 26 Jul 2022 20:21:39 +0100
Message-Id: <20220726192150.2435175-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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


