Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A0364AB1F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:07:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rs6-0007Fh-5b; Mon, 12 Dec 2022 18:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rs3-0007F0-SC
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:06:03 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rs1-0004Lt-Tw
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:06:03 -0500
Received: by mail-ed1-x52c.google.com with SMTP id f7so15329180edc.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LuyI/hgCA8EM+7WspIU6SYJTlNy9W44FIcpLaj/BLMk=;
 b=xeebUGjK8gqr5qRD7aoTsKYNlKsMrbb4Ta+r/ttugk7SZEnjozOtWzySkFbCgmXXhs
 25iYdEC3WsqJyQzOO6004MAe0ynZn/TnShy3BgD+lxy7hWD5Jp+En3/DM4Edi1oxmp/7
 YdEodpfq98G8aBil4QYWbou5tQRHFstgpaqY/twJArWKTKO4o8dx8P/Io2hVwNFYKyne
 Ji1L71Qnlvz1UbE94Xf9u7Yuk01o52d1JLD4MxaRgrqgDoT/XuFkmbd0hwVrixK83z6I
 pdWNmZqPBLuwrXkW2P7e2eYXaxRh78HM8rhApukLIcZ42bYnTDMw+GXMRyllhTwGQI/x
 GowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LuyI/hgCA8EM+7WspIU6SYJTlNy9W44FIcpLaj/BLMk=;
 b=MckdxbjXy5K/Imzl2hKIGVFSpUuoLz0jKU8Uti5tPF8GVfuJ0LGu5w0z25ZSMG8GEm
 FpZlyqzpm4uiS6uWbHJUWqk/kyWSKJBGKPjHhYMg31aKIFVLLImScF+GdIW9LmUy3DLd
 hnEd645JL0SlYJkOj1kJaIDxV9m9U40uKNzMkeIcMmO7eX1n271Mpa4s6MtE8e2gatbY
 srd+1K4+JThWVTORCqY9flpWLG/6bb2waZmDgS6+EHkVmXJdD9Z3Z1J39y6hRs7VxZ8O
 I1NM3IqtXBaTNIs1Z66HfbBgH55eJ/KalMuNgBaOrEth7HtkabuNCLnm9neI9bC9BE3k
 /uxQ==
X-Gm-Message-State: ANoB5pklUDnJS/ARakAwHVPZ6cyZfM+tVhmh+DEpeKGbslLkjc1P/RPZ
 06o1uBZ+EN6jtyROimZ71OtlxrQz0io9iFFXXG4=
X-Google-Smtp-Source: AA0mqf59uUpx/xwTABxVza8GuUGIDZBVNW6VGynYXAoBHXYf/uAwKHm9U8MU5+cOI5modeV9ZOJWOw==
X-Received: by 2002:a05:6402:1002:b0:467:9384:a7aa with SMTP id
 c2-20020a056402100200b004679384a7aamr16552007edu.15.1670886360465; 
 Mon, 12 Dec 2022 15:06:00 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ch17-20020a0564021bd100b0046c2eee21a2sm4258946edb.11.2022.12.12.15.05.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:06:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 07/10] hw/virtio: Directly access cached
 VirtIODevice::access_is_big_endian
Date: Tue, 13 Dec 2022 00:05:14 +0100
Message-Id: <20221212230517.28872-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212230517.28872-1-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Since the device endianness doesn't change at runtime,
use the cached value instead of evaluating it on each call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-access.h | 44 +++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 07aae69042..985f39fe16 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -43,7 +43,7 @@ static inline uint16_t virtio_lduw_phys(VirtIODevice *vdev, hwaddr pa)
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         return lduw_be_phys(dma_as, pa);
     }
     return lduw_le_phys(dma_as, pa);
@@ -53,7 +53,7 @@ static inline uint32_t virtio_ldl_phys(VirtIODevice *vdev, hwaddr pa)
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         return ldl_be_phys(dma_as, pa);
     }
     return ldl_le_phys(dma_as, pa);
@@ -63,7 +63,7 @@ static inline uint64_t virtio_ldq_phys(VirtIODevice *vdev, hwaddr pa)
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         return ldq_be_phys(dma_as, pa);
     }
     return ldq_le_phys(dma_as, pa);
