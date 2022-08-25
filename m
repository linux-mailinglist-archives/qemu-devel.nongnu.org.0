Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A585B5A0534
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 02:34:00 +0200 (CEST)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR0oo-00012v-8l
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 20:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0jv-0006Ra-B1
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:28:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0js-0007ad-OY
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:28:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso3173573pjd.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 17:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+DKWOlXcmxRWzgkpjTA2zbMSYXJivN3PfUfVBM14vrg=;
 b=eWZYIO4LIGFLq8OmXRuxRZNTwPNrKRUTfmuRx3NDT97XmkRLvmAQPBm8DdJWUB2GYM
 oMM8F0gZTAHzRBzLqp94HWsb1eKZVXYvddcLqsyUkU04GFyFf2wvEtwK2261uDyEsEA/
 c/5vs6Li/O5U4xSAcb4SuoJSMGsoOnnmdC0dyA7U7O0XV/RdimUmcGna2SglIjPx/IAY
 b4ZjfLlg5ZgPYPbTEqA4FV6OlZQNd/nokQ6KzIel+PIGvXLhYMoOLtWPyQ7WFtGN9IV4
 xIA7IfeT+9+K9w1YYpyodmRezXZz07YsyeDsAPFkb3XZyAJDxDqNKCPNaryJtWZjpWPB
 g+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+DKWOlXcmxRWzgkpjTA2zbMSYXJivN3PfUfVBM14vrg=;
 b=PPANXn7hImM/ePnXhdz3peGv9usZrBUKcBKV/54wZ3pnlyJ+j9mx6hNU9VOq24+/HV
 KwDoVKB2Rb8hrSChJgOtGWJmXifOAf+75K+2jlDuMaZx1+fB/Pbld7iEorKkgOLXdtdF
 OtiSIUzvzMB+6iYV9Jvchp3sJW1qi1jsMHyzA6FtIwgmB0suAUdfxOe6KX8qwbrQsVs4
 QQcJS77eKigInrZhYltLWRtEe4xrpopX3Xco0nYbKd+OT65MN8In6dvgfwM/ILsHMEe/
 NgEpQzQ3UD8l3jr839LBM9F2+fCtrvSMoDJcbnCiUO4y5WwjBqLgI20cByZA1lRMClSM
 +mQA==
X-Gm-Message-State: ACgBeo135XAwuTuIpeU/NRNS77Zen02M5azv0FcZXEE6R1qpLo3r/vp/
 pSka1fozvJokOkrbmbPI1fAp7w==
X-Google-Smtp-Source: AA6agR5D19MLyNp9+80/FknR89TazHyb1d3YG9ARzrAAqeYAbxeL3tViLMwe+GD2nx3klyKsfOGg4g==
X-Received: by 2002:a17:902:6b84:b0:172:f7cc:175 with SMTP id
 p4-20020a1709026b8400b00172f7cc0175mr1236818plk.158.1661387331262; 
 Wed, 24 Aug 2022 17:28:51 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090a154d00b001f2ef3c7956sm2022628pja.25.2022.08.24.17.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 17:28:50 -0700 (PDT)
Message-ID: <22e4d338-1037-a79e-1ccc-51f2320f0956@linaro.org>
Date: Wed, 24 Aug 2022 17:28:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/17] target/i386: add 28-2f, 38-3f opcodes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173250.232491-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824173250.232491-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 8/24/22 10:32, Paolo Bonzini wrote:
> @@ -183,8 +202,7 @@ static void gen_XOR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
>           decode->op[2].alu_op_type == X86_ALU_GPR &&
>           decode->op[1].n == decode->op[2].n) {
>           tcg_gen_movi_tl(s->T0, 0);
> -        gen_op_update1_cc(s);
> -        set_cc_op(s, CC_OP_LOGICB + decode->op[0].ot);
> +        set_cc_op(s, CC_OP_CLR);
>       } else {
>           gen_alu_op(s, OP_XORL, decode->op[0].ot);
>       }

Should be squashed with previous.


r~

