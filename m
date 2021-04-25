Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B11436A84B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 18:12:38 +0200 (CEST)
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahN7-0006Ia-CX
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 12:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lahJP-0002ur-OM
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 12:08:47 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lahJL-0007m1-VO
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 12:08:47 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso1073855pje.1
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Sy+yWnHgWFIH7FhNpb4hFC0UNvDF6B0SoJRx9M3wiGY=;
 b=GpVINKPEpzyQ4EZLz2fSlx4yEI4QRg1bIMi8v+aaTQi9sQrQYH7eRGPXBacUnVtVJ9
 ZNV+4VY5GifkcruBI7bsrV7SuUW2DSQDfUBE894zz4giY1G85iIGD/5yEPMl1kgP4P+5
 +rFYVWynQlasPoRG8ozFYatue4F9JJxp+i/J0kIKPrObUDUmFDKyGLd3C1POXzFggets
 u4IgLFinENZshsXOD/aun4DHwTZ3M8eIrGe3kPF2EHqaUu+9ZjoWKoYcywuzVgbe/nSZ
 QVVSrU2uB/3lAiKD+O20rfFk6QRlr35iqAI6mDeprZxpqzNw6+QpboQ4owd9zFOqaAU4
 zqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sy+yWnHgWFIH7FhNpb4hFC0UNvDF6B0SoJRx9M3wiGY=;
 b=f1ZK1UmCLSh43XXfWRZRwYx2OaNfHbkd686pajgbqCOvEhwVUy4ngBI9snoV8Nv9yA
 pmi0TtOmlhedmkv1RHGp2ckZjSxQlTIcqmDJfn3mfalcP7EvbT7MzeS5CoTJq0njLKED
 3gJ5MQs8DE2Jpkr9hAgGztm1rsbtq88RfxtC7pEZjgNarTPGYMpgGSr2CT07MJ1n9xYZ
 o2DetqZKkzIRG5bm6egGbR+mK3R5nRcZD2HyXl3BYO9wpHtp1osCC3X+SmGU6UjnoOn/
 vH41/FEQ1fgDza0QeEGDlZCC/Qn79dUMybT4JfLm+E0lLu7HAoONlyFHMaq2QShKIFBV
 Tgfg==
X-Gm-Message-State: AOAM532C4ul1iFDGSZYm2Hg6EpGylNt5SM/lW5uH9EcDD6RN4gM6srdg
 2YZkQI3RZgiUzD+eFvC77ycvnHAYE8UPxg==
X-Google-Smtp-Source: ABdhPJxyCy519dgBtOPHWLbwkvjhIU0nLMS99Binsq9STsUQrMgOadUsZyUee7pqZBG70rq0ToveLw==
X-Received: by 2002:a17:90a:af95:: with SMTP id
 w21mr17237391pjq.178.1619366920810; 
 Sun, 25 Apr 2021 09:08:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id ml19sm770760pjb.2.2021.04.25.09.08.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Apr 2021 09:08:40 -0700 (PDT)
Subject: Re: [PATCH 8/8] linux-user/sparc64: Implement signals
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210425155749.896330-1-richard.henderson@linaro.org>
 <20210425155749.896330-9-richard.henderson@linaro.org>
Message-ID: <46839d70-81a8-b95c-667e-f7f03be06e5b@linaro.org>
Date: Sun, 25 Apr 2021 09:08:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210425155749.896330-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/21 8:57 AM, Richard Henderson wrote:
> We've been using the 32-bit sparc abi for 64-bit signals.
> There's a surprising amount of difference, beginning with
> the fact that 64-bit always uses rt signal frames.
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   linux-user/sparc/target_signal.h    |   2 +
>   linux-user/sparc64/target_syscall.h |  14 +-
>   linux-user/sparc64/signal.c         | 245 +++++++++++++++++++++++++++-
>   3 files changed, 254 insertions(+), 7 deletions(-)

Ho hum.  I just realized I've broken sparc32plus.
I'll have to reorg the ifdefs.


r~

