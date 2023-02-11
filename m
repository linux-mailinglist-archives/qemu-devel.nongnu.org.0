Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74788693428
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 23:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQyBN-0007YD-1J; Sat, 11 Feb 2023 17:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQyBK-0007Y1-KR
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 17:17:18 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQyBI-0001rX-T7
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 17:17:18 -0500
Received: by mail-pf1-x42a.google.com with SMTP id g9so5737759pfo.5
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 14:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GPduDWZ0Nn/9ooQpjf+9DyQxNAXlZrljpOQys9Zk/pc=;
 b=DOJMwSXbET6BZhcURF+uRXd85g8eynsTDOXc/ZrbNY+7eVAQJ6kn7um/gIk2oefqpJ
 XLayCjmYknp6jazNC+s/ljZ0dWKD6sFkFPawrdWU2XF15DxGq6kl6Voa8nAwAVDqsb7D
 a3JtoPqDuWVUqWyBjzX9Oz/wPQ8L9hS3xlG6I09q+oo3XMp2iHB+WSlghaXjzOlZkm7v
 RFdu7CXPz+Iit15Ncmf5yY9zCIRhDcumO/uDzv2SLVeHRExgyXlsVG/N7yO4iEQ4iZ/t
 QpuEhJeG4s9DgtiKPsmEOkOKgVtbzdj5we59B7PsymTojB60JmtuUyT/Cyg3fUwh0kdT
 X5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GPduDWZ0Nn/9ooQpjf+9DyQxNAXlZrljpOQys9Zk/pc=;
 b=yEbkD2nUX/TvASMep9B5FIxbElE7AUwkCvR4Jc4Wp32zGrPAz+qG09vzh8soEbbYQp
 DnMSoxRE/2015sySWlJLFIBf+jj1ZulO+stGKa00o0CODgfF3ccRLju6T7znNyFTlNSo
 IZCpjKiy6crJdqgQMPxt443k2slEbC16/Zqi30BgwYbiLfi9zkmu+Wfz+fYczET+DLJq
 k6qXWIw7AkDK8mV604Sm5GOQAnAoNeMaOWcEKQZFtOwKLPaiEXClmHaWPGsGO5PniVn6
 OFG69CSnyUmDXfatOpBNhJFWWJ9HZsKbCXdG4c/z8vsUUjsQ2EndnsLU/S0o0Lw06vXa
 XuFQ==
X-Gm-Message-State: AO0yUKX6+MFDzAvAZ1v4xSpzzDRxNA1lHNZ+ExT94T/wMZmrsKLo3/p8
 vz3uZfYny2MKkr/w5RfDNOA2GA==
X-Google-Smtp-Source: AK7set8D/lumYy1HF0Ty2bIOMZpRuFq/XWEJY3jIs/adMMJQGzGJkP/XsJ99kUgNaKvlT5dsS6nXgA==
X-Received: by 2002:aa7:983d:0:b0:593:cdc7:5dd3 with SMTP id
 q29-20020aa7983d000000b00593cdc75dd3mr17282135pfl.4.1676153835207; 
 Sat, 11 Feb 2023 14:17:15 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 f15-20020aa782cf000000b005a84de344a6sm5497330pfn.14.2023.02.11.14.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 14:17:14 -0800 (PST)
Message-ID: <f7a5c2d4-f8d2-9dc6-d34f-a12154dbc87e@linaro.org>
Date: Sat, 11 Feb 2023 12:17:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/9] bsd-user: Two helper routines oidfmt and sysctl_oldcvt
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Sean Bruno <sbruno@FreeBSD.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210231829.39476-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 13:18, Warner Losh wrote:
> +static int sysctl_oldcvt(void *holdp, size_t *holdlen, uint32_t kind)
> +{
> +    switch (kind & CTLTYPE) {
> +    case CTLTYPE_INT:
> +    case CTLTYPE_UINT:
> +        *(uint32_t *)holdp = tswap32(*(uint32_t *)holdp);
> +        break;
> +
> +#ifdef TARGET_ABI32
> +    case CTLTYPE_LONG:
> +    case CTLTYPE_ULONG:
> +        /*
> +         * If the sysctl has a type of long/ulong but seems to be bigger than
> +         * these data types, its probably an array.  Double check that its
> +         * evenly divisible by the size of long and convert holdp to a series of
> +         * 32bit elements instead, adjusting holdlen to the new size.
> +         */
> +        if ((*holdlen > sizeof(abi_ulong)) &&
> +            ((*holdlen % sizeof(abi_ulong)) == 0)) {
> +            int array_size = *holdlen / sizeof(long);
> +            int i;
> +            if (holdp) {
> +                for (i = 0; i < array_size; i++) {
> +                    ((uint32_t *)holdp)[i] = tswap32(((long *)holdp)[i]);
> +                }
> +                *holdlen = array_size * sizeof(abi_ulong);
> +            } else {
> +                *holdlen = sizeof(abi_ulong);
> +            }
> +        } else {
> +            *(uint32_t *)holdp = tswap32(*(long *)holdp);
> +            *holdlen = sizeof(uint32_t);

This is totally confusing.  Why would it ever be an array?
Why is this section the only place we ever assign back into holdlen?

Can you point to anything similar in the freebsd source?  The whole thing is pretty hard 
to track, starting from sys/kern/kern_sysctl.c.


r~

