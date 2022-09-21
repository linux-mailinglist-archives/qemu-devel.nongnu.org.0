Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DBD5BFF21
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:47:47 +0200 (CEST)
Received: from localhost ([::1]:35756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob04n-00081O-Sh
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazUB-0000vv-0O
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazU8-0001br-UN
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663765792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=phpo7srLS6NG5as2rpsuXfh4HpxPxQJLoWkYJv56wGY=;
 b=HMfjIt1fF6OvtdkuelqaGAwpjYlNntP21fQ7QDkT81X/fVp898NvV7jXvq4/H/2B6zYpjJ
 ufiKyP6zZBXju8ZHxy+7cdxTdw7NdeZ+BrYuSj/qec46wcR5mrjNwHKbCP+5fa2FyuYnmn
 GUyG6ruUogIz6wSG0CrCmfdNSjkIqJA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-4xxjkFr4Nvu3PQ3Xvxb_Tw-1; Wed, 21 Sep 2022 09:09:51 -0400
X-MC-Unique: 4xxjkFr4Nvu3PQ3Xvxb_Tw-1
Received: by mail-qk1-f198.google.com with SMTP id
 w10-20020a05620a444a00b006ce9917ea1fso4204404qkp.16
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=phpo7srLS6NG5as2rpsuXfh4HpxPxQJLoWkYJv56wGY=;
 b=1M9FLaef/jOQYGpfyINXVmduTVsNm7+5NVcpqRJ3QRS7XaNhIvgSo9zKE774uqepQ2
 vxXP6ZBJ8+DqrrQrfjT+gda24h6gxnXzAaz0RnL5UWPTDGioWIKmaziyM9c87IgVVx1c
 K+RMuaHiNslrAdIZjSY4/bXdzF/sz1Tt6VM+L3NFSF1uH7zfjw0IXT/5znCKWs79T4t1
 28PejKpFFxfFV0GytFm+gi+U6ttMDlXEx+hB9eJyxzJ4hc//uJ6iTHAOEaewomGiABiT
 MXxVQMZ18e7nJSFiHoUcLcKqI8f+SsUyfOSKssyRFBi6gwXkv1s0qpNkFllw326dgiCe
 C4IQ==
X-Gm-Message-State: ACrzQf06JgSJCJd8fgdcbEK8kJVCXpQN5JQHzGqZ1vqkaFVefYiwNGSq
 MV5RB/YWvKUZdMvB/KtjMA8GeOGNTrPehlHPktQx7CecMzvPiLUMr3Z5LZhdy4OFuk6FM23faDi
 TTa0GzuYMNg6V40xoQN9oM3btiU2Ody8=
X-Received: by 2002:a05:6214:20e2:b0:4ac:b9a6:17be with SMTP id
 2-20020a05621420e200b004acb9a617bemr22559482qvk.104.1663765790239; 
 Wed, 21 Sep 2022 06:09:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5VmLi6r5M6n8l0dPvyjR0SdDPnmXAXiCa/ane2CitVpwvpNxr8NOfkUx/+zeZvztgoeXgYbTy7UZmuUjFuRi8=
X-Received: by 2002:a05:6214:20e2:b0:4ac:b9a6:17be with SMTP id
 2-20020a05621420e200b004acb9a617bemr22559460qvk.104.1663765790002; Wed, 21
 Sep 2022 06:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-20-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-20-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 15:09:39 +0200
Message-ID: <CABgObfa3RE3o6cfUk-7qagubCcxUO7J3sFfp63O5z08-RQHBiQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/23] target/i386: Use gen_jmp_rel for gen_jcc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> -static inline void gen_jcc(DisasContext *s, int b,
> -                           target_ulong val, target_ulong next_eip)
> +static void gen_jcc(DisasContext *s, MemOp ot, int b, int diff)
>  {
> -    TCGLabel *l1, *l2;
> +    TCGLabel *l1 = gen_new_label();
>
> -    if (s->jmp_opt) {
> -        l1 = gen_new_label();
> -        gen_jcc1(s, b, l1);
> -
> -        gen_goto_tb(s, 0, next_eip);
> -
> -        gen_set_label(l1);
> -        gen_goto_tb(s, 1, val);
> -    } else {
> -        l1 = gen_new_label();
> -        l2 = gen_new_label();
> -        gen_jcc1(s, b, l1);
> -
> -        gen_jmp_im(s, next_eip);
> -        tcg_gen_br(l2);
> -
> -        gen_set_label(l1);
> -        gen_jmp_im(s, val);
> -        gen_set_label(l2);
> -        gen_eob(s);
> -    }
> +    gen_jcc1(s, b, l1);
> +    gen_jmp_rel(s, ot, 0, 1);
> +    gen_set_label(l1);
> +    gen_jmp_rel(s, ot, diff, 0);

Might be worth a comment that jumps with 16-bit operand size truncate
EIP even if the jump is not taken.

Otherwise,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

>  }
>
>  static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
> @@ -4721,7 +4703,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>      int shift;
>      MemOp ot, aflag, dflag;
>      int modrm, reg, rm, mod, op, opreg, val;
> -    target_ulong next_eip, tval;
>      bool orig_cc_op_dirty = s->cc_op_dirty;
>      CCOp orig_cc_op = s->cc_op;
>
> @@ -6881,22 +6862,20 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          break;
>      case 0x70 ... 0x7f: /* jcc Jb */
> -        tval = (int8_t)insn_get(env, s, MO_8);
> -        goto do_jcc;
> +        {
> +            int diff = (int8_t)insn_get(env, s, MO_8);
> +            gen_bnd_jmp(s);
> +            gen_jcc(s, dflag, b, diff);
> +        }
> +        break;
>      case 0x180 ... 0x18f: /* jcc Jv */
> -        if (dflag != MO_16) {
> -            tval = (int32_t)insn_get(env, s, MO_32);
> -        } else {
> -            tval = (int16_t)insn_get(env, s, MO_16);
> +        {
> +            int diff = (dflag != MO_16
> +                        ? (int32_t)insn_get(env, s, MO_32)
> +                        : (int16_t)insn_get(env, s, MO_16));
> +            gen_bnd_jmp(s);
> +            gen_jcc(s, dflag, b, diff);
>          }
> -    do_jcc:
> -        next_eip = s->pc - s->cs_base;
> -        tval += next_eip;
> -        if (dflag == MO_16) {
> -            tval &= 0xffff;
> -        }
> -        gen_bnd_jmp(s);
> -        gen_jcc(s, b, tval, next_eip);
>          break;
>
>      case 0x190 ... 0x19f: /* setcc Gv */
> --
> 2.34.1
>


