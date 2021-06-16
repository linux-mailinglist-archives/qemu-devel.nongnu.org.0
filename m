Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0F3AA189
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:39:44 +0200 (CEST)
Received: from localhost ([::1]:37840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYZr-0000dg-Qb
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYYA-00070K-I8
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:37:58 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYY8-0003ZF-Ff
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:37:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c18-20020a05600c0ad2b02901cee262e45fso2054310wmr.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TdB0c7UX8gjC3ajIMl5/SCOjjM+jlyQt0azNl89uspQ=;
 b=ZkKr/seaKdvTjzW4wdmxQddQwL4GmYYIkcVkhVRCpSss5Snp2gz/TtnqBZazcfk+wm
 tsR0uHZdJsn8xo96Pm9O54euX6aVCZqYEJQCzthSkLn++pafG++2ay9XZJargMeBGqeT
 4y26g74DWvvITZFF2EzjjH4afdIyyKbKg7DutB82c2hLwpIfhY826x96MNxKJ/Gca0m/
 in+X7LYdtcAovwjLkiuYy602plmIYZDQ6qRFWT2zWGxDkOyigiEhg+1eqW82P4fclTHD
 VekYbEZiwMrJNUMraka08EZuwkWFx5ldZoE/WSRlvRaVfY2HAe43e788sx1KturOW5+5
 8cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TdB0c7UX8gjC3ajIMl5/SCOjjM+jlyQt0azNl89uspQ=;
 b=FjWjgAd+a9JWylngkTdFp1ZdbgcYbtFIlbk0JtGaf8dvgiAJEDdavZ3EzSlywLQqXY
 iGKrsPC4UXoghdFcLsmYfRi3kHRpDPpRna2w8rWxGHC0kRgqNQbRroktqkRpwm5X8WgR
 zWOwQhoCgbxPWeExVlI0tWjCWOrXlb5NC35MngzIiyi2y3qEEqo40H9GGe96WVNhW2wR
 MpKUe7m7op7uGsDRE81MucvQevFxgwykcG0MSz3obHbR7sduHDCOrZXF4qanTS09fpJc
 vUbZArj1+O2I24TI2FDEaxOCYUmRQ/Q9nB3RUUfK4QEG+rYfSVr0oYNKLKfO2noD+cIL
 8c/w==
X-Gm-Message-State: AOAM532eEKek1U00PoiA7s1C/TmGykc1/f+XGURL0X1fq99DALzRrb8c
 0Q09Qyb1vXRaPwo5IThoGi8=
X-Google-Smtp-Source: ABdhPJwk2cfArfJn7a/8VxI5VrafU8Lj9IFOUnB/nP59Ee3E/DA+jja8oACLYSOV+kCWrtJhUw6IMQ==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr866445wmc.110.1623861474998; 
 Wed, 16 Jun 2021 09:37:54 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m6sm3241169wrw.9.2021.06.16.09.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:37:54 -0700 (PDT)
Subject: Re: [PATCH 06/21] linux-user/cris: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7d224227-6cbb-706b-a4b1-5f4832fc1dbb@amsat.org>
Date: Wed, 16 Jun 2021 18:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:11 AM, Richard Henderson wrote:
> Split out setup_sigreturn so that we can continue to
> initialize the words on the stack, as documented.
> However, use the off-stack trampoline.
> 
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/cris/target_signal.h |  2 ++
>  linux-user/cris/signal.c        | 29 +++++++++++++++++++++--------
>  2 files changed, 23 insertions(+), 8 deletions(-)

> +void setup_sigtramp(abi_ulong sigtramp_page)
> +{
> +    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 * 2, 0);

3 * 2?

> +    assert(tramp != NULL);
> +
> +    default_sigreturn = sigtramp_page;
> +    setup_sigreturn(tramp);
> +
> +    unlock_user(tramp, sigtramp_page, 4 * 2);

Ditto.

> +}
> 


