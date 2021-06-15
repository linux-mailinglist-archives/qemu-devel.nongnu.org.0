Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F5B3A75B4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:18:53 +0200 (CEST)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0XM-0005k6-Mx
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt0WT-000513-7k
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:17:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lt0WQ-0005rM-81
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:17:56 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h1so7781683plt.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 21:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6kjNefm+09bwWjgtLFGq1d03bIJCqYB11aL2bOSrCnY=;
 b=clX5ahL/V9e9rRkCBZKnBaLF0+uCwxCcZ1SkZls97VQ0QVd27O8uX5sNib7RZ18SG4
 41BrGgRc23xhor3TiA2krjfGpCtcT/pGTmS1sY6xBeJADKc3Dptx7GH/8e07FJBLoyis
 VVCzr9/En+UdVGvTsGq0ozyzsfHmkqSrn8eZmNhPdgfH4qLBlHu59HTOp72WTdO/rLuO
 YCN7U0PfrjWiGY8fKYap7RYW8xgpeOtxNZ26V9HRQD7fuVJ2Fp4YFEGulywNHoKV6HDC
 OH710mwM+0PtT5B7dtdS4DSxKFD9e8Zwi514JORpg3oJeoVPbg6bha4GU5eU6Ru5hqgu
 mh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6kjNefm+09bwWjgtLFGq1d03bIJCqYB11aL2bOSrCnY=;
 b=QvBPSWlR3nXJKaZdt2tHKJX+q8z9Lj46ICguyvYaiTVsqOI4vICoZn0UsyRoNWfr1O
 BGvtJQ3qh0ALcqUWkHK7++3A0Ha0sVPTTU04fR/BzggaARvurgJ14Ybmm0uUvnY0soD6
 2BrNztVNwBHCBlmYlONp7z3KKNUdCxbaQwNZsl/QnwOuZWcSkelCqgRcJ1rEJoq6OfQ7
 c5SVAcb8iIccd9XGcKH3+sSZBMQ9sZNehk3wV8xy4wee9U3q1fU7LmG52sJcH+n28whE
 R7efktX1DEQ6uFur4l1rE7umuuVb1S5zHPc67TH3I7zxkuLtbnjylgLas4D5/ZHOy6ep
 /xZA==
X-Gm-Message-State: AOAM533nbejmYox/jlbVtICj7tA4SZL/uVwF0JDeialHZDGRlzshOjf3
 AfvEKC/4cTAJrsK6JVipSPE1xA==
X-Google-Smtp-Source: ABdhPJzAjjMsoN1URlAFao0X50l/3Az89uz2k3xxoBp7WgGrqSldZnQqNzrEMWoDUdf6CijQ/OSzbQ==
X-Received: by 2002:a17:90a:a00f:: with SMTP id
 q15mr2861788pjp.193.1623730672449; 
 Mon, 14 Jun 2021 21:17:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d3sm887207pjk.16.2021.06.14.21.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 21:17:52 -0700 (PDT)
Subject: Re: [PATCH 1/4] mc146818rtc: Make PF independent of PIE
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210613211549.18094-1-thorpej@me.com>
 <20210613211549.18094-2-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c2ae675-f734-174d-6640-baebc817f3ba@linaro.org>
Date: Mon, 14 Jun 2021 21:17:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210613211549.18094-2-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: paolo and mst

On 6/13/21 2:15 PM, Jason Thorpe wrote:
> Make the PF flag behave like real hardware by always running the
> periodic timer without regard to the setting of the PIE bit, so
> that the PF will be set when the period expires even if an interrupt
> will not be raised.  This behavior is documented on page 16 of the
> MC146818A advance information datasheet.
> 
> Signed-off-by: Jason Thorpe <thorpej@me.com>
> ---
>   hw/rtc/mc146818rtc.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 4fbafddb22..366b8f13de 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -155,10 +155,6 @@ static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>   {
>       int period_code;
>   
> -    if (!(s->cmos_data[RTC_REG_B] & REG_B_PIE)) {
> -        return 0;
> -     }

This looks correct, but I don't know enough about this device.


r~

