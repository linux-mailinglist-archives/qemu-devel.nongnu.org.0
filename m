Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EBE4ECD35
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:27:22 +0200 (CEST)
Received: from localhost ([::1]:47590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdyT-0000cr-42
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:27:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZdxD-0007as-Qd
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 15:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZdxB-000871-8u
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 15:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648668360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSEl25+RfU8O+A2XBUICQ6IevkDCGMu7zFaoHhEZKzQ=;
 b=USlFXjmBmscjtDMaBqkNBSZGDnu6EffcwhVlE/bsYRQmILShv8aLDRNgAvM+fMZVnfZLSe
 bJoUVrtjIUjnG+l4ql9ZmRNKLFh32WBl2nLWSddjk0rq8zCIdUquTRAw/UOwDO35BOOL4z
 9cSrtGw/tjkcChTMZrqyB3YugGG+Kcg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-gDOWVyw-MeersuQPhJt0Yg-1; Wed, 30 Mar 2022 15:25:59 -0400
X-MC-Unique: gDOWVyw-MeersuQPhJt0Yg-1
Received: by mail-qt1-f197.google.com with SMTP id
 k11-20020ac8604b000000b002e1a4109edeso18158972qtm.15
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 12:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DSEl25+RfU8O+A2XBUICQ6IevkDCGMu7zFaoHhEZKzQ=;
 b=Q+D0lf4NrZjcUm41yqiaKitC2HxatK1N21hKCKU++Qm2eh19b1e/JUiqsheCFOeRXE
 Vt9DQC4DCmqIuXKR15JJ882ihvlmFDzuyVN6zoZcxCtOvOeY0AFdFmCPlq+hFgNlSmkq
 BpOKW+vGPsJFpuTJlWwhdF+D5YJZS1uY+ja5/cN7/grvno9KWDcsywowamK+u2npNR00
 ErexSKlLd/mSiVbz42Gt9M85KnbQgCvr/nN5eD6oa5cJXr53Twq8ko5okgnrgcWSNcbV
 IPu50TSt3mi1AOlbtq5cnXAFv7yh2yRjuOAoWrr4eDFkeltMkCFGdF9xw05oZ86cy7P5
 Fxgw==
X-Gm-Message-State: AOAM5306DBVI4+tvf0j+Lq1z0qfFzGfGWblQtkljtQd4CJLEFNts+jou
 c26meOePwGSJumH6wN/FKYo/2Dm5d4R6mSHU2hYHJLTTUXrclMF3XufxVSXIDFjladk2OWFQcAx
 RqhoINfGMkcx8uVw=
X-Received: by 2002:ac8:59d2:0:b0:2e1:f86d:b3d3 with SMTP id
 f18-20020ac859d2000000b002e1f86db3d3mr1105723qtf.276.1648668358594; 
 Wed, 30 Mar 2022 12:25:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw/LP6ESpVZ+W+B8mE5yDDzkHVCaJpKMKAx+CqYb3NAcpYT0oHQFtqJPkKmI02yzVK45Z2UA==
X-Received: by 2002:ac8:59d2:0:b0:2e1:f86d:b3d3 with SMTP id
 f18-20020ac859d2000000b002e1f86db3d3mr1105703qtf.276.1648668358346; 
 Wed, 30 Mar 2022 12:25:58 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 3-20020a370503000000b0067b03f03589sm11230549qkf.53.2022.03.30.12.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 12:25:57 -0700 (PDT)
Date: Wed, 30 Mar 2022 15:25:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Subject: Re: [PATCH 2/2] softmmu/physmem: fix dirty memory bitmap memleak
Message-ID: <YkSuxObygiiPbXfo@xz-m1.local>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> +    unsigned int nr_blocks_inuse;
>      unsigned long *blocks[];
>  } DirtyMemoryBlocks;

The problem looks valid, but can we avoid introducing these variables at
all?

IIUC what we miss here is the proper releasing of dirty blocks when ram is
released.  IMHO as long as we properly release the extra dirty memory
blocks in qemu_ram_free(), then last_ram_page() will reflect the existing
dirty memory block size.  That looks simpler if I'm correct..

Side question: both of the patches are not regression introduced in this
release, right?  So they are targeting for the next release?

Thanks,

-- 
Peter Xu


