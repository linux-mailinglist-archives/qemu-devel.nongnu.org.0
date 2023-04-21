Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D26EB510
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:41:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzQU-0001wp-S4; Fri, 21 Apr 2023 18:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzQP-0001tX-Nf
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:40:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzQN-0000dK-3y
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:40:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1763ee85bso22781825e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116811; x=1684708811;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOmOI5bhybaH2l8KUmk7CRxECVlXysRD1MtBuA8x5wg=;
 b=GV1un2O/iIOz23DpTe2YQWXQF3000aalUd6NufmMxr3d8mDQtpgfX2SO6wnokXLhuK
 9luCN7LrAhmUsqyHXGR4uvWxKN207Pc6qoVnZaQ4iufZUbEk9NGALOw8D26ScIxjpF0e
 mxRpxobDP0hMEtTRhPr9y6VU8tT9SaS4EUtZRw/S07oDmXVTOaZ7u7iFGXtaF435RkjO
 R2gFihrkF9fGXfWN3XdFZc5Ah98b9xotM1IWqhHoIOMthdxUYAjOSoyyydZCl3+FAIE9
 LBcahI6VmZ0KBH9J+mVUjDYR9N2L/P/jBgDxXGPCaCoCPMJRZKfOr3cgRFOq2sIzcj+C
 dkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116811; x=1684708811;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOmOI5bhybaH2l8KUmk7CRxECVlXysRD1MtBuA8x5wg=;
 b=VM/Dnz3y1NDDxZVsRjsd8Hdz51j3R9l8pt3cD5T+gKXHUgKneczBBkTJZPbWSkAe6V
 +IPvWWHBBhXw/gr4JPmZlWRk5t8W7n4us3nLWnDACyrqG4O3xXso8/YRHB0oqaQlyJ5g
 DgJE3JYHgkV1VAwqDUJlwC8ugbjb+0GiYcThqBMVmm5h1Ej+NujGiVKMeg1tgDyFri2f
 lRPIaF9eImG7UI8gipaUimmLDOizQv/p9ZCoUYT5ohylI1ETEKw8ruccD1iDhdROf6RQ
 BgU79tGMeoRQvSfOblkhbJyDWtKEsZ/QmsgeaUwD/u3XqLEnyi7hDH1tmfJ0J9paS2Zu
 jdFQ==
X-Gm-Message-State: AAQBX9e/+kqyg1xrOx5MGUBlunjVEsOv03CFgPojGgrPwIn/yQoeiZfz
 XV9qh+VqUKTA2p6K19jbp9ACmg==
X-Google-Smtp-Source: AKy350aUj7Pbnh+7Xo6OSIMhPVhOr6g2YHHkZ83GzxK15BlNKlVvqPZLKiCFtkz7pR0C3addWQ9Elg==
X-Received: by 2002:a7b:cd02:0:b0:3ef:d8c6:4bc0 with SMTP id
 f2-20020a7bcd02000000b003efd8c64bc0mr2897673wmj.40.1682116810858; 
 Fri, 21 Apr 2023 15:40:10 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003f195d540d9sm1496439wmo.14.2023.04.21.15.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:40:10 -0700 (PDT)
Message-ID: <76538c93-af56-a80c-48fc-e3b8e0ee5e3f@linaro.org>
Date: Sat, 22 Apr 2023 00:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/54] tcg: Split out tcg_out_ext32u
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for performing 32-bit zero-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
>   tcg/arm/tcg-target.c.inc         |  5 +++++
>   tcg/i386/tcg-target.c.inc        |  4 ++--
>   tcg/loongarch64/tcg-target.c.inc |  2 +-
>   tcg/mips/tcg-target.c.inc        |  3 ++-
>   tcg/ppc/tcg-target.c.inc         |  4 +++-
>   tcg/riscv/tcg-target.c.inc       |  2 +-
>   tcg/s390x/tcg-target.c.inc       | 20 ++++++++++----------
>   tcg/sparc64/tcg-target.c.inc     | 17 +++++++++++------
>   tcg/tci/tcg-target.c.inc         |  9 ++++++++-
>   11 files changed, 54 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


