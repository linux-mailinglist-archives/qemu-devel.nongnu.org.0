Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2046A8AD8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 21:49:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXpqK-0004sg-SB; Thu, 02 Mar 2023 15:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXpqI-0004qj-Tl
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 15:47:58 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXpqH-0003Yo-BS
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 15:47:58 -0500
Received: by mail-pj1-x1029.google.com with SMTP id y2so398557pjg.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 12:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677790075;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lveCctSfE1YZYVAB6XxHoWUv+tJNAkDjVEBkaW1Ki2U=;
 b=c33XqIiiI6y5b8w2cWVx8bY6mAqaQvt/p7YfrSIo3i/frwkD1ITOLj+fY4ppzpHEmr
 kwR1zOO5JLrbusWt97R1RoxnIyek5tSpRkxWJgo3tUTIe8YsrbIuB6n2EVD2zvyxJ/UC
 EP55CkQGBew+8r/xHwSSZ0Csa7q6NeHOtscFJOppGQe0jcoHexN+Cg/TY9Qli6OT1xw/
 jY6OE9jfH5HYgqtwKvrCuDy568fje/yIpSoCjIADn+YquRdpmR8niGgr2u6I65Yni0ih
 2kveSDd2qCwEjoMRcnLD9HVHK2PmVQoaVT31HPcG+T+7iWIubEjr1sAC4iDIvRfagZZ3
 UjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677790075;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lveCctSfE1YZYVAB6XxHoWUv+tJNAkDjVEBkaW1Ki2U=;
 b=Vm00pVUwiQAhF2uPINAOus2puw5yriR3JBwyXrz4AxPMLgi8Ld3zr3t3OYCrkZosEN
 mIy77jhg08kLRtArwnVtfS61MswOAC4HTVXIHKBD+fFkBn0j3mhK4U4qMF5a+WcpXGkz
 3OfG98J7YOeCjkeZuC3eC2uI5CgliCViVsGgNu7KrH44nMeP4ovbMKutAXK3PT7lR8+G
 JNmhJaG9GlzKYDpkpOPEiR4iyrYbOlXZwQFpPOTTaqQoJnhu26TGbruIXXEZITENkf0W
 H0RBXRnSLNmYHuFC7HmNaepAvA9yKY2e34GfA0mwGLpumR0PHlwuN2F+zHm5YJVtSCti
 OtsQ==
X-Gm-Message-State: AO0yUKUPoAGVQNdkyroaeMnJTBJBuARNbxRiSJ42rr+znrhPmEXrXV9G
 D0M2oG6J8jkov2KZPtMQUNkCYQ==
X-Google-Smtp-Source: AK7set9O1HvWaCstxwczqTiUUr3X9hDZFMkKvNEiSzldQJGUlv/fURYOoG6r+0au/GebPwD25vy55A==
X-Received: by 2002:a17:902:ab1b:b0:19c:c9d0:5bf8 with SMTP id
 ik27-20020a170902ab1b00b0019cc9d05bf8mr7844072plb.35.1677790075552; 
 Thu, 02 Mar 2023 12:47:55 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a170902d54b00b0019c92f56983sm110935plf.120.2023.03.02.12.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 12:47:55 -0800 (PST)
Message-ID: <234c4694-946f-78e3-07fc-dad06d6932e9@linaro.org>
Date: Thu, 2 Mar 2023 12:47:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 23/26] testing: probe gdb for supported architectures
 ahead of time
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
 <20230302190846.2593720-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230302190846.2593720-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/2/23 09:08, Alex Bennée wrote:
> +# mappings from gdb arch to QEMU target
> +mappings = {
> +    "alpha" : "alpha",
> +    "aarch64" : ["aarch64", "aarch64_be"],
> +    "armv7": "arm",
> +    "armv8-a" : ["aarch64", "aarch64_be"],
> +    "avr" : "avr",
> +    "cris" : "cris",
> +    # hexagon?

No hexagon in upstream gdb.

> +    "hppa1.0" : "hppa",
> +    "i386" : "i386",
> +    "i386:x86-64" : "x86_64",
> +    # loongarch?

Loongarch64 in my recent gdb build.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

