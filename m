Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0E6EB470
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:09:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppywJ-0003F8-Ux; Fri, 21 Apr 2023 18:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppywE-00039r-G2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:09:06 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppywB-00015c-V7
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:09:06 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso15523515e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114942; x=1684706942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B0agTpYykBeeRAl+6gdjWDPPrqA1bL2ACaS0l0R1iTs=;
 b=ogs+qsBlDV8GU1RVM5mR2MIWk7OhcP5dwIJ0LQPb9Ri9QX1FkYQ66aT859f+uiDVqB
 1RNlCvbq8CJJNxdqbaRye49PfwcnuB8RIl5g8TU9gphYn5DRU3RhA9nZux/nME7kua7l
 pP+IGhVDIDGVf2/Ebh6ud0bvmQrn3Usa5e/MOs1utzLv6YApsu2Lxu4PhjXY3diF60o/
 S75yit5qpGYAyFahtLtx3/eKAElQC8TWvrtnZl6xAeeeHqsCNJ1i3yybK/LDLwEOH9oo
 bRnjghMJ94vNa3D44e+hYevVq22wxgYvcLp5FTxxmuRUm+2GFPOOqwjTFz8UjnmjNUv2
 4gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114942; x=1684706942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B0agTpYykBeeRAl+6gdjWDPPrqA1bL2ACaS0l0R1iTs=;
 b=EGpiKgLHDSkwTdw69Ziv/Et7azEuIQlqgcfq3VrJ6qPRCWKvzTeDCoc5ANOAUIzAYd
 ciClfVwgNpNy68V13RqM0/zVbkXMnjaV9xU6sjohCaVAQgf5MYtSUPJ+fOtXA4ooUu/k
 hG6ZadGiPpqp4ZfzjEYd/S+pYmaa4XRirhR2ZRhJRE18U9hlnzkL9SdDFHn4aRjIfQAQ
 JwUvghv31ZYCgH2KPgI8szAPP2NPjMPLvJqwSiHna7/sC/DM6j3UQ6CHO1cP1YNSyiv/
 bbIf6YNMObkotaYfiepE9Sr4iUIxKKWjvvvpGJgzDrGvmASZVKzDbmTTCWXr1O3fzEb6
 RLvA==
X-Gm-Message-State: AAQBX9cE81i+AfTLALka49JQaRDg9bW9C5zDjz2nJL71zijT7QbhGQCr
 /sq6x1MKq4kWvbUM8du/Um5f6Q==
X-Google-Smtp-Source: AKy350a4EaOfY3iGpS19XhOqst4sb/knXnrIfAurDrHBzqSsKqqZt6IiYD5nS7J50pXmpLSv5UD5HQ==
X-Received: by 2002:a7b:cb47:0:b0:3f0:7ddf:d8d8 with SMTP id
 v7-20020a7bcb47000000b003f07ddfd8d8mr2900931wmj.18.1682114942696; 
 Fri, 21 Apr 2023 15:09:02 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 t26-20020a05600c329a00b003f17f9965a7sm9248376wmp.1.2023.04.21.15.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:09:02 -0700 (PDT)
Message-ID: <b3e02d61-ba38-55f8-dec0-3072c7b45d1f@linaro.org>
Date: Sat, 22 Apr 2023 00:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 04/54] tcg: Split out tcg_out_ext8u
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> We will need a backend interface for performing 8-bit zero-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  5 +++++
>   tcg/aarch64/tcg-target.c.inc     | 11 +++++++----
>   tcg/arm/tcg-target.c.inc         | 12 +++++++++---
>   tcg/i386/tcg-target.c.inc        |  7 +++----
>   tcg/loongarch64/tcg-target.c.inc |  7 ++-----
>   tcg/mips/tcg-target.c.inc        |  9 ++++++++-
>   tcg/ppc/tcg-target.c.inc         |  7 +++++++
>   tcg/riscv/tcg-target.c.inc       |  7 ++-----
>   tcg/s390x/tcg-target.c.inc       | 14 +++++---------
>   tcg/sparc64/tcg-target.c.inc     |  9 ++++++++-
>   tcg/tci/tcg-target.c.inc         | 14 +++++++++++++-
>   11 files changed, 69 insertions(+), 33 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


