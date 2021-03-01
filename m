Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E85328C2E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 19:50:25 +0100 (CET)
Received: from localhost ([::1]:38942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGncc-00027x-Qw
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 13:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGnbb-0001hX-Ks
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:49:19 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGnbZ-0007nq-Sx
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:49:19 -0500
Received: by mail-pj1-x102b.google.com with SMTP id e9so165195pjj.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 10:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z3pdNnR4pAKF4KiupNphCod16VxvG/aD01gv1Bd8gag=;
 b=vRxEz6tsu/fME/UNlIpwnjFbtv4+1Mfg3Xmr8AhXkdfGpDCb5QFfTznfJvYxt1WQQB
 i0HeLPjdSO1dUH5m2QWvwvo8Q5vpsnDHFcrzpctRFbPwbyLqTbYN+sxC++06HuVSgIsi
 neMdICZWhs7No7VRVkFmGljjVBW0rVTeQG3TVDebJM0Eu8GN5S/iH8v7CzxxwlgtDdkN
 oRGfh165RkUpREx+q6wL0Sa6BjzYA6mXbB7qJosH7SbWQ+ltByuKkF8jCf+13cFFrGch
 vhFnf0FYTYcL90oxmPCvkixaeoTw9vLv6fmj9VGi4PxPxINqq7eZYz678Epo3mQ0Ydpn
 bETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z3pdNnR4pAKF4KiupNphCod16VxvG/aD01gv1Bd8gag=;
 b=LhuJKRmo6dB75LKt6Gsg2iw/gHpo0awMB13RW67BOzcR0b0c54wiHc2H5Gf0vCGfOg
 UyCfS3pHUQjHCmuY1VG8WF0m7VtbRcN4lkBhu9OZ/Fo1bBU4xLiRX1jJq9DRnDS8w/QU
 AwG5OgOmtL12dN/XgJs6zYF2WheG6eGSeXZIIJxwQzn+HeixkQ/7m8C7WhyAi2s4zspx
 w0Pf59tyMBxsegFW34G5azBKsPhd/c32x72bQoVeLVJw9AE3/OyqZJbqPfDCEZXNhjVk
 64xVbN3PD1WSfNHBqHBEMapwC5cjUnyiwVU5JR4qABzagEstngf+yyhzmQD4rcrn351S
 DLxg==
X-Gm-Message-State: AOAM532LBLtOLudz96DQ35ABKWZZGJOiV9I+liq9hIwRpuSRG1dSDsBO
 k1ufo77KzD+SQ1Nn39P7v+2R0qYh8yeGVw==
X-Google-Smtp-Source: ABdhPJz+8LFc6CbIzYCzt7YU+p+z7rLWPiiUeugDclb0dd4/2fHbjnyIrnCdua1GpJD5xQNToblauQ==
X-Received: by 2002:a17:90a:9f96:: with SMTP id
 o22mr273525pjp.119.1614624555931; 
 Mon, 01 Mar 2021 10:49:15 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id s15sm18891421pfe.108.2021.03.01.10.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 10:49:15 -0800 (PST)
Subject: Re: [RFC v2 07/24] target/arm: move physical address translation to
 new modules
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-8-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4938d38-eec9-361c-b689-77832a3da75d@linaro.org>
Date: Mon, 1 Mar 2021 10:49:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-8-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1023,9 +1023,6 @@ typedef struct ARMVAParameters {
>       bool using64k   : 1;
>   } ARMVAParameters;
>   
> -ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
> -                                   ARMMMUIdx mmu_idx, bool data);
> -

Moving aa64_va_parameters away from its struct return is not good.  Either move 
them both or not at all.

The collection of stuff you've split out into get-phys-addr.h is pretty random. 
  Let's just leave it all in internals.h for now.  We can make a more reasoned 
decision vs all of the vma and regime related functions.


r~

