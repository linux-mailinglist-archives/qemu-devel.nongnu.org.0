Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5D763634D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrZG-0004pZ-1u; Wed, 23 Nov 2022 10:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxrZE-0004p0-Cn
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:21:40 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxrZB-0006Tq-Tm
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:21:40 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i12so26020820wrb.0
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 07:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oheCMzPlxFSw90huN9+zm9vfeGiOj55wqAJi+rQ46y8=;
 b=dL3/kdxaI9Vzk5VwfieV8qd5WhPPP3Ld8fU/oNpphZBYKIOLE061ipKYQyzHz4voH+
 r0WoxizYuHQvDayFqvFeMDN5laGjb6HvxS9HL5bzYPyrzlENti1/sj3RqJmdcjO2yBuV
 chjzZSBJCepLuCJIGn4CZWW8ywzzcwOKIwDa09IdY7okO+aIz6+qQMBCwckVSrCYAvpe
 I2tq80uU6n+0GJ53wvW1l42RFPS4y6IrYWLJj1YziDJrepySV4OL8Z9aTpPedz8JMfOn
 6ssqnasGgzbSvfN1SQRKLqncIIxwvAsFc6h8RB4CLs28Nd1Zd2uUrNi8xn9BEn0RGdaG
 EBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oheCMzPlxFSw90huN9+zm9vfeGiOj55wqAJi+rQ46y8=;
 b=a6cA3OlsV9lttSfIJOyk0JL9ote+eaHT76Of0Y496H3wq1mictdecas4zOFxDMpYif
 dQjvhUXkwvw/AQ7m4tMkfiz0itIHNAMoaR4tOmiHPGt07/2hX1GlRQiKIWN/IxYpPsY2
 UeAzKym4wsYiXy+oenOv3fxA/NSur+11FIhvL0JyD5WITbKou5DPO9wsqFgB/4oXfWGo
 OKPTs60fXGDcV//SlQQUhSmXR96Dpc/kWLvkCHLG5PF4aawYVJCGWybJTdg90N8Velld
 tHZD+CcLjTq6f7gQaIP1k40aKzVy85gQykW5njAaPUz1G5dQZo1o5N+bSI94VDVQc2AX
 zgvA==
X-Gm-Message-State: ANoB5pnf5pWucDmfXYdn/gTsvPRFSXXFunTj1x2Gd6cwml1GNXML8IcK
 24jcN8rQvfVHq1BCNf1JV9VrgQ==
X-Google-Smtp-Source: AA0mqf49kcw7LDbXf0Irl5c61KM6FSLohtnweeaUro7nLmYakrTfphu8HPKphS8NGxGAWIpth/0wDw==
X-Received: by 2002:a5d:4409:0:b0:241:eeaa:9917 with SMTP id
 z9-20020a5d4409000000b00241eeaa9917mr1831960wrq.68.1669216896582; 
 Wed, 23 Nov 2022 07:21:36 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h14-20020adffa8e000000b0022e653f5abbsm6652512wrr.69.2022.11.23.07.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 07:21:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A00D01FFB8;
 Wed, 23 Nov 2022 15:21:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Subject: [PATCH v1 1/2] include/hw: attempt to document VirtIO feature
 variables
Date: Wed, 23 Nov 2022 15:21:33 +0000
Message-Id: <20221123152134.179929-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123152134.179929-1-alex.bennee@linaro.org>
References: <20221123152134.179929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We have a bunch of variables associated with the device and the vhost
backend which are used inconsistently throughout the code base. Lets
start trying to bring some order by agreeing what each variable is
for.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>

---
v2
  - dropped DISCUSS and commentary
  - separated protocol section for clarity
  - updated working on vhost->backend_features
  - made clear guest_features was the written state
---
 include/hw/virtio/vhost.h  | 25 ++++++++++++++++++++++---
 include/hw/virtio/virtio.h | 19 ++++++++++++++++++-
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 353252ac3e..eaf628f656 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -88,13 +88,32 @@ struct vhost_dev {
     int vq_index_end;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
+    /**
+     * vhost feature handling requires matching the feature set
+     * offered by a backend which may be a subset of the total
+     * features eventually offered to the guest.
+     *
+     * @features: available features provided by the backend
+     * @acked_features: final negotiated features with front-end driver
+     *
+     * @backend_features: this is used in a couple of places to either
+     * store VHOST_USER_F_PROTOCOL_FEATURES to apply to
+     * VHOST_USER_SET_FEATURES or VHOST_NET_F_VIRTIO_NET_HDR. Its
+     * future use should be discouraged and the variable retired as
+     * its easy to confuse with the VirtIO backend_features.
+     */
     uint64_t features;
-    /** @acked_features: final set of negotiated features */
     uint64_t acked_features;
-    /** @backend_features: backend specific feature bits */
     uint64_t backend_features;
-    /** @protocol_features: final negotiated protocol features */
+
+    /**
+     * @protocol_features: is the vhost-user only feature set by
+     * VHOST_USER_SET_PROTOCOL_FEATURES. Protocol features are only
+     * negotiated if VHOST_USER_F_PROTOCOL_FEATURES has been offered
+     * by the backend (see @features).
+     */
     uint64_t protocol_features;
+
     uint64_t max_queues;
     uint64_t backend_cap;
     /* @started: is the vhost device started? */
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index a973811cbf..0f612067f7 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -93,6 +93,12 @@ enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_BIG,
 };
 
+/**
+ * struct VirtIODevice - common VirtIO structure
+ * @name: name of the device
+ * @status: VirtIO Device Status field
+ *
+ */
 struct VirtIODevice
 {
     DeviceState parent_obj;
@@ -100,9 +106,20 @@ struct VirtIODevice
     uint8_t status;
     uint8_t isr;
     uint16_t queue_sel;
-    uint64_t guest_features;
+    /**
+     * These fields represent a set of VirtIO features at various
+     * levels of the stack. @host_features indicates the complete
+     * feature set the VirtIO device can offer to the driver.
+     * @guest_features indicates which features the VirtIO driver has
+     * selected by writing to the feature register. Finally
+     * @backend_features represents everything supported by the
+     * backend (e.g. vhost) and could potentially be a subset of the
+     * total feature set offered by QEMU.
+     */
     uint64_t host_features;
+    uint64_t guest_features;
     uint64_t backend_features;
+
     size_t config_len;
     void *config;
     uint16_t config_vector;
-- 
2.34.1


