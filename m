Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D655748585D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:32:07 +0100 (CET)
Received: from localhost ([::1]:36556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5B4w-00049p-GS
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:32:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5B1v-0001Wi-26
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:28:59 -0500
Received: from [2607:f8b0:4864:20::62c] (port=35397
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5B1t-0000GE-GO
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:28:58 -0500
Received: by mail-pl1-x62c.google.com with SMTP id n16so260980plc.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 10:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=25I0Gl7pwemVufaHXQWiZ7c+B9mOipshGDUykk3V7Hk=;
 b=pATBtmJSKM3u4zgXlk3pIYDgyJrgLXLsVVNu7f5w6h641lUq6w1p3DN7aTUooeB5aT
 eaMVMmwJd2VYjUQQsGLi2JPGNku+ZaNEOVmAL38E+4oDGvpxTBO9oCgxR2+PLFbkBVt3
 7EBt6hdyePEeczryuhjILS6SebNmwSvJpw4OfE0PdZ/3n5OfxWjh63RIH+XY/lQoqYsD
 /0bNZrVNH22axUiscnqMTeF6Kfiw91nn9gOW83HVdRcqraiMh0Vtv4nmmMlFzYFB3sq7
 Nog1/BnX4DTcSVBq1938cwIM2CNIhmO+4gTm28Eouepghol/2OMmmsEBKqgeUnVycqKl
 NUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=25I0Gl7pwemVufaHXQWiZ7c+B9mOipshGDUykk3V7Hk=;
 b=K38Dzrda8iPzE9tnEGcA2IrD9YsmMWG8iLzi9l4aj8nz+VYVnqfKUvFDPBKHcM0BD9
 hiqSJuRG9w/Vd2b+Jr45URMMsudV2JzH6bo7X9Z0iYzczKB7KVyDwbsHArU1Jf3inkfp
 8NC8R3BNiI6CmcNz4T6JXzOmStDsj6kSNeGGj0E6FdAzotOU3Kw0KRMaUWLUUWn/DDgf
 VoOYhZ37mUFv5CvIstNu3MDSM/uVpM/Q6/phiLaxPcE2hlWRAGHgtZb3F4x2Av/wH8jV
 GrO0O08jfWZ0O4mg8pedOddgwIRG+oBgfavykUIlg3u1M8Hsb1fUKTlej+irgqEhbqQx
 LxsA==
X-Gm-Message-State: AOAM530bb2q+4YjQ0igaRDoFSj9JwjQZTikmoCVQdHCtypjLH7X6r7Q/
 Po2x7Wa0Bp/ABENhNvjCHs+ung==
X-Google-Smtp-Source: ABdhPJxwEOHSt6yGmuyCm71nl6ugNum7cDZ/JPw2qebsBIYdpfbifVcaq1hFCdrp0vuHcxXfTzfkiQ==
X-Received: by 2002:a17:902:c952:b0:148:e3c6:89ea with SMTP id
 i18-20020a170902c95200b00148e3c689eamr54321133pla.56.1641407328963; 
 Wed, 05 Jan 2022 10:28:48 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b65sm44546518pfg.209.2022.01.05.10.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 10:28:48 -0800 (PST)
Subject: Re: [PATCH v2 1/2] linux-user/ppc: deliver SIGTRAP on
 POWERPC_EXCP_TRAP
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220104210015.457468-1-matheus.ferst@eldorado.org.br>
 <20220104210015.457468-2-matheus.ferst@eldorado.org.br>
 <a31423b5-2d76-12a9-5bea-fcc4e608342a@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3d54247-a56c-0657-d94d-5c9b127638e5@linaro.org>
Date: Wed, 5 Jan 2022 10:28:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a31423b5-2d76-12a9-5bea-fcc4e608342a@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, laurent@vivier.eu, david@gibson.dropbear.id.au,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 10:46 PM, Cédric Le Goater wrote:
> On 1/4/22 22:00, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
>> The si_code comes from do_program_check in the kernel source file
>> arch/powerpc/kernel/traps.c
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   linux-user/ppc/cpu_loop.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
>> index 46e6ffd6d3..6c99feb19b 100644
>> --- a/linux-user/ppc/cpu_loop.c
>> +++ b/linux-user/ppc/cpu_loop.c
>> @@ -188,7 +188,8 @@ void cpu_loop(CPUPPCState *env)
>>                   }
>>                   break;
>>               case POWERPC_EXCP_TRAP:
>> -                cpu_abort(cs, "Tried to call a TRAP\n");
>> +                si_signo = TARGET_SIGTRAP;
>> +                si_code = TARGET_TRAP_BRKPT;
> 
> These lack 'info.'

You missed the Based-on in the cover-letter.


r~

