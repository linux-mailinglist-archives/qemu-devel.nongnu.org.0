Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05D2638F1D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycXX-0004Oo-3i; Fri, 25 Nov 2022 12:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXH-0004MJ-Tl
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:48 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXG-0004Uj-2g
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id q7so6887091wrr.8
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oheCMzPlxFSw90huN9+zm9vfeGiOj55wqAJi+rQ46y8=;
 b=iK+3BbAIUyetIiK+ew4YGxFuekdxe/FKPIBFWQ5DH3qQavsuaZIDWlUjXTlXLgccxL
 leFFqqlXstse23BZ2EB/XZ+TetJbNRfZSmpx9RY+FMSIR+gjnuwdK94k32/Tv06O/vdq
 AJG1u80qLpwbuJCupLmpzGetPoZOVVYWkXGTxvshBYluwF9GUv+eUHdbg0lfEdDCY26i
 Bd9pZs3wYyNn8UxQwhwQDpsyWYr+ugqSV/nKulPxLc8DKKcWhU/jt1LUdhPPTO/uCU4q
 KpAucvYy4lrNLRItbBLddZvM4YlByTKen1LZzYze7jmuEfgGjP3AOymBKmxhBJ1Nxyst
 T5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oheCMzPlxFSw90huN9+zm9vfeGiOj55wqAJi+rQ46y8=;
 b=LL/BqQTEHbGM0ce7GDyEnDfc9XgD9mt6RWJxBZsw3YgD7Ek+ZlLgIR4jjQXJ7a7qUG
 7QJtlMEs/QHJxiRtWVCt6gn/hVfXwnVJ1BdSIC3L57xy6NxC9szo22AAKBqU78KZ4cVv
 gzNTnzvtNh5PTFvo4Oog3gRLvnHn03MJLS6XMbEzuaJ0i761CVn+wKEhnrccUNVns1El
 UanJvAN2xeaGNwgSnCCIYdb5jHMkXEzH+TqHRdoIggT2KAaH8knIxnSHj6zAkc3o9uZY
 YHceZoLkq+llduj3BnBMDwFrSsUSCDnAzpShzIWlLBb4JZr/fbyyV4udKh6HltLIOahH
 mslg==
X-Gm-Message-State: ANoB5pmfD8ziZsZjWq+02/SWFqJEVk9CtR9/aCI3+N3yJ0XKYnuCFjjw
 na/Mwe1rYrhZVY6Wb/OAl7p9dQ==
X-Google-Smtp-Source: AA0mqf4lHaTJ22ZQWbUwcSnIWdpW4cihGtzRyReJXIwfpjN3J1JwTmOLPzq91g/+NEo+Xp7zU8K9Lg==
X-Received: by 2002:a5d:554b:0:b0:242:84c:8d2 with SMTP id
 g11-20020a5d554b000000b00242084c08d2mr2217771wrw.555.1669397444109; 
 Fri, 25 Nov 2022 09:30:44 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm16195031wms.3.2022.11.25.09.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 09:30:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38B591FFB8;
 Fri, 25 Nov 2022 17:30:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Subject: [PATCH v2 1/5] include/hw: attempt to document VirtIO feature
 variables
Date: Fri, 25 Nov 2022 17:30:39 +0000
Message-Id: <20221125173043.1998075-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125173043.1998075-1-alex.bennee@linaro.org>
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


