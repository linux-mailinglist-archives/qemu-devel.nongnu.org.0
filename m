Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A050A3607E6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 13:02:23 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzlO-00064h-P7
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 07:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lWzkA-0005by-TU
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lWzk2-0004YR-Go
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 07:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618484452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePzf7bEv+DbDMD42cvU8l+oJ+LINvrC2waN/zNmF4x0=;
 b=K7oG4nvd2NT+sT1Jmu2n/dQi5xRHv57nNsRiRV0v2ev/STRPwl2YyhqNrcaixdnptpS0Xb
 DImii9ljM0BT9+CGSl0VxB2H9HfPbGOdJZjDBVuFZyEpnHZcvemFBJUkMflDC1au8T+rPZ
 KOaaBWgiX6mkuM50vhrwamL2e8gsEOY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-HQoJQ4yrOry_Z1e5l-5SaQ-1; Thu, 15 Apr 2021 07:00:51 -0400
X-MC-Unique: HQoJQ4yrOry_Z1e5l-5SaQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 jl27-20020a17090775dbb029037ccdce96e6so785592ejc.21
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 04:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ePzf7bEv+DbDMD42cvU8l+oJ+LINvrC2waN/zNmF4x0=;
 b=UtJCit6qsdPWFxLrfBumEjrUIF9zCeuVLaV3NkvO56bae0XYd7MH4kHBlZCRYl1Ngu
 tY9vF1TVa9bzWlg+GnGRHmyioSvdAMy2D7J7gxHt/18jogqnPFu7GzLsRaaNyCuc/eJa
 Ih/TZh25NQ98YOzSMS/6+HpyLqlNLMUsf6yxi0QixgeW4bIWaycvfvBtxEgJGMELNtcb
 PQQLg5SkHgKSXVottcf9gVifiOfHOMOEwC33m9XoanKVIKZ3EvFfZtsWeRFzJa5iU1F2
 TZoeEVMKGmIHRT0SgPR2yAalCYSwMvi9O8tBBf76ab2QC6Il4sN7K8DfVkdVKXFsz9t5
 uliQ==
X-Gm-Message-State: AOAM530TcKjBy+mWx154l3w14F+Mcw6zatZHmvSOyIgGYyTTmUwpNnCp
 MYpOD9XOdV2JKYJ+8LovYouy9Zlt2vPPEzqmu0nmL6Xo+R1HdBO3K+HWmb4mdOpO8pMnEXktZBC
 JyZJTgrssxN3ojcc=
X-Received: by 2002:a17:906:d04d:: with SMTP id
 bo13mr2777021ejb.157.1618484450099; 
 Thu, 15 Apr 2021 04:00:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYcUnLtldd+fGRL4mNXLx1Mgaf6PoVKWXnR6Kcr28Gr4XJXztQvuhke2XvfM+GWuq2fDFXGQ==
X-Received: by 2002:a17:906:d04d:: with SMTP id
 bo13mr2776995ejb.157.1618484449884; 
 Thu, 15 Apr 2021 04:00:49 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id k19sm1590865ejk.117.2021.04.15.04.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 04:00:49 -0700 (PDT)
Date: Thu, 15 Apr 2021 13:00:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/2] exec/memory: Extract address_space_set() from
 dma_memory_set()
Message-ID: <20210415110047.ku3uqj5evcprs77r@steredhat>
References: <20210415100409.3977971-1-philmd@redhat.com>
 <20210415100409.3977971-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415100409.3977971-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 12:04:08PM +0200, Philippe Mathieu-Daudé wrote:
>dma_memory_set() does a DMA barrier, set the address space with
>a constant value. The constant value filling code is not specific
>to DMA and can be used for AddressSpace. Extract it as a new
>helper: address_space_set().
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> include/exec/memory.h | 16 ++++++++++++++++
> softmmu/dma-helpers.c | 16 +---------------
> softmmu/physmem.c     | 19 +++++++++++++++++++
> 3 files changed, 36 insertions(+), 15 deletions(-)
>
>diff --git a/include/exec/memory.h b/include/exec/memory.h
>index 5728a681b27..192139af58e 100644
>--- a/include/exec/memory.h
>+++ b/include/exec/memory.h
>@@ -2568,6 +2568,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
>     }
> }
>
>+/**
>+ * address_space_set: Fill address space with a constant byte.
>+ *
>+ * Return a MemTxResult indicating whether the operation succeeded
>+ * or failed (eg unassigned memory, device rejected the transaction,
>+ * IOMMU fault).
>+ *
>+ * @as: #AddressSpace to be accessed
>+ * @addr: address within that address space
>+ * @c: constant byte to fill the memory
>+ * @len: the number of bytes to fill with the constant byte
>+ * @attrs: memory transaction attributes
>+ */
>+MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
>+                              uint8_t c, hwaddr len, MemTxAttrs attrs);
>+
> #ifdef NEED_CPU_H
> /* enum device_endian to MemOp.  */
> static inline MemOp devend_memop(enum device_endian end)
>diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
>index 7d766a5e89a..8e1e7ad5320 100644
>--- a/softmmu/dma-helpers.c
>+++ b/softmmu/dma-helpers.c
>@@ -23,21 +23,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
> {
>     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
>
>-#define FILLBUF_SIZE 512
>-    uint8_t fillbuf[FILLBUF_SIZE];
>-    int l;
>-    MemTxResult error = MEMTX_OK;
>-
>-    memset(fillbuf, c, FILLBUF_SIZE);
>-    while (len > 0) {
>-        l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
>-        error |= address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
>-                                     fillbuf, l);
>-        len -= l;
>-        addr += l;
>-    }
>-
>-    return error;
>+    return address_space_set(as, addr, c, len, MEMTXATTRS_UNSPECIFIED);
> }
>
> void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
>diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>index 85034d9c11e..c9117527ae7 100644
>--- a/softmmu/physmem.c
>+++ b/softmmu/physmem.c
>@@ -2891,6 +2891,25 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
>     }
> }
>
>+MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
>+                              uint8_t c, hwaddr len, MemTxAttrs attrs)
>+{
>+#define FILLBUF_SIZE 512
>+    uint8_t fillbuf[FILLBUF_SIZE];
>+    int l;
>+    MemTxResult error = MEMTX_OK;
>+
>+    memset(fillbuf, c, FILLBUF_SIZE);
>+    while (len > 0) {

What about return immediately if there is an error?
I mean:
     while (len > 0 && result == MEMTX_OK) {

I don't have a strong opinion on that, so in both cases:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>+        l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
>+        error |= address_space_write(as, addr, attrs, fillbuf, l);
>+        len -= l;
>+        addr += l;
>+    }
>+
>+    return error;
>+}
>+
> void cpu_physical_memory_rw(hwaddr addr, void *buf,
>                             hwaddr len, bool is_write)
> {
>-- 
>2.26.3
>


