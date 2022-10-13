Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44D35FDE69
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:42:50 +0200 (CEST)
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1IG-0000oZ-TK
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oj1DZ-0003o4-Gt
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oj1DT-0007Gj-EU
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665679063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z6L5EDMp3ArYlK/3/jVLXdNyPLyNBskhnVk1rqA8W34=;
 b=F972WXNlxJjzdDmDIAwg9GhB8fodKcwsHvr4S9/WBrhL+Zkd/QxwpcFxIEH4GdFgAHtvRh
 J87n5eYnwopSWWtxMlAznGKNDhQ9bJjnXBTnv5GXLSZeUk1WaJvFdQTsKlN17l+IV1i6zT
 rTl2jqgX+GBbwHkISnp9FVQp6zL2CPg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-466-VyUcsMnsOv2PI_I2KixgxA-1; Thu, 13 Oct 2022 12:37:42 -0400
X-MC-Unique: VyUcsMnsOv2PI_I2KixgxA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so778499wrg.4
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 09:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z6L5EDMp3ArYlK/3/jVLXdNyPLyNBskhnVk1rqA8W34=;
 b=4hy1p4yKI4sV9HBDroqPC3SPU9EeXqLBiJIq7S68bfuJOx+a7MV3+F96V+rNe2LI5j
 KxvZfG9dKO1e4adFUnv48765QwufUAJD+hIC9I8bo+LRVSSp5CRMzRFT3yc1hP9ieAF4
 9FEeFSYP7af+SQQH6hoXNLUesX3+VLFoHGxoSyoi31ji1DXcakIgmnBs+M4GzA/l1zun
 hQjKJe+yKyApOcjWrUT5l6Jl26wB6JQarjUaPMveDek07jCnljez5EPcjWtekA+5XWyk
 K7d0BNQeOxAMq8HUkA5Kk5le/9EpG8LBvXS6D9rQyWzF2zZnQy/7MPIVBk7jYmoczj4x
 hmHw==
X-Gm-Message-State: ACrzQf1rIRKoi6Dese3jMDFdXz9za4cetdBmeOKoL4/VqFGC+S+4bosB
 WZlaBW2DXN2hKq6X3G+Uqve218caoSW6zLQ/5JdsDwXiZR0BdoRcKNGaBbrTl7KGrmlta6/iBe6
 cKcf0ciSioKUB0v0=
X-Received: by 2002:a05:6000:1f04:b0:22e:5e0b:e1fb with SMTP id
 bv4-20020a0560001f0400b0022e5e0be1fbmr554950wrb.222.1665679042419; 
 Thu, 13 Oct 2022 09:37:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5kKixx1QELK7fA9LVMicT/PMzSd5sX9Vtb4CmzJLx4ZrARmJMzuGnkwyk0ngpel4BjO2Uddg==
X-Received: by 2002:a05:6000:1f04:b0:22e:5e0b:e1fb with SMTP id
 bv4-20020a0560001f0400b0022e5e0be1fbmr554937wrb.222.1665679042184; 
 Thu, 13 Oct 2022 09:37:22 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o5-20020a5d62c5000000b00228cbac7a25sm24791wrv.64.2022.10.13.09.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 09:37:21 -0700 (PDT)
Date: Thu, 13 Oct 2022 17:37:19 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 06/15] migration: Yield bitmap_mutex properly when
 sending/sleeping
Message-ID: <Y0g+v1ZDorVRHkUm@work-vm>
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-7-peterx@redhat.com>
 <Y0buySbboE3xOVoQ@work-vm> <Y0b+i6vliRkBC2MI@x1n>
 <Y0g6i6z3K4mglmPb@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0g6i6z3K4mglmPb@x1n>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Oct 12, 2022 at 01:51:07PM -0400, Peter Xu wrote:
> > On Wed, Oct 12, 2022 at 05:43:53PM +0100, Dr. David Alan Gilbert wrote:
> > > * Peter Xu (peterx@redhat.com) wrote:
> > > > Don't take the bitmap mutex when sending pages, or when being throttled by
> > > > migration_rate_limit() (which is a bit tricky to call it here in ram code,
> > > > but seems still helpful).
> > > > 
> > > > It prepares for the possibility of concurrently sending pages in >1 threads
> > > > using the function ram_save_host_page() because all threads may need the
> > > > bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
> > > > qemu_sem_wait() blocking for one thread will not block the other from
> > > > progressing.
> > > > 
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > 
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > 
> > > although a comment above the reclaration of ram_save_host_pages saying
> > > it can drop the lock would be veyr good.
> > 
> > Let me add that.  Thanks,
> 
> A fixup to this patch attached to touch up the comment for
> ram_save_host_page().

Yep, that's right (I don't think we have any formal annotation for
locks)

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> -- 
> Peter Xu

> From dcc3adce062df7216851890d49f7d2b1fa2e84a4 Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Thu, 13 Oct 2022 12:18:04 -0400
> Subject: [PATCH] fixup! migration: Yield bitmap_mutex properly when
>  sending/sleeping
> Content-type: text/plain
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/ram.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 538667b974..b311ece48c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2407,9 +2407,14 @@ out:
>   * a host page in which case the remainder of the hostpage is sent.
>   * Only dirty target pages are sent. Note that the host page size may
>   * be a huge page for this block.
> + *
>   * The saving stops at the boundary of the used_length of the block
>   * if the RAMBlock isn't a multiple of the host page size.
>   *
> + * The caller must be with ram_state.bitmap_mutex held to call this
> + * function.  Note that this function can temporarily release the lock, but
> + * when the function is returned it'll make sure the lock is still held.
> + *
>   * Returns the number of pages written or negative on error
>   *
>   * @rs: current RAM state
> -- 
> 2.37.3
> 

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


