Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0E04EDFC5
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:36:44 +0200 (CEST)
Received: from localhost ([::1]:44566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyix-0006QU-Kf
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:36:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZyhQ-0004yB-0L
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZyhL-0000IR-Kz
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648748102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lo5fYXubQisqy0pHKUUIJWw+qgSfTujmKX8/F8TFr/Y=;
 b=OcB2tq/xJaizhHYNVml67ESSStNT9fMxPsdfQX79rP/kx3vjXLezOA2fDvSZkXhyzDImHj
 YYQVycL2WTW/O7XU00Z3T/PNQRxfGBWBxgLuSv2cLXwMUGOk+nm2gGeOagEG+mO9ENQkei
 m5g9iM1Cr9REQbACPZYpZ3VygYna8PE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-sGU52cfsP_ShbU6UdPKeBg-1; Thu, 31 Mar 2022 13:35:01 -0400
X-MC-Unique: sGU52cfsP_ShbU6UdPKeBg-1
Received: by mail-qt1-f200.google.com with SMTP id
 f3-20020ac84983000000b002e22396acfbso38203qtq.18
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lo5fYXubQisqy0pHKUUIJWw+qgSfTujmKX8/F8TFr/Y=;
 b=SazzKRAO+/yc2DCmUYxJByAfCv04G+kyuTmacYJFmgjzjUxMzJLa8rgfoMpJq8G90T
 1G8Dt6rs0I3za8yji4/PupdBldOpSt5O924w8IjoBfefeot/+cwYJOqMXaQo/xsgtUIu
 D0LrdhpAVQmfrLo05nR58A2rjKCdUJDmdOgbp9deBheLREF5zHM24iJF/xAsOJlpT1YA
 q/pQUts19MTwN8U4YoFC1Erv6FzFjSan0kolMlc5Z5aRVMzyH3j5yp53wsmBsDKuILMx
 6QOfMkqcUi8cq6AMDQHvvQXlXSTqdoZ4cCYZ81sbCWQuFVodo6HL3iqhdHpQmbsy3Bem
 7+Pg==
X-Gm-Message-State: AOAM532NpThPiind0eJQTI3+soRbS9FfbkAAD0yuenX+gaeEpGFuggt2
 MZUXIWwflwdaubFnGd7kPt2QVzyJ50mKUdJtdwQxdEKME7f4zQDbWSxJQgfV9I5EL31qYbSEYQX
 qp8GEgZaNJzHXV3o=
X-Received: by 2002:a05:6214:1bcb:b0:441:759e:84b9 with SMTP id
 m11-20020a0562141bcb00b00441759e84b9mr33713062qvc.19.1648748100258; 
 Thu, 31 Mar 2022 10:35:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAMU+ymB+ke9IIib8FXrEyW2CbXJ4iLVjlHI2AzDMI8iSAM7snusOrS/qreIHhDY+uBHQyeA==
X-Received: by 2002:a05:6214:1bcb:b0:441:759e:84b9 with SMTP id
 m11-20020a0562141bcb00b00441759e84b9mr33713025qvc.19.1648748099690; 
 Thu, 31 Mar 2022 10:34:59 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 d82-20020a376855000000b0067dacb03b6esm12468442qkc.130.2022.03.31.10.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 10:34:59 -0700 (PDT)
Date: Thu, 31 Mar 2022 13:34:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Subject: Re: [PATCH 2/2] softmmu/physmem: fix dirty memory bitmap memleak
Message-ID: <YkXmQot/1pONmdtn@xz-m1.local>
References: <20220325154013.16809-1-arbn@yandex-team.com>
 <20220325154013.16809-2-arbn@yandex-team.com>
 <YkSuxObygiiPbXfo@xz-m1.local>
 <cbbc0453-62d2-b8b6-f9ef-6323f39b9560@yandex-team.com>
MIME-Version: 1.0
In-Reply-To: <cbbc0453-62d2-b8b6-f9ef-6323f39b9560@yandex-team.com>
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

On Thu, Mar 31, 2022 at 07:14:12PM +0300, Andrey Ryabinin wrote:
> 
> 
> On 3/30/22 22:25, Peter Xu wrote:
> > On Fri, Mar 25, 2022 at 06:40:13PM +0300, Andrey Ryabinin wrote:
> >> The sequence of ram_block_add()/qemu_ram_free()/ram_block_add()
> >> function calls leads to leaking some memory.
> >>
> >> ram_block_add() calls dirty_memory_extend() to allocate bitmap blocks
> >> for new memory. These blocks only grow but never shrink. So the
> >> qemu_ram_free() restores RAM size back to it's original stat but
> >> doesn't touch dirty memory bitmaps.
> >>
> >> After qemu_ram_free() there is no way of knowing that we have
> >> allocated dirty memory bitmaps beyond current RAM size.
> >> So the next ram_block_add() will call dirty_memory_extend() again to
> >> to allocate new bitmaps and rewrite pointers to bitmaps left after
> >> the first ram_block_add()/dirty_memory_extend() calls.
> >>
> >> Rework dirty_memory_extend() to be able to shrink dirty maps,
> >> also rename it to dirty_memory_resize(). And fix the leak by
> >> shrinking dirty memory maps on qemu_ram_free() if needed.
> >>
> >> Fixes: 5b82b703b69a ("memory: RCU ram_list.dirty_memory[] for safe RAM hotplug")
> >> Cc: qemu-stable@nongnu.org
> >> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
> >> ---
> >>  include/exec/ramlist.h |  2 ++
> >>  softmmu/physmem.c      | 38 ++++++++++++++++++++++++++++++++------
> >>  2 files changed, 34 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
> >> index 2ad2a81acc..019e238e7c 100644
> >> --- a/include/exec/ramlist.h
> >> +++ b/include/exec/ramlist.h
> >> @@ -41,6 +41,8 @@ typedef struct RAMBlockNotifier RAMBlockNotifier;
> >>  #define DIRTY_MEMORY_BLOCK_SIZE ((ram_addr_t)256 * 1024 * 8)
> >>  typedef struct {
> >>      struct rcu_head rcu;
> >> +    unsigned int nr_blocks;
> >> +    unsigned int nr_blocks_inuse;
> >>      unsigned long *blocks[];
> >>  } DirtyMemoryBlocks;
> > 
> > The problem looks valid, but can we avoid introducing these variables at
> > all?
> > 
> > IIUC what we miss here is the proper releasing of dirty blocks when ram is
> > released.  IMHO as long as we properly release the extra dirty memory
> > blocks in qemu_ram_free(), then last_ram_page() will reflect the existing
> > dirty memory block size.  That looks simpler if I'm correct..
> > 
> 
> ram_list.dirty_memory is RCU protected which means we can't free it immediately.
> Freeing must be delayed until the end of RCU grace period.
> One way to do it is using rcu callback, like in this patch. That why we need these
> variables - to pass the information into rcu callback.
> 
> Another way is using synchronize_rcu() before freeing the memory. In that case
> the variables won't be needed. But it's expensive.
> Also I'm not sure if using synchronize_rcu() under a mutex lock is a good idea.
> Perhaps it will needed somehow to rework dirty_memory_resize() to move synchronize_rcu() and freeing
> outside of mutex_lock()/unlock() section.

I suggested that just because from the 1st glance I failed to read clearly
on the current patch due to some trivial details (I commented inline),
which made me thought that merging extend/shrink is not necessary.  But I
agree it looks mostly correct, and call_rcu() should indeed be preferred.

Thanks,

-- 
Peter Xu


