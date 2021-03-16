Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE533E235
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:34:30 +0100 (CET)
Received: from localhost ([::1]:54600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJCn-0005Ex-2N
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ92-0001qu-3Q
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:30:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ8x-00071f-Op
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:30:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v15so11363705wrx.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G8XQmFINXjY+Rf09bPwsimI/ESsroTxnO6BJnDShlZo=;
 b=d0F8rMRlFsKKAyvjDCPnx/mSZnrG1k5i9o0eBidVVZmTxxWotH0oe8E1aymeUx7zdl
 YMF380VeJ5ZGENtp70tRURuyGQHPc75pgf4kfv9xESunxwxHTlm8VGeqg5VaxBTjT08j
 uMyIJCgoLLCNvW2bf1X+odMDuYnXjmX0LCi8D6wGCgyv3MS2OewSmg0WkFpiQUx7I2tf
 mf0/h4JYYrxBRpu2q84KpJTUlv9YmAURhC/mHEB7sVFkVOmpZ8rzBEyhKpuVxPkAAjs3
 IB5fWwabqwnuBkyZxr6RFk2PNIGqh1C8w8ZxwkVkprTaeafBsq+IVI5Me+0L5V0LfSOI
 9RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8XQmFINXjY+Rf09bPwsimI/ESsroTxnO6BJnDShlZo=;
 b=mantetrSP3aWugq+2/LhBYrkfQkxN8wv36sS465W3qr+V9TM/aAF8fS9V/b28y0b35
 00wbyAGMExdza3hhYP8rgn1pfK8f7skrE6mfVdFD10MM6WHCV47LFlWX+b2Iy7Gsl1uu
 kvRW689V92YAxvZtvWcCDwJUwIcfJ69DnKjPEB8Sc1JJFFKWPxKnJwbI6D1/ii4dIwFk
 6wx+W/iuVpNJJN6T73JgPrvawcXvbnGf067CphOiZLklrpn90pFqHh9r+Kf7+yoTaXMo
 SGifn7DxWjGP/yJcoPk2dZ7rKFeioRInfTsGWf/PyD9QwljGkW6BMq7uYAg7JyuAsY7w
 xRxw==
X-Gm-Message-State: AOAM531fx63WJHD9uULhP/GflJbaixxgb1hkPIJ0mc/WSaPv0pM4IhaN
 y4HL1uoEF7bw33U+WaE8klaycSBLZt5h2w==
X-Google-Smtp-Source: ABdhPJwUvi5TPaZy85xAp6GlkjuqxHo8P5KQs8xtJeR8F0ct2KPBubj18/hpBAWaRvMczdEB5gzpew==
X-Received: by 2002:adf:e548:: with SMTP id z8mr1389371wrm.246.1615937428789; 
 Tue, 16 Mar 2021 16:30:28 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s8sm24520895wrn.97.2021.03.16.16.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:30:28 -0700 (PDT)
Subject: Re: [PATCH v5 35/57] tcg/tci: Split out tcg_out_op_rrcl
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a12076e6-de05-6b64-a8fb-07d2f2b26a3f@amsat.org>
Date: Wed, 17 Mar 2021 00:30:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

