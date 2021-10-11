Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54BB4296FD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:36:32 +0200 (CEST)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma0A2-0005VQ-Ah
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma088-0004ej-SL
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:34:32 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma086-0006nS-4m
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:34:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so623989pjb.4
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RxumxtBGTXYbVQS891N65Bg4u/tdz7G4UdhEfHQ0zvE=;
 b=sWGjR7DziIl5/5Ud9j791YTIREPFb/iHagMiy/1LTxWz0XheMVcFdIVRpLuwlz7qQX
 OXAkZHxqQqQd0Plpgdrg6w+2I3EGkIRDtPa8Ii7PVIlv2E/y3LzCipvw0z+lq+WNVqck
 F9GhSNMz6u0e5QM0JS96sd2ml7z5Xx/aPE7xvjtRhuJJQKgkSqEZlHJmLMaM5ng9nFxc
 5AQI0ouVpOPk/u3BWL0VTeQ35YLmzrNf+17x+yBy8qF8Bsa2+dOCb4LnJ9u+INup0TuC
 A9vUyhDGAVkoK/cVWIYyPD7DNveBkSZT2UQ+jv5YLXNqM/YfevxVSEzl+BCUB9UcNbtJ
 wgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RxumxtBGTXYbVQS891N65Bg4u/tdz7G4UdhEfHQ0zvE=;
 b=L6yxb9Q2doP3rrXRNHpgsI0LmnjxUJj/5oSqgXQlC6L792rrGdgs//PDmOQ/yzF3bZ
 igrR05CxVat58//6JM1nxlxOa30NEYNXV7Oqr5iUOEKP/Fc5BV/sLqX0sOmZK+tKs5SK
 Jy8LlzduMlt6Sf0Pt2x5zxNSwAwpbUskBV5NA7eLeOnLxNxKHCW70lehNq1LQfZdSgVW
 ehQHcqFpjtVvZqHJ8Rcj+PIXDzlVBKq4eArrl+OiVtWxIzF5lk6HUv1Pk6msdMcJHykU
 FIpPM0oZP7ZabSKapPzp5hVBz6JolYYJFTUdlpRmFXS9qMX5BXlMqlTBLyOgDo31M++Q
 b6Nw==
X-Gm-Message-State: AOAM53001c220hNVMjBe0JoJbKyyBlQnsHk2dNYzpu5DaIwRMbQR8m6q
 s28DDDdC3hMURQTGFLSo/d1YZQ==
X-Google-Smtp-Source: ABdhPJzARBejLc2ph7ILXgT3hDjUrIwF19JmkaljwXWoRqqwbNTlhgX1VFIz2pJlOaUmMPgXD1PYRw==
X-Received: by 2002:a17:90b:4b03:: with SMTP id
 lx3mr678164pjb.162.1633977268442; 
 Mon, 11 Oct 2021 11:34:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z17sm8627376pfa.148.2021.10.11.11.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 11:34:27 -0700 (PDT)
Subject: Re: [RFC PATCH] target/s390x: move tcg_gen_insn_start to
 s390x_tr_insn_start
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211011155729.3222362-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a67b397-813d-b34a-22fd-ee480dc6809b@linaro.org>
Date: Mon, 11 Oct 2021 11:34:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155729.3222362-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 8:57 AM, Alex Bennée wrote:
> We use INDEX_op_insn_start to make the start of instruction
> boundaries. If we don't do it in the .insn_start hook things get
> confused especially now plugins want to use that marking to identify
> the start of instructions and will bomb out if it sees instrumented
> ops before the first instruction boundary.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 25 ++++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index f284870cd2..fe145ff2eb 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6380,9 +6380,6 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>       /* Search for the insn in the table.  */
>       insn = extract_insn(env, s);
>   
> -    /* Emit insn_start now that we know the ILEN.  */
> -    tcg_gen_insn_start(s->base.pc_next, s->cc_op, s->ilen);
> -
>       /* Not found means unimplemented/illegal opcode.  */
>       if (insn == NULL) {
>           qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
> @@ -6550,8 +6547,30 @@ static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
>   {
>   }
>   
> +/*
> + * We just enough partial instruction decoding here to calculate the
> + * length of the instruction so we can drop the INDEX_op_insn_start
> + * before anything else is emitted in the TCGOp stream.
> + *
> + * See extract_insn for the full decode.
> + */
>   static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>   {
> +    CPUS390XState *env = cs->env_ptr;
> +    DisasContext *s = container_of(dcbase, DisasContext, base);
> +    uint64_t insn, pc = s->base.pc_next;
> +    int op, ilen;
> +
> +    if (unlikely(s->ex_value)) {
> +        ilen = s->ex_value & 0xf;
> +    } else {
> +        insn = ld_code2(env, s, pc);  /* FIXME: don't reload same pc twice */

I think we might as well delay the set of ilen until after the normal load, rather than 
introduce a fixme.

r~

> +        op = (insn >> 8) & 0xff;
> +        ilen = get_ilen(op);
> +    }
> +
> +    /* Emit insn_start now that we know the ILEN.  */
> +    tcg_gen_insn_start(s->base.pc_next, s->cc_op, ilen);
>   }
>   
>   static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
> 


