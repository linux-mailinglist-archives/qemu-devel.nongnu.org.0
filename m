Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE73B360787
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:49:36 +0200 (CEST)
Received: from localhost ([::1]:35820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzZ1-0008Su-RL
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lWzWP-0006rb-Ka
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:46:57 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lWzWH-000508-Cu
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:46:51 -0400
Received: from [192.168.100.1] ([82.142.18.94]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxmBc-1ljpLB2EiE-00zGCM; Thu, 15 Apr 2021 12:46:35 +0200
Subject: Re: [PATCH v2 1/2] exec/memory: Extract address_space_set() from
 dma_memory_set()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20210415100409.3977971-1-philmd@redhat.com>
 <20210415100409.3977971-2-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9a72b757-1d9a-f4c7-e22c-8a073a48a9a9@vivier.eu>
Date: Thu, 15 Apr 2021 12:46:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415100409.3977971-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sG2odHTSmJ3xv9znbBdtQoo0hGNbA5parQPzKlZNtcA2ZanupAj
 Yryla7vqswcBQ9cG7F/i3kWVbvdUlQzewgPrsz5elS4q45q+JNDK+ezDV9vKRRAB2oldF1Z
 zsDfL1K/5DokV+Lost1dHN7hK6TsJjrBNCnlEQ9h/2ddBf2DL90b01PHqc7y1WzEgotIHjw
 HTmyAKAyLrAuwrjuNj20w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5JdKggw5GXU=:36Cgjab0+U4Mh+Wt+T06z/
 +OmgnGEGqh8nCy3V7zKdYABpDSlMUTSAQr0q6UTIXXfs0KC+1hMl2y6y1a5m9eAYVZFEHx75S
 3Z1o9ma4Hc4hs5fq+LrU+hyWvlNkSNtB47pCl1fq77mRlGyjVzEnkVhwL0f+MPqzuomX5P9Pr
 1onKc37L8xndqRd0ITofyXYBfd0L/rNsI/p0nnDW60tQEuzshnHlXl4F9UN+Nzh4VR5o3ny5d
 EiZYCWNb77nEeloGlUIzYqG3xzYf1jZ3MtVVUI6/8ZtG7sla0DQD9CBvHJTk/fvwoOciomKci
 9uKOdA7K8QPUKfigmOPX9D/6ovlWO1nEmBF1YBY1RYfUS8ljxQjo9JIeah4Fb43Vucj53le1e
 rKg4pt8lfbJXHm0gQ4WySaoHpblu25pjydoXKBceDPK7ezHytm9/1x6NZvZcyshFKQgMNpuVn
 2PpzeDlbPL5hxEUb6qzc9O4KatnV36h+B3KdGUaf6RLLJneg3t+MFA7cSlKJBLpeRaGIBfjQT
 gFBs/NPmAEu+WnG3whxdEc=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/04/2021 à 12:04, Philippe Mathieu-Daudé a écrit :
> dma_memory_set() does a DMA barrier, set the address space with
> a constant value. The constant value filling code is not specific
> to DMA and can be used for AddressSpace. Extract it as a new
> helper: address_space_set().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/exec/memory.h | 16 ++++++++++++++++
>  softmmu/dma-helpers.c | 16 +---------------
>  softmmu/physmem.c     | 19 +++++++++++++++++++
>  3 files changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 5728a681b27..192139af58e 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2568,6 +2568,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
>      }
>  }
>  
> +/**
> + * address_space_set: Fill address space with a constant byte.
> + *
> + * Return a MemTxResult indicating whether the operation succeeded
> + * or failed (eg unassigned memory, device rejected the transaction,
> + * IOMMU fault).
> + *
> + * @as: #AddressSpace to be accessed
> + * @addr: address within that address space
> + * @c: constant byte to fill the memory
> + * @len: the number of bytes to fill with the constant byte
> + * @attrs: memory transaction attributes
> + */
> +MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
> +                              uint8_t c, hwaddr len, MemTxAttrs attrs);
> +
>  #ifdef NEED_CPU_H
>  /* enum device_endian to MemOp.  */
>  static inline MemOp devend_memop(enum device_endian end)
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7d766a5e89a..8e1e7ad5320 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -23,21 +23,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
>  {
>      dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
>  
> -#define FILLBUF_SIZE 512
> -    uint8_t fillbuf[FILLBUF_SIZE];
> -    int l;
> -    MemTxResult error = MEMTX_OK;
> -
> -    memset(fillbuf, c, FILLBUF_SIZE);
> -    while (len > 0) {
> -        l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
> -        error |= address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
> -                                     fillbuf, l);
> -        len -= l;
> -        addr += l;
> -    }
> -
> -    return error;
> +    return address_space_set(as, addr, c, len, MEMTXATTRS_UNSPECIFIED);
>  }
>  
>  void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 85034d9c11e..c9117527ae7 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2891,6 +2891,25 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
>      }
>  }
>  
> +MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
> +                              uint8_t c, hwaddr len, MemTxAttrs attrs)
> +{
> +#define FILLBUF_SIZE 512
> +    uint8_t fillbuf[FILLBUF_SIZE];
> +    int l;
> +    MemTxResult error = MEMTX_OK;
> +
> +    memset(fillbuf, c, FILLBUF_SIZE);
> +    while (len > 0) {
> +        l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
> +        error |= address_space_write(as, addr, attrs, fillbuf, l);
> +        len -= l;
> +        addr += l;
> +    }
> +
> +    return error;
> +}
> +
>  void cpu_physical_memory_rw(hwaddr addr, void *buf,
>                              hwaddr len, bool is_write)
>  {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

