Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321D386B23
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 22:17:54 +0200 (CEST)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijgW-0002lO-W0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 16:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lijfC-0001yH-Dd
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lijf4-0003Af-2n
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621282580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CsHn7isVN8/B3MOWGXVTzyyNnzJc4dsqM4UnU3NSnaM=;
 b=gJEXj5bViJSDRYQbEtuRsw+iA4RjhTMOAhfZDASZzFAXyym6vbGuSpNJ/4h2/E5s+0EUBo
 v1BieXn4yhncyP4UyaA1YzpQo54vWLZANpoTbl7yAbJvquT7SpYq9KqDq+kGI+mDegwLbq
 hXW/Wd8G+xxnC50R4eZGlHiddUnkuQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-ZfhmuE7cMeKhU2-6LK0BjA-1; Mon, 17 May 2021 16:16:18 -0400
X-MC-Unique: ZfhmuE7cMeKhU2-6LK0BjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9127501ED;
 Mon, 17 May 2021 20:16:17 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B6CF10074EF;
 Mon, 17 May 2021 20:16:17 +0000 (UTC)
Date: Mon, 17 May 2021 16:16:16 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Ziqiao Kong <ziqiaokong@gmail.com>
Subject: Re: [PATCH v4 1/2] target/i386: Trivial code motion
Message-ID: <20210517201616.szvgx5xygbgwwhz6@habkost.net>
References: <20210507080055.258563-1-ziqiaokong@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210507080055.258563-1-ziqiaokong@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 07, 2021 at 04:00:56PM +0800, Ziqiao Kong wrote:
> Move the float translation case to a new block by a new pair of braces.

If you are just adding braces around the code, do you really need
to reindent all the code?  I don't see any mention of `switch`
statements on style.rst, but I see 235 existing cases where the
brackets are aligned below the `c` in `case`.

In either case, I'm looking for a description of "why", not
"what", but I couldn't find it.  Why are the braces necessary or
useful here?

