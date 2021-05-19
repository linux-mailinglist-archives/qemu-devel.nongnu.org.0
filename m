Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C3438931C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:57:16 +0200 (CEST)
Received: from localhost ([::1]:39098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOZP-0003rw-Jo
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOYM-00030U-I6
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:56:10 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:34604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOYK-0008Ln-TU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:56:10 -0400
Received: by mail-ua1-x935.google.com with SMTP id x1so4076173uau.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 08:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nk1t6j0mxpmBtLfTkdqElpJJl7vyBE61p8JfNN5UOjg=;
 b=ZaaT/EbT8WPcTCBgT+0W6czoZBQRp07JwoO3LfcNqqhHEVLms0ZlIlBKLSdFfqbMbR
 YOY4gZR5aP3PRHVfGbJoGDWzrkar0SQq+r5r3KcQjuwNt4wut7qO+VmNTR+J6Ghd+lac
 1afxnj/QeqrQfInyoffPFvKf8fBtpLl5uZPJUVM36+QPhgyhZMFNF+NZccS57vcvNsCS
 yi+L+06WPC4mv7lAtTtb3i5EiARXVBCSPWI7r4DVmXpCmZiFu+TyA5iZXbbXdv6ViDuo
 vLruUxyrl7DH/HJygoxDInvRPksyLDpVAwJ+XSSwlsT8aAyaHCFMo7qtADAluX0umKIC
 uA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nk1t6j0mxpmBtLfTkdqElpJJl7vyBE61p8JfNN5UOjg=;
 b=L96CS+OIdZia4Kdk4KYrI+RdCCmHV6e/hL8wAoVTg5QwvnHvv6FOOOZWoR6Xk+i1vY
 2BBOSdh8f6UPwaFWVuXS2rygXIGKBUoLy5PW2xtJ9Wt8BmO5eWDpUnJ2ZGs9sqf7w2x9
 4TgWVKqE9b7+xrArsqygWfarxQ+ejlPZeO7uAwjupfuqwzRTNGSsAPZQ+9VIEd3rk+Ud
 +Xwv0Z8UgV39h8Wuzdb57ci+PvrQtF8BC1NC0TRCHw/4NrLVdS5eY5HqrJrLkWf2RMJO
 KlgbDfS3JGG3JwDSqYzt6b4zmMKghU/p3MuA2gzuTj1fUb0mPZCZQK9lhmW+hZqsD1UR
 QAjg==
X-Gm-Message-State: AOAM530v84Xm6/u0pYsYI43exz/wQIOJSWz+jPNBdtgjMSBbhE07R1IZ
 h8ofCr1IkI/zlOBqCKdn5yVy+Q==
X-Google-Smtp-Source: ABdhPJy0W4GfA28bm0EAW2O1HHTpaFzHcjLYzCcccRnhe8WBR9i9/HhYeVkTS5vTVp7Awaj0jW6wiw==
X-Received: by 2002:ab0:64da:: with SMTP id j26mr79024uaq.44.1621439767687;
 Wed, 19 May 2021 08:56:07 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id w144sm2388vke.47.2021.05.19.08.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 08:56:07 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] target/ppc: reduce usage of fpscr_set_rounding_mode
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
 <20210518150515.57983-4-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <34e387ee-d428-22f2-2ef6-65b6a7a8744e@linaro.org>
Date: Wed, 19 May 2021 10:56:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518150515.57983-4-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x935.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 10:05 AM, Bruno Larsen (billionai) wrote:
> +    int old_rounding_mode = get_float_rounding_mode(&env->fp_status);

FloatRoundMode is a better type for the variable.

> @@ -3136,8 +3136,10 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
>  {                                                                      \
>      ppc_vsr_t t = *xt;                                                 \
>      int i;                                                             \
> +    int curr_rounding_mode;                                            \

Likewise.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

