Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B61336FC4F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:25:05 +0200 (CEST)
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcU4m-0004yq-K7
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcU3D-0003bl-4u
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:23:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcU39-0002M6-VO
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:23:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so1843214pja.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FmXAZs3IUZUMOYlbGkVhXna2YmnPZP0m6+bIotg8g0c=;
 b=XnNwW1w5oMgpheU8GZuHzJStbT4rpe9kFODFreQAKUuB6g7AlIXHyqtMKhXTa2Hx7s
 ppNZWqNU44EONGZupsdlkF6wUmiJPsNzfXtIRgGOZnMxiRVdMiZM4xxgW28eNs/stWrE
 XglhNa/sqq0ILLaksZ3wNzV4OFE7QsrGYviq5Xj6uxxtxNWb7q2ApfGzrXD984bGzN5Y
 IL2zUZNJL9a2oDjQ5CrqnpGjbH8zVgMK2F9OJXD9vFPt9G597/IYVGtq4g4vGpjsfDvo
 xf3T/TD7dqwWKiH36O6SU/hZ9s3Jv8uEyvETcdSrxEhF2iL0LTxN9/1H8fpgpOfNs0PM
 GBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FmXAZs3IUZUMOYlbGkVhXna2YmnPZP0m6+bIotg8g0c=;
 b=K+hevRx7w2CzAYTgnVAmUPFuBiJ/5VRypAcxdEmx7mPx3twNrmtHAs2eRWt7tCdvEY
 aCqszgL4XE6spdZRG0GLrvvnga4/EAYW338MQz0+oHau/LIEm8of6ma0XM3Y/Hw2Wzgm
 C7QVpRxBfcV7NRKBE5qsbK1iPBtG+Et2KkQbSA9ru5RkwoevqRYu22wvyC2fZwEipAEQ
 r7RDbBFZPWREcC+b81GkqZgDyv/MtVaaQTgNeOBSpmF3PRubFBlHBKzXbFQ0jaOE0HmS
 JcpEyU04pfRH4vbh6uunzUlxv2q7sx8vcaLuD32mmqnSc8MtTBIT4Unxapgh1rBqhtNb
 BhBA==
X-Gm-Message-State: AOAM530dqG0cZTN7nQc6eAaD/hC7KxFybksw/zUqjl3utYjfye5fTKqp
 BCRvDTOocysUuYXtCGcMSu1bUg==
X-Google-Smtp-Source: ABdhPJx/XPUJ+4JEixPczNEvnbj0j4qT6Q7KS4yZJmn4YuKPfCTNfrFpaIfuYzXF70h3v4bzP8evnQ==
X-Received: by 2002:a17:902:c106:b029:ee:a12b:c097 with SMTP id
 6-20020a170902c106b02900eea12bc097mr2472363pli.27.1619792601754; 
 Fri, 30 Apr 2021 07:23:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id b5sm3783413pgb.0.2021.04.30.07.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 07:23:21 -0700 (PDT)
Subject: Re: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
 <CP2PR80MB3668052FF0C559D6D092B0C7DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbe523e8-3482-1ead-082a-7829c1551be9@linaro.org>
Date: Fri, 30 Apr 2021 07:23:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668052FF0C559D6D092B0C7DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 4:23 AM, Luis Fernando Fujita Pires wrote:
> I think we should reconsider using the same .decode file for both 32- and
> 64-bit instructions, to avoid duplicating argument set definitions, and to
> keep the prefixed instructions close to their non-prefixed counterparts.
varinsnwidth assumes there is no easy way to determine, before decoding, the 
width of the instruction.  The way this is implemented in decodetree is vastly 
less optimal than what we can do with a few lines for ppc.

In addition, there's a rough spot in %field definitions.  You can't share those 
between patterns of different sizes, which can get confusing.  Have a look at 
target/rx, and the definitions of %b[23]_r_0, which is the same field for 2 and 
3-byte insns.

The replication of argument set definitions is unfortunate, but in the end will 
only be a handful of lines.  We could probably come up with a way to avoid that 
too, via a decodetree extension, if you really insist.  (My vague idea there 
would put the argument set definitions into a 3rd file, included on the 
decodetree command-line.)

> And, in order to share the trans_PADDI/ADDI implementation, maybe add something to decodetree.py to allow us to specify that an instruction shares the trans_XX() implementation from another one, such as:
> ADDI            001110 ..... ..... ................     @PLS_D_32 !impl=PADDI

This is done by using the same name up front.
If you like, add a comment to give the real instruction name.

PADDI   001110 ..... ..... ................     @PLS_D_32 # ADDI


> This way, we could (and would need to, in fact) keep the 'P' in the prefixed instruction names, but at the same time avoid having extra trans_XX functions just calling another one without any additional code.

I don't understand this at all.



r~

