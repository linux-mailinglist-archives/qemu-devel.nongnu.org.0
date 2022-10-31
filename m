Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD03613763
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:07:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHy-0007rF-8U; Mon, 31 Oct 2022 08:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHN-0003w4-Bo
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHJ-0002eK-21
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6cIEnv/B6TNmwuy+yjMUUsEZp+0oTgySRy8CBJkVXno=;
 b=g9pmb2D5EhZ/l0dJeMTLzAecvRVjyMU0Wbxy4MwB28hGrNApAc2L9LPQ65kbcFCAkD3EOD
 lW/9655OAGq4WkFiB4yP/1vgIjwPV6oh+E1+Vog0LKJChUaIZpv576YSFtu6wbBW3kmPST
 J3ErH1l2KREAOxRf+PE1P1dv0DYzS58=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-HgCc69F2MmWvu9zno8xJjA-1; Mon, 31 Oct 2022 08:52:31 -0400
X-MC-Unique: HgCc69F2MmWvu9zno8xJjA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so3012332wrg.16
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cIEnv/B6TNmwuy+yjMUUsEZp+0oTgySRy8CBJkVXno=;
 b=K1mA42DzByNJ8zOKLj7pWQDkKkiQH2KN3TkxtUIGEpjTDmrYadL9tiBmzuEqU7v/G0
 1Um5/BQZpBUhxDKsiOi47VPAp+G7Vpm+UxcsCyXjZI15/XJxjNmaUfuvkwvhn45BQL7o
 2BHZYCCF2K+V9M8fsvJJ6fdvjNDVz4SoxNyBexwYzXqn6zJCcpMc36vVcF084s0WiCUL
 ztsllngvJaSr0ymfBRHPhlNzcHpG65Pk7V5E3SD14fYG5hPaDXInkf2ROr0DKjs+k6bk
 h7jx7dPe/bUGSqeFIf2bBaSCZIWuFONbtVBWvfIrvyhRZoJsKouun4BHOpK2/GWLtoou
 KEsw==
X-Gm-Message-State: ACrzQf1pZVb/F2lw+JKAtQxWrTndYBzUP7jvXGvrocZg8MfF7m5CrYE8
 yPD/uSzj/IEE11WkOFzUhjqevAHkWyN8uUTrfudt5lKiOi+FGKW0gHV98rxHK4K8V8ExJPTvisw
 0jPrbcZBHlwE9TTi+bzTZWq+MFGHX02goj5RmQAdHc2qQQgPz0cA0IlMnYHK+
X-Received: by 2002:adf:dc08:0:b0:236:cfcf:8e62 with SMTP id
 t8-20020adfdc08000000b00236cfcf8e62mr2382329wri.367.1667220749727; 
 Mon, 31 Oct 2022 05:52:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6sHLEKOVgQxxeew27JUfMiLrd3gj2z+8PoornMt3Y3iEVNy8hKMtgLO9w9W9lgkU+3BQq+iw==
X-Received: by 2002:adf:dc08:0:b0:236:cfcf:8e62 with SMTP id
 t8-20020adfdc08000000b00236cfcf8e62mr2382308wri.367.1667220749413; 
 Mon, 31 Oct 2022 05:52:29 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k3-20020a05600c1c8300b003c6b7f5567csm22626600wms.0.2022.10.31.05.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:28 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 36/86] virtio: re-order vm_running and use_started checks
Message-ID: <20221031124928.128475-37-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


