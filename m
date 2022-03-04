Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0E24CDDB9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:07:46 +0100 (CET)
Received: from localhost ([::1]:54714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEDI-00036n-TL
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQDz2-0007yU-Ou
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:53:00 -0500
Received: from [2607:f8b0:4864:20::1029] (port=43657
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQDz1-0002Jh-3z
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:53:00 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so7755536pju.2
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 11:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=isLEgj/rIE9pf2fYCkbJfnTSK+RAGub5ms/ITRC6pyE=;
 b=tuaRef82qCZYrxgm+5GUvFVSoKfMkPhF/lp5DU0pkblok3bH8CvNcZwdZVUEQ2m4Q2
 ZgFkkyysbQ6uL6K+JIcpZEuQeCwlNkM6cGI4BDFvNHWV+5tdE6+dhITzrWH45e3y/3Zi
 L56gbLgzKnM2dJfJ15kODLDrliKaU/yttKy0NrFyxZngDRwE16dELkAd/0E7hBajzDCB
 GQ85EkRmjVxQsMiCgw4I57v+8wpvT7HWzY9rDf6q4fKKDJMJzj6XqPB7YbjzSXEOHCwc
 HMZPUL/KfSAfLNi2/4DaeLCdtvsV/9/9Wm3o+8mcWBRh8n6e+N82NO5wNZ2QtVb6zfp0
 68SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=isLEgj/rIE9pf2fYCkbJfnTSK+RAGub5ms/ITRC6pyE=;
 b=xyOPib9CHqCh9d0BuBABwDoTwUtQr0Fea6yoewPwdLCKKaiqAiKtHKJHfKtfrAZd7H
 sQ6T5ueiMTfVByE1B1qqLfIHu6/QKUKpBr5F31ex0HMikFIqqjuCmBClPGmNWKcv4VEx
 +fWkBTjLTbqPGnqZB2x0pZ7jpSrPRc/y7qNn2FzJbTjWPA2Vh2DCjH4dsdwUM53nglea
 fRonX1Ft+Y1ZY0ZvRxM82LGDKZFaNwSDs9cg/Y3vdhhnQLNFKVGCqG34OHntwc6D9Mpk
 Ih6J7duENZwhFX9GbKJ/wPf0qX6coU6XGqOh999lLgWC/O8VZ4f3ar9rWDyu2WrdOvxS
 n5LQ==
X-Gm-Message-State: AOAM532WpOMaHbp3JFrVWIyIYaV2rpQVoEEvq+Bz7HsnqRolSNpWIP2Z
 32ds6B3WvD3wQ2v3+NYJ4csf7Q==
X-Google-Smtp-Source: ABdhPJyJNwvTvAtJGxDlgaXT/IqWeQJETz1IRasvOPaxPbq87mejsUMgIU8nt8o/F667DQS3rO9hnQ==
X-Received: by 2002:a17:902:cf08:b0:151:9d28:f46f with SMTP id
 i8-20020a170902cf0800b001519d28f46fmr208080plg.53.1646423577416; 
 Fri, 04 Mar 2022 11:52:57 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a17090a648800b001bf2b437609sm2234897pjj.24.2022.03.04.11.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 11:52:56 -0800 (PST)
Message-ID: <df2c63db-54d9-ae40-f403-b1adfa6bdbdc@linaro.org>
Date: Fri, 4 Mar 2022 09:52:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <20220301215958.157011-19-richard.henderson@linaro.org>
 <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 01:52, Peter Maydell wrote:
> Is it not possible to implement this in the usual "change
> property for older versioned machines" way of adding to
> the hw_compat arrays?
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4d..dac82a709ba 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,7 +37,9 @@
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-pci.h"
> 
> -GlobalProperty hw_compat_6_2[] = {};
> +GlobalProperty hw_compat_6_2[] = {
> +    { "arm-cpu-max", "lpa2", "false" },
> +};
>   const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);

Hmm, I didn't try that, just mirrored the other examples within hw/arm/virt.c.
I guess the real type name would be TYPE_ARM_MAX_CPU, or "max-arm-cpu".

...

Yes, that works.  I'll send an update.


r~

