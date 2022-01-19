Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F5493BF6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 15:33:18 +0100 (CET)
Received: from localhost ([::1]:52836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAC1V-0000wk-GG
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 09:33:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nABko-0000qI-2p
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nABkk-0007lW-KF
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642601757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+BuDcwoIsNi7Hr5lMceHCSH7xiNyirMcO9uZotoqpSE=;
 b=JJjQr4f08/rTPS2nA+g10yFVxLwoepmz1hc3c3qpfq8TdOG0WksvsikzkE0ZKduUZ1EudA
 LcmEXjbjji8hFzXVts8165E9WOjH/sgc9m929TC0Vhtem83FRiMJk39CZuyPsuzbBJS9un
 JriRAGipqDbiIzQE5Ugad2ToSNgOAOk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-EVAYvmQ6NheP_eL4azutTQ-1; Wed, 19 Jan 2022 09:15:56 -0500
X-MC-Unique: EVAYvmQ6NheP_eL4azutTQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 en7-20020a056402528700b00404aba0a6ffso1423050edb.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 06:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+BuDcwoIsNi7Hr5lMceHCSH7xiNyirMcO9uZotoqpSE=;
 b=L+/DDYsk3eD3Ezg2RWu/R/fuXziaEvJyoPI6zCeJl0gO1ldhyiuZm6aFBi5fUSxOWf
 X7Ero2ygXTE1JWO12lUHwvU0qgOKpPiuCeSIbnRo1LwTHbe22wy0GGaTsZGKt82b4n60
 fUlDjXqv5Z8hEpbiYfN0bm0kveE2GwqE/YoCuRl7m6nLAlKO9qm79ivv28y+RbTRkL1w
 2ntJSoErj4r+S+GVzONMIYfAH3zg/3Yfc5dTlEy3WLa8ZScGQf9QqNgRomgRaXClHjSx
 Jt5vy40ca4VvAbLoy3Lbpvg5PEHThOWo93o9S5ZX0u+Y8zzLSakUs8Eqq71Zofcx8zrr
 hSXg==
X-Gm-Message-State: AOAM530EpgTfcZoQazd0R1xBQOcOvBGtsbXkRv5FiK8spXDosus+QwAd
 5plf+WG1LnhO4rAvgNwjgAZrHS89/whnO4l5EVgVwv+RndkWrIIzZn53YSTFPQk0sDIqXnlG3eT
 exrdQ4j602gtNC4M=
X-Received: by 2002:adf:f74f:: with SMTP id z15mr7727633wrp.238.1642601754697; 
 Wed, 19 Jan 2022 06:15:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAdSFbVZKzhyIXWD27qy4eehCDAifOtGQ/vd2TcuvtekFYTdMGCqXLGwHymx6UFfTC9fkj4Q==
X-Received: by 2002:adf:f74f:: with SMTP id z15mr7727617wrp.238.1642601754477; 
 Wed, 19 Jan 2022 06:15:54 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id r8sm17335wrx.2.2022.01.19.06.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 06:15:53 -0800 (PST)
Date: Wed, 19 Jan 2022 14:15:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 03/15] migration: Enable UFFD_FEATURE_THREAD_ID even
 without blocktime feat
Message-ID: <YegdGL1POHb4tY+I@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-4-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-4-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> This patch allows us to read the tid even without blocktime feature enabled.
> It's useful when tracing postcopy fault thread on faulted pages to show thread
> id too with the address.
> 
> Remove the comments - they're merely not helpful at all.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/postcopy-ram.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index d18b5d05b2..2176ed68a5 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -283,15 +283,13 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
>      }
>  
>  #ifdef UFFD_FEATURE_THREAD_ID
> -    if (migrate_postcopy_blocktime() && mis &&
> -        UFFD_FEATURE_THREAD_ID & supported_features) {
> -        /* kernel supports that feature */
> -        /* don't create blocktime_context if it exists */
> -        if (!mis->blocktime_ctx) {
> -            mis->blocktime_ctx = blocktime_context_new();
> -        }
> -
> +    if (UFFD_FEATURE_THREAD_ID & supported_features) {
>          asked_features |= UFFD_FEATURE_THREAD_ID;
> +        if (migrate_postcopy_blocktime()) {
> +            if (!mis->blocktime_ctx) {
> +                mis->blocktime_ctx = blocktime_context_new();
> +            }
> +        }
>      }
>  #endif
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


