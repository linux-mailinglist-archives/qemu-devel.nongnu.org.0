Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E130690E9E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:48:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQA4u-0008If-PP; Thu, 09 Feb 2023 11:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pQA4c-0008Br-PE
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pQA4W-00016Y-7l
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675961214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lDReBgEP+b0XVLaxDQ5OCpYzoQhbYCrLgeSXp93oiCk=;
 b=d8xlFbNJ5H8zH1pGibiQBY6vcOJIvfZU0xi9JJXDweEclraXUSTtiUMGvnuooSoOJkhq++
 xjmh/3/Y7pJ1gD636HW8nBoiwyVdCqlmfhiiXGvTaDdm2rdJWBfgiadsL30nywZWByRvoW
 va4EhtFzQDkPX66tODtX2rkn51CO9bA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-Pvwb-WMrPbu2ZzP7-S0Ruw-1; Thu, 09 Feb 2023 11:46:51 -0500
X-MC-Unique: Pvwb-WMrPbu2ZzP7-S0Ruw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi16-20020a05600c3d9000b003dfeeaa8143so1299717wmb.6
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 08:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lDReBgEP+b0XVLaxDQ5OCpYzoQhbYCrLgeSXp93oiCk=;
 b=nuEVsF56vn5RHHkYsf6bYZd4ChnvlJXP2pR+tksx0B3GeP2t/4W22SAyWgJRQgqFig
 rg8O50VNug30MgsxSqF6QAz5j2d/VyCVl6fF/cCwF3SBzLYyE9Ye9bgwM7MxW6igx427
 L1k4f42Lvob+Gj8M8nvIcFSY2O6rica2wJqZ6sjfV/YOe6V7yt72IX2ATya+FHUlsSy9
 0uqqcxqWoAA83oLHH83BxVz5XbLJr2hRhx0D9u30+plo/6Nlg2ZREcmh3Ky+w1/GAeSA
 ExtPaNS+a2Ut0LGFUuU/L8JHP0KXmt90lEyhtAKowh+na0HF0qhRrXzRm2uXrhKYIKHv
 Y2rw==
X-Gm-Message-State: AO0yUKWju0GmcxRwWKXgSMQO8Dt9HcujhB5HRdwzJKyViWm1hzGIMa4h
 jRumN/j7A60GwwwO9wvopmIUJONH9nGJF1nEKcCzFwLlTM5/fbtF0Zs1+3WIB/3i+4tZwrZbnwU
 bFe8wXiRJOZJrZK0=
X-Received: by 2002:a5d:595f:0:b0:2c3:9851:e644 with SMTP id
 e31-20020a5d595f000000b002c39851e644mr10544743wri.63.1675961210083; 
 Thu, 09 Feb 2023 08:46:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8jmrxm4tNr3O5zdGiE5H02uk/pN6awBTiYUHsEB/q7DTFEQ9Y8+7DuRQyhwlu0eApEg3As2w==
X-Received: by 2002:a5d:595f:0:b0:2c3:9851:e644 with SMTP id
 e31-20020a5d595f000000b002c39851e644mr10544734wri.63.1675961209866; 
 Thu, 09 Feb 2023 08:46:49 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a5d4245000000b002c3be49ef94sm1704450wrr.52.2023.02.09.08.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 08:46:49 -0800 (PST)
Date: Thu, 9 Feb 2023 16:46:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] migration: I messed state_pending_exact/estimate
Message-ID: <Y+Ujd6yYIWqiN6QA@work-vm>
References: <20230209152301.33111-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209152301.33111-1-quintela@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Juan Quintela (quintela@redhat.com) wrote:
> I called the helper function from the wrong top level function.

Oops yes; as Peter says, this needs a Fixes: line, bu tother than that.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> This code was introduced in:
> 
> commit c8df4a7aeffcb46020f610526eea621fa5b0cd47
> Author: Juan Quintela <quintela@redhat.com>
> Date:   Mon Oct 3 02:00:03 2022 +0200
> 
>     migration: Split save_live_pending() into state_pending_*
> 
>     We split the function into to:
> 
>     - state_pending_estimate: We estimate the remaining state size without
>       stopping the machine.
> 
>     - state pending_exact: We calculate the exact amount of remaining
>       state.
> 
> Thanks to Avihai Horon <avihaih@nvidia.com> for finding it.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/savevm.c | 50 +++++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index e9cf4999ad..ce181e21e1 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1551,31 +1551,6 @@ void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
>      *res_compatible = 0;
>      *res_postcopy_only = 0;
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> -        if (!se->ops || !se->ops->state_pending_exact) {
> -            continue;
> -        }
> -        if (se->ops->is_active) {
> -            if (!se->ops->is_active(se->opaque)) {
> -                continue;
> -            }
> -        }
> -        se->ops->state_pending_exact(se->opaque,
> -                                     res_precopy_only, res_compatible,
> -                                     res_postcopy_only);
> -    }
> -}
> -
> -void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
> -                                     uint64_t *res_compatible,
> -                                     uint64_t *res_postcopy_only)
> -{
> -    SaveStateEntry *se;
> -
> -    *res_precopy_only = 0;
> -    *res_compatible = 0;
> -    *res_postcopy_only = 0;
> -
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>          if (!se->ops || !se->ops->state_pending_estimate) {
>              continue;
> @@ -1591,6 +1566,31 @@ void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
>      }
>  }
>  
> +void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
> +                                     uint64_t *res_compatible,
> +                                     uint64_t *res_postcopy_only)
> +{
> +    SaveStateEntry *se;
> +
> +    *res_precopy_only = 0;
> +    *res_compatible = 0;
> +    *res_postcopy_only = 0;
> +
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (!se->ops || !se->ops->state_pending_exact) {
> +            continue;
> +        }
> +        if (se->ops->is_active) {
> +            if (!se->ops->is_active(se->opaque)) {
> +                continue;
> +            }
> +        }
> +        se->ops->state_pending_exact(se->opaque,
> +                                     res_precopy_only, res_compatible,
> +                                     res_postcopy_only);
> +    }
> +}
> +
>  void qemu_savevm_state_cleanup(void)
>  {
>      SaveStateEntry *se;
> -- 
> 2.39.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


