Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E345AD2FD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:43:33 +0200 (CEST)
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBRr-0002hN-Uj
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAi2-0002nt-BS
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:56:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAhy-00064D-7R
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:56:09 -0400
Received: by mail-wr1-x434.google.com with SMTP id az27so11039507wrb.6
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=geim/YwvvCBOmEvgklD8WbMoIr/Bs2QVffnjiiMdASI=;
 b=lDvW3Q4DpzHPnqIPy91TQlXKN72Cx0PUK6dUz+IELPUVWUvjyghnwrxCJGi5EbkpgY
 EK1ZcaiPn5ofQ++CvUwH3i6bgG9yAKUaHF58eQVK9sAEqvhY5mhPFsDvUupuLMbsO8t7
 U5qpPBgfM7qVkj70TQE/iqcVufW99bzxUlEOCJD0nfDyohoHYV180ALijoa86UARAR7s
 mTKpdTH59pt2qrR6vRMmMXcpb2keCMd4EMPbQ2w/WcJ+tFMae/pPD01ky/+o3euUYMzb
 itbonsVtSOScyuRsjXhVltkMoTEIG28WK55tpBEyTerSaaRY4gky6YRTxz6bpiXaeMxK
 jUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=geim/YwvvCBOmEvgklD8WbMoIr/Bs2QVffnjiiMdASI=;
 b=GHeQ1dPnX0O/z4pVPjSsCpRCa5AE95UbFFrXAqLmEY2mBlqlDcKx9NSsgQc1ayP8Ro
 pIBXZELcs1OLYKqCwoorAgVtcGBf3JOro61ZbzZrGAwq7Li1bj/TebcGG8eR/Obknnpj
 QzIW48GHS4by3KsBt3BGPJqbv6I4LzpPmVBP+UdcArzH5mhz7M6w11SJwhsHBh+f2xzm
 mLyNRg6TBcJ6CDBDSQor83V8204c5eN8c14Fs5GmGOcK1o2UEJXfVKq+8kVc8XIYZtAG
 jKfh2/O1Eu3+rEYxG8c6v1G/CCJaGaJqvTGA9nHte44h5XFVZIGz14M+Czh+nbsUU/cj
 T9Qg==
X-Gm-Message-State: ACgBeo1NZ4gBGTQ9RCHU8NdL6ittUMEHx48tqWJDGH1NexQN8hvXWnk+
 oyE9+iRllwUZFYw1q7+QPPUtDw==
X-Google-Smtp-Source: AA6agR4Z5thUPiTKY0vnvh/fhp5hz8BCo2zp5uQmUs7RU5iDyPR0ggJ0SHzk1/8IJ3SdhU/02Gx2hA==
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id
 h1-20020adffa81000000b00224f2602523mr24155990wrr.26.1662378958923; 
 Mon, 05 Sep 2022 04:55:58 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 f16-20020adff590000000b0022865038308sm4211594wro.93.2022.09.05.04.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:55:58 -0700 (PDT)
Message-ID: <3c6dcd06-21d9-ae48-3203-e9a52f9dec5d@linaro.org>
Date: Mon, 5 Sep 2022 12:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 15/20] disas/nanomips: Introduce Dis_info struct
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-16-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-16-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> This patch introduces the Dis_info struct, which should hold the
> necessary data for handling runtime errors. Fields fprintf_func and
> stream are in charge of error printing. Field buf enables the use of
> sigsetjmp() and siglongjmp() functions. Support for runtime error
> handling will be added later.
> 
> Parameter m_pc, which we need for address calculation, is integrated
> into the Dis_info struct.
> 
> We're filling Dis_info at the entrance of the nanoMIPS disassembler,
> i.e. print_insn_nanomips. Next, we're adding that information as an
> argument wherever we need to.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 4083 ++++++++++++++++++++++----------------------
>   1 file changed, 2050 insertions(+), 2033 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 9e34ca164c..5142f307fc 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -41,9 +41,16 @@ typedef uint32_t uint32;
>   typedef uint16_t uint16;
>   typedef uint64_t img_address;
>   
> +struct Dis_info {
> +  img_address m_pc;
> +  fprintf_function fprintf_func;
> +  FILE *stream;
> +  sigjmp_buf buf;
> +};

As mentioned vs patch 3, this structure should be introduced much earlier, which 
eliminates almost all of this patch.  What remains appears to be specific to the next 
patch, for exception handling, and you would merge this into that.


r~

