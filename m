Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654C5BFDD0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:28:37 +0200 (CEST)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oayqB-0006z7-Sj
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayYO-0007lE-4m
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayYK-0006NI-Fe
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663762207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cQuh9HmEgWD9z6oHsFFu/JC+IlRdjXLUBl5tt5zj67k=;
 b=NsRGdyvP52kzCj6tLfCgzS6kzH8r8qhFrChAUxeiZxhjGvm7OyJ48SXuwZBBE1+aoBSgtj
 IS14Twdy4WBoXYqlH8/lS3EDH7pFKsAa8pjNfeVdkmLHT6T+6/UjXB1Rb2BNrPyyyizn4R
 ylSrRwcc0TiT+W0uhcVFlwaAUbkfAPE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-xvwrffjDMzaqsGkpKMJJUg-1; Wed, 21 Sep 2022 08:10:06 -0400
X-MC-Unique: xvwrffjDMzaqsGkpKMJJUg-1
Received: by mail-qk1-f200.google.com with SMTP id
 de16-20020a05620a371000b006ceb92bc740so4107179qkb.15
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cQuh9HmEgWD9z6oHsFFu/JC+IlRdjXLUBl5tt5zj67k=;
 b=brg6m0TXlsnWUEvs+jcM+HZku2HqoReKC+k+fLsdUtF646sXhjcxZ1eCS88CWTzk4V
 g4q643AI+7lk0lgIqdb+2GbNTVhgJ/O6Sd6Cnf4/wEKv6SagHO/2jrYE+EfZhbJtwW2s
 5p/2BmLZzE5PJJQakktJ7qWjGQXj3otJ2aqYdBYaQ2Juoo36Dug8fO5gAcWvvhlglEaZ
 wcnTHp04oTMRrW7ARtepKDiJ575MOIy3sCaueHeGQHSNzPRqd+uRgABdf5dntKk2QosU
 0FaqmLQwvowMh8z0LzLbFFADT8pdOM68N7z70y1m1wh8SvwGVnINbfecl4rLgjWFD8ev
 z2Ag==
X-Gm-Message-State: ACrzQf1JzUDiRqq4ZpgF57NBNYJjanIF+XMgoeF7mthY7v+rlDVMtJMC
 x1nPDVjsJsIyPEGOTMvSOCh2W6VrIDVkU8Df4q4OuK5NPmQdBdZrraV/8pXgczYQeKWF/T8chzc
 aBSPIFdqcQjQUOenBftTnR1RA5AUnrus=
X-Received: by 2002:a05:620a:3725:b0:6ce:e7b3:d8e4 with SMTP id
 de37-20020a05620a372500b006cee7b3d8e4mr13337092qkb.144.1663762205861; 
 Wed, 21 Sep 2022 05:10:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4POU44yvpTMonI1vQggdXFSnwM3Nd/UnrRcegxp5ny6aXnut9Pt54knFxp04mtQZhYDDSrHPkLLk8k+baR46U=
X-Received: by 2002:a05:620a:3725:b0:6ce:e7b3:d8e4 with SMTP id
 de37-20020a05620a372500b006cee7b3d8e4mr13337069qkb.144.1663762205601; Wed, 21
 Sep 2022 05:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-9-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-9-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:09:54 +0200
Message-ID: <CABgObfYn2kW=KG50rggUUaaNdrpVgvdWDZ=nW5k70dRAXU-8iQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] target/i386: Use DISAS_EOB* in gen_movl_seg_T0
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
>
> Set is_jmp properly in gen_movl_seg_T0, so that the callers
> need to nothing special.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>  target/i386/tcg/translate.c | 36 +++++-------------------------------
>  1 file changed, 5 insertions(+), 31 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 778ee4ed4c..ea35d3e9b4 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -2432,13 +2432,15 @@ static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
>             because ss32 may change. For R_SS, translation must always
>             stop as a special handling must be done to disable hardware
>             interrupts for the next instruction */
> -        if (seg_reg == R_SS || (CODE32(s) && seg_reg < R_FS)) {
> -            s->base.is_jmp = DISAS_TOO_MANY;
> +        if (seg_reg == R_SS) {
> +            s->base.is_jmp = DISAS_EOB_INHIBIT_IRQ;
> +        } else if (CODE32(s) && seg_reg < R_FS) {
> +            s->base.is_jmp = DISAS_EOB_NEXT;
>          }
>      } else {
>          gen_op_movl_seg_T0_vm(s, seg_reg);
>          if (seg_reg == R_SS) {
> -            s->base.is_jmp = DISAS_TOO_MANY;
> +            s->base.is_jmp = DISAS_EOB_INHIBIT_IRQ;
>          }
>      }
>  }
> @@ -5682,26 +5684,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          ot = gen_pop_T0(s);
>          gen_movl_seg_T0(s, reg);
>          gen_pop_update(s, ot);
> -        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
> -        if (s->base.is_jmp) {
> -            gen_update_eip_next(s);
> -            if (reg == R_SS) {
> -                s->flags &= ~HF_TF_MASK;
> -                gen_eob_inhibit_irq(s, true);
> -            } else {
> -                gen_eob(s);
> -            }
> -        }
>          break;
>      case 0x1a1: /* pop fs */
>      case 0x1a9: /* pop gs */
>          ot = gen_pop_T0(s);
>          gen_movl_seg_T0(s, (b >> 3) & 7);
>          gen_pop_update(s, ot);
> -        if (s->base.is_jmp) {
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> -        }
>          break;
>
>          /**************************/
> @@ -5748,16 +5736,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              goto illegal_op;
>          gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
>          gen_movl_seg_T0(s, reg);
> -        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
> -        if (s->base.is_jmp) {
> -            gen_update_eip_next(s);
> -            if (reg == R_SS) {
> -                s->flags &= ~HF_TF_MASK;
> -                gen_eob_inhibit_irq(s, true);
> -            } else {
> -                gen_eob(s);
> -            }
> -        }
>          break;
>      case 0x8c: /* mov Gv, seg */
>          modrm = x86_ldub_code(env, s);
> @@ -5956,10 +5934,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          gen_movl_seg_T0(s, op);
>          /* then put the data */
>          gen_op_mov_reg_v(s, ot, reg, s->T1);
> -        if (s->base.is_jmp) {
> -            gen_update_eip_next(s);
> -            gen_eob(s);
> -        }
>          break;
>
>          /************************/
> --
> 2.34.1
>


