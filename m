Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C29E2ED6B6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:30:59 +0100 (CET)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxa3m-0006yP-Ff
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxa24-00063t-Ji
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:29:12 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxa22-00068I-Qd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:29:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id c5so6588801wrp.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 10:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Sp6xnppzP63IJbAIlt4s8+XoPyS9MrOwigW3DBOc8I=;
 b=S7ik/Bsh9MCt+12Vz8XDQY7mHbub+gCil64G4Me/IB1twAMh14V1kAgW8VGgBf0aMh
 ns1ZjoBnuavYSe3vk3HO+zACS54EOTyjV02HEQpaXrFwDnd9Av+Lia6o2UhskyB9SHEW
 s2y7JJSKO23pjoK6nmFQKIisxhUwTtfysLcGoDN0ziS72EsCqvYlYH9Xt0gNzeepkjm5
 hxvnqH3oVLbz4VT3+TtNScCk1RhFbk2Ltjegkme6asFObBySsSKlQTJimoYn8Ey53oJ5
 /gmRo8IFfaucWjfiAr0Xp4K2c+4KxF5qyH+FbfyAghb2VLrIyFjzl2COu11XkDdUBOFa
 0Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Sp6xnppzP63IJbAIlt4s8+XoPyS9MrOwigW3DBOc8I=;
 b=quhXb8ROCNDmdQU0134wH38OCuiYk9ywe7Ov9XCRwoJzIQzYfWtpyK0tqGuyoKUqCE
 2bePIqtJkanENqG+riQPHZC1FPoQMPM9Ri14XE4md6IRt094bO+sR9LERSdc3FDfgv3D
 CGqAtdx4HFLvR3xNOmoN8Bj3hPCr9YqXcm2goEmzlDqR/YJMFpzJTcMnqZjJEH9W43Qx
 FaFfy8z/evVLVE9/6Eqi9wvf9BE8w1X6FldTw1wnBHOF/pLaXhL6+InfNKIZygAi56Z7
 5Bs0rTVQ1Aa1/C0lfFE6TToHeq44LXx2zORTX1bcVMcmn/YfehCLwr1F++Ap2zxKEZae
 CMtg==
X-Gm-Message-State: AOAM531VCuK5zPhDhMpIU4tbmux4huD+lEoL5ypAOWWhWj1tSa5p/yyZ
 R6JX8gJmN5oXS83U6PEG/oM=
X-Google-Smtp-Source: ABdhPJxekrwZ2/W2aMw3OGWtNJHP+lJH2vA4UWYZ5PyH45sm1AhVQRw0qxRPP/MyYy7h5SZRwPfHxQ==
X-Received: by 2002:adf:a495:: with SMTP id g21mr10729866wrb.198.1610044148765; 
 Thu, 07 Jan 2021 10:29:08 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id w17sm8472022wmk.12.2021.01.07.10.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 10:29:07 -0800 (PST)
Subject: Re: [PATCH v2 00/24] target/mips: Convert MSA ASE to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a4a92c8d-21d5-5300-bef7-2ee3129e6a13@amsat.org>
Date: Thu, 7 Jan 2021 19:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 11:57 PM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (24):
>   target/mips/translate: Extract decode_opc_legacy() from decode_opc()
>   target/mips/translate: Expose check_mips_64() to 32-bit mode
>   target/mips/cpu: Introduce isa_rel6_available() helper
>   target/mips: Introduce ase_msa_available() helper
>   target/mips: Simplify msa_reset()
>   target/mips: Use CP0_Config3 to set MIPS_HFLAG_MSA
>   target/mips: Simplify MSA TCG logic
>   target/mips: Remove now unused ASE_MSA definition
>   target/mips: Alias MSA vector registers on FPU scalar registers
>   target/mips: Extract msa_translate_init() from mips_tcg_init()
>   target/mips: Remove CPUMIPSState* argument from gen_msa*() methods
>   target/mips: Explode gen_msa_branch() as gen_msa_BxZ_V/BxZ()
>   target/mips: Rename msa_helper.c as mod-msa_helper.c
>   target/mips: Move msa_reset() to mod-msa_helper.c
>   target/mips: Extract MSA helpers from op_helper.c
>   target/mips: Extract MSA helper definitions
>   target/mips: Declare gen_msa/_branch() in 'translate.h'
>   target/mips: Extract MSA translation routines
>   target/mips: Introduce decode tree bindings for MSA opcodes
>   target/mips: Use decode_ase_msa() generated from decodetree
>   target/mips: Extract LSA/DLSA translation generators
>   target/mips: Introduce decodetree helpers for MSA LSA/DLSA opcodes
>   target/mips: Introduce decodetree helpers for Release6 LSA/DLSA
>     opcodes
>   target/mips/mod-msa: Pass TCGCond argument to gen_check_zero_element()

Thanks, series queued to mips-next
(without patch #3 "Introduce isa_rel6_available helper").

