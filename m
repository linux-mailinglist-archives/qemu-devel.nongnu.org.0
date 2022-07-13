Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4AD573C48
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 19:59:49 +0200 (CEST)
Received: from localhost ([::1]:48102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBgeK-0002rj-L1
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 13:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBgch-00017N-A0
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 13:58:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBgcd-00013t-Eo
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 13:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657735082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+M33eDuT48DU6OeTiJVsytBtO/ZzWXAZ47NqOkBVT+4=;
 b=FmAgxdj5M6fkybJ0RzUh7vUygPWg9Aj2CA0bVmuAh05HC30T1N7TykS2mTuYafYEcLLJ2z
 7LnHdR+rz44dBby/snMrAjCYMA+B6J3TUPj/FNewi9yhltdDTwc2k0zekcAY4xNWeSrA35
 ZR3/rypGs1DMNnW12xISIoB/MSDA41k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-yO35C616P8iy5smRwvvlyQ-1; Wed, 13 Jul 2022 13:58:01 -0400
X-MC-Unique: yO35C616P8iy5smRwvvlyQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 83-20020a1c0256000000b003a2d01897e4so5753028wmc.9
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 10:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+M33eDuT48DU6OeTiJVsytBtO/ZzWXAZ47NqOkBVT+4=;
 b=jRBKqhn6LPBYZgKb8AelWgoQahipPV8ZwWEJ1Dr9yfw+/pytcJMlJadjO5p82qZjyz
 fqyPFDZx9EV/loGf4gNLDPmqL1jKrgxAcxOECqk6zm5GmrrMg3H5/hJeMyyKXWHjArwv
 NTzujfp5sc7oc+lsMp57iu/kRehfCrDIACUYmq3rUEICZXzmh3rtINb39MUripwKorcD
 3bPEEZpWcUFRpCbiJsEOw/boMGOC9aEEiooXfN+ZecEScycUlLXC1eoc8Yec+eQA3w/E
 9weknTihcsJP32nWzjAw+q5iG5f+YH/dq1NNd2ijden2cnOIJxb2rinwG6rWe2e+ZpZU
 hQ6Q==
X-Gm-Message-State: AJIora/H0gGBatMP/CNPrS8XmAZtf4OHQW/7BOZlUAu4qik4Bl2RkbIX
 CBNXP59GCNyTr6JjbeQ+dvizdDFzzy50o1UmW1Sri9bbmMswrHaGhmoDqWEWhbZ32E6cgdP7kQA
 reQ+oF+qo0NrY/Wg=
X-Received: by 2002:a05:600c:4e8b:b0:3a0:5826:3321 with SMTP id
 f11-20020a05600c4e8b00b003a058263321mr4940925wmq.108.1657735078112; 
 Wed, 13 Jul 2022 10:57:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/6JBrVqy7A+jzr1frUEo7YtNcjpU8MChvtU68OtKgk17d+uOlGVOy5Xl6uAPqCYjj0dnXqQ==
X-Received: by 2002:a05:600c:4e8b:b0:3a0:5826:3321 with SMTP id
 f11-20020a05600c4e8b00b003a058263321mr4940909wmq.108.1657735077901; 
 Wed, 13 Jul 2022 10:57:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b0021d64a11727sm11495886wrr.49.2022.07.13.10.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 10:57:57 -0700 (PDT)
Date: Wed, 13 Jul 2022 18:57:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 10/13] migration: Export ram_release_page()
Message-ID: <Ys8HolEusRmGt87y@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-11-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-11-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.h | 1 +
>  migration/ram.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/ram.h b/migration/ram.h
> index 7b641adc55..aee08de2a5 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -66,6 +66,7 @@ int ram_load_postcopy(QEMUFile *f);
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
>  
>  void ram_transferred_add(uint64_t bytes);
> +void ram_release_page(const char *rbname, uint64_t offset);
>  
>  int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
>  bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
> diff --git a/migration/ram.c b/migration/ram.c
> index 71506b1b20..3b2af07341 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1182,7 +1182,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
>      }
>  }
>  
> -static void ram_release_page(const char *rbname, uint64_t offset)
> +void ram_release_page(const char *rbname, uint64_t offset)
>  {
>      if (!migrate_release_ram() || !migration_in_postcopy()) {
>          return;
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


