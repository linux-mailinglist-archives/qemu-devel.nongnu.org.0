Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1051E6BD249
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:24:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcoW1-0003IM-Q1; Thu, 16 Mar 2023 10:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcoVz-0003Hy-M0
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:23:35 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcoVx-0004ZK-Uj
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:23:35 -0400
Received: by mail-pl1-x633.google.com with SMTP id h8so1905509plf.10
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678976611;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GCcwv059gK8CBDZbisirXuwAnTFGGlYUenHXJBpZqu4=;
 b=rulVmRfV6jLfNob9sitsa+9x4xLvNWLCLnVfxwwGm4XYYB+HTfe4EAfMEiI0OCu+77
 AmRBSuS2b7fhYmqNf/Q6nmsr7Spm+vl4/k6uv5N4gQ+3QAxT+vC+cfHgLdVCVX0bbL3c
 ZD/IDJNbCRFdsC8qhT0EvBIosaCyKYqZXc1skmISI5qhRSFGgke3HyiPCGCZl8VxlRjz
 euoBtLiPiKtddWic3jPKLNwNZYE4ytREXaKSYV8pLSgs5jxweoXjflqH+xtozDDnOBz9
 6QGS+lmExxoXfjH4+NtX96V7QHBIU9gxv81wdNJGFwQ0RItcEx0OOUQ16Yxo9BfcHH53
 90RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678976611;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GCcwv059gK8CBDZbisirXuwAnTFGGlYUenHXJBpZqu4=;
 b=zLjXVcKtvmUo3JZzcELM7iPt1ThmKnWVOdQc35KB4d2qEIN4tUH94+korP/MVNcx2y
 P64Nuuci6s0hnDLn3m0t51oFof2YcB9JroKbgOh5U88+W3Rnk/TjO7WLXs0wEGhKLR7l
 79p2I6Ch1j2pRhMmOk8nIA5zZq1h5UjiEJAjZglBrjw6mB4QifpX7+sBd10zcYEN9/Di
 EAnspzhhtPZxdQDZpGgWrLp/TWhnsA0aTis/5RbVjcWefD+uYvUVMZr+OjFo2y0W5krI
 l5h5CLlpi8sGcqfxVrwVsGW/0s7ptte2k9CaCnP/nmmo9ZGAlsLqgQG89uvII6Yohr38
 7TmQ==
X-Gm-Message-State: AO0yUKXCCnUHuDLEBdpO+8zv6cQwoLW9mZcWvSd9Gecu5UntSUBmfhe7
 OgSnl1MPxtOJorQV7Pj1EtYoHA==
X-Google-Smtp-Source: AK7set/Mc09ubgrgvdbEi2zj+RibQy9FTdTRX/OMwNAHIur+07AyCJ+WE6Rfyai8qSUh880Uzee42A==
X-Received: by 2002:a17:90b:1b11:b0:23e:aba4:21e2 with SMTP id
 nu17-20020a17090b1b1100b0023eaba421e2mr4271679pjb.37.1678976611596; 
 Thu, 16 Mar 2023 07:23:31 -0700 (PDT)
Received: from [192.168.57.227] (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 j12-20020a170903028c00b0019f3cc3fc99sm5699498plr.16.2023.03.16.07.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 07:23:31 -0700 (PDT)
Message-ID: <a4ff39cc-b7c6-5912-7344-68ed9637bc9b@linaro.org>
Date: Thu, 16 Mar 2023 07:23:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] linux-user/m68k: Handle EXCP_ADDRESS in cpu_loop
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230309201604.3885359-1-richard.henderson@linaro.org>
 <20230309201604.3885359-3-richard.henderson@linaro.org>
 <4f55ec67-2a20-9d99-1934-f7b20f3094fe@vivier.eu>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4f55ec67-2a20-9d99-1934-f7b20f3094fe@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/15/23 11:16, Laurent Vivier wrote:
> I've tested tests/tcg/m68k/excp-address.c on a real hardware (Q800), and the result 
> differs from the one from QEMU:
> 
> On Q800 (etch m68k, kernel 5.14.0):
> 
> $ ./excp-address
> Illegal instruction
> $ strace ./excp-address
> ...
> rt_sigaction(SIGBUS, {0x80000478, [], SA_SIGINFO}, NULL, 8) = 0
> --- SIGILL (Illegal instruction) @ 0 (0) ---
> +++ killed by SIGILL +++

Ok, that suggests that we need to do something different in the translator in patch 1. 
I'll give it some thought.


r~

