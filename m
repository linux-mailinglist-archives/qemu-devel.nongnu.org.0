Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040DA6AD32F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKuZ-0003Aw-GW; Mon, 06 Mar 2023 19:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKuW-00039p-VQ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:10:32 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKuT-0003mU-3o
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:10:31 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso6235622wmp.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678147827;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CGdLL4ZiKt/zu1Fn9z2hcTBNyHakwL7rYXL/fjIqxxY=;
 b=vzgOA+OSKxB9fApnlof5ULvSeu2t64srJXtfraY2c2uNvPcIdcW/Dnri5aZcamyMV4
 /c2c39azhnLKxbqBsA9Ig+iYvJFFgdzG0dgBjlPMkWLgvP03NB24xVvpvvcO15ysTvq6
 QEq9ppT2OxlFs3HLJFjSpO9V0SO3iWSBpoL7DbS2+Suihj/QSDZfbigjHHKKokZEkKBv
 YY0+FwGrI1PRMGt/2RGKDwBz5nWhnbPVgNNR1AOL8tpb+ZeyOF/8QI2fVXvDmjSAILMm
 Jw6ZrUSuYSZRT3IXEjLW37QcOWw1C6ASBrqp47/OuK7QalYe/qXVOeRm9M1gjyEXYL5F
 2y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147827;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CGdLL4ZiKt/zu1Fn9z2hcTBNyHakwL7rYXL/fjIqxxY=;
 b=SGA79OCJ6dL5rCp5d0GBKKwwlnKYd/GUUNyAjlAK5juqq7S0ptF2w1qCDou+NDqTdl
 XYOsRFObSXP5sblYy5ucAe3NOFXrLLnO5ekt5UkbmI4F+jqx9MozS8zKpgUMV2ocJxJ2
 Oid7r2QS4K8eUHjk5ik7A9PMoD4MkYR17RfJIUbnBvMIrCqNsz+sxMFLfUxn7cXuGaT8
 vmfx+jFriB6/z9rkvopnDh8OsRgFx+LlwchizBQKyE2oMayI5z6pNraoW6ZMkAnV6YXO
 d9czxwB2z93uaRSRJXAjNiGinWK+bZmOAQtlI0IvvvDLB73qX1fpTM2o21/kJdps8wRB
 GV2Q==
X-Gm-Message-State: AO0yUKVWJDpfK7y3o4lE7rk+5nKAtW8sNhkyrxmHQXhb10DmKRU2DI9u
 LoTUgMu+aSfb58v62bMFNHd2uQ==
X-Google-Smtp-Source: AK7set9WR/DHouuPKiTC+FrgQr4ftgEgWqpQO/TAZYPY/y7luiKSQXy05jkDEUHqEbj/LseJBh9hvw==
X-Received: by 2002:a05:600c:3b27:b0:3e2:6c6:31ba with SMTP id
 m39-20020a05600c3b2700b003e206c631bamr11332895wms.11.1678147827504; 
 Mon, 06 Mar 2023 16:10:27 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d44d1000000b002c58ca558b6sm10993073wrr.88.2023.03.06.16.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:10:27 -0800 (PST)
Message-ID: <b176860d-a62a-20f0-ef9e-084617497346@linaro.org>
Date: Tue, 7 Mar 2023 01:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 61/70] target/tricore: Avoid tcg_const_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-62-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-62-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/2/23 06:42, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 127 +++++++++++++++++++------------------
>   1 file changed, 64 insertions(+), 63 deletions(-)

Long patch but friendly enough.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


