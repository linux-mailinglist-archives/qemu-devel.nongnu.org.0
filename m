Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AE3435646
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 01:06:40 +0200 (CEST)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKfO-0002hr-M5
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 19:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKcy-0001dD-TY
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 19:04:08 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKcl-00073o-7D
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 19:04:08 -0400
Received: by mail-pf1-x42f.google.com with SMTP id f11so4205334pfc.12
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 16:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gRndTUXE5cdNhklrFqyISWq5gSR0pyKSZosqTOaP3uM=;
 b=poy006cGxE+T9DU1VGbOiRqIC0vsxl0QnSGd9nq7VR8boQQXkyQwazXprIc+GuY1Vt
 NZVFoCOnEwb8PXmtkxZs56IzvtbtqBPfaMTb1jRE5hO8CMFnJxfrfMtgLbxWishp2lNJ
 t4fH2AR7MB4jNu3RuqNBYexEcVmEJ/Y+uVbYfHK5jFJZ4e9ZpcTBXK8bMQbykZO+26UD
 eWRJEpSDqOS+xOqdVGC1gu/NwYIua86t9mNu0Vo9X8K9cz1jv4M9Eidf9AXtIENlLUMp
 ul7UJgRlPP2yyStsVXbG4WZQ3bprj/iNyq5KiIYtFJIRlIHu7ULUPZPZOOkv57EaJV7g
 RzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gRndTUXE5cdNhklrFqyISWq5gSR0pyKSZosqTOaP3uM=;
 b=OR0Suti20fBFIdoa/kQCEVFPVZituVErvMlx8aegEgIP1xWmLU1DFLTveITP4w3WX6
 Lf2tDK/AfiEcrqhWJ3P1wsys02sfK+V4ZnqDGIxdRFReA6pTDCiLvW3asenePTslUW2u
 PTya2Juq8TRKJEyPrTuwsB8jMcfdxVgYZp9v477MjhMlC5uYUUEcIvcvmY4EePVz50X9
 IEyHcRw0PkGRuqUetIHONF/yMic6OGeYR/OkTjle97+b33JxVdwvulwHp9MRPXUNqNkr
 KsmdtyR3cxvA80VoayFvPXz5eyweCFq5hpChW0mX8BGo1hgCYtkfTmLag8xkXmMvOTBH
 GmMA==
X-Gm-Message-State: AOAM533agSRbBwlHxd58ehxAS5kBNr5ftAdVOBUj0CCmH4tTIXT3Ym8N
 CdKksn/V7a6udjhKRHJNGUUoeQ==
X-Google-Smtp-Source: ABdhPJxS70IufDahgAO6/Y0IT3ZT204WMHRAYUoBT0l8t+Jwft7UNfjMaDalQXqRvPxLzhHb8MjYjw==
X-Received: by 2002:aa7:949c:0:b0:44c:a0df:2c7f with SMTP id
 z28-20020aa7949c000000b0044ca0df2c7fmr1798325pfk.34.1634771032796; 
 Wed, 20 Oct 2021 16:03:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c15sm3611874pfo.178.2021.10.20.16.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 16:03:52 -0700 (PDT)
Subject: Re: [PATCH v3 16/21] target/riscv: adding high part of some csrs
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-17-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04396b41-3198-d4f1-6f04-7a4b77d558ea@linaro.org>
Date: Wed, 20 Oct 2021 16:03:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-17-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> Adding the high part of a minimal set of csr.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/cpu.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8b96ccb37a..27ec4fec63 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -192,6 +192,13 @@ struct CPURISCVState {
>       target_ulong hgatp;
>       uint64_t htimedelta;
>   
> +    /* Upper 64-bits of 128-bit CSRs */
> +    uint64_t mtvech;
> +    uint64_t mscratchh;
> +    uint64_t mepch;
> +    uint64_t satph;
> +    uint64_t mstatush;

There's nothing defined for mstatush (except SD), so we might as well leave it out until 
there is.  The only thing required there is that we put SD in the correct place when we 
compute it from lower bits on read.

mepch and mtvech do not need extending until we extend pc.

I don't see a definition of how satph extends, and since you're not changing the rv64 
virtual memory routines nothing will examine it anyway.  Let's drop that.

Which leaves mscratchh and maybe sscratchh as the only "real" 128-bit csrs.
Which suggests that the support that you do add in the next patch does not need to be 
quite as complicated.  E.g. drop the op128 hook.


r~

