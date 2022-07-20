Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3F57B44D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:11:48 +0200 (CEST)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE6gF-00014x-Qq
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oE6cv-0006Ql-Gr; Wed, 20 Jul 2022 06:08:21 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oE6ct-0004Mx-AC; Wed, 20 Jul 2022 06:08:21 -0400
Received: by mail-pl1-x632.google.com with SMTP id v21so14527122plo.0;
 Wed, 20 Jul 2022 03:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=uljuGDAhVM4aBMo+BCg/PZn6SnAxw/ofibypaU2ChE4=;
 b=b5eVNCK151/mfYOHOxh8uezG4vH/k/JpQWD0/Ac2Zi+bjscwSxh4HEzxlONWQkWFzZ
 644MPkFn58MgsoZk9OYpRqSvO906RwJHNWvuXIkCJqVEXoO0O4PkhfS6RnIXJElKcyjB
 Gxexsl+OBWauRuuL+Gdv3aXpA3f3l6jAVWypkNhjqqleIwb2M0lm2BG9Xjlbvaa3oMKP
 T6U+c+4nXMoycb/kBih1bpKDgTaZaoLhG4oUPU3P3e73LNnT4b7somJnlRZbyGreOHWB
 kjCEwNS/VKPloNfGXYLdSJ7F5KbQH0Yh0Y5QW1CP07VuCuhAwgB1mxo9nmiQ0/VIW99h
 QNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=uljuGDAhVM4aBMo+BCg/PZn6SnAxw/ofibypaU2ChE4=;
 b=GrgvMX03VsKs3HqLDqf60A4ESgNrGa2pfMGf9sFS8MdrihZ+OD9Azyq7TXysCt5tmf
 2O2UwR6I6pX1XuUD/6Q1aKqckytQ5DhGI5gz0K4DRxVkH9x/9Km8Uc08fWHkyDlZ/KuI
 gBcjDQqQZWEN+B9aLQM/f5dTv2MLZL1IUMzgMLntPWI+Gbzc4gdMVv1L43LIIH505xA6
 XaXxfaOy/2+MeyuoDzSHp4RZ6KDH7vD5LphrgttDngbmXxDJOhlpCZr3+Exf0Q/iZqHI
 rjKzvyzXP8Uz5jFqiV3b7S2sx7Lk16hL7sT7TzEuLoFpQ7be7RakF5u4TVL0G303AQXR
 hrNg==
X-Gm-Message-State: AJIora/1wxIxrdONP6jatCMI9yq4IQ+zbVKVS1rsImHp2x7ASEMlhedj
 Ty4eI35BdL/4GEnuGH8XosSRWhJOLbs=
X-Google-Smtp-Source: AGRyM1uFqN82aba16pX7YpaGfaqrODdo2Kc70g/sGqUz6/KkYC9cLkxFT0tzl+JzgR/9TsLkqtWnQw==
X-Received: by 2002:a17:902:ccc7:b0:16c:484f:4c69 with SMTP id
 z7-20020a170902ccc700b0016c484f4c69mr39580999ple.118.1658311696759; 
 Wed, 20 Jul 2022 03:08:16 -0700 (PDT)
Received: from localhost (27-33-251-27.static.tpgi.com.au. [27.33.251.27])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a17090a054200b001f0ade18babsm1189551pjf.55.2022.07.20.03.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 03:08:16 -0700 (PDT)
Date: Wed, 20 Jul 2022 20:08:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc: Implement new wait variants
To: qemu-ppc@nongnu.org, =?iso-8859-1?q?V=EDctor?= Colombo
 <victor.colombo@eldorado.org.br>
Cc: qemu-devel@nongnu.org
References: <20220719113843.429600-1-npiggin@gmail.com>
 <d3957528-313e-42c9-8f46-32e68267f0b6@eldorado.org.br>
