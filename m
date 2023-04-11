Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA42F6DD83B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:45:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBV9-0002bC-AC; Tue, 11 Apr 2023 06:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmBV7-0002aq-HQ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:45:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pmBV2-0002N9-JU
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681209919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DEIb+5SjLKlFj4FBJyCo3I41MRNQwmRvQYKowwm1GqA=;
 b=DE3fTxQQU0c439TB7J+SlYPaAUk1lNfMhUUYOHtleA3fb24FF5WwPdhIH61OLnjhQoqML9
 hXzJIqFnRB5gcVQ3O3PNzXODBNZuLjXZh0ljmKSyxGF9VPUA4VvmMlFhH9HbPA8EvGjL0c
 UnzAPZpqjZxvCkRZSgcMEWfiAroFmiY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-f2siPP8KOhmdPqjGH_N7TA-1; Tue, 11 Apr 2023 06:45:18 -0400
X-MC-Unique: f2siPP8KOhmdPqjGH_N7TA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg22-20020a05600c3c9600b003ef6ee937b8so1088983wmb.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DEIb+5SjLKlFj4FBJyCo3I41MRNQwmRvQYKowwm1GqA=;
 b=K/Xs3eutaOif/FLvkAxQJEP0NydyyeMcUaJVJBtPY/7DdE6EeRfaMiILlmR+y/xwuv
 MmdYRDX+pEw+e5jZW3+zxypRCL/S0MqbXNc1PZd1BzLDfq2YyP6tbofvNdHfPM6KaT0w
 Jb0WdgshZM1kKLp/vWe8ryoFwqmF/dEFAQnHvCnn5oOhTemudcKZIFRd95K/WoeEDT0q
 Jo2ePaN4LMxpTKvUmYtSip72Bl4jLujqwmvAuEgj77p6V9oGAM2xaOXoKfeXPPIwdH39
 C1qM/y7+3QpfBXXpNBUwmWRCbwCPsYTKNtuC8O+PoJoY1m5sBQUJGQK5InF9ohQ3AX+W
 r7qw==
X-Gm-Message-State: AAQBX9eU5jjdpdQ7jn4rDNVKtHVbXdRyc9qwUTp10epvWlFDc+pRQv68
 3Un1i9bUem87frrC+mN5VOupgzEyT2EreZclTaWkf5oWC80IGU6/NPaSZRiw2J0EFWBBmwsrXtm
 oCWKnod4DySToNzye/3JnyM8=
X-Received: by 2002:a1c:7c0b:0:b0:3ed:551b:b78f with SMTP id
 x11-20020a1c7c0b000000b003ed551bb78fmr8758217wmc.4.1681209917076; 
 Tue, 11 Apr 2023 03:45:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bhSFXZuyfKCKkapPJ2pDNDSiglSU0JTn9UTN30LAscw1fXnqtfq8bt53mNXhlnHYf1/hgSBg==
X-Received: by 2002:a1c:7c0b:0:b0:3ed:551b:b78f with SMTP id
 x11-20020a1c7c0b000000b003ed551bb78fmr8758207wmc.4.1681209916779; 
 Tue, 11 Apr 2023 03:45:16 -0700 (PDT)
Received: from redhat.com ([2.52.10.80]) by smtp.gmail.com with ESMTPSA id
 e17-20020adffc51000000b002ef2e148d59sm13586651wrs.16.2023.04.11.03.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 03:45:16 -0700 (PDT)
Date: Tue, 11 Apr 2023 06:45:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yaowei Bai <baiyw2@chinatelecom.cn>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/rtc: fix crash caused by lost_clock >= 0 assertion
Message-ID: <20230411064451-mutt-send-email-mst@kernel.org>
References: <1670228615-2684-1-git-send-email-baiyw2@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1670228615-2684-1-git-send-email-baiyw2@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Dec 05, 2022 at 04:23:35PM +0800, Yaowei Bai wrote:
> In our production environment a guest crashed with this log:
> 
>     qemu-kvm: /home/abuild/rpmbuild/BUILD/qemu-5.0.0/hw/rtc/mc146818rtc.c:201: periodic_timer_update: Assertion `lost_clock >= 0' failed.
>     2022-09-26 10:00:28.747+0000: shutting down, reason=crashed
> 
> This happened after the host synced time with the NTP server which
> we had adjusted backward the time because it mistakenly went faster
> than the real time. Other people also have this problem:
> 
>     https://bugzilla.redhat.com/show_bug.cgi?id=2054781
> 
> After the host adjusted backward the time, the guset reconfigured the
> period, this makes cur_clock smaller than last_periodic_clock in
> periodic_timer_update function. However, the code assumes that cur_clock
> is bigger than last_periodic_clock, which is not true in the situation
> above. So we need to make it clear by introducing a if statement. With
> this patch we can handle this crash situation to just reset the
> next_periodic_time.
> 
> Signed-off-by: Yaowei Bai <baiyw2@chinatelecom.cn>


Hmm not sure this is a good fix.  Paolo what's your take?

> ---
>  hw/rtc/mc146818rtc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 1ebb412..a397949 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -199,7 +199,9 @@ periodic_timer_update(RTCState *s, int64_t current_time, uint32_t old_period, bo
>          next_periodic_clock = muldiv64(s->next_periodic_time,
>                                  RTC_CLOCK_RATE, NANOSECONDS_PER_SECOND);
>          last_periodic_clock = next_periodic_clock - old_period;
> -        lost_clock = cur_clock - last_periodic_clock;
> +        if (cur_clock > last_periodic_clock) {
> +            lost_clock = cur_clock - last_periodic_clock;
> +        }
>          assert(lost_clock >= 0);
>      }
>  
> -- 
> 2.7.4


