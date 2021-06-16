Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5813A9F1D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:32:51 +0200 (CEST)
Received: from localhost ([::1]:60876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXX8-0002gO-Pz
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltXVH-0000Hj-Vy
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:30:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltXVD-0002sy-OR
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623857451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9qmo9reFkLvWiUkJIXUwaOinMVWCC4BBnXGR12xeCIM=;
 b=Sqtc8SMlRGpGu3Kp27AUIFiAdBCyNsaAaQeK+aDQh7W+3I8bMZh2SJgp17MpNT2rpvdzvl
 rABSobSHgMEGARV9PXxBEl6e4yq0lLFV2CPpPvhsO2wyiZ9JyIzjYEmu5TOPd605glxbkc
 qb4Jz9/ZowF2AWUOK/GBDSLQaxqgnFk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-z9IYVva_NxSv6ja6DqEq1Q-1; Wed, 16 Jun 2021 11:30:49 -0400
X-MC-Unique: z9IYVva_NxSv6ja6DqEq1Q-1
Received: by mail-qv1-f71.google.com with SMTP id
 r8-20020a0562140c88b0290242bf8596feso2311476qvr.8
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9qmo9reFkLvWiUkJIXUwaOinMVWCC4BBnXGR12xeCIM=;
 b=mrNqHgaUs5GkXO83zOOnrAbIn86dYm4wiSsAinJ3z3mk25ob7ApBFLSG+4Vcm0uKU+
 +BFoOR+YESnzgSkinj02w8a98dT13oDkuSrzaYOFq0qaOCvveGEV58YKEeML5sJiLso4
 fXChVX3ewCozlcjm5T6u4FTffZ8SLjTksjbmVCnKg6VvrkOKp1vohgiKIpYdkQDHNgZ4
 Qcys3reWc5sa6s72GEPfJo3oYGOq8cprLPwW4rrSVQGmbV957+qL7lSD3NJCN2IEa30S
 z9FQhFd5NijtvVXKts4XXNgSaRbpn8+vkKCx03/BpsderC2eauNbchMXXbbFyT0CDR58
 pDyQ==
X-Gm-Message-State: AOAM530WzncJJ2xTPbQ8wXGzBNnNp5H2Sppe5aO2ReLvAmrPgRBpJlZ4
 yFX0+XFY6UQ8THSSw37k4XGSyhkrSQTVcpZ79Su0c/gDDGe9uxzkAes1YLWMD8j8V5epp6HUlxC
 fISJo1IJomVYK2RY=
X-Received: by 2002:a05:6214:162a:: with SMTP id
 e10mr568196qvw.49.1623857449467; 
 Wed, 16 Jun 2021 08:30:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxB+aze9/qJITEpU8HV1zVbXZAwyp1QrjsBwiz+nlbLky4XCCEAIcuSWpQxCypXWvPX6TpEw==
X-Received: by 2002:a05:6214:162a:: with SMTP id
 e10mr568170qvw.49.1623857449254; 
 Wed, 16 Jun 2021 08:30:49 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id h12sm1760999qkj.52.2021.06.16.08.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 08:30:48 -0700 (PDT)
Date: Wed, 16 Jun 2021 11:30:47 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v4 3/6] migration/dirtyrate: introduce struct and adjust
 DirtyRateStat
Message-ID: <YMoZJ/0+flzvK2om@t490s>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
 <5b9aeb59a3bda83a374608ba44f92e5d242ee6da.1623804189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <5b9aeb59a3bda83a374608ba44f92e5d242ee6da.1623804189.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 09:12:29AM +0800, huangy81@chinatelecom.cn wrote:
> -static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time,
> -                                uint64_t sample_pages)
> +static void init_dirtyrate_stat(int64_t start_time,
> +                                struct DirtyRateConfig config)
>  {
> -    DirtyStat.total_dirty_samples = 0;
> -    DirtyStat.total_sample_count = 0;
> -    DirtyStat.total_block_mem_MB = 0;
>      DirtyStat.dirty_rate = -1;
>      DirtyStat.start_time = start_time;
> -    DirtyStat.calc_time = calc_time;
> -    DirtyStat.sample_pages = sample_pages;
> +    DirtyStat.calc_time = config.sample_period_seconds;
> +    DirtyStat.sample_pages = config.sample_pages_per_gigabytes;
> +
> +    switch (config.mode) {
> +    case DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING:
> +        DirtyStat.page_sampling.total_dirty_samples = 0;
> +        DirtyStat.page_sampling.total_sample_count = 0;
> +        DirtyStat.page_sampling.total_block_mem_MB = 0;
> +        break;
> +    case DIRTY_RATE_MEASURE_MODE_DIRTY_RING:
> +        DirtyStat.dirty_ring.nvcpu = -1;
> +        DirtyStat.dirty_ring.rates = NULL;

Missing "break"?

> +    default:

Assert here instead?

> +        break;
> +    }
>  }

-- 
Peter Xu


