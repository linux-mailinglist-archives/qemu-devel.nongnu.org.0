Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781654EDFAA
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:31:11 +0200 (CEST)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyda-0000Eo-36
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:31:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZybl-0007En-PT
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZybi-0007OD-4H
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648747752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ETDcC60q0vpwy3D5uyi2yuHnOGLu+/ObquldxvWQ3YY=;
 b=DcNcGXY/tKWrMo4Y+Rx6h1+GpIcwByA98WGRiX2NNNZxpNtZ6iBtwksMP4haOCg2x3Iz0a
 dthIVtJxuLnNIJsA54koWbhIM/XmAbNpmc9aPVQ7ZYAZmURhSVTxm3MWmDb3yhONun+R78
 8iBqBsCqzmOzl8Ypz9nMBXeQSwwfcqA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-nlD5l7utP-OdHYhxly7liA-1; Thu, 31 Mar 2022 13:29:11 -0400
X-MC-Unique: nlD5l7utP-OdHYhxly7liA-1
Received: by mail-qk1-f199.google.com with SMTP id
 207-20020a3706d8000000b0067b322bef9eso81649qkg.3
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ETDcC60q0vpwy3D5uyi2yuHnOGLu+/ObquldxvWQ3YY=;
 b=p70mT5HrBVbxA1hVpNHK5CCskNAaAb7bwW8YapIIuOcLs5q4/Ges8ZQ5o4k2nzmELg
 O2o7jqFBNSn+e1n88djjtfPFEY1efPANASpDHKHNuNOdtpQHjibHJw9+tAoqRLWZNXei
 VdAFdu1Ffc3tCbdG1YY/RP/MoAz9PoD0F0t2jhU9XqPn+tOgwCMrnqx0xZh8v96l4Res
 nzTeK8xVrUXSLtdPyrhI4+M5U3eIpnOWPscjyFmR9et0eGsZ3d+wVUlz51gV2aQALKmt
 dgrg6S992cdX7VcW2nCc/hGUIaOYrFixyQCl1jwH9nSI5R+2+NLcXtm9X+AcXG22afk4
 lcTQ==
X-Gm-Message-State: AOAM530TVXYGnqScAxwuaSImZd2NYegemuYpFrXDrLKlQ/kJ85YUePki
 aBBjKOoP1sf9VDa+ZtQzxY7FZgtDh73JCU8yPMCQZS1yQxmrZQSnD1sVpJfcZspo9N1Evi5ey5m
 IVLxh8Dfn5yAc5+4=
X-Received: by 2002:ac8:5a0c:0:b0:2e1:d196:dbae with SMTP id
 n12-20020ac85a0c000000b002e1d196dbaemr5177426qta.271.1648747749725; 
 Thu, 31 Mar 2022 10:29:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8uxeo/184H22jMQi+2fOLJcNreO7qZ6cj3+sehXHsvkypmOHqR7vQ1+5CEfBuY4IFCJ7Olw==
X-Received: by 2002:ac8:5a0c:0:b0:2e1:d196:dbae with SMTP id
 n12-20020ac85a0c000000b002e1d196dbaemr5177408qta.271.1648747749403; 
 Thu, 31 Mar 2022 10:29:09 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 c145-20020a379a97000000b0067d943f7586sm12603704qke.123.2022.03.31.10.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 10:29:09 -0700 (PDT)
Date: Thu, 31 Mar 2022 13:29:07 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Subject: Re: [PATCH 2/2] softmmu/physmem: fix dirty memory bitmap memleak
Message-ID: <YkXk43o5wuSc1mMh@xz-m1.local>
References: <20220325154013.16809-1-arbn@yandex-team.com>
 <20220325154013.16809-2-arbn@yandex-team.com>
