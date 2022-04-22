Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E050BBBB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:31:44 +0200 (CEST)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvG3-0005Ld-AG
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhvBa-0000aM-DS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:27:06 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhvBY-0003gl-PM
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:27:06 -0400
Received: by mail-io1-xd2c.google.com with SMTP id p21so8940005ioj.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=gTAwlSAdkUOrO8/C89Uve61pt9EmMHVuxdoWEivDyPs=;
 b=vPh10TKbqkjguW/+nIQXSw/69ahYV5o22T2i0odhHU/Yh5nYnfaPXo2uSrrTmcET4F
 kuAm1CxjiZlaNIHwkIJRwsFB5a6YiPoUA6+YSQFj2Ioxmin/009xdTFg5A8esrg5M7nK
 /3di7bnm1JuPOq8Lnsm1gbnQnKJr8PaHyxjkrBHQR+AMuDMFTyaV2TzRXOiSQKpx5KtY
 hafC7F+RXgvXBEfjqGUptjbwlzIHunIsNoxE5E6e2RdWIDXa1mak0a31Pj6Uwn3xYP+U
 nXhbUEdYK1Flquqb6H5YMESzSM8inxxoE/jDmkCeaRGIuiJY446naI9XrQ3zmB6NwbMl
 fSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gTAwlSAdkUOrO8/C89Uve61pt9EmMHVuxdoWEivDyPs=;
 b=zTR6ItXevDLJmfYgSoSq4JnKzmxU6Pqt/xnlgkxY+klyX+mB2gu2sFgFxF+SYP9LQC
 MaFUGAPAATwxb0MhVV3m1x0x6Ckqe7eigL12sap3OqqjIQ+bgMnJx978ahN3sfjjjbxT
 r7wpnncf040qqA98QJFWEM/fXP5X9IHpSSS44LpxuyPPWgKshVnWLrZ0V0Q5D3HEhMP0
 vSvoeqn6pBVax40CGFoFQSZWkgEd56ttrM6xPcrYM5YVMqkYC2vl/RwIzpxv6Zklpjhj
 5V4Yf4IXnILsTfnRlrcw4wArOC38XSJ5gnTo87aqurr/xolYp8+pC6gDnxLn2/+5GGMj
 Ulbg==
X-Gm-Message-State: AOAM531LJS/jwXCLEKRw8ekOmJiOJvS/vKfuChiEwM/sOq4UQ/jU0PCB
 yph0wDGVoyR6P9jx3jneKShJyWXdsb1IFg==
X-Google-Smtp-Source: ABdhPJwy1i/lGLEkMSeiRrjoxYHJ6OwsSnnKusvCluXxYa85C4IZPU+IgzoCURvB3TC3mk2YZmpYfg==
X-Received: by 2002:a05:6638:191c:b0:326:3c70:b9c3 with SMTP id
 p28-20020a056638191c00b003263c70b9c3mr2304629jal.154.1650641223428; 
 Fri, 22 Apr 2022 08:27:03 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1?
 ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b006496b4dd21csm1692082iok.5.2022.04.22.08.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:27:02 -0700 (PDT)
Message-ID: <41ad2198-5a20-8323-ca52-c1cb6be11821@linaro.org>
Date: Fri, 22 Apr 2022 08:26:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 7/7] target/xtensa: use tcg_constant_* for remaining
 opcodes
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220422115025.381131-1-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422115025.381131-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 04:50, Max Filippov wrote:
> - gen_jumpi passes target PC to the helper;
> - gen_callw_slot uses callinc (1..3);
> - gen_brcondi passes immediate field (less than 32 different possible
>    values) to the helper;
> - disas_xtensa_insn passes PC to the helpers;
> - translate_entry passes PC, stack register number (0..15) and stack
>    frame size to the helper;
> - gen_check_exclusive passes PC and boolean flag to the helper;
> - test_exceptions_retw passes PC to the helper;
> - gen_check_atomctl passes PC to the helper;
> - translate_ssai passes immediate shift amount (0..31) to the helper;
> - gen_waiti passes next PC and an immediate (0..15) to the helper;
> 
> use tcg_constant_* for the constants listed above. Fold gen_waiti body
> into the translate_waiti as it's the only user.
> 
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
> Changes v2->v3:
> - use 'pc' consistently in gen_check_atomctl
> 
> Changes v1->v2:
> - convert gen_jumpi, disas_xtensa_insn, test_exceptions_retw and
>    gen_check_atomctl
> - use tcg_constant_* for PC
> 
>   target/xtensa/translate.c | 77 +++++++++++++--------------------------
>   1 file changed, 25 insertions(+), 52 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

