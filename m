Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E2380E14
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:20:55 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaYY-0000uA-Du
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJB-0007Qw-4l
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJ9-0005ei-7Y
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vnhVXVRJO7yDWeWARdc2oQopicnGk45iiCjyrv6W8TM=;
 b=EF97fAw4NJnyGdqBsnytWiRpTPhqiKqjpqrkC30GtQJm5VwEhj4im4Hog38Of5t8qA8lyG
 xZaoD9EryUz8d4x1DLvX1PV5khasaKOz7SelrNFR9D5g3fbBTbPME13TmfrMfi/OjWLJRS
 caBYy7BKI1Pm4emZHf+ymgFRTeO8U84=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Uen13_bDMyim8WRLAa9Qng-1; Fri, 14 May 2021 12:04:56 -0400
X-MC-Unique: Uen13_bDMyim8WRLAa9Qng-1
Received: by mail-wr1-f72.google.com with SMTP id
 t5-20020adfb7c50000b029010dd0bb24cfso12887716wre.2
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vnhVXVRJO7yDWeWARdc2oQopicnGk45iiCjyrv6W8TM=;
 b=QwTegmM2sZX0m8qKxYmfnuBCBYFpSvjWspMhm/GlPweWS3xSYQoDsDrx7xombpahZg
 /CxJPe+WsEK5mB70KQcPIJItreRJMX2RAuB1BtHCjg3X/W/0YZy+XNAPGsX7i003+aAd
 L37UmAgZh/VGtNLT7EskH750tveVva5Gslhxc2XCF0FpjV+e+nnxdHSzlivJgGdkQWTo
 vN1eN2J3DGoV+V9TE+/EoHe9LgZRM16NZlo++6OZu3Y2gTIjgA0x1vcX5ud/+wClJTar
 34ztRjfBj7pHuXyWsRUc6yBswaLLRnWXhB2JFMmsH1fQWud4EovrU9TxsiYPw5afv3M/
 SuIA==
X-Gm-Message-State: AOAM531sWtxz89Zuir31LeHTaQjCQusxjwV/KfqzVSb0DWOUxQ/e3m2/
 iFkwug11CBgOSHxEO9h1g2gwFAJ/O89tIYN6/gbVgCylnaaIJ4hYcvqGSUiWv/ac8j++e646zO1
 FqGXp9mdCWSb7dOfeIjoVHgJTixlSkUb8L4HU7KOyg8i/w4FgXBvsbnwpvEqE
X-Received: by 2002:a1c:9d83:: with SMTP id g125mr1988556wme.179.1621008295038; 
 Fri, 14 May 2021 09:04:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhtIVNEyWEGY2t4BxlyahnNt3rapHCTbH44+Pk+4j7Ac+F1KxjCK6T2MvBP4d4kPqBl9Yn6Q==
X-Received: by 2002:a1c:9d83:: with SMTP id g125mr1988533wme.179.1621008294815; 
 Fri, 14 May 2021 09:04:54 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id g19sm5683585wme.48.2021.05.14.09.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:54 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] vhost-vdpa: Make vhost_vdpa_get_device_id() static
Message-ID: <20210514160245.91918-16-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zenghui Yu <yuzenghui@huawei.com>

As it's only used inside hw/virtio/vhost-vdpa.c.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Message-Id: <20210413133737.1574-1-yuzenghui@huawei.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h | 2 --
 hw/virtio/vhost-vdpa.c         | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 9b81a409da..28ca65018e 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -22,6 +22,4 @@ typedef struct vhost_vdpa {
 } VhostVDPA;
 
 extern AddressSpace address_space_memory;
-extern int vhost_vdpa_get_device_id(struct vhost_dev *dev,
-                                   uint32_t *device_id);
 #endif
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..8f2fb9f10b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -371,8 +371,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
     return 0;
 }
 
-int vhost_vdpa_get_device_id(struct vhost_dev *dev,
-                                   uint32_t *device_id)
+static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
+                                    uint32_t *device_id)
 {
     int ret;
     ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_DEVICE_ID, device_id);
-- 
MST


