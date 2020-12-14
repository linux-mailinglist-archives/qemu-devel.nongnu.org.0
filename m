Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84712DA31B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:16:26 +0100 (CET)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kow8n-0002BX-RD
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow79-0000r7-11
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:14:43 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow77-0004f3-LM
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:14:42 -0500
Received: by mail-wr1-x442.google.com with SMTP id 91so17942106wrj.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A33abQqsZSXeu3kMyQ3y9+ZG3ZynRZmZhz6QM1pBbU4=;
 b=aBW4jb1R2hlT1f47uYM8g6ztIVo9nfwDPDZH5WpK6FrQpZnmcR4fE7lJJ7p8muF4hC
 K2rGpR+AjWtlWdPDHND6FNjpC3CrJyoD4FwKiuFGg70lp5NcH4SPcKm6Pmj4XN3ntKpQ
 vqpMTJJBKq2zqRShZUGoxIJSGfDvHXEmTc9tR8ofeasu8dypUPKHEECtBWoZvklm5ZQN
 Vusw8KrFwozCV//SuPfEViqjBklfTtYAPb0YQmoCAeLVgRQLmdHw9Xe2xYgyw0XoW71S
 20UVhwIVdT/B5fCOlVtJHpFoM0W/aV+rRUciEc9BbMJghbSJwWNUrIu9jkOtb1G3jIIA
 +VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A33abQqsZSXeu3kMyQ3y9+ZG3ZynRZmZhz6QM1pBbU4=;
 b=H79I69bEozZGOHXzpoKR7VNQfa7Qsiwb0tEplJgxb0htcu9XTjyQeij4oP8+jczJcZ
 0fEPJolv0t+I2b68fnjRXcQ6p0BKc6bFdNkOElfq7BKRvaOE5GfccVniJBo01sHacs8L
 NH4FAsH/11tKpEfYpr4OMF5j1hElxO5TkFzjMRDh6u2WKLSVOPds5HF26GaYnRUWlQX0
 BVOkDFJfYNTpBj8+uUlBdeiPH2eVPTqmgJavWdENepEybpNcbp9njTn4wokAre1Wn0gt
 38H9Ac52MdtOeRAGI9pyk9PN5MC7chaces4Zt+FOtcYC+dHJq2R8XtIIY0twUNhjnBlh
 Qykg==
X-Gm-Message-State: AOAM533tJXI/UfWCs99wdl6rgn6Bnzl4Ut0g54vIHyUcCtFD2URYUfk7
 ATKfJ2o5eCDjyr/LSPgJMAJmgKg5JQo=
X-Google-Smtp-Source: ABdhPJwB+6YyiPwCVOHJlrZQDIdshDMEUq2xR+GgscoOh4bXEZYfA1a8l8WdukrD2VtZVtPsP1wQ9w==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr30885795wrm.90.1607984080029; 
 Mon, 14 Dec 2020 14:14:40 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j9sm29114107wrm.14.2020.12.14.14.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:14:39 -0800 (PST)
Subject: Re: [PATCH v4 14/43] tcg: Make DisasContextBase.tb const
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5278ce65-7dd4-64c1-9e15-969374637c2f@amsat.org>
Date: Mon, 14 Dec 2020 23:14:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214140314.18544-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 3:02 PM, Richard Henderson wrote:
> There is nothing within the translators that ought to be
> changing the TranslationBlock data, so make it const.
> 
> This does not actually use the read-only copy of the
> data structure that exists within the rx region.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/gen-icount.h  | 4 ++--
>  include/exec/translator.h  | 2 +-
>  include/tcg/tcg-op.h       | 2 +-
>  accel/tcg/translator.c     | 4 ++--
>  target/arm/translate-a64.c | 2 +-
>  tcg/tcg-op.c               | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

