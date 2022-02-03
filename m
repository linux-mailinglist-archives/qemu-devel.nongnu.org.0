Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457BA4A87E4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:46:14 +0100 (CET)
Received: from localhost ([::1]:59248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFeJI-0002gZ-Op
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:46:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFeFp-0001Bd-Gl
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFeFm-0003CE-2f
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643902952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yc3JeVPe8zaYZYucuVKcMOh734texqioha3leWoJo9I=;
 b=Pv5XZeJzW2pxb3RAn+sp0i54VqFA0hfYaQg0UaScCdSYwU4ZG/Gwb/+RswhMzm7SjW8kgD
 ZridWEeqkkdoucaerUUSesJs7mUH4hsYynGG27CFFyXs1YHZd7yN9gJt6H8Hw8JttnCM4A
 /nWj+ztrt0QKAz+kp+fBY6lC6fpgzU4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-_9c62FLCO66752Dmd6c-Ig-1; Thu, 03 Feb 2022 10:42:31 -0500
X-MC-Unique: _9c62FLCO66752Dmd6c-Ig-1
Received: by mail-wr1-f71.google.com with SMTP id
 s25-20020adfa299000000b001d8d032255fso807661wra.14
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 07:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yc3JeVPe8zaYZYucuVKcMOh734texqioha3leWoJo9I=;
 b=2p1r5/HZneueQ6D+z4Mu070bYSPqomSA96xZfCKdFVcTs2CF2QBlPnabh9HW2K01dd
 mVpT2t7diFjNy5XVbl6w3+8tLud7L9xehH3bwlXD75kR0YGiZH6fV+gYapb6HbKWxm8d
 bQwS2p3dnqgn1ZYZfYb6VLS59b3vaSSUb24wi16giD9IZvGCKl0nP7gJAJ+pV6Lfq8eo
 eYSMbTDt02HIgutT5F/EBsm/XikKY2HlmjzIlx3YEbwskkvr7o2vrQbwFPi4ZTDbJcO4
 aX5UL7AmcCU5Hudocgp6YS3FWrVE7SZK4VN7q64XhjiNsyIe1UV4p6ZiK6jvjFUQdH0a
 lihQ==
X-Gm-Message-State: AOAM530uD6W9W0FA54xcX5FPapVBll0VI17Z4oK6NYSrRgjmI8eAFwpD
 Fsn8MtagttzlyaVePSJtvZvvICj2xHcGJi1DCsmFpyxeT1pJW8PswB8w/aJhGNtxMLb5cMN837X
 Sd/4BsXW6VfQXg/g=
X-Received: by 2002:adf:fecd:: with SMTP id q13mr29278624wrs.363.1643902950303; 
 Thu, 03 Feb 2022 07:42:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqQN7K4MDgBHPRFUTFHwxYn2HV9MH1Nf+fkBXmFYToGKs1wNo05KDkULd1HKfY+FH6gziVYw==
X-Received: by 2002:adf:fecd:: with SMTP id q13mr29278617wrs.363.1643902950164; 
 Thu, 03 Feb 2022 07:42:30 -0800 (PST)
Received: from work-vm (82-132-239-190.dab.02.net. [82.132.239.190])
 by smtp.gmail.com with ESMTPSA id u15sm20530248wrn.48.2022.02.03.07.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 07:42:29 -0800 (PST)
Date: Thu, 3 Feb 2022 15:42:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 11/15] migration: Add pss.postcopy_requested status
Message-ID: <Yfv347O10Nx06MeG@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-12-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-12-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> This boolean flag shows whether the current page during migration is triggered
> by postcopy or not.  Then in ram_save_host_page() and deeper stack we'll be
> able to have a reference on the priority of this page.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 3a7d943f9c..b7d17613e8 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -400,6 +400,8 @@ struct PageSearchStatus {
>      unsigned long page;
>      /* Set once we wrap around */
>      bool         complete_round;
> +    /* Whether current page is explicitly requested by postcopy */
> +    bool         postcopy_requested;
>  };
>  typedef struct PageSearchStatus PageSearchStatus;
>  
> @@ -1480,6 +1482,9 @@ retry:
>   */
>  static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>  {
> +    /* This is not a postcopy requested page */
> +    pss->postcopy_requested = false;
> +
>      pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>      if (pss->complete_round && pss->block == rs->last_seen_block &&
>          pss->page >= rs->last_page) {
> @@ -1971,6 +1976,7 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>           * really rare.
>           */
>          pss->complete_round = false;
> +        pss->postcopy_requested = true;
>      }
>  
>      return !!block;
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


