Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A34454CE8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 19:16:41 +0100 (CET)
Received: from localhost ([::1]:38260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPU8-0004G5-Ct
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 13:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnPS4-0001jp-MP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:14:32 -0500
Received: from [2a00:1450:4864:20::32c] (port=56226
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnPS3-0005f8-7L
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:14:32 -0500
Received: by mail-wm1-x32c.google.com with SMTP id p18so3032431wmq.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 10:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+sajnlcB9/lgGlCODRREcgwb/W4f+w4AKAOU57DgsS8=;
 b=RFJS/Z2CfyY8snrFgvFGQ13S4vXz2RNYZIN50MEZN69Q+yNINYPIaTbfWXOJ+ugYuQ
 Z87xfA8BtrYVEm8N5MYl5nXxRhG8ZKRGTQo5qw7OmvsJ+rDtqVVnlW0G2IyMTlgFqGsC
 KFH0BYw6eKG/qL4YzWpxKw/vQSP9Ob8N+tRHh84E98nSFJiM+B1KDq+gT64xi5Hf3jlm
 StOXpHSqlj+E3TgiXfshYPm+pqau8fla/qhuk2aXwC/bTgdH5yKJiIhkxHoK7OfNdMjj
 MtuNSkrCB37qK3pzrxI8WbyFawwIpPXSp2u++OUDA6IwlgT5x5O20yABNScgXUClCyCw
 A03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+sajnlcB9/lgGlCODRREcgwb/W4f+w4AKAOU57DgsS8=;
 b=NGN/1g0CmDN3IgSbCrJvp0sXQQnSr+nbM5q7oti7QtUpP3QnNeA0eqadhlUIIFdwSl
 dGyruS1ma2EYyXaCkDe9ZCMV1EVvmndo5ts0OQc1ClS7OR4FJjZISkXCn+Uw2WRAtErD
 czuTuJvY/T6XVxm87Fi1JRGUs6BVwmx+soTr9dNui0F2KWq9mMm+dsibScRm3gH6ea5D
 NBZa6Wpp9G+8AN6YArSL2IatAJoy5E1VJxpNogh7FR+KVe8P0KJ+qqG/OJBqePzPseic
 Jo8NVZLPxfkyuDgfQEVrlsyhEXlKYX2n6DkoImMk/CbDtO7+LkbYcWQZ/iRW/B2HwLRy
 p6Tg==
X-Gm-Message-State: AOAM533Y9f8Qj5uXQ1iCDSQUB6UvFmgL9ZsbHXQcIRHwF+2w4/5SOBFq
 l19xOcJjoSxHIBIc/0EilLX5mg==
X-Google-Smtp-Source: ABdhPJwF7tM0ObdFP1ubHL4iCp3fg6VybOWOE8RQEbkn8gxscoWXMmn5gkO/4piSfBIQJBlc5EuLtw==
X-Received: by 2002:a7b:c050:: with SMTP id u16mr2005310wmc.82.1637172869782; 
 Wed, 17 Nov 2021 10:14:29 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id c16sm530879wrx.96.2021.11.17.10.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 10:14:29 -0800 (PST)
Subject: Re: [PATCH for-6.2] tests/tcg/ppc64le: Fix compile flags for
 byte_reverse
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211117173353.7623-1-richard.henderson@linaro.org>
 <e2bcae52-1802-5d75-9a3e-6fca8a69268f@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <702bc6a4-af91-44fa-7713-a16869402892@linaro.org>
Date: Wed, 17 Nov 2021 19:14:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e2bcae52-1802-5d75-9a3e-6fca8a69268f@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 7:12 PM, Cédric Le Goater wrote:
> On 11/17/21 18:33, Richard Henderson wrote:
>> With a host compiler new enough to recognize power10 insns,
>> CROSS_CC_HAS_POWER10 is true, but we do not supply the -cpu
>> option to the compiler, resulting in
>>
>> /tmp/ccAVdYJd.s: Assembler messages:
>> /tmp/ccAVdYJd.s:49: Error: unrecognized opcode: `brh'
>> /tmp/ccAVdYJd.s:78: Error: unrecognized opcode: `brw'
>> /tmp/ccAVdYJd.s:107: Error: unrecognized opcode: `brd'
>> make[2]: *** [byte_reverse] Error 1
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This looks fine. Queued for 6.2
> 
> I would need some education on how to run these tests and reproduce.

make check-tcg.


r~

