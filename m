Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F2456CC5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:50:55 +0100 (CET)
Received: from localhost ([::1]:50870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0Xm-0005g8-Kx
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo0VP-0004dR-Lx
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:48:27 -0500
Received: from [2a00:1450:4864:20::335] (port=56203
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo0VN-0003mF-Lc
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:48:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id p18so7890821wmq.5
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BGFKDIVIvHK3mHkN2uTLsgXluyGuFh02ktVwfW0IAU4=;
 b=MfQmUjZvMYwL2spFSUgL1xWbTgx4rzW1JbRspNKdaQQ9evKCycWsK+5G63JamLBlj9
 JBxMRo5XHoizH/jpspjcLDsRAQKU6/zqZrLLmdhVDyz6i+n1SCVhuvPFRYk75dhsHAjC
 tnxIsGQ57BlnNNfobnFEuyzNEhIAyae2u4SWyxgqdCf0vvhVHtmzAKV3ODvoa4h68vwO
 gSIG174eWo90oH2ovH3PlkHtTjTSVlNJ2/Z8h9AVHBt9ZlbqbSdJ77n1W2YFAzvCiqLe
 tPNoq3URKVJHj75tpX979I8mZq+B4oOoxikxXy3JMeOS5GDzw8ewWzf9zoQKQd70vuMW
 SmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BGFKDIVIvHK3mHkN2uTLsgXluyGuFh02ktVwfW0IAU4=;
 b=XbrOm/Qy5rHQCCC3VdyyX2CNiToofeiJwSt7NyakCxtMeLrFBkCL1SDFeIq66PEa/6
 hFYtO1C2iU3k60IRj114S3qKlRogw+IXL1w95JKRUp5OivnfARsXqDEbXNI+ariZL/tB
 /azd7dOuvjse9ZGJyTs1sOVLUldz3c4s34MUWTwer/zzPxovW62NhLTRUcUKhyfQH8iF
 5EfmGKjMNBU/IA+wLQ00A/542coQKdRWtJsIWGgLqOwTc8BY9ql2jEhECpBNwZH083ng
 p2IENjg19hPEsHK3wWy4IAaUAL06Jv4azg5KewtrmT2aeW40myxb5zGr8vFYLAFclrT2
 tiLg==
X-Gm-Message-State: AOAM531igRKuf/8TWLfbi9O/S5XcXL5X3XvwDWhuqxPoKSYRu3N5NJpD
 ygOkO4LjP0F7omN3dSPZdNys/g==
X-Google-Smtp-Source: ABdhPJykA7mRU38U4m4gR23hGf4dkzorR2deY+SmVOv8wGUKE1WZyWTHhXYGTpQBEUnsXez78ootoQ==
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr5240893wmq.111.1637315303998; 
 Fri, 19 Nov 2021 01:48:23 -0800 (PST)
Received: from [192.168.8.105] (165.red-37-158-79.dynamicip.rima-tde.net.
 [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id o25sm2697279wms.17.2021.11.19.01.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:48:23 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/ppc: Fixed call to deferred exception
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211118132502.984059-1-lucas.araujo@eldorado.org.br>
 <20211118132502.984059-2-lucas.araujo@eldorado.org.br>
 <5e723955-68fc-a77c-b131-ca9e29f23423@linaro.org>
 <2e1e6486-87e9-fade-e443-2e822377f927@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81ae0b1c-58ce-9046-0e86-84fd4e64ee58@linaro.org>
Date: Fri, 19 Nov 2021 10:48:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2e1e6486-87e9-fade-e443-2e822377f927@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.727,
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
Cc: matheus.ferst@eldorado.org.br, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, pc@us.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 10:24 AM, Cédric Le Goater wrote:
>>> +    } else if ((fpscr & FP_VXVC) && (fpscr_ve != 0)) {
>>> +        error = POWERPC_EXCP_FP_VXVC;
>>> +    }
>>
>> Is there a defined order for these in the manual?  I couldn't find it quickly if so.  If 
>> there is no defined order, I think you should test VE only once.
>>
>> Drop the use of fpscr_ve and use fpscr & FP_VE instead. (I think these hidden uses of 
>> *env are evil and should be banished, but that's a bit of a job.)
> 
> you mean all the msr_* macros ? I agree. It's huge and I wonder how we could automate 
> parts of it.

Well, those too.  But fpscr_ve is the one that caught my eye here.


r~

