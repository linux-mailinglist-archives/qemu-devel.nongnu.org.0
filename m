Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76184643DCE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:49:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Sh7-0000AS-Fb; Tue, 06 Dec 2022 02:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Sh1-00006k-CR
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:48:46 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Sgi-0008Jv-RV
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:48:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h12so22201631wrv.10
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7RYh+K45p6qpJzfJQJR2NuCgucVCtv9dGrXsX8LHk/s=;
 b=k8xGaoGMnLGatzyqdRc7WFNhVMj0wAFJK/Zq9HfHc2UHDkfOUd/F9+lOx8/RMGBmMz
 iMcwt469fdapLiWN6K12hO3Q5kHJe8te4GI6iGbj7PblXAdFmxASRBr5t+rTzIZf4saD
 tmaIL3Bsk/5MtpS05sj9i6JvixZ32Pj64bp2KdYjR9WBuMrbuKROtn1nnMBMlaV5macy
 3eTcrYoSiQxa5iCKPb9R10bBbh3lReygdDw5+1boVIRuHYqCimYZ4ztEyLgdH81hDdsA
 h2Rzn7Wr8xKMJWDTJzdQPh0m4WU49qGS6k8sDp4RnuNJVsgOZcHIRchSwIUTH8xXHyB6
 oteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7RYh+K45p6qpJzfJQJR2NuCgucVCtv9dGrXsX8LHk/s=;
 b=HFv0ZoO2tHnNN9r28jyBgLW9QQi8tgwlQujc8YPgcruGUxPWcbR5NPiPzhitg8TgDU
 Xg4ToSs9IKJIbL1bjEdSbcjZ/r0NaTi8kxxcl8aemoYN8r4UEo5wc+eVWw+UM3mi0X7U
 9rUpzFQ/WEH8Pa8ipzFGEZM1CmqYcjxywDQqYmI6PADje7X0xc6b4Je1pnOE+s/Jdtlx
 gIJyi8rSFWJmBnXuLzfuLThOQaTREBJPrA3r7LBWYgkOOJamq+ZApr2ANcCcLmkaJE6z
 G/Mk2FLrLFtzNAvThR0kUjVjLv1IBCZrb8d6y1K4KpGFojz9f8MnQHKLEKmuSUHA1FPK
 pnaA==
X-Gm-Message-State: ANoB5pmMvzCTyGoUsFjer2LkujenRPPUIQC6JDA4bi0abEGIRvXKqw+5
 /EJg/sw6MOw5KBb2AiEetVlGfQQhpXkz9TZOpl0=
X-Google-Smtp-Source: AA0mqf4jvRFE/yXhSaWEjdJxlX8yvaEEtbiAV7RVWWDhZov5TphoCMYBK+6lMUOwQF6v3JZo4uDxIA==
X-Received: by 2002:a5d:560b:0:b0:242:1b1:ae8 with SMTP id
 l11-20020a5d560b000000b0024201b10ae8mr33427105wrv.16.1670312903272; 
 Mon, 05 Dec 2022 23:48:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b003cf894dbc4fsm19820324wma.25.2022.12.05.23.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:48:22 -0800 (PST)
Message-ID: <6740ec4f-a978-6467-ee6d-79eeef3c4059@linaro.org>
Date: Tue, 6 Dec 2022 08:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 22/22] tcg/riscv: Implement direct branch for goto_tb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.265, SPF_HELO_NONE=0.001,
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

On 6/12/22 05:17, Richard Henderson wrote:
> Now that tcg can handle direct and indirect goto_tb simultaneously,
> we can optimistically leave space for a direct branch and fall back
> to loading the pointer from the TB for an indirect branch.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/riscv/tcg-target.h     |  5 +++++
>   tcg/riscv/tcg-target.c.inc | 19 +++++++++++++++++--
>   2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 56f7bc3346..a75c84f2a6 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -159,6 +159,11 @@ typedef enum {
>   #define TCG_TARGET_HAS_mulsh_i64        1
>   #endif
>   
> +<<<<<<< HEAD
> +=======
> +void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
> +
> +>>>>>>> 89ab294271 (tcg/riscv: Implement TCG_TARGET_HAS_direct_jump)

HEAD is correct :)


