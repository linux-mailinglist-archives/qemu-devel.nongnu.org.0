Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8C961684F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:19:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJg-0006J5-Dz; Wed, 02 Nov 2022 12:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJa-00069i-Ay
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJV-0002c0-Pz
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cIEnv/B6TNmwuy+yjMUUsEZp+0oTgySRy8CBJkVXno=;
 b=J6rH5oqJ3EA2+HkvrNLRx+jrDYUpBFYRAg+yLuAvacQIWnazxlVF1fjlWoa8N90p/FSj+R
 HYGo2HLBm+i/1EDYUpKNncl1VxX7VjlytOTQ4ErOKRtKjaJp6IDkJpEuR7UnFRzhF/XZR5
 lbbFNEt986hZoCymK6bUTgxzgkyp6N8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-KVWgaSKcMoylhKBfQ1x_MA-1; Wed, 02 Nov 2022 12:10:00 -0400
X-MC-Unique: KVWgaSKcMoylhKBfQ1x_MA-1
Received: by mail-wm1-f70.google.com with SMTP id
 9-20020a1c0209000000b003cf6fce8005so519063wmc.9
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cIEnv/B6TNmwuy+yjMUUsEZp+0oTgySRy8CBJkVXno=;
 b=hswpenK21DfKndBx+3VXFNjNXpBD/7selFekSK3PQzMbMT+PWOsVsBP5vtqadVOkZa
 quoQC45I+pdmPxQiGIR8IL65NdiCp7BgL2A+wRaggiUuxofS5BKnOFxNkd1uiqzQ5nZ4
 QxF6hxohwviJzhfYVbgiC+7K6k8n4mSmDTd7Sfhb7xkIKJgkipv0QkP0TnNT4J24xa+/
 m4/SBnFtrm4y5vxjaNdWYU6AeL7QhPHqKfvHeZ7l0WZakjH8KPCWVuAPANZxnVPD8NIj
 0mo/PcShzI8u0lcaUTf6jkC94EOuEfbctZb7uil+zedb5RZ7io1P9DGNGf3L8LmXOZZs
 16Fg==
X-Gm-Message-State: ACrzQf0EiI5mb3ba6Mxggltv0vM3hG8VDk81kEAejp6KfUH+eK+Pvi6c
 l/SdExk4nHFvR7ZI8SZKamzk+0mWzP6TTVdVQ87Pz94gjYWk/7QQikhZgK4B8EBSbi/46ef7JhB
 HnIvSEv99n/1VjnNc8dOvtjJ6UdSPMUBO0uJImDJ9j5xxxlt68J9oZxKEfavK
X-Received: by 2002:a05:600c:3655:b0:3cf:7082:dc18 with SMTP id
 y21-20020a05600c365500b003cf7082dc18mr11745827wmq.36.1667405398481; 
 Wed, 02 Nov 2022 09:09:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5wdjP+zLed0xH8M3HslNV07xyclVL10Ylssv71UbFVDVYJ5gz6vmcfV1XFqEbDpsJqMPEhrQ==
X-Received: by 2002:a05:600c:3655:b0:3cf:7082:dc18 with SMTP id
 y21-20020a05600c365500b003cf7082dc18mr11745802wmq.36.1667405398206; 
 Wed, 02 Nov 2022 09:09:58 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 co4-20020a0560000a0400b002238ea5750csm16421280wrb.72.2022.11.02.09.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:57 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 34/82] virtio: re-order vm_running and use_started checks
Message-ID: <20221102160336.616599-35-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alex Bennée <alex.bennee@linaro.org>

During migration the virtio device state can be restored before we
restart the VM. As no devices can be running while the VM is paused it
makes sense to bail out early in that case.

This returns the order introduced in:

 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)

to what virtio-sock was doing longhand.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Message-Id: <20221014132108.2559156-1-alex.bennee@linaro.org>
Tested-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f41b4a7e64..ebb58feaac 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -385,14 +385,14 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
 
 static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
 {
-    if (vdev->use_started) {
-        return vdev->started;
-    }
-
     if (!vdev->vm_running) {
         return false;
     }
 
+    if (vdev->use_started) {
+        return vdev->started;
+    }
+
     return status & VIRTIO_CONFIG_S_DRIVER_OK;
 }
 
-- 
MST


