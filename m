Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8028247359C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 21:08:32 +0100 (CET)
Received: from localhost ([::1]:52316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwrcc-0002ZZ-7r
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 15:08:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mwrax-0001f3-Gj
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 15:06:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mwrav-0004Ni-3y
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 15:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639426004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lX7MIX7hf5Q3TCJCIKSrdxWGEfwxLsyB8AL2ix5etPM=;
 b=C1Ra0dCv7uQuY3vn1A+QhC4sVLKPl1s4NrAZG/0UJk4vueIOLWSXQbk3uPFHyJj2wM5IE2
 ABFuqFnvLHV1nWbnDhogO9LLge1SIER6jnyC//FpAaZPJXd4I0+6J2FF05XdCYta+cd1W4
 TjZzEDIN7/kyGO0HuQextesEnHKAPLQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-9apO-4SmMZSwpitHyy560A-1; Mon, 13 Dec 2021 15:06:43 -0500
X-MC-Unique: 9apO-4SmMZSwpitHyy560A-1
Received: by mail-wm1-f71.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso12071274wma.6
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 12:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lX7MIX7hf5Q3TCJCIKSrdxWGEfwxLsyB8AL2ix5etPM=;
 b=La0REH2K+KvlEh8tKazILeI/gUPMExwdoHibS/OTf6+Y+uxcBCsrozgEuokDaitZyH
 WdleS/ciwee25xlOP/Ku+ratNYhZ1UIW8Z1UVukdDggp/FYgzZlv7MP6hAzMmkuz78Bn
 Al2ifkHuxc9faumoxKaAMeAFbIfF+ciJ3Q2VpGsf4j9TKjjIXXMn7cRar2Cl3JqDhnis
 O+1BUZGoblR8Ajr2Ypy/j0J9wjZalTfVVzD1Ab/ZTsjGh/FiSCa1lWjGTpYcKVYkYwtg
 /pq5dn/JBriUHbely4wBGxsfrA/Dp3DJ2TXRh8RHmE60zji1i5+AES0jliYXVY+f61fc
 Zp0g==
X-Gm-Message-State: AOAM531WLb/kLo8z5qOt9r3LJHZ61KPB3RVi+A/5XQ7YiXxas5PRGg/c
 x16eKwb/jlJH7H3ineGYzLmm8R2xF5cdU/eRtmRwNILlK2o+6sPTrqsQxQQRxrSp4Qp7XtcTDYC
 yyNqBlinw4pSdA0Q=
X-Received: by 2002:adf:f708:: with SMTP id r8mr788785wrp.198.1639426001379;
 Mon, 13 Dec 2021 12:06:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl1itji9iS5BrgvKPWcu/w1fewRgkK7ULAWuWmcd2D1ep20EkUAi2LFevZxTdipKrgVE6JPQ==
X-Received: by 2002:adf:f708:: with SMTP id r8mr788753wrp.198.1639426001102;
 Mon, 13 Dec 2021 12:06:41 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id i15sm9554583wmq.18.2021.12.13.12.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 12:06:40 -0800 (PST)
Message-ID: <8e97b380-5741-0e48-5d2d-4e1effe4358e@redhat.com>
Date: Mon, 13 Dec 2021 21:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
To: Byron Lathi <bslathi19@gmail.com>, qemu-devel@nongnu.org
References: <20211213182449.7068-1-bslathi19@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211213182449.7068-1-bslathi19@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 19:24, Byron Lathi wrote:
> Add support for the Cortex-A5. These changes are based off of the A7 and
> A9 init functions, using the appropriate values from the technical
> reference manual for the A5.
> 
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>  target/arm/cpu_tcg.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

>  static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
>      /*
>       * power_control should be set to maximum latency. Again,
> @@ -1019,6 +1055,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
>      { .name = "arm1136",     .initfn = arm1136_initfn },
>      { .name = "arm1176",     .initfn = arm1176_initfn },
>      { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
> +    { .name = "cortext-a5",  .initfn = cortex_a5_initfn },

Typo "cortex"?

>      { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
>      { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
>      { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
> 


