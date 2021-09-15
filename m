Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2906340CB5E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:04:28 +0200 (CEST)
Received: from localhost ([::1]:51340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQYKh-0004bS-6r
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQY9N-00006Z-5a
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:52:47 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQY9F-0005ez-AE
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:52:44 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 17so3322811pgp.4
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e4kFMKkImB/FvWSMs65uVMEKYjok0/dHvZSnffMPbRg=;
 b=H/n6T7HLd6hMk6iqqZT4q9J2gKCuXoTL+KpODFzGOrbmIffToM6ulTF1OvCROoYj5D
 jbMPX/BmgS6BACaI5LFUyV0sM3/O249/HQUFc1NpJWo2K9OCGwJnwjdRb8Vvios9Tu+j
 NCtTEc4lRrIp/3enqgjZ+dS+lBhZtvPFvyMWGemucirSc+AskhVPlgSpWsIWJgckhvVl
 eywbC32o91kgh3uJGET9dIhyesPzYk55k2uXuD8OqzSJRo1Hs6un4k58wmHa9iH0EkkC
 Hbtr23NxIfVzy4wpYc8at+ARQOAs/YzFh6+pTvQvij2rv6t3Z0WEPoWyco9OCRFDtrKd
 QEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e4kFMKkImB/FvWSMs65uVMEKYjok0/dHvZSnffMPbRg=;
 b=BM6eAr+aLUnw8YfoArWrws4SxPqO+TwqgkTLc/gUBfJZ45IBOdRscu4dC5nbDRcpeH
 4gtA50VarydU3BZuawA8JrzuTZ9pSmZpyNGi6gBsRlRg0Dgy/8virfC78jSHpRYLMO1x
 vbvzl1hF3FVv/+U+dQ+/S+fy0abO6cyN4w6bIQ9BezrBD5v5k9mfG7Rlbls9EWaJDemG
 cTME8+ByZpwwWo4gXUr0UVeLNR9b1+TUBlLvRpEv+MXcak7+otGe8RCX9gUqwq/zRoTU
 WBBjph+2C26LLQ3X6wYN7Jml7cUD8u3eou368YQHC/GczjILvasuYdwCMpJ98BoebBh7
 oYrw==
X-Gm-Message-State: AOAM531s5N0u4SHUfaVzIQmYE2r0DlIziTvkRbo/TvIwqKktkeHdTlFD
 acfFvWKeMDJv1mbEpll4oA6qkA==
X-Google-Smtp-Source: ABdhPJyKNCi+G1B5P0IfcQ1ZEUJaWgOOKP+AW+RLuGFdvWiQgraPO1ywENVMnTh9eeZR5JCBChrnPw==
X-Received: by 2002:a63:e446:: with SMTP id i6mr689469pgk.288.1631724755287;
 Wed, 15 Sep 2021 09:52:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a11sm444792pgj.75.2021.09.15.09.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 09:52:34 -0700 (PDT)
Subject: Re: [RFC PATCH 7/7] linux-user: Reorg cpu_signal_handler
To: Warner Losh <imp@bsdimp.com>
References: <20210913220552.604064-1-richard.henderson@linaro.org>
 <20210913220552.604064-8-richard.henderson@linaro.org>
 <CANCZdfrYpbeDChw_EHNUoJT7M5Qz=d67HLjdfo_gm-iOLB=Zeg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a1a75a7-72e1-4ec6-d16d-38574786e536@linaro.org>
Date: Wed, 15 Sep 2021 09:52:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfrYpbeDChw_EHNUoJT7M5Qz=d67HLjdfo_gm-iOLB=Zeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.698,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 9:43 AM, Warner Losh wrote:
>     Split out two functions into linux-user/host/arch/host-signal.h.
>     Since linux-user requires a linux host, drop all of the BSD and
>     Solaris ifdefs.  These should be recreated under bsd-user/ when
>     the current blanks there are filled.
> 
> For some architectures, this code will be small and host specific (I'm thinking
> arm, i386, ppc* and x86_64) but for others, there's common code that can be shared
> to parse the instruction (aarch64, mips*, riscv*). Do you see any value in
> sharing that instruction parsing code in some way?

Yes, that would be ideal.  Although even more ideal would be for all kernels to actually 
provide detail to the signal handler so that we don't need to parse instructions. 
(AArch64 being the example where they did finally fix that, though we've still got for for 
pre-3.16 kernels still hanging about.)  How are the BSDs in this respect?

Anyway, I'm not sure how to organize such sharing, but I'm open to suggestion.


r~

