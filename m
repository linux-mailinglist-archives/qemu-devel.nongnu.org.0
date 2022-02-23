Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4174C0F61
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:41:39 +0100 (CET)
Received: from localhost ([::1]:49710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMo9R-0002G2-RD
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnh9-0004NL-5e
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:12:26 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnh6-0002vN-V1
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:12:22 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id B6E0B21C2B;
 Wed, 23 Feb 2022 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VxurO+Taaelw6ptsfaXOdh+WlTM1bjPDCyZKCuw9kFM=;
 b=e3O0HLNZ4oOZCmFzpn6CNirVySdwk3JEOymMGH2Kge570g3AXJHJUnau5fBIEszkAoe6Wq
 etBl+2zP+E6JSRTMUvsQe2EQguVquAwirSXJLWsdhbhI1LDaA0sg4Un4JZ+NaTu5lYc5hy
 KbhSr2pV/b9wSKlWTm7DfimIdxBzg5U=
Message-ID: <bd6f884e-a150-88d8-4b8c-9ec76171b275@greensocs.com>
Date: Wed, 23 Feb 2022 10:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 11/14] softmmu/memory: add
 memory_region_try_add_subregion function
Content-Language: en-US-large
To: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-12-damien.hedde@greensocs.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220223090706.4888-12-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Philippe,

I suppose it is ok if I change your mail in the reviewed by ?

Thanks,
Damien

On 2/23/22 10:07, Damien Hedde wrote:
> It allows adding a subregion to a memory region with error handling.
> Like memory_region_add_subregion_overlap(), it handles priority as
> well. Apart from the error handling, the behavior is the same. It
> can be used to do the simple memory_region_add_subregion() (with no
> overlap) by setting the priority parameter to 0.
> 
> This commit is a preparation to further use of this function in the
> context of qapi command which needs error handling support.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   include/exec/memory.h | 22 ++++++++++++++++++++++
>   softmmu/memory.c      | 23 +++++++++++++++--------
>   2 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 4d5997e6bb..070dcb5255 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2215,6 +2215,28 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                            MemoryRegion *subregion,
>                                            int priority);
>   
> +/**
> + * memory_region_try_add_subregion: Add a subregion to a container
> + *                                  with error handling.
> + *
> + * Behaves like memory_region_add_subregion_overlap(), but errors are
> + * reported if the subregion cannot be added.
> + *
> + * @mr: the region to contain the new subregion; must be a container
> + *      initialized with memory_region_init().
> + * @offset: the offset relative to @mr where @subregion is added.
> + * @subregion: the subregion to be added.
> + * @priority: used for resolving overlaps; highest priority wins.
> + * @errp: pointer to Error*, to store an error if it happens.
> + *
> + * Returns: True in case of success, false otherwise.
> + */
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp);
> +
>   /**
>    * memory_region_get_ram_addr: Get the ram address associated with a memory
>    *                             region
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 678dc62f06..6bc76bf6da 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2541,27 +2541,34 @@ done:
>       memory_region_transaction_commit();
>   }
>   
> -static void memory_region_add_subregion_common(MemoryRegion *mr,
> -                                               hwaddr offset,
> -                                               MemoryRegion *subregion)
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp)
>   {
>       MemoryRegion *alias;
>   
> -    assert(!subregion->container);
> +    if (subregion->container) {
> +        error_setg(errp, "The memory region is already in another region");
> +        return false;
> +    }
> +
> +    subregion->priority = priority;
>       subregion->container = mr;
>       for (alias = subregion->alias; alias; alias = alias->alias) {
>           alias->mapped_via_alias++;
>       }
>       subregion->addr = offset;
>       memory_region_update_container_subregions(subregion);
> +    return true;
>   }
>   
>   void memory_region_add_subregion(MemoryRegion *mr,
>                                    hwaddr offset,
>                                    MemoryRegion *subregion)
>   {
> -    subregion->priority = 0;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, 0, &error_abort);
>   }
>   
>   void memory_region_add_subregion_overlap(MemoryRegion *mr,
> @@ -2569,8 +2576,8 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                            MemoryRegion *subregion,
>                                            int priority)
>   {
> -    subregion->priority = priority;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, priority,
> +                                    &error_abort);
>   }
>   
>   void memory_region_del_subregion(MemoryRegion *mr,

