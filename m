Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D0263F930
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 21:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0qGD-0007tJ-CS; Thu, 01 Dec 2022 15:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0qGB-0007sn-HT
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 15:34:19 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0qG9-0003cC-AX
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 15:34:19 -0500
Received: by mail-pf1-x432.google.com with SMTP id 124so3033908pfy.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 12:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C41hdrvmJzWT4QWltLxdv6w04gTtATgDK19BXleL3nY=;
 b=jE2hX3TGvU4QMDzCz08R6SAJ/Wj8pWneVPoYXQuIpzHDRZCCgwGP00Q+qAZrp8R61s
 ELxm3AZhgq6KiyP0vZRSboiIer1frjVifE5pXBPGmnwN2R0mEesjwYczPUIUggcjnh0m
 2bzfq/r+of56n87ooDQfyDj6StOiY0f76Q8j5xZ31GQzRHTSVZ7bMFi84yz2ydScNpLs
 knN5pxiNtGew1nx/pL7aN2ASJCeI2AOYwoUS1vwc7wOAe/5kDC4Bxxy3V51AXBy0drUt
 p10vV5DWYxpwQaHBppq38UqV/KGByGI/1Gsd13xRkS1jBDN4zdiHQ0qJ4b/wBmU95igm
 JWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C41hdrvmJzWT4QWltLxdv6w04gTtATgDK19BXleL3nY=;
 b=ImV3aFEPGtPaWgNhHSbgWTLGQDjrDLhxaa04fPlkyIOFIAh62eHERl2UFegyl+8Om1
 8AtJ5RDVTICUAFkOwAvZHKPW7UkT2Rh0mDDR14ff085L0W8BXK8obPqw9DSOfXPL4RHn
 mM7JQW2P3VphW89ZplQi1xPLgsGrHO7l4VgrQNmDHQ2g1/GYhYCu8ZeFyiOceG/kOpkO
 eyo0gTbhx+13TJ2A0TvfL1pHA7yg0M3v5dr4ViHv4SyA82jawhu4tjS2Sf7aR1f3CZMz
 NaRnde3/JyUbfjpSfLRcqH8Q14u5BD4BbD5LQqeR4lOQTYsooRExcBCXMTAohjNmWGhf
 UTog==
X-Gm-Message-State: ANoB5plA7ev7vrxuNKjGcpzAZnkNN4YU4ZEYr6STt8eoOdqRD3smLCIm
 6SB2C43An5UznDTyiVus0WRO7w==
X-Google-Smtp-Source: AA0mqf798EYaTJrE5IBz325b2hdN5zBrheEWiwGto9t404/wyBmI+s7sYIcfynVI5HBFLSUNvKqTng==
X-Received: by 2002:a63:4605:0:b0:478:80f8:66a6 with SMTP id
 t5-20020a634605000000b0047880f866a6mr1411098pga.222.1669926855204; 
 Thu, 01 Dec 2022 12:34:15 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:e3cc:2e37:17d4:f1d5?
 ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 nt15-20020a17090b248f00b00217090ece49sm3419938pjb.31.2022.12.01.12.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 12:34:14 -0800 (PST)
Message-ID: <b6ffa0d4-3646-771f-5eb7-6bbb9ad8726b@linaro.org>
Date: Thu, 1 Dec 2022 12:34:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 24/26] tcg: Introduce tcg_temp_ebb_new_*
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-25-richard.henderson@linaro.org>
 <20221130180703.dprt7lzmppgfihtp@heavy>
 <5f8d64c4-3ad0-2340-6fe0-86707b41980b@linaro.org> <87mt87aqc5.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87mt87aqc5.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 12/1/22 11:13, Alex Bennée wrote:
>> I'm not sure I want to take this anymore.  It's confusing to use.  I
>> really think what I should do instead is improve the TCG register
>> allocator.
> 
> Whats the ultimate aim for the rewrite? Hold values in target registers
> over the extended block? What about avoid spills between potential fault
> points?

Primary goal is to handle register allocation across basic blocks without front end 
translators needing to consider "local" vs "temporary".  Which would also allow any use of 
branches in the middle-end, where we currently have to worry about accidentally killing 
temporaries held by the front end.  That's where this patch fails, in that it makes the 
current situation even more complicated.

Secondary goal would be proper register allocation across basic blocks.

Tertiary goal would be single-assignment form, to allow better optimizations.

I'll have to do some research before committing to do anything in this area.


r~

