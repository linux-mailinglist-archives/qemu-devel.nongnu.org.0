Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7E33F6A15
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 21:47:01 +0200 (CEST)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIcNw-0001jA-19
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 15:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIcN8-00011R-JL
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 15:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIcN2-00045C-3n
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 15:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629834362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5zD4QlhRM6Lo31cWQWvm/7PEflQtifZyIKIe0LDHdR4=;
 b=dodooZXqEJOqKNRtgjzGaAhkrDQgLg29L18JwVUy20848xPAkWoPPH81OWVOwAIfzQoIky
 7OAclkmRGqTOCZE53R2OqoSXt6twHohcFJv29VnI/Lnn/rPrLz2dPb/IVL60L+amUqYb7o
 RwE8VRydbe5XTScc1mTLcMTOtQ143z8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-1fowIPGePi2h1H5pEOEVXQ-1; Tue, 24 Aug 2021 15:34:36 -0400
X-MC-Unique: 1fowIPGePi2h1H5pEOEVXQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 70-20020a370b49000000b003d2f5f0dcc6so15101069qkl.9
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 12:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5zD4QlhRM6Lo31cWQWvm/7PEflQtifZyIKIe0LDHdR4=;
 b=FdMQkASagOvSBtiUixM5SsxW5gxmOXxND5kuJS62VbojeQCVkQXUMErbCWAKv5Nxuq
 enJlhD8cb8dllXXrjuH01KM4kWRbMl0P+ZwkrO4NVoxZqsKJNLdj8aYfs2D7la1/7hax
 Q1bqnMh6yTVA2cMa5E5UCfMJQvcyArWzvhk/GEzkfDYIemudbs3l3ZyDe6V79fRkQQNF
 U58ZIeJrkbLQ4O8Z4EryOrn4EIH6PKvsYfg4/TJwlBHOAcz7TB4xhaoZSAsn8h925vB4
 TvmSa1AISAgneZ11jdi0S5xBxo5HkTRtudTh2hxhFsqg8h5DnN5LJjtK2i0AP9Ecj5vQ
 3Zxw==
X-Gm-Message-State: AOAM531e9vaI7FSq+GhqrtrQJL9vCOseSLSAadQRyrmid8H9n4DLIVeJ
 q4LHruMNJaC0LIHoDQDecDEA7Syil8LU9GRGlr6ebeypr+qB9FaaBQZ2VyYhScd/k7zeenW3+Qu
 c9bwrSGIIHJW17V4=
X-Received: by 2002:a05:6214:21ac:: with SMTP id
 t12mr2741140qvc.53.1629833676207; 
 Tue, 24 Aug 2021 12:34:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEfzVq4AdaI2dCKQ45+iBx3Pk1FK17J8+OhWAt3bio8j/d18KmLkI+hbXmXNqkdEO6hOMLAw==
X-Received: by 2002:a05:6214:21ac:: with SMTP id
 t12mr2741108qvc.53.1629833675999; 
 Tue, 24 Aug 2021 12:34:35 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id n11sm1279203qkk.17.2021.08.24.12.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 12:34:35 -0700 (PDT)
Date: Tue, 24 Aug 2021 15:34:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <YSVJyYn5lBM4+XZ8@t490s>
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
 <YSQKHaGiJZE5OAk2@t490s>
 <CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com>
 <20210824120153.altqys6jjiuxh35p@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210824120153.altqys6jjiuxh35p@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Peter, Gerd,

On Tue, Aug 24, 2021 at 02:01:53PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > I was vaguely tossing an idea around in the back of my mind
> > about whether you could have a flag on devices that marked
> > them as "this device is currently involved in IO", such that
> > you could then just fail the last DMA (or qemu_irq_set, or
> > whatever) that would complete the loop back to a device that
> > was already doing IO. But that would need a lot of thinking
> > through to figure out if it's feasible, and it's probably
> > a lot of code change.

(Thanks for the write-up, Peter; it helps a lot)

> 
> Quick & dirty hack trying the above.  Not much code, it is opt-in per
> MemoryRegion (so less overhead for devices which already handle all DMA
> in a BH), tracks state in DeviceState.  Adds a check to a rather hot
> code path though.  Not tested yet (stopped investigating when I noticed
> Philippe tries to fix the same thing with another approach).  Not
> benchmarked.
> 
> Maybe it helps ...
> 
> take care,
>   Gerd
> 
> From 80e58a2cd2c630f0bddd9d0eaee71abb7eeb9440 Mon Sep 17 00:00:00 2001
> From: Gerd Hoffmann <kraxel@redhat.com>
> Date: Tue, 17 Aug 2021 07:35:37 +0200
> Subject: [PATCH] allow track active mmio handlers
> 
> ---
>  include/exec/memory.h  |  1 +
>  include/hw/qdev-core.h |  1 +
>  softmmu/memory.c       | 24 ++++++++++++++++++++++--
>  3 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317f0..b1883d45e817 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -265,6 +265,7 @@ struct MemoryRegionOps {
>           */
>          bool unaligned;
>      } impl;
> +    bool block_reenter;
>  };
>  
>  typedef struct MemoryRegionClass {
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa1b..4cf281a81fa9 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -191,6 +191,7 @@ struct DeviceState {
>      int instance_id_alias;
>      int alias_required_for_version;
>      ResettableState reset;
> +    bool io_handler_active;
>  };
>  
>  struct DeviceListener {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4dfc..5eb5dd465dd2 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -437,7 +437,18 @@ static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
>  {
>      uint64_t tmp;
>  
> -    tmp = mr->ops->read(mr->opaque, addr, size);
> +    if (mr->ops->block_reenter) {
> +        DeviceState *dev = DEVICE(mr->owner);
> +        if (!dev->io_handler_active) {
> +            dev->io_handler_active = true;
> +            tmp = mr->ops->read(mr->opaque, addr, size);
> +            dev->io_handler_active = false;
> +        } else {
> +            tmp = MEMTX_OK;
> +        }
> +    } else {
> +        tmp = mr->ops->read(mr->opaque, addr, size);
> +    }
>      if (mr->subpage) {
>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
> @@ -489,7 +500,16 @@ static MemTxResult memory_region_write_accessor(MemoryRegion *mr,
>          trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
>                                        memory_region_name(mr));
>      }
> -    mr->ops->write(mr->opaque, addr, tmp, size);
> +    if (mr->ops->block_reenter) {
> +        DeviceState *dev = DEVICE(mr->owner);
> +        if (!dev->io_handler_active) {
> +            dev->io_handler_active = true;
> +            mr->ops->write(mr->opaque, addr, tmp, size);
> +            dev->io_handler_active = false;
> +        }
> +    } else {
> +        mr->ops->write(mr->opaque, addr, tmp, size);
> +    }
>      return MEMTX_OK;
>  }

Can I read this as a better approach if it still allows P2P so things that
Paolo and Qiang used to mention will still work?

https://lore.kernel.org/qemu-devel/7e4fd726-07e9-dc09-d66b-5692dd51820f@redhat.com/
https://lore.kernel.org/qemu-devel/CAKXe6S+v4z_PYbZ6MMzEZk7Q0Qc+q9tzL+a8918U_-XR=aj7RA@mail.gmail.com/

Can we do that similarly for qemu_set_irq() and friends but based on IRQState?

Thanks,

-- 
Peter Xu