@@ -74,7 +74,7 @@ static inline void virtio_stw_phys(VirtIODevice *vdev, hwaddr pa,
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         stw_be_phys(dma_as, pa, value);
     } else {
         stw_le_phys(dma_as, pa, value);
@@ -86,7 +86,7 @@ static inline void virtio_stl_phys(VirtIODevice *vdev, hwaddr pa,
 {
     AddressSpace *dma_as = vdev->dma_as;
 
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         stl_be_phys(dma_as, pa, value);
     } else {
         stl_le_phys(dma_as, pa, value);
@@ -95,7 +95,7 @@ static inline void virtio_stl_phys(VirtIODevice *vdev, hwaddr pa,
 
 static inline void virtio_stw_p(VirtIODevice *vdev, void *ptr, uint16_t v)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         stw_be_p(ptr, v);
     } else {
         stw_le_p(ptr, v);
@@ -104,7 +104,7 @@ static inline void virtio_stw_p(VirtIODevice *vdev, void *ptr, uint16_t v)
 
 static inline void virtio_stl_p(VirtIODevice *vdev, void *ptr, uint32_t v)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         stl_be_p(ptr, v);
     } else {
         stl_le_p(ptr, v);
@@ -113,7 +113,7 @@ static inline void virtio_stl_p(VirtIODevice *vdev, void *ptr, uint32_t v)
 
 static inline void virtio_stq_p(VirtIODevice *vdev, void *ptr, uint64_t v)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         stq_be_p(ptr, v);
     } else {
         stq_le_p(ptr, v);
@@ -122,7 +122,7 @@ static inline void virtio_stq_p(VirtIODevice *vdev, void *ptr, uint64_t v)
 
 static inline int virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         return lduw_be_p(ptr);
     } else {
         return lduw_le_p(ptr);
@@ -131,7 +131,7 @@ static inline int virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
 
 static inline int virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         return ldl_be_p(ptr);
     } else {
         return ldl_le_p(ptr);
@@ -140,7 +140,7 @@ static inline int virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
 
 static inline uint64_t virtio_ldq_p(VirtIODevice *vdev, const void *ptr)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         return ldq_be_p(ptr);
     } else {
         return ldq_le_p(ptr);
@@ -150,9 +150,9 @@ static inline uint64_t virtio_ldq_p(VirtIODevice *vdev, const void *ptr)
 static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
 {
 #if HOST_BIG_ENDIAN
-    return virtio_access_is_big_endian(vdev) ? s : bswap16(s);
+    return vdev->access_is_big_endian ? s : bswap16(s);
 #else
-    return virtio_access_is_big_endian(vdev) ? bswap16(s) : s;
+    return vdev->access_is_big_endian ? bswap16(s) : s;
 #endif
 }
 
@@ -160,7 +160,7 @@ static inline uint16_t virtio_lduw_phys_cached(VirtIODevice *vdev,
                                                MemoryRegionCache *cache,
                                                hwaddr pa)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         return lduw_be_phys_cached(cache, pa);
     }
     return lduw_le_phys_cached(cache, pa);
@@ -170,7 +170,7 @@ static inline uint32_t virtio_ldl_phys_cached(VirtIODevice *vdev,
                                               MemoryRegionCache *cache,
                                               hwaddr pa)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         return ldl_be_phys_cached(cache, pa);
     }
     return ldl_le_phys_cached(cache, pa);
@@ -180,7 +180,7 @@ static inline uint64_t virtio_ldq_phys_cached(VirtIODevice *vdev,
                                               MemoryRegionCache *cache,
                                               hwaddr pa)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         return ldq_be_phys_cached(cache, pa);
     }
     return ldq_le_phys_cached(cache, pa);
@@ -190,7 +190,7 @@ static inline void virtio_stw_phys_cached(VirtIODevice *vdev,
                                           MemoryRegionCache *cache,
                                           hwaddr pa, uint16_t value)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         stw_be_phys_cached(cache, pa, value);
     } else {
         stw_le_phys_cached(cache, pa, value);
@@ -201,7 +201,7 @@ static inline void virtio_stl_phys_cached(VirtIODevice *vdev,
                                           MemoryRegionCache *cache,
                                           hwaddr pa, uint32_t value)
 {
-    if (virtio_access_is_big_endian(vdev)) {
+    if (vdev->access_is_big_endian) {
         stl_be_phys_cached(cache, pa, value);
     } else {
         stl_le_phys_cached(cache, pa, value);
@@ -216,9 +216,9 @@ static inline void virtio_tswap16s(VirtIODevice *vdev, uint16_t *s)
 static inline uint32_t virtio_tswap32(VirtIODevice *vdev, uint32_t s)
 {
 #if HOST_BIG_ENDIAN
-    return virtio_access_is_big_endian(vdev) ? s : bswap32(s);
+    return vdev->access_is_big_endian ? s : bswap32(s);
 #else
-    return virtio_access_is_big_endian(vdev) ? bswap32(s) : s;
+    return vdev->access_is_big_endian ? bswap32(s) : s;
 #endif
 }
 
@@ -230,9 +230,9 @@ static inline void virtio_tswap32s(VirtIODevice *vdev, uint32_t *s)
 static inline uint64_t virtio_tswap64(VirtIODevice *vdev, uint64_t s)
 {
 #if HOST_BIG_ENDIAN
-    return virtio_access_is_big_endian(vdev) ? s : bswap64(s);
+    return vdev->access_is_big_endian ? s : bswap64(s);
 #else
-    return virtio_access_is_big_endian(vdev) ? bswap64(s) : s;
+    return vdev->access_is_big_endian ? bswap64(s) : s;
 #endif
 }
 
-- 
2.38.1


