Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7692649B693
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:44:26 +0100 (CET)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCN3Z-0005jb-IB
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLiT-0007JP-0d
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:34 -0500
Received: from [2607:f8b0:4864:20::102a] (port=56259
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nCLiQ-0004wv-S5
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:18:32 -0500
Received: by mail-pj1-x102a.google.com with SMTP id d5so17532615pjk.5
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 05:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGbj6244a378yuPR0ftQP81z4tBw3+5/JWR9CFPlaUw=;
 b=YctHY83t9qIOLn+Jc9HKKz4RudXMYC+720q+ArnITgyp97xJ9OAG+Nq9Etn1DgmLjT
 V7KQ0v1Rr97GHMgXQH2VMQx5Y0KYJF2vxXUxkhKKTD9Laa3WN1cl7iP+llK1reCBTQy0
 PJ9NNIG/N2k7B8hnGE2WJnYDUo7oSyFDlXi4v7jX0TjFKSas1+YQXOnWU4xKKfnynkNk
 8hsTX/PK6ikKPOdwJyfV1ul9EHYK/X4BktVjC9gXTBtt/sIYkkdGsh/C2BZVBGGBrKsr
 jQxvG3KB0Bi0wZ1EqXlMw1AcNwl9LwH91fza4KLIrFpk+AuT0fujX5QcRSAVtPbH1zo7
 +3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wGbj6244a378yuPR0ftQP81z4tBw3+5/JWR9CFPlaUw=;
 b=Dh87g+slEwa+d6VzTRNkhKPxwDd5NrX6rVWOcCGd3ai9wwOKmmABopRAonEurc6k/B
 8XjtWpVXSpdfe7KWKqCm9Y0cJtVSagJLvOGLFF5UcJrLnytZGENtoGPNvczAYs7C0G/v
 lnxyawzyFOsXCN5spSGy1XETjF0Ez0rq6mFzRLoxk6Eprs3Wp/bMlwwcuu0kp9r+bBco
 SniiF54qCpwabkmmNm3CHMT0HAeqBNTmvSsnyIOiUkDjwXApxBONpU6Z+Ld5bO2zgBZg
 8Q7M3MjvFzHoi1aHsMLMLEIKivHkHnlgmFx66d6nN+ppYXFKsnFH3CoveydbFomrw6YI
 CpLA==
X-Gm-Message-State: AOAM5321+0vxznWY9bzU2r/m4yIJjW3x6eupSNr0rbSHFHxoVYt1ueOv
 Nd6n9+POdNeh5vTH8W2M/6zJ
X-Google-Smtp-Source: ABdhPJwJUC/arhEoqNXDvggwUzPLGiXSaZGNqizZ2BZ12+zqjUVt2Yv/TmGMmv+IhBgEepe8G4vG7Q==
X-Received: by 2002:a17:902:ab05:b0:14b:e74:d7bd with SMTP id
 ik5-20020a170902ab0500b0014b0e74d7bdmr18757672plb.126.1643116709395; 
 Tue, 25 Jan 2022 05:18:29 -0800 (PST)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id h18sm3555591pfh.51.2022.01.25.05.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 05:18:28 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com
Subject: [PATCH 1/5] linux-headers: Add vduse.h
Date: Tue, 25 Jan 2022 21:17:56 +0800
Message-Id: <20220125131800.91-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125131800.91-1-xieyongji@bytedance.com>
References: <20220125131800.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds vduse header to standard headers so that the
relevant VDUSE API can be used in subsequent patches.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 include/standard-headers/linux/vduse.h | 306 +++++++++++++++++++++++++
 scripts/update-linux-headers.sh        |   1 +
 2 files changed, 307 insertions(+)
 create mode 100644 include/standard-headers/linux/vduse.h

diff --git a/include/standard-headers/linux/vduse.h b/include/standard-headers/linux/vduse.h
new file mode 100644
index 0000000000..4242bc9fdf
--- /dev/null
+++ b/include/standard-headers/linux/vduse.h
@@ -0,0 +1,306 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _VDUSE_H_
+#define _VDUSE_H_
+
+#include "standard-headers/linux/types.h"
+
+#define VDUSE_BASE	0x81
+
+/* The ioctls for control device (/dev/vduse/control) */
+
+#define VDUSE_API_VERSION	0
+
+/*
+ * Get the version of VDUSE API that kernel supported (VDUSE_API_VERSION).
+ * This is used for future extension.
+ */
+#define VDUSE_GET_API_VERSION	_IOR(VDUSE_BASE, 0x00, uint64_t)
+
+/* Set the version of VDUSE API that userspace supported. */
+#define VDUSE_SET_API_VERSION	_IOW(VDUSE_BASE, 0x01, uint64_t)
+
+/**
+ * struct vduse_dev_config - basic configuration of a VDUSE device
+ * @name: VDUSE device name, needs to be NUL terminated
+ * @vendor_id: virtio vendor id
+ * @device_id: virtio device id
+ * @features: virtio features
+ * @vq_num: the number of virtqueues
+ * @vq_align: the allocation alignment of virtqueue's metadata
+ * @reserved: for future use, needs to be initialized to zero
+ * @config_size: the size of the configuration space
+ * @config: the buffer of the configuration space
+ *
+ * Structure used by VDUSE_CREATE_DEV ioctl to create VDUSE device.
+ */
+struct vduse_dev_config {
+#define VDUSE_NAME_MAX	256
+	char name[VDUSE_NAME_MAX];
+	uint32_t vendor_id;
+	uint32_t device_id;
+	uint64_t features;
+	uint32_t vq_num;
+	uint32_t vq_align;
+	uint32_t reserved[13];
+	uint32_t config_size;
+	uint8_t config[];
+};
+
+/* Create a VDUSE device which is represented by a char device (/dev/vduse/$NAME) */
+#define VDUSE_CREATE_DEV	_IOW(VDUSE_BASE, 0x02, struct vduse_dev_config)
+
+/*
+ * Destroy a VDUSE device. Make sure there are no more references
+ * to the char device (/dev/vduse/$NAME).
+ */
+#define VDUSE_DESTROY_DEV	_IOW(VDUSE_BASE, 0x03, char[VDUSE_NAME_MAX])
+
+/* The ioctls for VDUSE device (/dev/vduse/$NAME) */
+
+/**
+ * struct vduse_iotlb_entry - entry of IOTLB to describe one IOVA region [start, last]
+ * @offset: the mmap offset on returned file descriptor
+ * @start: start of the IOVA region
+ * @last: last of the IOVA region
+ * @perm: access permission of the IOVA region
+ *
+ * Structure used by VDUSE_IOTLB_GET_FD ioctl to find an overlapped IOVA region.
+ */
+struct vduse_iotlb_entry {
+	uint64_t offset;
+	uint64_t start;
+	uint64_t last;
+#define VDUSE_ACCESS_RO 0x1
+#define VDUSE_ACCESS_WO 0x2
+#define VDUSE_ACCESS_RW 0x3
+	uint8_t perm;
+};
+
+/*
+ * Find the first IOVA region that overlaps with the range [start, last]
+ * and return the corresponding file descriptor. Return -EINVAL means the
+ * IOVA region doesn't exist. Caller should set start and last fields.
+ */
+#define VDUSE_IOTLB_GET_FD	_IOWR(VDUSE_BASE, 0x10, struct vduse_iotlb_entry)
+
+/*
+ * Get the negotiated virtio features. It's a subset of the features in
+ * struct vduse_dev_config which can be accepted by virtio driver. It's
+ * only valid after FEATURES_OK status bit is set.
+ */
+#define VDUSE_DEV_GET_FEATURES	_IOR(VDUSE_BASE, 0x11, uint64_t)
+
+/**
+ * struct vduse_config_data - data used to update configuration space
+ * @offset: the offset from the beginning of configuration space
+ * @length: the length to write to configuration space
+ * @buffer: the buffer used to write from
+ *
+ * Structure used by VDUSE_DEV_SET_CONFIG ioctl to update device
+ * configuration space.
+ */
+struct vduse_config_data {
+	uint32_t offset;
+	uint32_t length;
+	uint8_t buffer[];
+};
+
+/* Set device configuration space */
+#define VDUSE_DEV_SET_CONFIG	_IOW(VDUSE_BASE, 0x12, struct vduse_config_data)
+
+/*
+ * Inject a config interrupt. It's usually used to notify virtio driver
+ * that device configuration space has changed.
+ */
+#define VDUSE_DEV_INJECT_CONFIG_IRQ	_IO(VDUSE_BASE, 0x13)
+
+/**
+ * struct vduse_vq_config - basic configuration of a virtqueue
+ * @index: virtqueue index
+ * @max_size: the max size of virtqueue
+ * @reserved: for future use, needs to be initialized to zero
+ *
+ * Structure used by VDUSE_VQ_SETUP ioctl to setup a virtqueue.
+ */
+struct vduse_vq_config {
+	uint32_t index;
+	uint16_t max_size;
+	uint16_t reserved[13];
+};
+
+/*
+ * Setup the specified virtqueue. Make sure all virtqueues have been
+ * configured before the device is attached to vDPA bus.
+ */
+#define VDUSE_VQ_SETUP		_IOW(VDUSE_BASE, 0x14, struct vduse_vq_config)
+
+/**
+ * struct vduse_vq_state_split - split virtqueue state
+ * @avail_index: available index
+ */
+struct vduse_vq_state_split {
+	uint16_t avail_index;
+};
+
+/**
+ * struct vduse_vq_state_packed - packed virtqueue state
+ * @last_avail_counter: last driver ring wrap counter observed by device
+ * @last_avail_idx: device available index
+ * @last_used_counter: device ring wrap counter
+ * @last_used_idx: used index
+ */
+struct vduse_vq_state_packed {
+	uint16_t last_avail_counter;
+	uint16_t last_avail_idx;
+	uint16_t last_used_counter;
+	uint16_t last_used_idx;
+};
+
+/**
+ * struct vduse_vq_info - information of a virtqueue
+ * @index: virtqueue index
+ * @num: the size of virtqueue
+ * @desc_addr: address of desc area
+ * @driver_addr: address of driver area
+ * @device_addr: address of device area
+ * @split: split virtqueue state
+ * @packed: packed virtqueue state
+ * @ready: ready status of virtqueue
+ *
+ * Structure used by VDUSE_VQ_GET_INFO ioctl to get virtqueue's information.
+ */
+struct vduse_vq_info {
+	uint32_t index;
+	uint32_t num;
+	uint64_t desc_addr;
+	uint64_t driver_addr;
+	uint64_t device_addr;
+	union {
+		struct vduse_vq_state_split split;
+		struct vduse_vq_state_packed packed;
+	};
+	uint8_t ready;
+};
+
+/* Get the specified virtqueue's information. Caller should set index field. */
+#define VDUSE_VQ_GET_INFO	_IOWR(VDUSE_BASE, 0x15, struct vduse_vq_info)
+
+/**
+ * struct vduse_vq_eventfd - eventfd configuration for a virtqueue
+ * @index: virtqueue index
+ * @fd: eventfd, -1 means de-assigning the eventfd
+ *
+ * Structure used by VDUSE_VQ_SETUP_KICKFD ioctl to setup kick eventfd.
+ */
+struct vduse_vq_eventfd {
+	uint32_t index;
+#define VDUSE_EVENTFD_DEASSIGN -1
+	int fd;
+};
+
+/*
+ * Setup kick eventfd for specified virtqueue. The kick eventfd is used
+ * by VDUSE kernel module to notify userspace to consume the avail vring.
+ */
+#define VDUSE_VQ_SETUP_KICKFD	_IOW(VDUSE_BASE, 0x16, struct vduse_vq_eventfd)
+
+/*
+ * Inject an interrupt for specific virtqueue. It's used to notify virtio driver
+ * to consume the used vring.
+ */
+#define VDUSE_VQ_INJECT_IRQ	_IOW(VDUSE_BASE, 0x17, uint32_t)
+
+/* The control messages definition for read(2)/write(2) on /dev/vduse/$NAME */
+
+/**
+ * enum vduse_req_type - request type
+ * @VDUSE_GET_VQ_STATE: get the state for specified virtqueue from userspace
+ * @VDUSE_SET_STATUS: set the device status
+ * @VDUSE_UPDATE_IOTLB: Notify userspace to update the memory mapping for
+ *                      specified IOVA range via VDUSE_IOTLB_GET_FD ioctl
+ */
+enum vduse_req_type {
+	VDUSE_GET_VQ_STATE,
+	VDUSE_SET_STATUS,
+	VDUSE_UPDATE_IOTLB,
+};
+
+/**
+ * struct vduse_vq_state - virtqueue state
+ * @index: virtqueue index
+ * @split: split virtqueue state
+ * @packed: packed virtqueue state
+ */
+struct vduse_vq_state {
+	uint32_t index;
+	union {
+		struct vduse_vq_state_split split;
+		struct vduse_vq_state_packed packed;
+	};
+};
+
+/**
+ * struct vduse_dev_status - device status
+ * @status: device status
+ */
+struct vduse_dev_status {
+	uint8_t status;
+};
+
+/**
+ * struct vduse_iova_range - IOVA range [start, last]
+ * @start: start of the IOVA range
+ * @last: last of the IOVA range
+ */
+struct vduse_iova_range {
+	uint64_t start;
+	uint64_t last;
+};
+
+/**
+ * struct vduse_dev_request - control request
+ * @type: request type
+ * @request_id: request id
+ * @reserved: for future use
+ * @vq_state: virtqueue state, only index field is available
+ * @s: device status
+ * @iova: IOVA range for updating
+ * @padding: padding
+ *
+ * Structure used by read(2) on /dev/vduse/$NAME.
+ */
+struct vduse_dev_request {
+	uint32_t type;
+	uint32_t request_id;
+	uint32_t reserved[4];
+	union {
+		struct vduse_vq_state vq_state;
+		struct vduse_dev_status s;
+		struct vduse_iova_range iova;
+		uint32_t padding[32];
+	};
+};
+
+/**
+ * struct vduse_dev_response - response to control request
+ * @request_id: corresponding request id
+ * @result: the result of request
+ * @reserved: for future use, needs to be initialized to zero
+ * @vq_state: virtqueue state
+ * @padding: padding
+ *
+ * Structure used by write(2) on /dev/vduse/$NAME.
+ */
+struct vduse_dev_response {
+	uint32_t request_id;
+#define VDUSE_REQ_RESULT_OK	0x00
+#define VDUSE_REQ_RESULT_FAILED	0x01
+	uint32_t result;
+	uint32_t reserved[4];
+	union {
+		struct vduse_vq_state vq_state;
+		uint32_t padding[32];
+	};
+};
+
+#endif /* _VDUSE_H_ */
diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index fea4d6eb65..4c7846076f 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -198,6 +198,7 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
          "$tmpdir/include/linux/const.h" \
          "$tmpdir/include/linux/kernel.h" \
          "$tmpdir/include/linux/vhost_types.h" \
+         "$tmpdir/include/linux/vduse.h" \
          "$tmpdir/include/linux/sysinfo.h"; do
     cp_portable "$i" "$output/include/standard-headers/linux"
 done
-- 
2.20.1


