Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323F64871EB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 05:59:43 +0100 (CET)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5hLq-0007yk-Af
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 23:59:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5hKZ-0007HV-Sq
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:58:23 -0500
Received: from [2607:f8b0:4864:20::634] (port=37585
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5hKY-0004On-DO
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:58:23 -0500
Received: by mail-pl1-x634.google.com with SMTP id q14so4045752plx.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 20:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FjC96+RTrBYu7tRgQY+hC1x8DNXqjnRJUtbljvajRfU=;
 b=hVMc3Tof984umopVU5qioSpsRYp2bwuj3IOTNQbePPacF0KRpbFaxvGYvTzOGRvWfC
 YeLCHUeUS2SlUPUCBTUQAWgrAeLIDkBnMc4kUP79QH2A6Ba+Jo/DSgKC25htGn1h/Oi5
 wJO8/665Ck9FtMk6ua2CTt7Yzu67uvhIPqH3pATlCEfMVsCVGTn/TfKXlmDxao0zn1Wy
 eRLhJM3Y/6zn8ysj2BOZrtGpmkmKq1K5l12gJC5YgfeWxIpseBEhVWzHbG7jUz4tjAII
 C2DG9Oeq3c02OnvMO1fBkg6KGMov6vNAGo33c8585gyROIGoPfSKkI8IVlyxpu7kaxjF
 jHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FjC96+RTrBYu7tRgQY+hC1x8DNXqjnRJUtbljvajRfU=;
 b=1tcM1BVwqxWp7hhmMaUra8onEh4Y8I7SctrZE8yl7I+5jKbhii405hDNkpchlyrPpv
 oxTezvRimo27Nxmx8wOWu0ZF6k4h6N/g8EbTHMXMkoBhZxIujYP14VIZS2Ho2WS6vYtD
 AZOTWyMc8bNDwDcpIZj0JewJDicVPfsGHJY0fzErox0ApwpOEVlJzbyJJpEi+E+hV9mD
 d0Q8+ZuJxIu7bwXgREVmaGRzTKhCWAFxXlSa8gzocbx+1hHEhLOHN3KojcsQ1KDDJDYc
 QLSo1W5EAaYrnPZ3aVGNuoDNpDUCNkFkxvmyaN1sA6R6FYWtxW6Ob7cSyQON+s6F7Hhq
 AZNQ==
X-Gm-Message-State: AOAM531CgucH0Q+E0GqKilmzTU4dcYr6AmEbAy8VHKdc5WUA/B/KGZdC
 CZdbhdb1Xsrp8U+eV0ndo2romWtEdRtnUA==
X-Google-Smtp-Source: ABdhPJx2us5y41J5W5AVY0c93Hy15FVtUtbmjPjkuD0X+mVmF6DNL8tFrazLn1ac0lR2Qvr2uo9FIA==
X-Received: by 2002:a17:90b:3810:: with SMTP id
 mq16mr13615219pjb.190.1641531500895; 
 Thu, 06 Jan 2022 20:58:20 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g5sm4356756pfj.143.2022.01.06.20.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 20:58:20 -0800 (PST)
Subject: Re: [PATCH v14 19/26] linux-user: Add LoongArch signal support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-20-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3892269b-1c27-cf6d-ee69-ce48f93b6b35@linaro.org>
Date: Thu, 6 Jan 2022 20:58:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106094200.1801206-20-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 1:41 AM, Song Gao wrote:
> +struct target_sigcontext {
> +    uint64_t sc_pc;
> +    uint64_t sc_regs[32];
> +    uint32_t sc_flags;
> +    uint32_t sc_fcsr;
> +    uint32_t sc_vcsr;
> +    uint64_t sc_fcc;
> +    uint64_t sc_scr[4];
> +    union fpureg sc_fpregs[32] __attribute__((aligned(32)));
> +    uint8_t sc_reserved[4096] __attribute__((aligned(16)));
> +};

Does not match the current (December 31) kernel source.

> +static inline void setup_sigcontext(CPULoongArchState *env,
> +                                    struct target_sigcontext *sc)

Don't bother with inline markers anywhere in this file.  Let the compiler decide.

> +restore_sigcontext(CPULoongArchState *env, struct target_sigcontext *sc)
> +{
> +    int i;
> +
> +    __get_user(env->pc, &sc->sc_pc);
> +    __get_user(env->fcsr0, &sc->sc_fcsr);

You need to call restore_fp_status after this assignment, somewhere before the end of the 
function.

Otherwise this looks ok.


r~

