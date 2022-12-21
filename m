Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56094653192
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:21:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yng-0006FU-CG; Wed, 21 Dec 2022 08:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynJ-0005xL-2y
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynH-0004M8-EY
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqIM7Ih2QfU9GsZBZ7nDrefLZe0QrMtj6k2iRrcRs5c=;
 b=SJZPOY/0ogWRm6zrf+sWeVL2sKr6u8ZkQrpyozs3piq3tjNsRmSC7T8Z7KG06h3VbLvWq4
 od3wy/gtvU0laT47MzM33BmbEn5/9GQT/5rQVgTzFWZ/io5NeGAuuzzjW/QSQtHxgtPpe+
 DK5PyVOi9vw/0IHEfUzXF15m0xew3ww=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-pCZFkjo9O66kdeo6ZM9tKA-1; Wed, 21 Dec 2022 08:05:55 -0500
X-MC-Unique: pCZFkjo9O66kdeo6ZM9tKA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so914799wme.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IqIM7Ih2QfU9GsZBZ7nDrefLZe0QrMtj6k2iRrcRs5c=;
 b=rY5JmcQg6wKZ9GZtoRq7KYbSLdNAV+inWj19S/uXh1O0J8bk9aa/VMtAgfVQL0IULc
 wfTIDkGNWGnw8WQAXHe1gj68x56tHLaAm5Cx98XVT81AxRpRJRoQFliWUwh9yNIYMYYI
 B5tEvRzxzeVDtZ9yFchVFCQrRRGtPCECIxDSjucXt+QHUIxSALRxatUuas3hXC1slATA
 cMlNJLZ8i8AIO7Fh7IurRAH2gL2p5xL7AtqRhkOaTg9p/NDwRp8Z6VJaJYZxRGqf9SrJ
 fQQ/OrZnL6q+YDcqCTDlDmnIv2pFTbZYy33H3qyDDPu6ub5oxtjhkQz++8lbsShIJUlf
 PXtQ==
X-Gm-Message-State: AFqh2kqCplbFbK4FCXlthdOgq4rOJDFdjUFs5W91nhEDT89tAZ0MRifV
 WSk16lDQbxtkf7Sk/p2eaRihqrbKCai7CUCo8rO3Bd9MqsVLpVvv927P9dFAg3K8NY+bBhiZ+4+
 v7LhGA8ChYPfkfl9THJXQGt+pTBYyYH6kv37sFKRmu0SpZ/yBSrDzcIHhwzK1
X-Received: by 2002:a05:600c:4d97:b0:3d2:3e73:7175 with SMTP id
 v23-20020a05600c4d9700b003d23e737175mr1575875wmp.40.1671627953553; 
 Wed, 21 Dec 2022 05:05:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtuHO+nj1sywEsVXcmSkl0XXNAftCPamv0CvCaPHzYvaxUWR3oux8amRSuVFtCNCU67LQXBGA==
X-Received: by 2002:a05:600c:4d97:b0:3d2:3e73:7175 with SMTP id
 v23-20020a05600c4d9700b003d23e737175mr1575859wmp.40.1671627953254; 
 Wed, 21 Dec 2022 05:05:53 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm7886629wms.2.2022.12.21.05.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:52 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Subject: [PULL 25/41] include/hw: attempt to document VirtIO feature variables
Message-ID: <20221221130339.1234592-26-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Alex Bennée <alex.bennee@linaro.org>

We have a bunch of variables associated with the device and the vhost
backend which are used inconsistently throughout the code base. Lets
start trying to bring some order by agreeing what each variable is
for.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>

Message-Id: <20221123152134.179929-2-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h  | 25 ++++++++++++++++++++++---
 include/hw/virtio/virtio.h | 19 ++++++++++++++++++-
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 67a6807fac..1cafa0d776 100644
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
index acfd4df125..24561e933a 100644
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
MST