> 
> Fix some coding style problem for the old code.
> 
> Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
> ---
>  VERSION                     |   2 +-
>  target/i386/tcg/translate.c | 953 ++++++++++++++++++------------------
>  2 files changed, 481 insertions(+), 474 deletions(-)
> 
> diff --git a/VERSION b/VERSION
> index e479d55a5e..09b254e90c 100644
> --- a/VERSION
> +++ b/VERSION
> @@ -1 +1 @@
> -5.2.95
> +6.0.0
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 880bc45561..52e94fe106 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5838,503 +5838,510 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>          /************************/
>          /* floats */
>      case 0xd8 ... 0xdf:
> -        if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
> -            /* if CR0.EM or CR0.TS are set, generate an FPU exception */
> -            /* XXX: what to do if illegal op ? */
> -            gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
> -            break;
> -        }
> -        modrm = x86_ldub_code(env, s);
> -        mod = (modrm >> 6) & 3;
> -        rm = modrm & 7;
> -        op = ((b & 7) << 3) | ((modrm >> 3) & 7);
> -        if (mod != 3) {
> -            /* memory op */
> -            gen_lea_modrm(env, s, modrm);
> -            switch(op) {
> -            case 0x00 ... 0x07: /* fxxxs */
> -            case 0x10 ... 0x17: /* fixxxl */
> -            case 0x20 ... 0x27: /* fxxxl */
> -            case 0x30 ... 0x37: /* fixxx */
> -                {
> -                    int op1;
> -                    op1 = op & 7;
> -
> -                    switch(op >> 4) {
> -                    case 0:
> -                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LEUL);
> -                        gen_helper_flds_FT0(cpu_env, s->tmp2_i32);
> -                        break;
> -                    case 1:
> -                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LEUL);
> -                        gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
> -                        break;
> -                    case 2:
> -                        tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
> -                                            s->mem_index, MO_LEQ);
> -                        gen_helper_fldl_FT0(cpu_env, s->tmp1_i64);
> -                        break;
> -                    case 3:
> -                    default:
> -                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LESW);
> -                        gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
> -                        break;
> -                    }
> -
> -                    gen_helper_fp_arith_ST0_FT0(op1);
> -                    if (op1 == 3) {
> -                        /* fcomp needs pop */
> -                        gen_helper_fpop(cpu_env);
> -                    }
> -                }
> +        {
> +            if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
> +                /* if CR0.EM or CR0.TS are set, generate an FPU exception */
> +                /* XXX: what to do if illegal op ? */
> +                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
>                  break;
> -            case 0x08: /* flds */
> -            case 0x0a: /* fsts */
> -            case 0x0b: /* fstps */
> -            case 0x18 ... 0x1b: /* fildl, fisttpl, fistl, fistpl */
> -            case 0x28 ... 0x2b: /* fldl, fisttpll, fstl, fstpl */
> -            case 0x38 ... 0x3b: /* filds, fisttps, fists, fistps */
> -                switch(op & 7) {
> -                case 0:
> -                    switch(op >> 4) {
> -                    case 0:
> -                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LEUL);
> -                        gen_helper_flds_ST0(cpu_env, s->tmp2_i32);
> -                        break;
> -                    case 1:
> -                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LEUL);
> -                        gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
> -                        break;
> -                    case 2:
> -                        tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
> -                                            s->mem_index, MO_LEQ);
> -                        gen_helper_fldl_ST0(cpu_env, s->tmp1_i64);
> -                        break;
> -                    case 3:
> -                    default:
> -                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LESW);
> -                        gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
> -                        break;
> -                    }
> -                    break;
> -                case 1:
> -                    /* XXX: the corresponding CPUID bit must be tested ! */
> -                    switch(op >> 4) {
> -                    case 1:
> -                        gen_helper_fisttl_ST0(s->tmp2_i32, cpu_env);
> -                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LEUL);
> -                        break;
> -                    case 2:
> -                        gen_helper_fisttll_ST0(s->tmp1_i64, cpu_env);
> -                        tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
> -                                            s->mem_index, MO_LEQ);
> -                        break;
> -                    case 3:
> -                    default:
> -                        gen_helper_fistt_ST0(s->tmp2_i32, cpu_env);
> -                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LEUW);
> -                        break;
> -                    }
> -                    gen_helper_fpop(cpu_env);
> -                    break;
> -                default:
> -                    switch(op >> 4) {
> -                    case 0:
> -                        gen_helper_fsts_ST0(s->tmp2_i32, cpu_env);
> -                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LEUL);
> -                        break;
> -                    case 1:
> -                        gen_helper_fistl_ST0(s->tmp2_i32, cpu_env);
> -                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LEUL);
> -                        break;
> -                    case 2:
> -                        gen_helper_fstl_ST0(s->tmp1_i64, cpu_env);
> -                        tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
> -                                            s->mem_index, MO_LEQ);
> -                        break;
> -                    case 3:
> -                    default:
> -                        gen_helper_fist_ST0(s->tmp2_i32, cpu_env);
> -                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> -                                            s->mem_index, MO_LEUW);
> -                        break;
> -                    }
> -                    if ((op & 7) == 3)
> -                        gen_helper_fpop(cpu_env);
> -                    break;
> -                }
> -                break;
> -            case 0x0c: /* fldenv mem */
> -                gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> -                break;
> -            case 0x0d: /* fldcw mem */
> -                tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> -                                    s->mem_index, MO_LEUW);
> -                gen_helper_fldcw(cpu_env, s->tmp2_i32);
> -                break;
> -            case 0x0e: /* fnstenv mem */
> -                gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> -                break;
> -            case 0x0f: /* fnstcw mem */
> -                gen_helper_fnstcw(s->tmp2_i32, cpu_env);
> -                tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> -                                    s->mem_index, MO_LEUW);
> -                break;
> -            case 0x1d: /* fldt mem */
> -                gen_helper_fldt_ST0(cpu_env, s->A0);
> -                break;
> -            case 0x1f: /* fstpt mem */
> -                gen_helper_fstt_ST0(cpu_env, s->A0);
> -                gen_helper_fpop(cpu_env);
> -                break;
> -            case 0x2c: /* frstor mem */
> -                gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> -                break;
> -            case 0x2e: /* fnsave mem */
> -                gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> -                break;
> -            case 0x2f: /* fnstsw mem */
> -                gen_helper_fnstsw(s->tmp2_i32, cpu_env);
> -                tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> -                                    s->mem_index, MO_LEUW);
> -                break;
> -            case 0x3c: /* fbld */
> -                gen_helper_fbld_ST0(cpu_env, s->A0);
> -                break;
> -            case 0x3e: /* fbstp */
> -                gen_helper_fbst_ST0(cpu_env, s->A0);
> -                gen_helper_fpop(cpu_env);
> -                break;
> -            case 0x3d: /* fildll */
> -                tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEQ);
> -                gen_helper_fildll_ST0(cpu_env, s->tmp1_i64);
> -                break;
> -            case 0x3f: /* fistpll */
> -                gen_helper_fistll_ST0(s->tmp1_i64, cpu_env);
> -                tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEQ);
> -                gen_helper_fpop(cpu_env);
> -                break;
> -            default:
> -                goto unknown_op;
>              }
> -        } else {
> -            /* register float ops */
> -            opreg = rm;
> +            modrm = x86_ldub_code(env, s);
> +            mod = (modrm >> 6) & 3;
> +            rm = modrm & 7;
> +            op = ((b & 7) << 3) | ((modrm >> 3) & 7);
> +            if (mod != 3) {
> +                /* memory op */
> +                gen_lea_modrm(env, s, modrm);
> +                switch (op) {
> +                case 0x00 ... 0x07: /* fxxxs */
> +                case 0x10 ... 0x17: /* fixxxl */
> +                case 0x20 ... 0x27: /* fxxxl */
> +                case 0x30 ... 0x37: /* fixxx */
> +                    {
> +                        int op1;
> +                        op1 = op & 7;
>  
> -            switch(op) {
> -            case 0x08: /* fld sti */
> -                gen_helper_fpush(cpu_env);
> -                gen_helper_fmov_ST0_STN(cpu_env,
> -                                        tcg_const_i32((opreg + 1) & 7));
> -                break;
> -            case 0x09: /* fxchg sti */
> -            case 0x29: /* fxchg4 sti, undocumented op */
> -            case 0x39: /* fxchg7 sti, undocumented op */
> -                gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
> -                break;
> -            case 0x0a: /* grp d9/2 */
> -                switch(rm) {
> -                case 0: /* fnop */
> -                    /* check exceptions (FreeBSD FPU probe) */
> -                    gen_helper_fwait(cpu_env);
> -                    break;
> -                default:
> -                    goto unknown_op;
> -                }
> -                break;
> -            case 0x0c: /* grp d9/4 */
> -                switch(rm) {
> -                case 0: /* fchs */
> -                    gen_helper_fchs_ST0(cpu_env);
> -                    break;
> -                case 1: /* fabs */
> -                    gen_helper_fabs_ST0(cpu_env);
> -                    break;
> -                case 4: /* ftst */
> -                    gen_helper_fldz_FT0(cpu_env);
> -                    gen_helper_fcom_ST0_FT0(cpu_env);
> -                    break;
> -                case 5: /* fxam */
> -                    gen_helper_fxam_ST0(cpu_env);
> -                    break;
> -                default:
> -                    goto unknown_op;
> -                }
> -                break;
> -            case 0x0d: /* grp d9/5 */
> -                {
> -                    switch(rm) {
> -                    case 0:
> -                        gen_helper_fpush(cpu_env);
> -                        gen_helper_fld1_ST0(cpu_env);
> -                        break;
> -                    case 1:
> -                        gen_helper_fpush(cpu_env);
> -                        gen_helper_fldl2t_ST0(cpu_env);
> -                        break;
> -                    case 2:
> -                        gen_helper_fpush(cpu_env);
> -                        gen_helper_fldl2e_ST0(cpu_env);
> -                        break;
> -                    case 3:
> -                        gen_helper_fpush(cpu_env);
> -                        gen_helper_fldpi_ST0(cpu_env);
> -                        break;
> -                    case 4:
> -                        gen_helper_fpush(cpu_env);
> -                        gen_helper_fldlg2_ST0(cpu_env);
> -                        break;
> -                    case 5:
> -                        gen_helper_fpush(cpu_env);
> -                        gen_helper_fldln2_ST0(cpu_env);
> -                        break;
> -                    case 6:
> -                        gen_helper_fpush(cpu_env);
> -                        gen_helper_fldz_ST0(cpu_env);
> -                        break;
> -                    default:
> -                        goto unknown_op;
> -                    }
> -                }
> -                break;
> -            case 0x0e: /* grp d9/6 */
> -                switch(rm) {
> -                case 0: /* f2xm1 */
> -                    gen_helper_f2xm1(cpu_env);
> -                    break;
> -                case 1: /* fyl2x */
> -                    gen_helper_fyl2x(cpu_env);
> -                    break;
> -                case 2: /* fptan */
> -                    gen_helper_fptan(cpu_env);
> -                    break;
> -                case 3: /* fpatan */
> -                    gen_helper_fpatan(cpu_env);
> -                    break;
> -                case 4: /* fxtract */
> -                    gen_helper_fxtract(cpu_env);
> -                    break;
> -                case 5: /* fprem1 */
> -                    gen_helper_fprem1(cpu_env);
> -                    break;
> -                case 6: /* fdecstp */
> -                    gen_helper_fdecstp(cpu_env);
> -                    break;
> -                default:
> -                case 7: /* fincstp */
> -                    gen_helper_fincstp(cpu_env);
> -                    break;
> -                }
> -                break;
> -            case 0x0f: /* grp d9/7 */
> -                switch(rm) {
> -                case 0: /* fprem */
> -                    gen_helper_fprem(cpu_env);
> -                    break;
> -                case 1: /* fyl2xp1 */
> -                    gen_helper_fyl2xp1(cpu_env);
> -                    break;
> -                case 2: /* fsqrt */
> -                    gen_helper_fsqrt(cpu_env);
> -                    break;
> -                case 3: /* fsincos */
> -                    gen_helper_fsincos(cpu_env);
> -                    break;
> -                case 5: /* fscale */
> -                    gen_helper_fscale(cpu_env);
> -                    break;
> -                case 4: /* frndint */
> -                    gen_helper_frndint(cpu_env);
> -                    break;
> -                case 6: /* fsin */
> -                    gen_helper_fsin(cpu_env);
> -                    break;
> -                default:
> -                case 7: /* fcos */
> -                    gen_helper_fcos(cpu_env);
> -                    break;
> -                }
> -                break;
> -            case 0x00: case 0x01: case 0x04 ... 0x07: /* fxxx st, sti */
> -            case 0x20: case 0x21: case 0x24 ... 0x27: /* fxxx sti, st */
> -            case 0x30: case 0x31: case 0x34 ... 0x37: /* fxxxp sti, st */
> -                {
> -                    int op1;
> +                        switch (op >> 4) {
> +                        case 0:
> +                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LEUL);
> +                            gen_helper_flds_FT0(cpu_env, s->tmp2_i32);
> +                            break;
> +                        case 1:
> +                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LEUL);
> +                            gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
> +                            break;
> +                        case 2:
> +                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
> +                                                s->mem_index, MO_LEQ);
> +                            gen_helper_fldl_FT0(cpu_env, s->tmp1_i64);
> +                            break;
> +                        case 3:
> +                        default:
> +                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LESW);
> +                            gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
> +                            break;
> +                        }
>  
> -                    op1 = op & 7;
> -                    if (op >= 0x20) {
> -                        gen_helper_fp_arith_STN_ST0(op1, opreg);
> -                        if (op >= 0x30)
> -                            gen_helper_fpop(cpu_env);
> -                    } else {
> -                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
>                          gen_helper_fp_arith_ST0_FT0(op1);
> +                        if (op1 == 3) {
> +                            /* fcomp needs pop */
> +                            gen_helper_fpop(cpu_env);
> +                        }
>                      }
> -                }
> -                break;
> -            case 0x02: /* fcom */
> -            case 0x22: /* fcom2, undocumented op */
> -                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fcom_ST0_FT0(cpu_env);
> -                break;
> -            case 0x03: /* fcomp */
> -            case 0x23: /* fcomp3, undocumented op */
> -            case 0x32: /* fcomp5, undocumented op */
> -                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fcom_ST0_FT0(cpu_env);
> -                gen_helper_fpop(cpu_env);
> -                break;
> -            case 0x15: /* da/5 */
> -                switch(rm) {
> -                case 1: /* fucompp */
> -                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
> -                    gen_helper_fucom_ST0_FT0(cpu_env);
> -                    gen_helper_fpop(cpu_env);
> -                    gen_helper_fpop(cpu_env);
>                      break;
> -                default:
> -                    goto unknown_op;
> -                }
> -                break;
> -            case 0x1c:
> -                switch(rm) {
> -                case 0: /* feni (287 only, just do nop here) */
> +                case 0x08: /* flds */
> +                case 0x0a: /* fsts */
> +                case 0x0b: /* fstps */
> +                case 0x18 ... 0x1b: /* fildl, fisttpl, fistl, fistpl */
> +                case 0x28 ... 0x2b: /* fldl, fisttpll, fstl, fstpl */
> +                case 0x38 ... 0x3b: /* filds, fisttps, fists, fistps */
> +                    switch (op & 7) {
> +                    case 0:
> +                        switch (op >> 4) {
> +                        case 0:
> +                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LEUL);
> +                            gen_helper_flds_ST0(cpu_env, s->tmp2_i32);
> +                            break;
> +                        case 1:
> +                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LEUL);
> +                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
> +                            break;
> +                        case 2:
> +                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
> +                                                s->mem_index, MO_LEQ);
> +                            gen_helper_fldl_ST0(cpu_env, s->tmp1_i64);
> +                            break;
> +                        case 3:
> +                        default:
> +                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LESW);
> +                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
> +                            break;
> +                        }
> +                        break;
> +                    case 1:
> +                        /* XXX: the corresponding CPUID bit must be tested ! */
> +                        switch (op >> 4) {
> +                        case 1:
> +                            gen_helper_fisttl_ST0(s->tmp2_i32, cpu_env);
> +                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LEUL);
> +                            break;
> +                        case 2:
> +                            gen_helper_fisttll_ST0(s->tmp1_i64, cpu_env);
> +                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
> +                                                s->mem_index, MO_LEQ);
> +                            break;
> +                        case 3:
> +                        default:
> +                            gen_helper_fistt_ST0(s->tmp2_i32, cpu_env);
> +                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LEUW);
> +                            break;
> +                        }
> +                        gen_helper_fpop(cpu_env);
> +                        break;
> +                    default:
> +                        switch (op >> 4) {
> +                        case 0:
> +                            gen_helper_fsts_ST0(s->tmp2_i32, cpu_env);
> +                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LEUL);
> +                            break;
> +                        case 1:
> +                            gen_helper_fistl_ST0(s->tmp2_i32, cpu_env);
> +                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LEUL);
> +                            break;
> +                        case 2:
> +                            gen_helper_fstl_ST0(s->tmp1_i64, cpu_env);
> +                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
> +                                                s->mem_index, MO_LEQ);
> +                            break;
> +                        case 3:
> +                        default:
> +                            gen_helper_fist_ST0(s->tmp2_i32, cpu_env);
> +                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> +                                                s->mem_index, MO_LEUW);
> +                            break;
> +                        }
> +                        if ((op & 7) == 3) {
> +                            gen_helper_fpop(cpu_env);
> +                        }
> +                        break;
> +                    }
>                      break;
> -                case 1: /* fdisi (287 only, just do nop here) */
> +                case 0x0c: /* fldenv mem */
> +                    gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
>                      break;
> -                case 2: /* fclex */
> -                    gen_helper_fclex(cpu_env);
> +                case 0x0d: /* fldcw mem */
> +                    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
> +                                        s->mem_index, MO_LEUW);
> +                    gen_helper_fldcw(cpu_env, s->tmp2_i32);
>                      break;
> -                case 3: /* fninit */
> -                    gen_helper_fninit(cpu_env);
> +                case 0x0e: /* fnstenv mem */
> +                    gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
>                      break;
> -                case 4: /* fsetpm (287 only, just do nop here) */
> +                case 0x0f: /* fnstcw mem */
> +                    gen_helper_fnstcw(s->tmp2_i32, cpu_env);
> +                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> +                                        s->mem_index, MO_LEUW);
>                      break;
> -                default:
> -                    goto unknown_op;
> -                }
> -                break;
> -            case 0x1d: /* fucomi */
> -                if (!(s->cpuid_features & CPUID_CMOV)) {
> -                    goto illegal_op;
> -                }
> -                gen_update_cc_op(s);
> -                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fucomi_ST0_FT0(cpu_env);
> -                set_cc_op(s, CC_OP_EFLAGS);
> -                break;
> -            case 0x1e: /* fcomi */
> -                if (!(s->cpuid_features & CPUID_CMOV)) {
> -                    goto illegal_op;
> -                }
> -                gen_update_cc_op(s);
> -                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fcomi_ST0_FT0(cpu_env);
> -                set_cc_op(s, CC_OP_EFLAGS);
> -                break;
> -            case 0x28: /* ffree sti */
> -                gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
> -                break;
> -            case 0x2a: /* fst sti */
> -                gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
> -                break;
> -            case 0x2b: /* fstp sti */
> -            case 0x0b: /* fstp1 sti, undocumented op */
> -            case 0x3a: /* fstp8 sti, undocumented op */
> -            case 0x3b: /* fstp9 sti, undocumented op */
> -                gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fpop(cpu_env);
> -                break;
> -            case 0x2c: /* fucom st(i) */
> -                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fucom_ST0_FT0(cpu_env);
> -                break;
> -            case 0x2d: /* fucomp st(i) */
> -                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fucom_ST0_FT0(cpu_env);
> -                gen_helper_fpop(cpu_env);
> -                break;
> -            case 0x33: /* de/3 */
> -                switch(rm) {
> -                case 1: /* fcompp */
> -                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
> -                    gen_helper_fcom_ST0_FT0(cpu_env);
> -                    gen_helper_fpop(cpu_env);
> +                case 0x1d: /* fldt mem */
> +                    gen_helper_fldt_ST0(cpu_env, s->A0);
> +                    break;
> +                case 0x1f: /* fstpt mem */
> +                    gen_helper_fstt_ST0(cpu_env, s->A0);
>                      gen_helper_fpop(cpu_env);
>                      break;
> -                default:
> -                    goto unknown_op;
> -                }
> -                break;
> -            case 0x38: /* ffreep sti, undocumented op */
> -                gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fpop(cpu_env);
> -                break;
> -            case 0x3c: /* df/4 */
> -                switch(rm) {
> -                case 0:
> +                case 0x2c: /* frstor mem */
> +                    gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> +                    break;
> +                case 0x2e: /* fnsave mem */
> +                    gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(dflag - 1));
> +                    break;
> +                case 0x2f: /* fnstsw mem */
>                      gen_helper_fnstsw(s->tmp2_i32, cpu_env);
> -                    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
> -                    gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
> +                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
> +                                        s->mem_index, MO_LEUW);
> +                    break;
> +                case 0x3c: /* fbld */
> +                    gen_helper_fbld_ST0(cpu_env, s->A0);
> +                    break;
> +                case 0x3e: /* fbstp */
> +                    gen_helper_fbst_ST0(cpu_env, s->A0);
> +                    gen_helper_fpop(cpu_env);
> +                    break;
> +                case 0x3d: /* fildll */
> +                    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
> +                                        s->mem_index, MO_LEQ);
> +                    gen_helper_fildll_ST0(cpu_env, s->tmp1_i64);
> +                    break;
> +                case 0x3f: /* fistpll */
> +                    gen_helper_fistll_ST0(s->tmp1_i64, cpu_env);
> +                    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
> +                                        s->mem_index, MO_LEQ);
> +                    gen_helper_fpop(cpu_env);
>                      break;
>                  default:
>                      goto unknown_op;
>                  }
> -                break;
> -            case 0x3d: /* fucomip */
> -                if (!(s->cpuid_features & CPUID_CMOV)) {
> -                    goto illegal_op;
> -                }
> -                gen_update_cc_op(s);
> -                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fucomi_ST0_FT0(cpu_env);
> -                gen_helper_fpop(cpu_env);
> -                set_cc_op(s, CC_OP_EFLAGS);
> -                break;
> -            case 0x3e: /* fcomip */
> -                if (!(s->cpuid_features & CPUID_CMOV)) {
> -                    goto illegal_op;
> -                }
> -                gen_update_cc_op(s);
> -                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> -                gen_helper_fcomi_ST0_FT0(cpu_env);
> -                gen_helper_fpop(cpu_env);
> -                set_cc_op(s, CC_OP_EFLAGS);
> -                break;
> -            case 0x10 ... 0x13: /* fcmovxx */
> -            case 0x18 ... 0x1b:
> -                {
> -                    int op1;
> -                    TCGLabel *l1;
> -                    static const uint8_t fcmov_cc[8] = {
> -                        (JCC_B << 1),
> -                        (JCC_Z << 1),
> -                        (JCC_BE << 1),
> -                        (JCC_P << 1),
> -                    };
> +            } else {
> +                /* register float ops */
> +                opreg = rm;
> +
> +                switch (op) {
> +                case 0x08: /* fld sti */
> +                    gen_helper_fpush(cpu_env);
> +                    gen_helper_fmov_ST0_STN(cpu_env,
> +                                            tcg_const_i32((opreg + 1) & 7));
> +                    break;
> +                case 0x09: /* fxchg sti */
> +                case 0x29: /* fxchg4 sti, undocumented op */
> +                case 0x39: /* fxchg7 sti, undocumented op */
> +                    gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
> +                    break;
> +                case 0x0a: /* grp d9/2 */
> +                    switch (rm) {
> +                    case 0: /* fnop */
> +                        /* check exceptions (FreeBSD FPU probe) */
> +                        gen_helper_fwait(cpu_env);
> +                        break;
> +                    default:
> +                        goto unknown_op;
> +                    }
> +                    break;
> +                case 0x0c: /* grp d9/4 */
> +                    switch (rm) {
> +                    case 0: /* fchs */
> +                        gen_helper_fchs_ST0(cpu_env);
> +                        break;
> +                    case 1: /* fabs */
> +                        gen_helper_fabs_ST0(cpu_env);
> +                        break;
> +                    case 4: /* ftst */
> +                        gen_helper_fldz_FT0(cpu_env);
> +                        gen_helper_fcom_ST0_FT0(cpu_env);
> +                        break;
> +                    case 5: /* fxam */
> +                        gen_helper_fxam_ST0(cpu_env);
> +                        break;
> +                    default:
> +                        goto unknown_op;
> +                    }
> +                    break;
> +                case 0x0d: /* grp d9/5 */
> +                    {
> +                        switch (rm) {
> +                        case 0:
> +                            gen_helper_fpush(cpu_env);
> +                            gen_helper_fld1_ST0(cpu_env);
> +                            break;
> +                        case 1:
> +                            gen_helper_fpush(cpu_env);
> +                            gen_helper_fldl2t_ST0(cpu_env);
> +                            break;
> +                        case 2:
> +                            gen_helper_fpush(cpu_env);
> +                            gen_helper_fldl2e_ST0(cpu_env);
> +                            break;
> +                        case 3:
> +                            gen_helper_fpush(cpu_env);
> +                            gen_helper_fldpi_ST0(cpu_env);
> +                            break;
> +                        case 4:
> +                            gen_helper_fpush(cpu_env);
> +                            gen_helper_fldlg2_ST0(cpu_env);
> +                            break;
> +                        case 5:
> +                            gen_helper_fpush(cpu_env);
> +                            gen_helper_fldln2_ST0(cpu_env);
> +                            break;
> +                        case 6:
> +                            gen_helper_fpush(cpu_env);
> +                            gen_helper_fldz_ST0(cpu_env);
> +                            break;
> +                        default:
> +                            goto unknown_op;
> +                        }
> +                    }
> +                    break;
> +                case 0x0e: /* grp d9/6 */
> +                    switch (rm) {
> +                    case 0: /* f2xm1 */
> +                        gen_helper_f2xm1(cpu_env);
> +                        break;
> +                    case 1: /* fyl2x */
> +                        gen_helper_fyl2x(cpu_env);
> +                        break;
> +                    case 2: /* fptan */
> +                        gen_helper_fptan(cpu_env);
> +                        break;
> +                    case 3: /* fpatan */
> +                        gen_helper_fpatan(cpu_env);
> +                        break;
> +                    case 4: /* fxtract */
> +                        gen_helper_fxtract(cpu_env);
> +                        break;
> +                    case 5: /* fprem1 */
> +                        gen_helper_fprem1(cpu_env);
> +                        break;
> +                    case 6: /* fdecstp */
> +                        gen_helper_fdecstp(cpu_env);
> +                        break;
> +                    default:
> +                    case 7: /* fincstp */
> +                        gen_helper_fincstp(cpu_env);
> +                        break;
> +                    }
> +                    break;
> +                case 0x0f: /* grp d9/7 */
> +                    switch (rm) {
> +                    case 0: /* fprem */
> +                        gen_helper_fprem(cpu_env);
> +                        break;
> +                    case 1: /* fyl2xp1 */
> +                        gen_helper_fyl2xp1(cpu_env);
> +                        break;
> +                    case 2: /* fsqrt */
> +                        gen_helper_fsqrt(cpu_env);
> +                        break;
> +                    case 3: /* fsincos */
> +                        gen_helper_fsincos(cpu_env);
> +                        break;
> +                    case 5: /* fscale */
> +                        gen_helper_fscale(cpu_env);
> +                        break;
> +                    case 4: /* frndint */
> +                        gen_helper_frndint(cpu_env);
> +                        break;
> +                    case 6: /* fsin */
> +                        gen_helper_fsin(cpu_env);
> +                        break;
> +                    default:
> +                    case 7: /* fcos */
> +                        gen_helper_fcos(cpu_env);
> +                        break;
> +                    }
> +                    break;
> +                case 0x00: case 0x01: case 0x04 ... 0x07: /* fxxx st, sti */
> +                case 0x20: case 0x21: case 0x24 ... 0x27: /* fxxx sti, st */
> +                case 0x30: case 0x31: case 0x34 ... 0x37: /* fxxxp sti, st */
> +                    {
> +                        int op1;
>  
> +                        op1 = op & 7;
> +                        if (op >= 0x20) {
> +                            gen_helper_fp_arith_STN_ST0(op1, opreg);
> +                            if (op >= 0x30) {
> +                                gen_helper_fpop(cpu_env);
> +                            }
> +                        } else {
> +                            gen_helper_fmov_FT0_STN(cpu_env,
> +                                                    tcg_const_i32(opreg));
> +                            gen_helper_fp_arith_ST0_FT0(op1);
> +                        }
> +                    }
> +                    break;
> +                case 0x02: /* fcom */
> +                case 0x22: /* fcom2, undocumented op */
> +                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fcom_ST0_FT0(cpu_env);
> +                    break;
> +                case 0x03: /* fcomp */
> +                case 0x23: /* fcomp3, undocumented op */
> +                case 0x32: /* fcomp5, undocumented op */
> +                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fcom_ST0_FT0(cpu_env);
> +                    gen_helper_fpop(cpu_env);
> +                    break;
> +                case 0x15: /* da/5 */
> +                    switch (rm) {
> +                    case 1: /* fucompp */
> +                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
> +                        gen_helper_fucom_ST0_FT0(cpu_env);
> +                        gen_helper_fpop(cpu_env);
> +                        gen_helper_fpop(cpu_env);
> +                        break;
> +                    default:
> +                        goto unknown_op;
> +                    }
> +                    break;
> +                case 0x1c:
> +                    switch (rm) {
> +                    case 0: /* feni (287 only, just do nop here) */
> +                        break;
> +                    case 1: /* fdisi (287 only, just do nop here) */
> +                        break;
> +                    case 2: /* fclex */
> +                        gen_helper_fclex(cpu_env);
> +                        break;
> +                    case 3: /* fninit */
> +                        gen_helper_fninit(cpu_env);
> +                        break;
> +                    case 4: /* fsetpm (287 only, just do nop here) */
> +                        break;
> +                    default:
> +                        goto unknown_op;
> +                    }
> +                    break;
> +                case 0x1d: /* fucomi */
>                      if (!(s->cpuid_features & CPUID_CMOV)) {
>                          goto illegal_op;
>                      }
> -                    op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
> -                    l1 = gen_new_label();
> -                    gen_jcc1_noeob(s, op1, l1);
> -                    gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
> -                    gen_set_label(l1);
> +                    gen_update_cc_op(s);
> +                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fucomi_ST0_FT0(cpu_env);
> +                    set_cc_op(s, CC_OP_EFLAGS);
> +                    break;
> +                case 0x1e: /* fcomi */
> +                    if (!(s->cpuid_features & CPUID_CMOV)) {
> +                        goto illegal_op;
> +                    }
> +                    gen_update_cc_op(s);
> +                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fcomi_ST0_FT0(cpu_env);
> +                    set_cc_op(s, CC_OP_EFLAGS);
> +                    break;
> +                case 0x28: /* ffree sti */
> +                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
> +                    break;
> +                case 0x2a: /* fst sti */
> +                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
> +                    break;
> +                case 0x2b: /* fstp sti */
> +                case 0x0b: /* fstp1 sti, undocumented op */
> +                case 0x3a: /* fstp8 sti, undocumented op */
> +                case 0x3b: /* fstp9 sti, undocumented op */
> +                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fpop(cpu_env);
> +                    break;
> +                case 0x2c: /* fucom st(i) */
> +                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fucom_ST0_FT0(cpu_env);
> +                    break;
> +                case 0x2d: /* fucomp st(i) */
> +                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fucom_ST0_FT0(cpu_env);
> +                    gen_helper_fpop(cpu_env);
> +                    break;
> +                case 0x33: /* de/3 */
> +                    switch (rm) {
> +                    case 1: /* fcompp */
> +                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
> +                        gen_helper_fcom_ST0_FT0(cpu_env);
> +                        gen_helper_fpop(cpu_env);
> +                        gen_helper_fpop(cpu_env);
> +                        break;
> +                    default:
> +                        goto unknown_op;
> +                    }
> +                    break;
> +                case 0x38: /* ffreep sti, undocumented op */
> +                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fpop(cpu_env);
> +                    break;
> +                case 0x3c: /* df/4 */
> +                    switch (rm) {
> +                    case 0:
> +                        gen_helper_fnstsw(s->tmp2_i32, cpu_env);
> +                        tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
> +                        gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
> +                        break;
> +                    default:
> +                        goto unknown_op;
> +                    }
> +                    break;
> +                case 0x3d: /* fucomip */
> +                    if (!(s->cpuid_features & CPUID_CMOV)) {
> +                        goto illegal_op;
> +                    }
> +                    gen_update_cc_op(s);
> +                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fucomi_ST0_FT0(cpu_env);
> +                    gen_helper_fpop(cpu_env);
> +                    set_cc_op(s, CC_OP_EFLAGS);
> +                    break;
> +                case 0x3e: /* fcomip */
> +                    if (!(s->cpuid_features & CPUID_CMOV)) {
> +                        goto illegal_op;
> +                    }
> +                    gen_update_cc_op(s);
> +                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
> +                    gen_helper_fcomi_ST0_FT0(cpu_env);
> +                    gen_helper_fpop(cpu_env);
> +                    set_cc_op(s, CC_OP_EFLAGS);
> +                    break;
> +                case 0x10 ... 0x13: /* fcmovxx */
> +                case 0x18 ... 0x1b:
> +                    {
> +                        int op1;
> +                        TCGLabel *l1;
> +                        static const uint8_t fcmov_cc[8] = {
> +                            (JCC_B << 1),
> +                            (JCC_Z << 1),
> +                            (JCC_BE << 1),
> +                            (JCC_P << 1),
> +                        };
> +
> +                        if (!(s->cpuid_features & CPUID_CMOV)) {
> +                            goto illegal_op;
> +                        }
> +                        op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
> +                        l1 = gen_new_label();
> +                        gen_jcc1_noeob(s, op1, l1);
> +                        gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
> +                        gen_set_label(l1);
> +                    }
> +                    break;
> +                default:
> +                    goto unknown_op;
>                  }
> -                break;
> -            default:
> -                goto unknown_op;
>              }
>          }
>          break;
> -- 
> 2.25.1
> 

-- 
Eduardo


