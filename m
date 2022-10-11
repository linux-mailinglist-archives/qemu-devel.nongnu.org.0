Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B81C5FB270
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:30:42 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEPB-0007U4-2d
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiD56-0008FI-OI
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:06:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiD54-0004dr-8J
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665486348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D9DZIeQeGxYAwE0E2S5YpmKIN+HRdJHwnT0uxl8akQI=;
 b=eLByJAaMwahSqvLCmsM/S0D8ci/DZoRCncfpBZn/WgqlfcAavO68VAAmHcfHFxpfsbhAZD
 hkPmUqvJUteInHWjVw9gGt812ze8T/T3fhabRAhqBFz6jPedOUuscO6onBsmoJ0e6HGTaT
 2a/HqJHkulr3sUOmxm+T5tXAuJXhb9U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-RPN5sjYlPBelh21XHH8M3Q-1; Tue, 11 Oct 2022 07:05:47 -0400
X-MC-Unique: RPN5sjYlPBelh21XHH8M3Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 sh33-20020a1709076ea100b0078d28567b70so5746567ejc.16
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D9DZIeQeGxYAwE0E2S5YpmKIN+HRdJHwnT0uxl8akQI=;
 b=FIJBOzUR5bDUHsgF3538//xRFRDP1x5UcPmQTkQf7ebAUS6AlIdnAfGPoiEE+4+XHX
 AKwNpOFs0sxCjHe7RCYTssNa7XB+sTM6TwW1iD0bQmRSINu6Mhb5Q9pAJk5g93Ales52
 Osagw9WNnvgrkdqvMSU80Y5vAaiz1yfDKFfU4DN6kHmBBsKN1LbGKHzYIe0gH/tBFJOp
 fMPhH49800Kr8kH8HCM6KeyuJek4erHQiIXjJPJNFTK5o3j6jNyABZCmMAih6+GVKszl
 q/FGjjPghhnGIyNkRnx4EahcosAVhC7TJyazyCwfStd/u0PJNw8HvXnwNm7vfziZTO61
 LJrQ==
X-Gm-Message-State: ACrzQf0SV9M+JhiC0N/Olmvdf0A2RqS7BuFrO4n9wVVfcMH8Gozb5/rL
 jbw0GgliJ6EV1hotWWfhgmkmovxGEmZbBXT8MOffWEznYHjvJG7485DRtld3EYAoTL2cP6FyB56
 jQzzQmmb3CJGf0fM=
X-Received: by 2002:a17:907:2d0b:b0:782:76dc:e557 with SMTP id
 gs11-20020a1709072d0b00b0078276dce557mr17498221ejc.690.1665486346595; 
 Tue, 11 Oct 2022 04:05:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5qcXsufSHQE9fiK/t76yBc/7WVmsOhBRs15RaeddghShbiAu6ewywk6O9HPrBq+Cq/UQbH7g==
X-Received: by 2002:a17:907:2d0b:b0:782:76dc:e557 with SMTP id
 gs11-20020a1709072d0b00b0078276dce557mr17498214ejc.690.1665486346402; 
 Tue, 11 Oct 2022 04:05:46 -0700 (PDT)
Received: from work-vm (82-132-238-71.dab.02.net. [82.132.238.71])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170906314e00b0078dd4c89781sm1003328eje.35.2022.10.11.04.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 04:05:45 -0700 (PDT)
Date: Tue, 11 Oct 2022 12:05:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: [PATCH] migration: Fix a potential guest memory corruption
Message-ID: <Y0VOBwuMrdMwSUo+@work-vm>
References: <20220919093237.2219892-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919093237.2219892-1-zhenzhong.duan@intel.com>
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

* Zhenzhong Duan (zhenzhong.duan@intel.com) wrote:

Hi,

> Imagine a rare case, after a dirty page is sent to compression threads's
> ring, dirty bitmap sync trigger right away and mark the same page dirty
> again and sent. Then the new page may be overwriten by stale page in
> compression threads's ring in the destination.

Yes, I think we had a similar problem in multifd.

> So we need to ensure there is only one copy of the same dirty page either
> by flushing the ring after every bitmap sync or avoiding processing same
> dirty page continuously.
> 
> I choose the 2nd which avoids the time consuming flush operation.

I'm not sure this guarantees it; it makes it much less likely but if
only a few pages are dirtied and you have lots of threads, I think the
same thing could still happy.

I think you're going to need to flush the ring after each sync.

Dave

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  migration/ram.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9ddbc68..67b2035586bd 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1551,7 +1551,7 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>      pss->postcopy_requested = false;
>      pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
>  
> -    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
> +    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page + 1);
>      if (pss->complete_round && pss->block == rs->last_seen_block &&
>          pss->page >= rs->last_page) {
>          /*
> @@ -1564,7 +1564,7 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>      if (!offset_in_ramblock(pss->block,
>                              ((ram_addr_t)pss->page) << TARGET_PAGE_BITS)) {
>          /* Didn't find anything in this RAM Block */
> -        pss->page = 0;
> +        pss->page = -1;
>          pss->block = QLIST_NEXT_RCU(pss->block, next);
>          if (!pss->block) {
>              /*
> @@ -2694,7 +2694,7 @@ static void ram_state_reset(RAMState *rs)
>  {
>      rs->last_seen_block = NULL;
>      rs->last_sent_block = NULL;
> -    rs->last_page = 0;
> +    rs->last_page = -1;
>      rs->last_version = ram_list.version;
>      rs->xbzrle_enabled = false;
>      postcopy_preempt_reset(rs);
> @@ -2889,7 +2889,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
>      /* Easiest way to make sure we don't resume in the middle of a host-page */
>      rs->last_seen_block = NULL;
>      rs->last_sent_block = NULL;
> -    rs->last_page = 0;
> +    rs->last_page = -1;
>  
>      postcopy_each_ram_send_discard(ms);
>  
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


