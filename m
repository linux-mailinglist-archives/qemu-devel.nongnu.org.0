Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E401C3278A0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 08:54:36 +0100 (CET)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdNz-0003Mc-W2
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 02:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdLX-00024p-IA
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:52:03 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdLV-0003zk-W5
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:52:03 -0500
Received: by mail-wr1-x436.google.com with SMTP id h98so14991267wrh.11
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 23:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0aOMR2ZupCYGqfbWeU7MWcw/vE560INFXR4YJ6GpTck=;
 b=NMnqRcWQ4LgyN64tw9D9WOAavJ/nTiuHZQzJOgw7R3s5YU8EBv3gRgOAYEdQeSVrRV
 Vat9CsY8P6QWPWYsbjg8MnjwaZUNteCS22oc+eoiFII90NtEODS2pjnmts6RQoMPAebT
 GTShk2GzHjBgLPfNP+w3h9ekhdOD+J7SLhOgUqJ0VJHZdclZqMHgUbBPo3lzM5cnpPjm
 4dV/drKt/zVlCHANhkAxYtxQOgzEYOuEXz9hiCCYmmEenP+TqBW2gUO3/7j8452NNnrh
 ReWNDN7RNgjXgphrqSxv0t64Zsl+C7lgypPAGCohisa0vp+o0aUQtt/lwpcytJPFrCIr
 SxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0aOMR2ZupCYGqfbWeU7MWcw/vE560INFXR4YJ6GpTck=;
 b=XTIDuQxkrSNrP5OBM8ii71vU8GBQoHL3FYNbrXQnHv1Ou/V9tK49URtV5D+isKrtSU
 kcDnjxeTm4FMbO+dNs58OOW2pjaOCZA697NFl/YyIS5pWUGJvEektwAcu6j7HHKygDjx
 IRAvAAG0NXcY8QavDdSXhNb8OZNsu//rgXvooyLdAn3ZGmlkA0PofuwNXdaBI3os9cm2
 xyGjvIM84IwjfHSKPVTBcHY7eCE1+JCCQSpzAkRTNGMHTZGk2bRqGhczMiUYkmjLPZnw
 Jm+MdI0PyAxdko5O3qgysG13IP0r++qV9LXJkiPRZ+FNxNiBEdNIRvFTyYFT4t+MbQ5S
 53Cw==
X-Gm-Message-State: AOAM531RFF+2KLF45OVeXa8rFWpiZ8HPp6X9ACAfbAcSUxJfTxDl6pAd
 LU6BfrPzvVjWl9xAanR6sbWcgEmWfAk=
X-Google-Smtp-Source: ABdhPJxBWm4Ikz3Ht/fMS2qby0zt8nZ6N/BmQ+Dpb9AVaVZDhfjbyCudlR5fEITzGbBtcjwvIlqW/Q==
X-Received: by 2002:adf:e510:: with SMTP id j16mr15380526wrm.153.1614585120386; 
 Sun, 28 Feb 2021 23:52:00 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p6sm10099886wru.2.2021.02.28.23.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 23:51:59 -0800 (PST)
Subject: Re: [PATCH 23/50] target/i386: Reduce DisasContext.vex_[lv] to uint8_t
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210228232321.322053-1-richard.henderson@linaro.org>
 <20210228232321.322053-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5520cf13-0b9b-99f9-4c33-9a89dac8a4f0@amsat.org>
Date: Mon, 1 Mar 2021 08:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210228232321.322053-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 12:22 AM, Richard Henderson wrote:
> Currently, vex_l is either {0,1}; if in the future we implement
> AVX-512, the max value will be 2.  In vex_v we store a register
> number.  This is 0-15 for SSE, and 0-31 for AVX-512.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


