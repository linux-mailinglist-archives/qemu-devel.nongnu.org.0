Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976BA5F5534
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 15:18:14 +0200 (CEST)
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og4Ht-0003gi-NZ
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 09:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og49m-0005gW-TG
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:09:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og49k-0007Ki-TB
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664975388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5/bpFK6gKvT1lMIa+syk+l2gn4hkkZkr30Axs1DdVF8=;
 b=RRlkLU1ek3t71VhQCZe0sPJMcl1uJ2teiXRxGQmqXQdIWUwqu7APOpb/HPfcbcze4PVFfL
 09mhf+dp91BNgwLfMmadcC/068Af43kQNUhiyTsPpiS8Q18krO5xhgLhixy432IDbtirTv
 3sN2Zpb/ktek9+KuurR5F4aivkUur1g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-bhZswSWNM_WZBaFk0l4c3A-1; Wed, 05 Oct 2022 09:09:47 -0400
X-MC-Unique: bhZswSWNM_WZBaFk0l4c3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 r8-20020a1c4408000000b003be5419a7e4so127175wma.1
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 06:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5/bpFK6gKvT1lMIa+syk+l2gn4hkkZkr30Axs1DdVF8=;
 b=3UvKR3km0IDNvI2jpEIXnlM1p/HPm/mx3jgoNdiWs0jOymmqteC2NC4F59g6yOz9rl
 tEGLpKIROOZUudW796pFtFdm0xpgx18v7am8DdnRzc0oylWCDn5QIvpI9hfSdrLoFbvf
 ck/iPrYgVW0Sk44AjETGQnAe3ORKUO/Kn9iTEI0tzJDexu3jFT8btatu/aAmAXmmAuQC
 V1wCC7xNTt5z5ehX2Yh99/JSBDwRDipSGLP0ZPdbYskgR7/AAKyVEnjOdFJYyPDMKl6s
 GCxfUUQB+B6V6S21X5GiK6o7h/I3PRRErcHOq0zR+qC8bvB70k/YBK3Q6t0G4vn1ckkX
 7f/g==
X-Gm-Message-State: ACrzQf2ybczq6PUs1V2VwNQFSoqlG7ok3gsrv9aP2JcRObr+3hzXWJXd
 hZJ1JTA260HVG4eKkTMPlVrsRu84+hMMlabn2IoE5vedsp6hRbMJXhJUe+mq8kNqdlkOQxW0u5v
 a/9KkCBQHzgdvYa4=
X-Received: by 2002:a05:600c:4f06:b0:3b4:b67c:68bb with SMTP id
 l6-20020a05600c4f0600b003b4b67c68bbmr3352060wmq.36.1664975386256; 
 Wed, 05 Oct 2022 06:09:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4YRCcy8dwS9tzxUodVjCFOW+ca6citA2vQM0ILCbEWm4COlQB602xGR/7m5gHCqGuTFnt3kA==
X-Received: by 2002:a05:600c:4f06:b0:3b4:b67c:68bb with SMTP id
 l6-20020a05600c4f0600b003b4b67c68bbmr3352027wmq.36.1664975385984; 
 Wed, 05 Oct 2022 06:09:45 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 d2-20020adffd82000000b0022e327f849fsm11248113wrr.5.2022.10.05.06.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 06:09:45 -0700 (PDT)
Date: Wed, 5 Oct 2022 14:09:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 09/14] migration: Add pss_init()
Message-ID: <Yz2CF3jprLHSHRTG@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225219.48946-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225219.48946-1-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
> Helper to init PSS structures.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 40ff5dc49f..b4b36ca59e 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -535,6 +535,14 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>  static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
>                                       bool postcopy_requested);
>  
> +/* NOTE: page is the PFN not real ram_addr_t. */
> +static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
> +{
> +    pss->block = rb;
> +    pss->page = page;
> +    pss->complete_round = false;
> +}
> +
>  static void *do_data_compress(void *opaque)
>  {
>      CompressParam *param = opaque;
> @@ -2640,9 +2648,7 @@ static int ram_find_and_save_block(RAMState *rs)
>          rs->last_page = 0;
>      }
>  
> -    pss.block = rs->last_seen_block;
> -    pss.page = rs->last_page;
> -    pss.complete_round = false;
> +    pss_init(&pss, rs->last_seen_block, rs->last_page);
>  
>      do {
>          again = true;
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


