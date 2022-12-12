Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2E464A2C6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jJX-0008G0-0s; Mon, 12 Dec 2022 08:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jI2-0007ch-Nh
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:56:31 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4jHv-0005We-QS
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:56:18 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1442977d77dso8405330fac.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GC/rGnWyVtDSAWVYglshmQYn4L3UKwoEAq1QJNKoweg=;
 b=DnXDg7VhzwsvigaeMD2WL3sFGobyoAmnnRKam9zZnMscAidR6FZQBoYPMwioHnY6n6
 Xe94NiQmC3GjeLj7GFDidbwZpwa+zM7bm44bwloHWoYEezVHPUarTf3SJ29Rz6jc1EAF
 Xu6vtH876E9JSJaL8jCBtTrp4Un0wKEa83HNmykF7MqPpBuDtAOX8bgdFtHxLFwLXXG8
 arD6YdfqektGyJgBHHc6YfW6yMVZ/Y7W3+IWug+bgaGHbK0wQiWyQ7Ap4i/M0ODDQKFZ
 fQkZVQ38T2N8I8eKB6LW8fgxoUU2/uKyYhxa+XIOSKl3UBrN3O1ve6iSwPneIbN/GiTu
 upfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GC/rGnWyVtDSAWVYglshmQYn4L3UKwoEAq1QJNKoweg=;
 b=N3W+eCnOmZQRUlxum/dd7JTzJ5bTlrJk8kRY0nU+UIP4Xx4vAbuZx/TLdp6mwj+GTN
 UPRHh+jkU5WtrnNh3nD1YHlVSBKJgWanUG/WsZBNMt0hlxg9RqN8NL57vY85aw+YCVii
 QETDMAKpSS9rdp0LeIUH9/CMqbY0BEF2fTQddxfwrFFpPhMOGkEfU0N4mBzo9aWTu2lj
 htEZO3xh+G/b965sDZDYHRqSJE6F2EWIKVZawRwuzXwVY1Lwj1vTNDrt3k64ysta/HKm
 NS/yHywm3J/XIWf8AOQ2Zi50Ozt8Mt9zWa45xPToMmHnaC1UE4Zhsy+6VCggms/dGfgv
 W3bA==
X-Gm-Message-State: ANoB5plY3Qm/ZA0QObCyev/SIWWRVAfy+7ASPzqFf5FqS5ukk1sspmGS
 k+6HaBMmGJKHr7w0KeUP2D+S1u5VP5voyVIwE4g=
X-Google-Smtp-Source: AA0mqf5PluTZYrsRWgMR+EifwUNcWWbJBUib/e1m8o0F4pP/kTuUH3whjA3KSNQwnGLnLDqsJioWpg==
X-Received: by 2002:a05:6870:a2cd:b0:137:3adf:af1e with SMTP id
 w13-20020a056870a2cd00b001373adfaf1emr7695879oak.28.1670853362660; 
 Mon, 12 Dec 2022 05:56:02 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:20f0:1d0e:8e1f:fff0?
 ([2806:102e:18:2efc:20f0:1d0e:8e1f:fff0])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a056870829300b00143cfb377b4sm4962156oae.6.2022.12.12.05.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:56:02 -0800 (PST)
Message-ID: <ef045691-6021-04e3-c41c-e119a64ce882@linaro.org>
Date: Mon, 12 Dec 2022 07:55:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 v2 05/11] hw/mips/bootloader: Implement nanoMIPS
 JALRc opcode generator
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
 <20221211204533.85359-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221211204533.85359-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
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

On 12/11/22 14:45, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/mips/bootloader.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> index 9fc926d83f..1dd6ef2096 100644
> --- a/hw/mips/bootloader.c
> +++ b/hw/mips/bootloader.c
> @@ -129,7 +129,17 @@ static void bl_gen_dsll(void **p, bl_reg rd, bl_reg rt, uint8_t sa)
>   
>   static void bl_gen_jalr(void **p, bl_reg rs)
>   {
> -    bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
> +    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
> +        uint32_t insn = 0;
> +
> +        insn = deposit32(insn, 26, 6, 0b010010); /* JALRC */
> +        insn = deposit32(insn, 21, 5, BL_REG_RA);
> +        insn = deposit32(insn, 16, 5, rs);
> +
> +        st_nm32_p(p, insn);
> +    } else {
> +        bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
> +    }
>   }
>   
>   static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)


