Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3766CCAB0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 21:36:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phF6g-0008Og-5y; Tue, 28 Mar 2023 15:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phF6V-0008KH-2l
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:35:36 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phF6T-0005PO-GB
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:35:34 -0400
Received: by mail-pg1-x530.google.com with SMTP id bn14so7880555pgb.11
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 12:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680032131;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RI6NgooPWf1+shVHmz9onObXEg7+7ioDx7uVwEHn83c=;
 b=HjikjCaDmX9XpCvTnR1LIBF5ACo5/+oq01bE0En2gu65Zx4QAB/yGMeD0GAS0LGfLn
 57IE+aCyxjgpCwbPBw5y23FI4T6LCRRSYhETmgLixdbBqYwJjYzXWvmmBvrYGI/I5Brx
 OmdjjM711PhQhgmzB0eVq2QJOp76rH5ODEeABggok/l0E6de6DKCUFBS6ZYJ1Q2Ow3Ku
 OHJ5QBzlWs6NM/gDT83QdE26BVplCXBpfL2e4zT2vov8fQcuay0mbgTDShbNvl3tCded
 uAnpAWiRi+8syWLiBYoZBB/n96rzW470YGPMB47IVI5WSnABT5ez8N1PikAJ9ax9YFO7
 BigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680032131;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RI6NgooPWf1+shVHmz9onObXEg7+7ioDx7uVwEHn83c=;
 b=TA0WfQsg0G7hX4MJ9ZfVf0YHaacbA1XsGIB3d7bUOXCm2Ky2QIYJP8/lB9ui7mT1OM
 WafA7Z+mAFyAXS1XWwVkqFgQodQxK/SCj6IAMqaFRqfYDns7shngU7fs0BmUinjSBDmP
 OKSb+p19QjpiUnD5RDpPETJUYwt1o6zrWiZJpwF7Wi21WmG9LedpQwTow80KdJXfXsIR
 eH7U1N8g5eHdHobVTd1TT9EuUVNwCofy6xfevA+ifqK2xUCTZ31BhDalFNVRykKsidrE
 lP3dZfg65PTKl9GMUmDiykDDwB/I60QxKv374kNuUUf6fMiGMm1+Abu97rSJzdKNsqyo
 U/kQ==
X-Gm-Message-State: AAQBX9dSo1aoelpS0w21g60r8i354OErw7peatrUsOqI5D/yXd18tXbY
 oNwqm/5v72J0Z5u6WY+7BwstGw==
X-Google-Smtp-Source: AKy350bmdNsoGGJ7FSy0iFVEzxekec+dC88rJfFzMyIwXseyt7PtHiPs3NBdZXglR33HPwdyS0apdg==
X-Received: by 2002:aa7:968b:0:b0:627:e61e:1ae with SMTP id
 f11-20020aa7968b000000b00627e61e01aemr15680821pfk.12.1680032131235; 
 Tue, 28 Mar 2023 12:35:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 v19-20020aa78513000000b0062a575b1497sm9978721pfn.26.2023.03.28.12.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:35:30 -0700 (PDT)
Message-ID: <baed9b95-b487-be47-5c9e-ac5d2536c1c9@linaro.org>
Date: Tue, 28 Mar 2023 12:35:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 03/44] target/loongarch: meson.build support build
 LSX
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/27/23 20:05, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/insn_trans/trans_lsx.c.inc | 5 +++++
>   target/loongarch/lsx_helper.c               | 6 ++++++
>   target/loongarch/meson.build                | 1 +
>   target/loongarch/translate.c                | 1 +
>   4 files changed, 13 insertions(+)
>   create mode 100644 target/loongarch/insn_trans/trans_lsx.c.inc
>   create mode 100644 target/loongarch/lsx_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

