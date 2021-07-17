Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764773CC5B5
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:13 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4pt5-0002Kg-JP
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4prj-0001a1-TQ
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:20:47 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4prh-0000M3-Vy
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:20:47 -0400
Received: by mail-pg1-x533.google.com with SMTP id w15so13998968pgk.13
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dh/X7qo1dE4XZEz16WZiKm4QVo8gcdQGGvN7zahN2wc=;
 b=mGMq631Xk6S8cns12p3LVVPxzP/ixBrexChj0Vcs86Rq8FRHj0EbMVag5BTiK2Ym6I
 bB5/eqTBNDiF91u1Y+bhL/bqtNiWvWEZa/3xO4YdgJ0+Y8PnfFAXjBK++AN3s07AT6H8
 Uo1hwRCfoj+DKYAhi1uSQ9b2ewg+RDG9gS2r86wgQyudEwiK5/KORU0zL54dhgDpGT3Z
 CmmHG71czHXpnKKq1GFeNcVhI4ommOD9PBICTGwhC52DBdhkhgSbyH8T0+Od0wSzjmB0
 ipwpuYR74lVxN0simnjmY1tjlIN0psFmma/hIq3DYMGOtAbMmubZQm1wkrrnx9qhahtC
 UiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dh/X7qo1dE4XZEz16WZiKm4QVo8gcdQGGvN7zahN2wc=;
 b=LHcG5FpX3AbIzSqN3vsBL5IZpE1+1TIcBcSEBarqlTSWO+CcuasUd5eOpG1AZWnqgn
 16BrgaUgzbAbrJMR6kjxc2L2j9ZkaW95zcDEWQP6jFGV8ia0Ithg0A8VoPBvpM06A6s5
 edPxZ+BwzPIUQ1OE2uXLVzJMLqUiNX3qlVa1vdl4dC+Be1qz/HuiLvL5uivXRTid2pzS
 pJFJbTNIYpPiUC9CvFRHVxax7tJnTLksuAAMImCE86aJIUcVh5bKu7JEnhd4qVUo4D+Y
 CaMNJQ6nKvMbZWfzTZ8asUsDjzECWfrBCgFsYX5c+CEuY7T71eZbGollMChfKewxX7lI
 TlOQ==
X-Gm-Message-State: AOAM533jkWjl/UtXIxPGi1alHeIUHrvOapugv7U5CRPQMpkUoUOvGuWm
 7vT3wpJDbsSCPxhl3s7pDUzPOw==
X-Google-Smtp-Source: ABdhPJwpOzRmsFZqwspA5Wsx+9AlNDfD4Kx24l+mfIja1tvepraznrulXui5Em25zjCU9SJn7Ieclw==
X-Received: by 2002:a62:e90f:0:b029:307:8154:9ff7 with SMTP id
 j15-20020a62e90f0000b029030781549ff7mr16763358pfh.79.1626549643893; 
 Sat, 17 Jul 2021 12:20:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id f5sm14329816pfn.134.2021.07.17.12.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 12:20:43 -0700 (PDT)
Subject: Re: [PATCH v2 10/10] accel/tcg: Encode breakpoint info into tb->cflags
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-11-richard.henderson@linaro.org>
 <CAFEAcA_HdOyPdbrQ+EeGYAP88-0L_RQEbB10-7KmMqpUASzYbA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <762ce4c8-a0c2-b5bf-3eac-4ae4421d1ff8@linaro.org>
Date: Sat, 17 Jul 2021 12:20:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_HdOyPdbrQ+EeGYAP88-0L_RQEbB10-7KmMqpUASzYbA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 10:58 AM, Peter Maydell wrote:
>> +static uint32_t cflags_for_breakpoints(CPUState *cpu, target_ulong pc,
>> +                                       uint32_t cflags)
>> +{
>> +    uint32_t bflags = 0;
>> +
>> +    if (unlikely(cpu->singlestep_enabled)) {
>> +        bflags = CF_BP_SSTEP;
>> +    } else {
> 
> Won't this ignore breakpoints when singlestepping ?

Single-step already has priority over other breakpoints:

>          /* Pass breakpoint hits to target for further processing */
> -        if (!db->singlestep_enabled
> -            && unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {


r~