MIME-Version: 1.0
In-Reply-To: <20220325154013.16809-2-arbn@yandex-team.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 25, 2022 at 06:40:13PM +0300, Andrey Ryabinin wrote:
> The sequence of ram_block_add()/qemu_ram_free()/ram_block_add()
> function calls leads to leaking some memory.
> 
> ram_block_add() calls dirty_memory_extend() to allocate bitmap blocks
> for new memory. These blocks only grow but never shrink. So the
> qemu_ram_free() restores RAM size back to it's original stat but
> doesn't touch dirty memory bitmaps.
> 
> After qemu_ram_free() there is no way of knowing that we have
> allocated dirty memory bitmaps beyond current RAM size.
> So the next ram_block_add() will call dirty_memory_extend() again to
> to allocate new bitmaps and rewrite pointers to bitmaps left after
> the first ram_block_add()/dirty_memory_extend() calls.
> 
> Rework dirty_memory_extend() to be able to shrink dirty maps,
> also rename it to dirty_memory_resize(). And fix the leak by
> shrinking dirty memory maps on qemu_ram_free() if needed.
> 
> Fixes: 5b82b703b69a ("memory: RCU ram_list.dirty_memory[] for safe RAM hotplug")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
> ---
>  include/exec/ramlist.h |  2 ++
>  softmmu/physmem.c      | 38 ++++++++++++++++++++++++++++++++------
>  2 files changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
> index 2ad2a81acc..019e238e7c 100644
> --- a/include/exec/ramlist.h
> +++ b/include/exec/ramlist.h
> @@ -41,6 +41,8 @@ typedef struct RAMBlockNotifier RAMBlockNotifier;
>  #define DIRTY_MEMORY_BLOCK_SIZE ((ram_addr_t)256 * 1024 * 8)
>  typedef struct {
>      struct rcu_head rcu;
> +    unsigned int nr_blocks;

Nit: How about renaming it to nr_blocks_allocated?  It's much harder to
identify this with the _inuse below otherwise..

It'll be great if there're comments explaining the two fields.

> +    unsigned int nr_blocks_inuse;

If there'll be comment, we should definitely mark out that this variable is
only set when a new array will be replacing this one.  IOW, this field is
not valid during most lifecycle of this structure, iiuc.  And that's very
not obvious..

>      unsigned long *blocks[];
>  } DirtyMemoryBlocks;
>  
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 32f76362bf..073ab37351 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1919,8 +1919,23 @@ void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length)
>      }
>  }
>  
> +static void dirty_memory_free(DirtyMemoryBlocks *blocks)
> +{
> +    int i;
> +
> +    /*
> +     *'nr_blocks_inuse' is more than nr_blocks (memory was extended)
> +     * or it's less than 'nr_blocks' (memory shrunk). In the second case
> +     * we free all the blocks above the nr_blocks_inuse.
> +     */
> +    for (i = blocks->nr_blocks_inuse; i < blocks->nr_blocks; i++) {
> +        g_free(blocks->blocks[i]);
> +    }
> +    g_free(blocks);
> +}
> +
>  /* Called with ram_list.mutex held */
> -static void dirty_memory_extend(ram_addr_t old_ram_size,
> +static void dirty_memory_resize(ram_addr_t old_ram_size,
>                                  ram_addr_t new_ram_size)
>  {
>      ram_addr_t old_num_blocks = DIV_ROUND_UP(old_ram_size,
> @@ -1929,25 +1944,28 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
>                                               DIRTY_MEMORY_BLOCK_SIZE);
>      int i;
>  
> -    /* Only need to extend if block count increased */
> -    if (new_num_blocks <= old_num_blocks) {
> +    /* Only need to resize if block count changed */
> +    if (new_num_blocks == old_num_blocks) {
>          return;
>      }
>  
>      for (i = 0; i < DIRTY_MEMORY_NUM; i++) {
>          DirtyMemoryBlocks *old_blocks;
>          DirtyMemoryBlocks *new_blocks;
> +        unsigned int num_blocks = MAX(old_num_blocks, new_num_blocks);
>          int j;
>  
>          old_blocks = qatomic_rcu_read(&ram_list.dirty_memory[i]);
>          new_blocks = g_malloc(sizeof(*new_blocks) +
> -                              sizeof(new_blocks->blocks[0]) * new_num_blocks);
> +                              sizeof(new_blocks->blocks[0]) * num_blocks);
> +        new_blocks->nr_blocks = new_num_blocks;

Here new_num_blocks is passed to nr_blocks, however the allocation is with
size max(old, new).  Shouldn't it still be new_num_blocks?

>  
>          if (old_num_blocks) {
>              memcpy(new_blocks->blocks, old_blocks->blocks,
>                     old_num_blocks * sizeof(old_blocks->blocks[0]));

Here we copied over all old pointers even if old>new..

If we allocate the new array with new_num_blocks entries only, shouldn't we
copy min(old, new) here instead?

Thanks,

>          }
>  
> +        /* memory extend case (new>old): allocate new blocks*/
>          for (j = old_num_blocks; j < new_num_blocks; j++) {
>              new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>          }
> @@ -1955,7 +1973,8 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
>          qatomic_rcu_set(&ram_list.dirty_memory[i], new_blocks);
>  
>          if (old_blocks) {
> -            g_free_rcu(old_blocks, rcu);
> +            old_blocks->nr_blocks_inuse = new_num_blocks;
> +            call_rcu(old_blocks, dirty_memory_free, rcu);
>          }
>      }
>  }
> @@ -2001,7 +2020,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>      new_ram_size = MAX(old_ram_size,
>                (new_block->offset + new_block->max_length) >> TARGET_PAGE_BITS);
>      if (new_ram_size > old_ram_size) {
> -        dirty_memory_extend(old_ram_size, new_ram_size);
> +        dirty_memory_resize(old_ram_size, new_ram_size);
>      }
>      /* Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
>       * QLIST (which has an RCU-friendly variant) does not have insertion at
> @@ -2218,6 +2237,8 @@ static void reclaim_ramblock(RAMBlock *block)
>  
>  void qemu_ram_free(RAMBlock *block)
>  {
> +    ram_addr_t old_ram_size, new_ram_size;
> +
>      if (!block) {
>          return;
>      }
> @@ -2228,12 +2249,17 @@ void qemu_ram_free(RAMBlock *block)
>      }
>  
>      qemu_mutex_lock_ramlist();
> +    old_ram_size = last_ram_page();
> +
>      QLIST_REMOVE_RCU(block, next);
>      ram_list.mru_block = NULL;
>      /* Write list before version */
>      smp_wmb();
>      ram_list.version++;
>      call_rcu(block, reclaim_ramblock, rcu);
> +
> +    new_ram_size = last_ram_page();
> +    dirty_memory_resize(old_ram_size, new_ram_size);
>      qemu_mutex_unlock_ramlist();
>  }
>  
> -- 
> 2.34.1
> 

-- 
Peter Xu


