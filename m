Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F4682FF7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:58:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMs4e-0003v8-UK; Tue, 31 Jan 2023 09:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMs4Z-0003lQ-QB
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:57:26 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMs4X-0008Vz-Hr
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:57:23 -0500
Received: by mail-pl1-x635.google.com with SMTP id p24so15303689plw.11
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 06:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jVgQYIugfa5xZdBepONxV7XSk/jH+sUgIJk9gL613Xg=;
 b=toYkiXXNYBJi4jnjRs2dZ1KFLw+ezmqFnlRvS3bRFzZN59wqijO888Mq1mZ1PHRv9A
 2cD6y0kASYwa68lCIeMisuXe/WJHqfNF/J3miBipaOOQlvX+K2u9gkQ2XYY/buy+Ujq/
 tYUh2Hk7CVVTxv5cnnI6f1uNYFekPpETsf/TPK7FFgNs31EjseqfHe4wpl6v67TTMaHY
 ffgfTvrjoW69QyyvWw1qZBuBuZ/XJTBpXhcOww8pf1V+lF2SYmPGlQKRa4DacRMWjmQ+
 z5LeTQo0z00C19E3O5Bzluy/NtcAVh7sSJJznzLhEjq+YbGXmSp6Wbd2xgYjsqgo2eVF
 RDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jVgQYIugfa5xZdBepONxV7XSk/jH+sUgIJk9gL613Xg=;
 b=qiYc54vIJmxb1rpHs7YJZpdXCYALB4drh6ilEzyXooHm98I/s9JzPhUkYspgFJr5RH
 hMr5BqoYVAqsoCoToHhPI5Ms3ASeRZPBWqF7kaqqBgIDlJ2Ce3CUdJigaYCbKtruHBv9
 j2dB8cXeYdg2mouaGOVBCP+KuLRh0xuA3Lz7bOFEzxmZ2ED3LuBb/g1fOWcNIZK1WfCQ
 +xz7tdaZ3HPPjrRbLcjUKJI483a6Kp2XbNXwu7pG1Hp4tgR+wwvTNbV1wX9jWLkQYzgH
 HMFY1D741c1B86nPMb+mjbWI027ol1VqFjW0XXw3bO35ki3o4SY5NnAFA/CL4NBwVri8
 rOfA==
X-Gm-Message-State: AO0yUKVXUSKdMLqvdEanCrsNmsAlFJVXMAM8nmkm1wPyYafe0r6/ZrX3
 3YHySPTay6P26GiLes84vFc9DA==
X-Google-Smtp-Source: AK7set9mzH7Yy4hUWiCM3LqJN3VP9cXlr2Uq4lWpRMNBZpaqGppVJ6PJsC14YDsZlsfcRxQkyye01w==
X-Received: by 2002:a17:902:ea06:b0:196:7c6d:2aee with SMTP id
 s6-20020a170902ea0600b001967c6d2aeemr10976622plg.11.1675177038995; 
 Tue, 31 Jan 2023 06:57:18 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 e3-20020a17090301c300b00177faf558b5sm9884329plh.250.2023.01.31.06.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 06:57:18 -0800 (PST)
Message-ID: <50e20ede-a9ba-e340-8b8b-c88dfb799ff9@linaro.org>
Date: Tue, 31 Jan 2023 04:57:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/i386: fix ADOX followed by ADCX
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20230131085458.28764-1-pbonzini@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230131085458.28764-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/30/23 22:54, Paolo Bonzini wrote:
> When ADCX is followed by ADOX or vice versa, the second instruction's
> carry comes from EFLAGS.  This is handled by this bit of gen_ADCOX:
> 
>          tcg_gen_extract_tl(carry_in, cpu_cc_src,
>              ctz32(cc_op == CC_OP_ADCX ? CC_C : CC_O), 1);
> 
> Unfortunately, in this case cc_op has been overwritten by the previous
> "if" statement to CC_OP_ADCOX.  This works by chance when the first
> instruction is ADCX; however, if the first instruction is ADOX,
> ADCX will incorrectly take its carry from OF instead of CF.
> 
> Fix by moving the computation of the new cc_op at the end of the function.
> The included exhaustive test case fails without this patch and passes
> afterwards.
> 
> Because ADCX/ADOX need not be invoked through the VEX prefix, this
> regression bisects to commit 16fc5726a6e2 ("target/i386: reimplement
> 0x0f 0x38, add AVX", 2022-10-18).  However, the mistake happened a
> little earlier, when BMI instructions were rewritten using the new
> decoder framework.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1471
> Reported-by: Paul Jolly<https://gitlab.com/myitcv>
> Fixes: 1d0b926150e5 ("target/i386: move scalar 0F 38 and 0F 3A instruction to new decoder", 2022-10-18)
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/emit.c.inc       | 20 +++++----
>   tests/tcg/i386/Makefile.target   |  6 ++-
>   tests/tcg/i386/test-i386-adcox.c | 75 ++++++++++++++++++++++++++++++++
>   3 files changed, 91 insertions(+), 10 deletions(-)
>   create mode 100644 tests/tcg/i386/test-i386-adcox.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

