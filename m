Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17F162672D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:39:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjDz-0001JE-Vf; Sat, 12 Nov 2022 00:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjDx-0001J5-Fm
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:38:37 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjDw-0003SZ-1X
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:38:37 -0500
Received: by mail-pg1-x52f.google.com with SMTP id q71so5946511pgq.8
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+dr702PKmhyhw5i0yz4q6fB3tQl0dl7W20flwe2t/cA=;
 b=Tb/U0Z2r8brrh5Z6doY/ilJ3zuj8sX92unavuSof3CYrghq6C8q5ODtPiwjh1VkJFB
 jN+BLbM/Sdfd0eN7LaOSyvsZIttyIR+a1s+zLQUb/I7oyXTZtDSR0u5FzLeIF2Rr3Nae
 2SVwqQB3AEYNhTaVbn14xxpN+GBPLcDrBf8mCmZRiyt4RIK48R52UwQJwpSx+i9KXSzI
 2tbRF204cpnxKGZvlnMQdomUWQ/WMFgDrUG6Xfh/KBsROyeaRCw0ztBN0Gzd/Mg78e0J
 uW27X+OfRaNPEXrz0sVBlfl6Ip4Tb6euE7g6BQfkAKJmjrwHYNmHUh2Fl4RgrZJM6PvF
 hwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+dr702PKmhyhw5i0yz4q6fB3tQl0dl7W20flwe2t/cA=;
 b=OI4OtlIBrtdvomx5d8OiVL6Ehn0px//fU2JmO2re5N12qUj1vu2NsWuEmaClstMp24
 Xu2gi05m3uLB+ZlQ6ugKuhzpqb0UP772J0ykyL4w0vnQT1s4wjAiSkP5FjcxG0hWUlqe
 PMWdNMIGF4yJR5lSfa5XvmDomk8HTnuNifBcRo+8fLGjkMbxg6+adhgoKxf7NeP4NZB2
 Xn3xHh1dlhcJIWwnhZ1EJ1e6M5Vi6oEzmd14QkbQp6dywwB5E80TK+jeMIjzmDsrhZhI
 DAMzuLd8Qs+P6bpmQGzMvxyJET/eCQkdqIbQ7naw+G3yM0oUYhy7+wtyTSFvf/3JgIDZ
 s1Ow==
X-Gm-Message-State: ANoB5pkBO4ZIXaRqiCPr5VJUeVWTyFzCOPiSHIuCM2MglrSAVA2qpPRR
 3T135EzZz8YkQ4NZB3LdgMdDfg==
X-Google-Smtp-Source: AA0mqf5jd2SCZibuxqTJdfhk01I1a9XTMOtCWbd3SSnrlZn1OvfwADZaM78Ud+tPC4qw/ifUNMulOQ==
X-Received: by 2002:a63:1d0a:0:b0:46f:8976:c7d2 with SMTP id
 d10-20020a631d0a000000b0046f8976c7d2mr4439950pgd.7.1668231514502; 
 Fri, 11 Nov 2022 21:38:34 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a170902e84f00b001885dbe31dfsm2688394plg.178.2022.11.11.21.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:38:33 -0800 (PST)
Message-ID: <bdd4b5c2-5bb6-9fa4-ecd5-aac6fee3293b@linaro.org>
Date: Sat, 12 Nov 2022 15:38:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 11/20] target/sparc: initialise MemTxAttrs for CPU
 access
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

On 11/12/22 04:25, Alex Bennée wrote:
> Both of the TLB fill functions and the cpu_sparc_get_phys_page deal
> with CPU based access. Use the new MEMTXATTRS_CPU constructor to
> ensure the correct CPU id is filled in should it ever be needed by any
> devices later.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/sparc/mmu_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

