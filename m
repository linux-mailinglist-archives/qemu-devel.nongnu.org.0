Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E032E6B9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 11:51:37 +0100 (CET)
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI83U-0005LW-CU
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 05:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI82E-0004li-Ss; Fri, 05 Mar 2021 05:50:18 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI82D-0006Xt-CW; Fri, 05 Mar 2021 05:50:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id w11so1546804wrr.10;
 Fri, 05 Mar 2021 02:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QGN3f7CgrKmAlQGB2+AH+M0JDQFf+ijm4nS39MJntoA=;
 b=uD453+7hr0PrXoQ9uh7+odAFMrf2THZ80kujoTu6FGS6pSBx6m1QY2K1rzXBbDG8oM
 jf+NMGW7useUjav0bZUh1Hx3z2MNtS6rTkn8h0RYtSvn/EdFnoQVtN8OxUmGuxX1rwSc
 8mJnQujLCFN1Vzmb6M98Vnniz7iP5eZkrnZxPjIfVXv2vF+tgWluO99S9z2LCGj+nwTj
 7+bKKJVmiakV9nTxrVQBbFbsi90vlPvtxBSU2lnae+JfmJ61R56nVgV9lAwBE/7Md6jm
 sofD3C4OBgbDMo46sY+pGIpmNf9fYszxlQXSf/AJYIGLMtboB8rpyILrFWRNCsvZdnwF
 SZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QGN3f7CgrKmAlQGB2+AH+M0JDQFf+ijm4nS39MJntoA=;
 b=LEuf5KLwEOvX9FV3lmleKNa3dfTMdA1EQnSSZn3DFvjcTHpXZCeb3Wm38oEmoLD9M3
 JdrhIhnb9ZRrfx3Q9HRUPQLWCO36GMbgH3uB/d3dUHZ1oufccYxmG213diu4xfkm2PGp
 CVgu3/U21+4ufEHfBOSS9ELgw1DyOun78p/iozcRDQmYmP0lj6iYPd5rBUPyB3WcnY1m
 LdWTLb7pTnJs0FqhoE4EHdNKKHhcVJq91tRvlYvGHcZkGqUn+AWXRhzDbgPmVFlM9gFI
 sv0YNM8e4IO3e0LSa4XlbrIzjXYbwnY/L6fZuwXtrhwY3Wx+IdcSh4ZzP53tm6XqNsL8
 b1dg==
X-Gm-Message-State: AOAM530YodCL9U5ZXbC9i/LNU2TD0zc/VBZbmwM6vqfFPFBtjp2ULZr0
 Gxoda93kLyCtokpphSdO3enXGBh0loY=
X-Google-Smtp-Source: ABdhPJwGrmtgx6jlcK6d7c2arJiHjyW4nhhf9dM06qg53g61Iw/rx2+9cSlrpQ6MiBgUnURnXVlfQw==
X-Received: by 2002:adf:ed44:: with SMTP id u4mr8598597wro.35.1614941415476;
 Fri, 05 Mar 2021 02:50:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r7sm4069088wre.25.2021.03.05.02.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 02:50:14 -0800 (PST)
Subject: Re: [PATCH 31/44] hw/arm/armsse: Indirect irq_is_common[] through
 ARMSSEInfo
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-32-peter.maydell@linaro.org>
 <4185da92-5909-5040-b015-5608aa57729b@amsat.org>
Message-ID: <3f23c566-9c06-003f-baa2-14d10ce09784@amsat.org>
Date: Fri, 5 Mar 2021 11:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4185da92-5909-5040-b015-5608aa57729b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 9:19 PM, Philippe Mathieu-Daudé wrote:
> On 2/19/21 3:46 PM, Peter Maydell wrote:
>> The SSE-300 has a slightly different set of shared-per-CPU interrupts,
>> allow the irq_is_common[] array to be different per SSE variant.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/armsse.c | 39 +++++++++++++++++++++------------------
>>  1 file changed, 21 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
>> index f43f0524e28..b316fe69571 100644
>> --- a/hw/arm/armsse.c
>> +++ b/hw/arm/armsse.c
>> @@ -68,6 +68,7 @@ struct ARMSSEInfo {
>>      bool has_cpuid;
>>      Property *props;
>>      const ARMSSEDeviceInfo *devinfo;
>> +    const bool *irq_is_common;
> 
> Maybe *const?

Forget what I said, I thought it was an array of pointers
to bool arrays, but it is only an pointer to an array of
booleans.

> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

