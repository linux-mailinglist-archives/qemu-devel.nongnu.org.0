Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C43BE01F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:14:15 +0200 (CEST)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vCg-0005Iw-MJ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0vAx-0002pu-DA
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 20:12:27 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0vAv-00089x-KB
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 20:12:26 -0400
Received: by mail-pg1-x534.google.com with SMTP id w15so417904pgk.13
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 17:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Llib8N0WksdVh2EkVAgQKmXpLfxNNYnAlv+ZqRgiiB0=;
 b=hfosbOZEU3HmbPrtZSLlwfXpbTjeucVHScXyFO1CGDXpLMqGI1c5SWlVSG/trBYnFA
 3ciXGaQ0vrYCX8flEQo4Hdh6wWXADXEgaysubCL0YEofrHIqRZKfYKhYd7/NyBozuZS1
 vseGuCSu5y4OJwXSFH9dvGeZBxCMnEv+qSvUd72As3AvAtyK8DRa9ofEqmYVEfLy66An
 fHdGJnPFRJX84WUIZZ4ltSgAvhrCupzZFRZShoOtZth1h50GpwWYrHGjt1ofx1RXA0Ce
 0CbVNO3drdf848CTqCIFIcI+Kf4omOGoY+up5y817gVlskzWDpPVCOea6KHeerLHsREe
 e5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Llib8N0WksdVh2EkVAgQKmXpLfxNNYnAlv+ZqRgiiB0=;
 b=XllPAp3y4+ryPMRLImRFGthEwAkzzWw9cJzbMCre0qEylSB1DSfFXg32E/XMreJ1TX
 b0rxbjcuUuS0J47gDEXDOiJ7NxFKb3PaWyVDtzK/2fYA9ec9OuLeX8OKt46LxNyTBA8V
 Bq2Wwh2NmHFKW7JEq4mHbgieK96R2YeffuKsPmzrwhtw4hzzGt89NeSuEkL1dIuSf2JG
 hYfQzlD/yVtrTEf3bMrHp5ELqeiHeydQsXdz8AGzYfF7hl/w1OBn9GFHmgZWT83VrtwP
 42qpGwpblkgEspvRAgJWQ+IbLwiTz6KamAiRNOi8YhA87CrdRU3oe+RL15mqEv+DsbzX
 4qRQ==
X-Gm-Message-State: AOAM5319UzMgTYLKcyWLIOCG3++bQVSU5YwyR2VIKeAPiez7VFuTHyGH
 rgDHVuPpqEGu0gd4yGnNQXVit7JRyVDxyA==
X-Google-Smtp-Source: ABdhPJzVmT93gzBTXPSCmSeSoBRky3CN4r08hACsTzShCp4h5gMLGn3aCOuzUggBTDQkRdQGfhj2pA==
X-Received: by 2002:aa7:84cb:0:b029:312:bd08:246f with SMTP id
 x11-20020aa784cb0000b0290312bd08246fmr22502996pfn.13.1625616744129; 
 Tue, 06 Jul 2021 17:12:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id i18sm10648606pgb.83.2021.07.06.17.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 17:12:23 -0700 (PDT)
Subject: Re: [PATCH 1/2] accel/tcg: Hoist tcg_tb_insert() up above
 tb_link_page()
To: Liren Wei <lrwei@bupt.edu.cn>, qemu-devel@nongnu.org
References: <cover.1625404483.git.lrwei@bupt.edu.cn>
 <f9fc263f71e11b6308d8c1fbc0dd366bf4aeb532.1625404483.git.lrwei@bupt.edu.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7db3e085-daa3-b4cf-0891-b630736d43f1@linaro.org>
Date: Tue, 6 Jul 2021 17:12:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f9fc263f71e11b6308d8c1fbc0dd366bf4aeb532.1625404483.git.lrwei@bupt.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 7:31 AM, Liren Wei wrote:
> TranslationBlocks not inserted into the corresponding region
> tree shall be regarded as partially initialized objects, and
> needs to be finalized first before inserting into QHT.
> 
> Signed-off-by: Liren Wei<lrwei@bupt.edu.cn>
> ---
>   accel/tcg/translate-all.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Queued, thanks.

r~

