Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC27672292
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 17:09:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIB0S-0003iX-MS; Wed, 18 Jan 2023 11:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIB0P-0003fa-Ha
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 11:09:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIB0O-0002Ki-3e
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 11:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674058179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EnczWuya39j3dK9APW5iguAlxAq+7FeVUnZHxoSSFc=;
 b=b2l0S1dGEZCgEUwkoEi8w6Gscvga5ITTOfI/694pEoNe1nsmSu8XAAXCw0rcPzPmWO7O3N
 mGXlb1uZYkKk87ly5539tpkMUYyDW3v6cCxv0baET8vfs7DOdqT8+G9eb8vfz5RrcV4tsK
 JW/izPodaFf7xzGuekKOKHQ4nhT5m54=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-wVsGnXNTN_-x150wDdiWKg-1; Wed, 18 Jan 2023 11:09:36 -0500
X-MC-Unique: wVsGnXNTN_-x150wDdiWKg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-4c2d68b6969so353281257b3.7
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 08:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2EnczWuya39j3dK9APW5iguAlxAq+7FeVUnZHxoSSFc=;
 b=ipoMgAu4u0vd1Vmz20G9qVPwQDUGmkSEyMLexkZGV/IBvJoIkClgI9Kr5oizwH7A4L
 27zAeopaa3SoWrgNMWXih7E1Mw/kLVkWKHJkVwCnCxz9+F+/TDkNpuC+SZfp9Pmgrvk8
 KrMrsSvx0vMdGlU7Uw4FzR13tSLYnBxlSV02zJtxxmTbCqafOjOAsSMNALda2cEZX6JW
 JqXUKhcUPV1QYHAAoNsRxwnZnucs4u48y6LGpx4IME8cwx5vSvhzWom213zMJgXSMGbn
 kCpHxjekz7gnRnuO4kHRou/U80XNm7cBTe0Ug4RkXwwmPWRShN+9URqilS2KZvv2sQJx
 hJYw==
X-Gm-Message-State: AFqh2ko27iyqSdt13NLqK4sqQm2xkYWyDcHBU71kd0ONgujdIaj9vkTq
 jY/oZo7L6iUgzt0GV2IiCIWsil0BB4AbGodEg7tfYI6R0RkQx4bsB4U8ZB4sw7vA9JUmIkTI5n0
 VNSec6cJ1EyzT0V8=
X-Received: by 2002:a05:7500:6609:b0:f0:4854:5db7 with SMTP id
 ix9-20020a057500660900b000f048545db7mr641457gab.68.1674058175562; 
 Wed, 18 Jan 2023 08:09:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuVP5/SWeJB2lutyvhgQ2YZhLMohEzlUfcpuOUC+rFr3W9UVhIpf50cM6hJmUPfmi6tKoMvMg==
X-Received: by 2002:a05:7500:6609:b0:f0:4854:5db7 with SMTP id
 ix9-20020a057500660900b000f048545db7mr641419gab.68.1674058175188; 
 Wed, 18 Jan 2023 08:09:35 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05620a28ce00b007062139ecb3sm10885240qkp.95.2023.01.18.08.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 08:09:34 -0800 (PST)
Message-ID: <fd06e139-c6e8-e978-c0ed-3e9aca258f19@redhat.com>
Date: Wed, 18 Jan 2023 17:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] bulk: Coding style fixes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230111083909.42624-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/01/2023 09.39, Philippe Mathieu-Daudé wrote:
> Fix the following checkpatch.pl violation on lines using the
> TARGET_FMT_plx definition to avoid:
> 
>    WARNING: line over 80 characters

It's just a warning...

> @@ -420,8 +421,9 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
>                   hwaddr curaddr;
>                   uint32_t a0, a1, a2, a3;
>   
> -                qemu_log("Page table: " TARGET_FMT_plx " len " TARGET_FMT_plx
> -                         "\n", ppc_hash32_hpt_base(cpu),
> +                qemu_log("Page table: " TARGET_FMT_plx
> +                         " len " TARGET_FMT_plx "\n",
> +                         ppc_hash32_hpt_base(cpu),
>                            ppc_hash32_hpt_mask(cpu) + 0x80);
>                   for (curaddr = ppc_hash32_hpt_base(cpu);
>                        curaddr < (ppc_hash32_hpt_base(cpu)

... and in cases like this, I'd really prefer the original line.

I think it would be better to just fix it if checkpatch.pl really throws an 
ERROR instead of a WARNING.

  Thomas


