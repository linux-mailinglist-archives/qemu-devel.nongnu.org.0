Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ACC39E5F3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:54:44 +0200 (CEST)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJSV-0002Pj-5j
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqJMN-0006XF-Rp
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqJLa-0003sn-8l
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623088053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oK/tDKwVBLXtn+uNjPG/KVtJB2vEDWVm1XDdxYJkEfk=;
 b=KL8ThsbYkI8q830rPB3jWGI6+8cUNmROF4fz4GlGb+eO20eCKwYC4Hn94euETckzXDSF7x
 4KnkAwEJeFNFrg/rmFwq0hY0mIqQleaqr3JOhKkpz28ARyyr1cCBJigxTNRyiFgxQg15y0
 4VgRtEqO8DzFEK72HR99aVG89i/rXJo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-NTTf92L-MPm0N7d5u7TaAA-1; Mon, 07 Jun 2021 13:47:32 -0400
X-MC-Unique: NTTf92L-MPm0N7d5u7TaAA-1
Received: by mail-qt1-f200.google.com with SMTP id
 d7-20020ac811870000b02901e65f85117bso7891276qtj.18
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 10:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oK/tDKwVBLXtn+uNjPG/KVtJB2vEDWVm1XDdxYJkEfk=;
 b=SeHPs9cEzT7WomkEuBBc8YDT27W4HhBkSZWHKyHv8EeLFt3s9UR2TIbGlX7RiJx7FI
 d9JvIQQQGQFE3MUH+EYEP6c5aKZLcle1kjwSgxunDyVqBlwsBdEdg9TParclhqQl7VxY
 yd4OwgwVkCDp9/4xWXfoL68mkNK+29tILcBrEk091AvUO/6a0JF0LLuwxL0AXKaqAO5q
 QvVxoHSE07/jIYY4x2YlVEROfeTFGxqb6pt4lBGZ8+1yz7vwEpabO6UbtQVqJPVfKqfz
 jaIRHcXIksQkzug+hnNFif7lbU8rvO42CBoXwDAKBgkbgpLwDEfpbpVKWNCw5bI7XdlA
 3pww==
X-Gm-Message-State: AOAM530t0m4oUnt2DMnqAraA3HZ0GZv83QfkYyOYYy5WP3XfMzO1Ufv8
 UYe1zHzsmLLhZJW6hUQGknkzUij5tHdm1CZjLIv4hjAPnQdrTfYW9m1CTIkLRrSov8VO9LXuCJK
 qxPFgfkpr8MkUH4Y=
X-Received: by 2002:ac8:47c2:: with SMTP id d2mr15950360qtr.128.1623088052317; 
 Mon, 07 Jun 2021 10:47:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh5zsN9x253igAiIypZwp52Regk3HY5AlAfojajZ9QL9jnq1ZGYyy4tQeHVLztJIc0baB8Mg==
X-Received: by 2002:ac8:47c2:: with SMTP id d2mr15950340qtr.128.1623088052088; 
 Mon, 07 Jun 2021 10:47:32 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id 25sm9430666qtd.51.2021.06.07.10.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:47:31 -0700 (PDT)
Date: Mon, 7 Jun 2021 13:47:30 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v3 6/7] memory: make global_dirty_log a bitmask
Message-ID: <YL5bsvTzQXlT9x6f@t490s>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <bc42f4a0b749333eda5087cee9f22c0a73f31645.1623027729.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <bc42f4a0b749333eda5087cee9f22c0a73f31645.1623027729.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 09:13:12AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> dirty rate measurement may start or stop dirty logging during
> calculation. this conflict with migration because stop dirty
> log make migration leave dirty pages out then that'll be a problem.
> 
> make global_dirty_log a bitmask can let both migration and dirty
> rate measurement work fine. introduce GLOBAL_DIRTY_MIGRATION and
> GLOBAL_DIRTY_DIRTY_RATE to distinguish what current dirty log aims
> for, migration or dirty rate.
> 
> all references to global_dirty_log should be untouched because any bit
> set there should justify that global dirty logging is enabled.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  include/exec/memory.h | 13 ++++++++++---
>  migration/ram.c       |  8 ++++----
>  softmmu/memory.c      | 36 +++++++++++++++++++++++++++---------
>  3 files changed, 41 insertions(+), 16 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c158fd7084..94c7088299 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -55,7 +55,10 @@ static inline void fuzz_dma_read_cb(size_t addr,
>  }
>  #endif
>  
> -extern bool global_dirty_log;
> +#define GLOBAL_DIRTY_MIGRATION  (1U<<0)
> +#define GLOBAL_DIRTY_DIRTY_RATE (1U<<1)

Add some comment for each dirty log reason would be nice.

> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index c19b0be6b1..b93baba82d 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -39,7 +39,7 @@
>  static unsigned memory_region_transaction_depth;
>  static bool memory_region_update_pending;
>  static bool ioeventfd_update_pending;
> -bool global_dirty_log;
> +int global_dirty_log;

Maybe unsigned int would make more sense for a bitmask?

>  
>  static QTAILQ_HEAD(, MemoryListener) memory_listeners
>      = QTAILQ_HEAD_INITIALIZER(memory_listeners);
> @@ -2659,14 +2659,20 @@ void memory_global_after_dirty_log_sync(void)
>  
>  static VMChangeStateEntry *vmstate_change;
>  
> -void memory_global_dirty_log_start(void)
> +void memory_global_dirty_log_start(int flags)
>  {
>      if (vmstate_change) {
>          qemu_del_vm_change_state_handler(vmstate_change);
>          vmstate_change = NULL;
>      }
>  
> -    global_dirty_log = true;
> +    if (flags & GLOBAL_DIRTY_MIGRATION) {
> +        global_dirty_log |= GLOBAL_DIRTY_MIGRATION;
> +    }
> +
> +    if (flags & GLOBAL_DIRTY_DIRTY_RATE) {
> +        global_dirty_log |= GLOBAL_DIRTY_DIRTY_RATE;
> +    }

Instead of separate "if"s, perhaps something like this?

  #define  GLOBAL_DIRTY_MASK  (0x3)

  assert(!(flags & (~GLOBAL_DIRTY_MASK)));
  assert(!(global_dirty_log ^ flags));
  global_dirty_log |= flags;

>  
>      MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
>  
> @@ -2676,9 +2682,15 @@ void memory_global_dirty_log_start(void)
>      memory_region_transaction_commit();
>  }
>  
> -static void memory_global_dirty_log_do_stop(void)
> +static void memory_global_dirty_log_do_stop(int flags)
>  {
> -    global_dirty_log = false;
> +    if (flags & GLOBAL_DIRTY_MIGRATION) {
> +        global_dirty_log &= ~GLOBAL_DIRTY_MIGRATION;
> +    }
> +
> +    if (flags & GLOBAL_DIRTY_DIRTY_RATE) {
> +        global_dirty_log &= ~GLOBAL_DIRTY_DIRTY_RATE;
> +    }

Same here?  Thanks,

-- 
Peter Xu


