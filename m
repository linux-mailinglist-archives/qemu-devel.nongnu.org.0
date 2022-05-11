Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD4522DBD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 09:58:31 +0200 (CEST)
Received: from localhost ([::1]:50802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nohEr-0001TR-Ov
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 03:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noh0V-0007Lo-CH
 for qemu-devel@nongnu.org; Wed, 11 May 2022 03:43:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noh0S-0000dz-02
 for qemu-devel@nongnu.org; Wed, 11 May 2022 03:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652255014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pku7Q1PfFP9QToC70mAwi4nN54AaBhdyakpGkeh4Xr8=;
 b=V8CoxqaM/Xei4BEOf58SpXdJmhLmT3s0i6HABz07WQ/P6aoE2/gct5g3+TE8n86gCvbiIH
 7ksfflzYtOVf9f9+PrpOhAgXpwsqBU1XCzIuSHw20B3mMS7UgWnz4Nc/v8Y13qzUWeVWL4
 2c1FbuXW4wOwuc44a+YRCg5ykoNJpjI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-tETc7gaQNf29hHLKrpw6zQ-1; Wed, 11 May 2022 03:43:33 -0400
X-MC-Unique: tETc7gaQNf29hHLKrpw6zQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 t4-20020a170906608400b006f8687b8884so700635ejj.0
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 00:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pku7Q1PfFP9QToC70mAwi4nN54AaBhdyakpGkeh4Xr8=;
 b=qUtwSJhV6PMYAEcCuVm+ocv7rfD5S+AZpro68GgV9HgwwsiCyTpYAQJNmxSmVDFJEW
 K2lsOG3PS3lufmNBDTKKYfeXOXan/cEZTiSeABVxgvn1pFC6XTlaaKZWqoB6MYuz1Jj2
 yAuBKHC/Srjh6Fn68cFX0v1SLMG+xOuQLDhYm9IW8amlnL3qXU1siJunWyAornOVRyla
 AhdbblxaRr/tVcgHPRsAz6pPoUrvgHc5z+B0BhUsvGGnjQJNV5Oq5VrejRc5pxdIriPm
 MxLHwRQKhQGkOvrnJb1lgF4crwbPklp1it2HcopCMkgissNMlaHa4aETBTcQLVuGSPz4
 E2aA==
X-Gm-Message-State: AOAM530nmJGRGd21JZoITUz08qw+A5Hh7STLOvCQIbkayYw4/QShYBnm
 W08hGqIza7HTm+tof6W6cmSGUOsVkWmb+e/2nlSsBIsJ/sgkiVGxvNwCMqpwh5TTt7bY+1M16X4
 diSgiiFK3AbVF8uSpVDvTETPU6kyVR2eKo9LZ2Rj7PAreEUMJUvwFBLVU6PTwmN+rz1s=
X-Received: by 2002:a50:c055:0:b0:428:8fe7:b2a9 with SMTP id
 u21-20020a50c055000000b004288fe7b2a9mr18201455edd.288.1652255011915; 
 Wed, 11 May 2022 00:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ng4X9tkL8x3CDdaFQzIjEeklW/M23BPS15Bd1hKReBa9JD7vmSgyJJEroxVLd4F1djW6Fw==
X-Received: by 2002:a50:c055:0:b0:428:8fe7:b2a9 with SMTP id
 u21-20020a50c055000000b004288fe7b2a9mr18201428edd.288.1652255011587; 
 Wed, 11 May 2022 00:43:31 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a17090699d300b006f3ef214dafsm659277ejn.21.2022.05.11.00.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 00:43:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Dov Murik <dovmurik@linux.ibm.com>
Subject: [PATCH] vhost-backend: do not depend on CONFIG_VHOST_VSOCK
Date: Wed, 11 May 2022 09:43:28 +0200
Message-Id: <20220511074328.164544-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The vsock callbacks .vhost_vsock_set_guest_cid and
.vhost_vsock_set_running are the only ones to be conditional
on #ifdef CONFIG_VHOST_VSOCK.  This is different from any other
device-dependent callbacks like .vhost_scsi_set_endpoint, and it
also broke when CONFIG_VHOST_VSOCK was changed to a per-target
symbol.

It would be possible to also use the CONFIG_DEVICES include, but
really there is no reason for most virtio files to be per-target
so just remove the #ifdef to fix the issue.

Reported-by: Dov Murik <dovmurik@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/vhost-backend.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index e409a865ae..4de8b6b3b0 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -203,7 +203,6 @@ static int vhost_kernel_get_vq_index(struct vhost_dev *dev, int idx)
     return idx - dev->vq_index;
 }
 
-#ifdef CONFIG_VHOST_VSOCK
 static int vhost_kernel_vsock_set_guest_cid(struct vhost_dev *dev,
                                             uint64_t guest_cid)
 {
@@ -214,7 +213,6 @@ static int vhost_kernel_vsock_set_running(struct vhost_dev *dev, int start)
 {
     return vhost_kernel_call(dev, VHOST_VSOCK_SET_RUNNING, &start);
 }
-#endif /* CONFIG_VHOST_VSOCK */
 
 static void vhost_kernel_iotlb_read(void *opaque)
 {
@@ -319,10 +317,8 @@ const VhostOps kernel_ops = {
         .vhost_set_owner = vhost_kernel_set_owner,
         .vhost_reset_device = vhost_kernel_reset_device,
         .vhost_get_vq_index = vhost_kernel_get_vq_index,
-#ifdef CONFIG_VHOST_VSOCK
         .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
         .vhost_vsock_set_running = vhost_kernel_vsock_set_running,
-#endif /* CONFIG_VHOST_VSOCK */
         .vhost_set_iotlb_callback = vhost_kernel_set_iotlb_callback,
         .vhost_send_device_iotlb_msg = vhost_kernel_send_device_iotlb_msg,
 };
-- 
2.36.0


