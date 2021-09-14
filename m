Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F99440B084
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:23:52 +0200 (CEST)
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9Lj-0001m4-4k
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ9JV-0008Ap-Pi
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:21:33 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:46790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ9JU-0003Fn-0T
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:21:33 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y17so12353122pfl.13
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nn0Znnm8PSVh8MUfruVQpR/Q0pVfxq7cKzZfJuKwdmQ=;
 b=k+yeeGuCy0SibwUtpJHTh/ajxltf4rvJJsBFSTmXlEOswvfqGx0ayfq6ZEp1r4Az9Y
 e4UWMLoVL3hDe+vv5JvWBbomuh9bJSRPNVEceFL5MIdOBNpgKCRZ72urTwmJUE8idAnE
 JZID0Jb0AuRwIGIPZuQrV9Yr/awkZ8TYm+kP5m+uxa66lkSIsxuuNPIfwqV4ktnOSz8e
 lpCTkTSA6jsrmgYLavlyOZER6wOuKih57q2/FTn6K8RVuQ/6hxIYq3gk+6pGwUuZyqxI
 zyMd7alKT6ncUca04GtZhZTIJUEIV1nqxvdrTl5Q+pdhZudYNXKSNxow5z9nZDPbH7q+
 qEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nn0Znnm8PSVh8MUfruVQpR/Q0pVfxq7cKzZfJuKwdmQ=;
 b=oCIS0/nQilWxF0LCiEed8+R5A4f0IompNSVRlnX2xapoF17Q+4AHE9tJ2oVzc5Yzuh
 5ebjMtLpZ9zcIeMv8MKKFwtrgKMIH7rJmDyJIzbYs4E1PH47yRxjS1x3uR8EpjRc9Snu
 9qAV4pZ9zwMmRfj3YE6cyqSJ9NEnx9LucXg6E3cgAujuOvsMHYu3PAiOsztuxcXO/uU6
 HTcw3IFIN6VR7Sn3DE3+nQEIZjGdUCok9IhVyBFqjyVE7lO76CiL5VOz7NCDfq5fK8N6
 Is8I7ziDemJnXFnqg6a/D5YjURsLCxXT3iLnO2d/mL1bVlsH6K5bhuV0Z803aGyldyRW
 R8Hg==
X-Gm-Message-State: AOAM5308Sft9UoJOY8rDRW3uEsqbhRFrk6cC8v3JW2KAhUiYsyKDahn6
 8HbBv4pW/PjMmXO3rmoY07tShA==
X-Google-Smtp-Source: ABdhPJyeM7pneNuEddlNRxo+ORNyCv1cz2Jb6UD57ppPHAor7eQAB1/vGX4YweYedI9lH5tF6cer0w==
X-Received: by 2002:a62:f90d:0:b0:3e3:5739:d075 with SMTP id
 o13-20020a62f90d000000b003e35739d075mr5060223pfh.19.1631629289367; 
 Tue, 14 Sep 2021 07:21:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s15sm9966700pfu.67.2021.09.14.07.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 07:21:28 -0700 (PDT)
Subject: Re: [PATCH v5 11/21] target/loongarch: Add floating point comparison
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
 <1631624431-30658-12-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ff9275c9-d795-b9f3-e52c-c662208dbd49@linaro.org>
Date: Tue, 14 Sep 2021 07:21:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631624431-30658-12-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:00 AM, Song Gao wrote:
> This patch implement floating point comparison instruction translation.
> 
> This includes:
> - FCMP.cond.{S/D}
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/fpu_helper.c            | 60 ++++++++++++++++++++++++++++++++
>   target/loongarch/helper.h                |  9 +++++
>   target/loongarch/insn_trans/trans_fcmp.c | 59 +++++++++++++++++++++++++++++++
>   target/loongarch/insns.decode            | 10 ++++++
>   target/loongarch/internals.h             |  5 +++
>   target/loongarch/translate.c             |  1 +
>   6 files changed, 144 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_fcmp.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

