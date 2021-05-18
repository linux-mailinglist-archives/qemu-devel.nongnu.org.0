Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C876238800C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:56:29 +0200 (CEST)
Received: from localhost ([::1]:57816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4tI-0005K3-Ta
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cP-0003NO-QZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:39:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cO-0000PD-3U
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEk8xnP8O33ZJSwD+df7PFRkkbykJzfgf6b1n4NdYiw=;
 b=QaiyKIXi0Fwyq3JfuNnq9NJAF0aTY2o24aWkLivfMAZR41Zf5VgVxwzM8KU6L2Jj8RUunR
 LTgDaUtDRWQ7vy+Aznni0d2+80vCH/B4aP/cMC8S/rwIkBPNyp4ccRsGUCudDgo2lH8Nzu
 zVkkpRVPt1qiLMUkILD4/+IgXuNvWcg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-MydVPJuGNo6rAORMmjALKw-1; Tue, 18 May 2021 14:38:54 -0400
X-MC-Unique: MydVPJuGNo6rAORMmjALKw-1
Received: by mail-ej1-f72.google.com with SMTP id
 bi3-20020a170906a243b02903933c4d9132so2755674ejb.11
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xEk8xnP8O33ZJSwD+df7PFRkkbykJzfgf6b1n4NdYiw=;
 b=orVI4Rxne8kx4gwHNNyQ/2l9qPnQ/JzO/W1qXpnesOKHbOMVso4yxAXhxAWutzeFAL
 gVRyXHd3KVIRkIR11GlgC7v/M95cCh7BYPPNBEk//fux173uOZ8rpJOCH69CiNJscyEq
 MEjvOpgOnkM9crDrnj63o9C+mIE52/qO3IHj0ROrtqJOKsZDUCEsH7T/AtqaijGAaV/k
 ZfLutl9tmw7t/Abe+q3eQCHdVTBXfgj77dFp4zEryz8VcoRPZrU310v/hxKnlCkNVWlS
 wKUvjpGISenoaaFu44EygkFG79LFHP8N+6o1AbpVKK6bNFSh+27APPeKG0D5/qb9YqBp
 J8tw==
X-Gm-Message-State: AOAM5326cSh8I1dLEH1XnCOsp3dTz4FQj+E1lHqIamtfYCmC7EkfyuAS
 G2Jjz3PTVOuKDBnNuZm3t03W9d9Fg8ANU8uGb5D1oE2Ne574ae7pEKRSwufNZTQQ89n6qiyBmgA
 VrVwdMcbaVKY9ZrSnkST/pkiKOTl7+KuPdofwG67d62yiIESWA7fpqX+VBQHYZCIi
X-Received: by 2002:a05:6402:17d9:: with SMTP id
 s25mr8515643edy.337.1621363133292; 
 Tue, 18 May 2021 11:38:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqPiDjpirvcTuktymefzdLqr0h1x+gjXThGtoYvkzgiRx5PfFwdcWWeCMmQtFUTPhuan8oKA==
X-Received: by 2002:a05:6402:17d9:: with SMTP id
 s25mr8515615edy.337.1621363133140; 
 Tue, 18 May 2021 11:38:53 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r17sm13274889edt.33.2021.05.18.11.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 23/25] hw/virtio: Use LDST_CONVERT macro to emit 64-bit
 load/store functions
Date: Tue, 18 May 2021 20:36:53 +0200
Message-Id: <20210518183655.1711377-24-philmd@redhat.com>
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
 include/hw/virtio/virtio-access.h | 39 +------------------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 0df52d190dc..ae66bbd74f9 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -107,34 +107,7 @@ static inline void virtio_st ## size ## _phys_cached(VirtIODevice *vdev,\
 VIRTIO_LD_CONVERT(uw, uint16_t)
 VIRTIO_ST_CONVERT(w, uint16_t)
 VIRTIO_LDST_CONVERT(l, int, uint32_t)
-
-static inline uint64_t virtio_ldq_phys(VirtIODevice *vdev, hwaddr pa)
-{
-    AddressSpace *dma_as = vdev->dma_as;
-
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldq_be_phys(dma_as, pa);
-    }
-    return ldq_le_phys(dma_as, pa);
-}
-
-static inline void virtio_stq_p(VirtIODevice *vdev, void *ptr, uint64_t v)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        stq_be_p(ptr, v);
-    } else {
-        stq_le_p(ptr, v);
-    }
-}
-
-static inline uint64_t virtio_ldq_p(VirtIODevice *vdev, const void *ptr)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldq_be_p(ptr);
-    } else {
-        return ldq_le_p(ptr);
-    }
-}
+VIRTIO_LDST_CONVERT(q, uint64_t, uint64_t)
 
 static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
 {
@@ -145,16 +118,6 @@ static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
 #endif
 }
 
-static inline uint64_t virtio_ldq_phys_cached(VirtIODevice *vdev,
-                                              MemoryRegionCache *cache,
-                                              hwaddr pa)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldq_be_phys_cached(cache, pa);
-    }
-    return ldq_le_phys_cached(cache, pa);
-}
-
 static inline void virtio_tswap16s(VirtIODevice *vdev, uint16_t *s)
 {
     *s = virtio_tswap16(vdev, *s);
-- 
2.26.3


