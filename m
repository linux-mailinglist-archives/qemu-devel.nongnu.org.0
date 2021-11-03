Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A97443BC7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:18:42 +0100 (CET)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi6nQ-0003WV-DM
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi6mO-0002UP-LH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:17:37 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:34488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi6mM-0002Zs-Hc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:17:36 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id i13so1381244qvm.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FIe2SafKrzVfGB0Mq/F/rIii1oVREFIOWNLCwQ03JEI=;
 b=QEIJrJWRaULIX76R3mWQ3G0joOVDT/plP8SkXxPH0xZzW+jjU93AyluyZhcsdIyNlt
 3VZOyGl8+zwlw2vJPIgjr2PghRfv6vHg+SZBRSuG88dc/qCoddHYt6iSah1RR5FNnshY
 1rmprzzydx4zx4sGAXcfy8iNnFWAm1daHxu+JD5CHpoVr21CBfYXZ+XLgmqVRleajFBj
 +Z3tJwc0pS+bnSLS/6I6/s47Na6RI6rTfGrXl1aIhZMdrBNxZeGPKkugw1pAO6Q2foAP
 o/xJKSUfY3fwMzZ1wMF72Oru2SWDzaTt47ZL5G3zZlxzzO1FTodYReUxEo641Otk8JzP
 dQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FIe2SafKrzVfGB0Mq/F/rIii1oVREFIOWNLCwQ03JEI=;
 b=Wm0bSBRCdTP+r/hzf1EW4CWVbqcO9hTd6JOZTQOCKMbvyXRhluWn8nmepEEj99Z+Q7
 8JL2Co32uzzObanCTWra6CNf/xAGjdTap6eaWSf+pAiA7XRGcKoaTLdFQdbzCyq+TF63
 ENYVB1UMUPLNuL7rDzUk9W6Pz5AzNK9KXi8hx+om9W911hTYFnkoJwO/3PmrmD8gvCFc
 xQyhcunbb1E97WMM+6fQ2I2hpLVGWb5UNpR8I+wADtUouo9vX4z6daJOBRNdHgugGAnR
 EIwBNR6D9tSxqi++UUBm1yyUJ2LESDJfHkr5mw8M+7XJ34+0d0l8sgyEBd4FyY175AF4
 eK+A==
X-Gm-Message-State: AOAM530Keg/WDGRvJG+peIlWUBSUoAygQEHd7TKJEvjGbb3rs/EkRDSk
 MTMfKHo0bptSIwPGGPSSG898vg==
X-Google-Smtp-Source: ABdhPJxZnYElrACHxFwLeXq1Ge/WNhr4/mYacBJPGL5EdKOU8CVbI27frIy7HaqlQVm0ayo4CAreCA==
X-Received: by 2002:a05:622a:1392:: with SMTP id
 o18mr43410450qtk.107.1635909451947; 
 Tue, 02 Nov 2021 20:17:31 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id a15sm694901qtb.85.2021.11.02.20.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:17:31 -0700 (PDT)
Subject: Re: [PATCH v2 08/30] bsd-user/arm/target_arch_cpu.h: Implement
 trivial EXCP exceptions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17dd2e5a-3778-ccb2-7ae5-a59c18f17601@linaro.org>
Date: Tue, 2 Nov 2021 23:17:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> +        case EXCP_UDEF:
> +            {
> +                /* See arm/arm/undefined.c undefinedinstruction(); */
> +                info.si_addr = env->regs[15];
> +
> +                /*
> +                 * Make sure the PC is correctly aligned. (It should
> +                 * be.)
> +                 */
> +                if ((info.si_addr & 3) != 0) {
> +                    info.si_signo = TARGET_SIGILL;
> +                    info.si_errno = 0;
> +                    info.si_code = TARGET_ILL_ILLADR;
> +                    queue_signal(env, info.si_signo, &info);

You won't need this; unaligned pc will raise a different exception.

> +                } else {
> +                    int rc = 0;
> +#ifdef NOT_YET
> +                    uint32_t opcode;
> +
> +                    /*
> +                     * Get the opcode.
> +                     *
> +                     * FIXME - what to do if get_user() fails?
> +                     */
> +                    get_user_u32(opcode, env->regs[15]);
> +
> +                    /* Check the opcode with CP handlers we may have. */
> +                    rc = EmulateAll(opcode, &ts->fpa, env);
> +#endif /* NOT_YET */

Drop this til you need it.  Even then, we prefer to emulate all insns in the front-end. 
We can talk about what changes need to happen such that the actual CP registers are simply 
available at EL0.  I suspect they've already been done for linux-user anyway...


r~

