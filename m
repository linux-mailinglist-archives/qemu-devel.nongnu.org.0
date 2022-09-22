Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E3C5E6868
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:30:18 +0200 (CEST)
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obP5d-0004yL-NC
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obNWY-000213-5E
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1obNWV-0005o7-3z
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663858185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3L5Lv4obmq2cVExEfeYxyUgws3dfK8VZfDgn2S+TNaI=;
 b=VNHf0neY7ymNJlOcpB8fpQ3U101MxuO3AylZJVBxA/9TsrWTC3w9h+MuhrLNZWAZizGe2P
 vroIvMp56PU+x8J5iD/FClztUaYJBbmAaQ9VaN53ivjl4WE/3qi7Vlx/2zBdVa5A+dARd4
 AfYeqwYhB80TRTUPswzHmnPz+JFsduA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-wKdfUaiOOOWoy0jlJ_AVUw-1; Thu, 22 Sep 2022 10:49:44 -0400
X-MC-Unique: wKdfUaiOOOWoy0jlJ_AVUw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r23-20020adfb1d7000000b002286358a916so3327993wra.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3L5Lv4obmq2cVExEfeYxyUgws3dfK8VZfDgn2S+TNaI=;
 b=su2+iMgbV0y/MmZyU/+VnSeccPHBGm+2Hajm0czuyRVSdAQzWSPMvumHmSJuDHK/FF
 2X1OWv3UAnDSVcUuPjnnDrdUsKym2ufS032bQpWr0w2QA74g4T1qdDe8qbUr5LpQo1bd
 QYEU5n3+Bwjsc5rOtKRaMD4UpolXBn4BGRasXVDKVdurUIkUyaowi0H5jgqSR5iiM8Ej
 75ANmxCuvOt/1X8673Yta+jKH2EkV58qZfsM0vOSgfRt2DQqCailV/k05ijG351IggFk
 9ujyFa7MTCfza13aLE46VGGH27vKV9u0oVqEoFGQoNtaN4EddU48/NNVH1EjJtw2KzeC
 RUJQ==
X-Gm-Message-State: ACrzQf3U7IHYK5jobbD+5CmTPlY6UhGtvbGbkMlh41wciltXwW4/iT2d
 WNMIfZ3SIzpBDPd4Rk/TCMDMWwvGkLJX+2xdoh57l9t8+avjCT8b77C5UFwzHTWyknSa2FaNSo2
 mFZUn94AngDiNiAs=
X-Received: by 2002:a1c:f002:0:b0:3b4:dda4:b58f with SMTP id
 a2-20020a1cf002000000b003b4dda4b58fmr9555543wmb.184.1663858181917; 
 Thu, 22 Sep 2022 07:49:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57R42ACAgXxvLMd1IeWs2PPTKwiRfJvpqhF0WRLtdyhLIMLNAs7E8rHto89V9dGXHVneBdIw==
X-Received: by 2002:a1c:f002:0:b0:3b4:dda4:b58f with SMTP id
 a2-20020a1cf002000000b003b4dda4b58fmr9555520wmb.184.1663858181520; 
 Thu, 22 Sep 2022 07:49:41 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bv3-20020a0560001f0300b0022b014fb0b7sm5508259wrb.110.2022.09.22.07.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 07:49:40 -0700 (PDT)
Date: Thu, 22 Sep 2022 15:49:38 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 1/5] migration: Fix possible deadloop of ram save process
Message-ID: <Yyx2An+YcgYCbsDx@work-vm>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-2-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920223800.47467-2-peterx@redhat.com>
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
> When starting ram saving procedure (especially at the completion phase),
> always set last_seen_block to non-NULL to make sure we can always correctly
> detect the case where "we've migrated all the dirty pages".
> 
> Then we'll guarantee both last_seen_block and pss.block will be valid
> always before the loop starts.
> 
> See the comment in the code for some details.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yeh I guess it can currently only happen during restart?

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9ddbc..1d42414ecc 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2546,14 +2546,22 @@ static int ram_find_and_save_block(RAMState *rs)
>          return pages;
>      }
>  
> +    /*
> +     * Always keep last_seen_block/last_page valid during this procedure,
> +     * because find_dirty_block() relies on these values (e.g., we compare
> +     * last_seen_block with pss.block to see whether we searched all the
> +     * ramblocks) to detect the completion of migration.  Having NULL value
> +     * of last_seen_block can conditionally cause below loop to run forever.
> +     */
> +    if (!rs->last_seen_block) {
> +        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
> +        rs->last_page = 0;
> +    }
> +
>      pss.block = rs->last_seen_block;
>      pss.page = rs->last_page;
>      pss.complete_round = false;
>  
> -    if (!pss.block) {
> -        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
> -    }
> -
>      do {
>          again = true;
>          found = get_queued_page(rs, &pss);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