In-Reply-To: <d3957528-313e-42c9-8f46-32e68267f0b6@eldorado.org.br>
MIME-Version: 1.0
Message-Id: <1658310914.f6mslzstqz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Excerpts from V=C3=ADctor Colombo's message of July 20, 2022 12:20 am:
> Hello Nicholas,
>=20
> On 19/07/2022 08:38, Nicholas Piggin wrote:
>> ISA v2.06 adds new variations of wait, specified by the WC field. These
>> are not compatible with the wait 0 implementation, because they add
>> additional conditions that cause the processor to resume, which can
>> cause software to hang or run very slowly.
>>=20
>> ISA v3.0 changed the wait opcode.
>>=20
>> ISA v3.1 added new WC values to the new wait opcode, and added a PL
>> field.
>>=20
>> This implements the new wait encoding and supports WC variants with
>> no-op implementations, which is provides basic correctness as explained.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   target/ppc/translate.c | 84 ++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 76 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 1d6daa4608..ce4aa84f1d 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -4066,12 +4066,79 @@ static void gen_sync(DisasContext *ctx)
>>   /* wait */
>>   static void gen_wait(DisasContext *ctx)
>>   {
>> -    TCGv_i32 t0 =3D tcg_const_i32(1);
>> -    tcg_gen_st_i32(t0, cpu_env,
>> -                   -offsetof(PowerPCCPU, env) + offsetof(CPUState, halt=
ed));
>> -    tcg_temp_free_i32(t0);
>> -    /* Stop translation, as the CPU is supposed to sleep from now */
>> -    gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>> +    uint32_t wc =3D (ctx->opcode >> 21) & 3;
>> +    uint32_t pl =3D (ctx->opcode >> 16) & 3;
>=20
> I think the best here would be to move this instruction to decodetree.
> However, this can be a bit of extra work and out of the scope you though
> for this patch.

Yeah you're probably right. I haven't looked into decodetree yet sorry,
if we could get this in first would be convenient.

> What do you think about adding a EXTRACT_HELPER to
> target/ppc/internal.h?

Just to avoid open coded extraction here? Probably a good idea, I'll try
it.

>> +
>> +    /* v3.0 and later use the ISA flag for wait rather than a PM flag *=
/
>> +    if (!(ctx->insns_flags2 & PPC2_PM_ISA206) &&
>> +        !(ctx->insns_flags2 & PPC2_ISA300)) {
>> +        /* wc field was introduced in ISA v2.06 */
>> +        if (wc) {
>> +            gen_invalid(ctx);
>> +            return;
>> +        }
>> +    }
>> +
>> +    if (!(ctx->insns_flags2 & PPC2_ISA310)) {
>> +        /* pl field was introduced in ISA v3.1 */
>> +        if (pl) {
>> +            gen_invalid(ctx);
>> +            return;
>> +        }
>=20
> IIUC the ISA says that "Reserved fields in instructions are ignored by
> the processor". So this check is incorrect, I guess, as we should allow
> the instruction to continue.

Hmm, I think you're right.

>> +
>> +        if (ctx->insns_flags2 & PPC2_ISA300) {
>> +            /* wc > 0 is reserved in v3.0 */
>> +            if (wc > 0) {
>=20
> This however is correct
>=20
>> +                gen_invalid(ctx);
>> +                return;
>> +            }
>> +        }
>> +    }
>> +
>> +    /* wc=3D3 is reserved and pl=3D1-3 are reserved in v3.1. */
>> +    if (wc =3D=3D 3 || pl > 0) {
>=20
> This can cause a situation where the field is reserve in a previous ISA
> and should be ignored. I think the best option is to put these checks
> inside a conditional for each different ISA. Otherwise it's getting a
> bit hard to follow what should happen in each situation.

Good idea.

>=20
>> +        gen_invalid(ctx);
>> +        return;
>> +    }
>> +
>> +    /* wait 0 waits for an exception to occur. */
>> +    if (wc =3D=3D 0) {
>> +        TCGv_i32 t0 =3D tcg_const_i32(1);
>> +        tcg_gen_st_i32(t0, cpu_env,
>> +                       -offsetof(PowerPCCPU, env) + offsetof(CPUState, =
halted));
>> +        tcg_temp_free_i32(t0);
>> +        /* Stop translation, as the CPU is supposed to sleep from now *=
/
>> +        gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>> +    }
>> +
>> +    /*
>> +     * Other wait types must not just wait until an exception occurs be=
cause
>> +     * ignoring their other wake-up conditions could cause a hang.
>> +     *
>> +     * For v2.06 and 2.07, wc=3D1,2 are architected but may be implemen=
ted as
>> +     * no-ops.
>> +     *
>> +     * wc=3D1 (waitrsv) waits for an exception or a reservation to be l=
ost.
>> +     * Reservation-loss may have implementation-specific conditions, so=
 it
>> +     * can be implemented as a no-op.
>> +     *
>> +     * wc=3D2 waits for an implementation-specific condition which coul=
d be
>> +     * always true, so it can be implemented as a no-op.
>> +     *
>> +     * For v3.1, wc=3D1,2 are architected but may be implemented as no-=
ops.
>> +     *
>> +     * wc=3D1 similarly to v2.06 and v2.07.
>> +     *
>> +     * wc=3D2 waits for an exception or an amount of time to pass. This
>> +     * amount is implementation-specific so it can be implemented as a
>> +     * no-op.
>> +     *
>> +     * ISA v3.1 does allow for execution to resume "in the rare case of
>> +     * an implementation-dependent event", so in any case software must
>> +     * not depend on the architected resumption condition to become
>> +     * true, so no-op implementations should be architecturally correct
>> +     * (if suboptimal).
>> +     */
>>   }
>>=20
>>   #if defined(TARGET_PPC64)
>> @@ -6852,8 +6919,9 @@ GEN_HANDLER2(stdcx_, "stdcx.", 0x1F, 0x16, 0x06, 0=
x00000000, PPC_64B),
>>   GEN_HANDLER_E(stqcx_, 0x1F, 0x16, 0x05, 0, PPC_NONE, PPC2_LSQ_ISA207),
>>   #endif
>>   GEN_HANDLER(sync, 0x1F, 0x16, 0x12, 0x039FF801, PPC_MEM_SYNC),
>> -GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x03FFF801, PPC_WAIT),
>> -GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA300=
),
>> +/* ISA v3.0 changed the extended opcode from 62 to 30 */
>> +GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x039FF801, PPC_WAIT),
>> +GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039CF801, PPC_NONE, PPC2_ISA300=
),
>=20
> Does this continue to work for the previous ISAs? I'm having a hard time
> testing this instruction for previous cpus, even without this patch

I don't think I tested that actually. I will.

Thanks for the review, I'll make updates and post a new vesion.

Thanks,
Nick

