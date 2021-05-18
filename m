Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0D388001
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:54:30 +0200 (CEST)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4rN-0000hi-QY
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4c5-0003IU-B2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4c3-0000Gb-AM
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bd795ibWFjtiUDy/XOhoxakC4+CKhSojCYBy76w9KxQ=;
 b=KvBvwQhBQBQ5fGxiq6oguygCQV1jwc52J7bv1KzCGR33ivZYYr3+v+zXvNVXYA1mJrRPl1
 fJSvysSVMqn9KIV6FywrCl/WtKuFBgCDa1w0aaFvp2J2UUq2ngDQbTcrz/PRtMnI8GaOtV
 hp9gRdMtcaTBVoGMT2fNsM4HzNREhp8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-XG9tTIZfP_auRaD95zDbjA-1; Tue, 18 May 2021 14:38:34 -0400
X-MC-Unique: XG9tTIZfP_auRaD95zDbjA-1
Received: by mail-ej1-f70.google.com with SMTP id
 e1-20020a170906c001b02903d958aadd4fso1230719ejz.23
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bd795ibWFjtiUDy/XOhoxakC4+CKhSojCYBy76w9KxQ=;
 b=rcebeP9MSD3Q6cbOU/7ZCToXtdZmB1QtHX8VGI9GgRTbOW9KCh0RUI54v3DWtoBlFG
 Dlmhw0M59B/fMDqhIXhWn2PDtW03cPmF2P7Rku82v2EkiJ9y4LAb19hXC8gVZiXdw441
 SEtUfuHshK/2b7EVv16//FauMJokU/kcdtE0fkeyw+A8T6BumdH3+2Q2yrAReOHs7swK
 0hGxRSfGF4wDtvhmYe2NX7fZL/1NtY8mlxZ36i2GeXkhrxjrbFL2QVOaUOXoRTTYtRMY
 13G3t4LYc8xaOAMqzGewhlZiJx7waVH8bflSAtqyzF40esU0r1BX0s20DbuOk2uCXF3O
 ut2A==
X-Gm-Message-State: AOAM532gZg8AMDYB8ngtsHO9Bg9obY3P8FPmIGtTahiu+4o7SlZeVjw1
 uAfW0J9RhzPR1f6yVLMMtyegLbRtyxKaarCwz2dTbGyvvGCeX3H+0LC/jIV+koLPGEQM6wlBCLY
 xwAQmia/S0/gvF9mZOHG4HPUbemjRxfMMQsdZziwCKuxnW24hVm3kmWI9ayQBrSl2
X-Received: by 2002:aa7:d818:: with SMTP id v24mr8520255edq.290.1621363113502; 
 Tue, 18 May 2021 11:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlnrkpwFSfKU0c08T4cMMe38gfG60nAItng5FxSG16/DvFANx6ztKNae4qHKvvhLwA+FRx1w==
X-Received: by 2002:aa7:d818:: with SMTP id v24mr8520224edq.290.1621363113227; 
 Tue, 18 May 2021 11:38:33 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z17sm10624200ejc.69.2021.05.18.11.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 19/25] hw/virtio: Use LD_CONVERT macro to emit 16-bit
 unsigned load/store code
Date: Tue, 18 May 2021 20:36:49 +0200
Message-Id: <20210518183655.1711377-20-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio-access.h | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 37e1e6ea535..594247f6e35 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -68,15 +68,7 @@ static inline rtype virtio_ld ## size ## _phys_cached(VirtIODevice *vdev,\
     return ld ## size ## _le_phys_cached(cache, pa);\
 }
 
-static inline uint16_t virtio_lduw_phys(VirtIODevice *vdev, hwaddr pa)
-{
-    AddressSpace *dma_as = vdev->dma_as;
-
-    if (virtio_access_is_big_endian(vdev)) {
-        return lduw_be_phys(dma_as, pa);
-    }
-    return lduw_le_phys(dma_as, pa);
-}
+VIRTIO_LD_CONVERT(uw, uint16_t)
 
 static inline uint32_t virtio_ldl_phys(VirtIODevice *vdev, hwaddr pa)
 {
@@ -149,15 +141,6 @@ static inline void virtio_stq_p(VirtIODevice *vdev, void *ptr, uint64_t v)
     }
 }
 
-static inline uint16_t virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        return lduw_be_p(ptr);
-    } else {
-        return lduw_le_p(ptr);
-    }
-}
-
 static inline uint32_t virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
 {
     if (virtio_access_is_big_endian(vdev)) {
@@ -185,16 +168,6 @@ static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
 #endif
 }
 
-static inline uint16_t virtio_lduw_phys_cached(VirtIODevice *vdev,
-                                               MemoryRegionCache *cache,
-                                               hwaddr pa)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        return lduw_be_phys_cached(cache, pa);
-    }
-    return lduw_le_phys_cached(cache, pa);
-}
-
 static inline uint32_t virtio_ldl_phys_cached(VirtIODevice *vdev,
                                               MemoryRegionCache *cache,
                                               hwaddr pa)
-- 
2.26.3


