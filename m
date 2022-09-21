Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A25BFEFA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:33:34 +0200 (CEST)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazr2-0000Wm-Lt
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaz02-00074s-De
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayzz-0003tz-Ha
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663763923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yEKpWRD0ZRKg6ntLTY8DlFuG4iH0Ll2+2jQ1BF2tDu8=;
 b=DLpiuWHme9vgmUU4UdL6TT9C6qsEozdezP1qOxxwf2H7qU3T9Z8lORZgB9+CYqYHMr2X3q
 WavOCo4QJuz5puTGl3AGgJziwGzDYXN0dnwMdXm5KXBoxt6uB77So+ScnonCkdQSpuIiux
 ZeclJR8YmPqtvEXB1y/892U4GmxUdaA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-RWwStDuwP0SyEqnJSDzBVA-1; Wed, 21 Sep 2022 08:38:36 -0400
X-MC-Unique: RWwStDuwP0SyEqnJSDzBVA-1
Received: by mail-qt1-f198.google.com with SMTP id
 e8-20020ac85988000000b0035c39dd5eb9so4043624qte.16
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yEKpWRD0ZRKg6ntLTY8DlFuG4iH0Ll2+2jQ1BF2tDu8=;
 b=ciHOg+3wPD3I6RL9kVpdMJEfSk9l1ZrUzTEkjg9nPEvV1/ur3Cw0eiV4FvTTedMCkE
 BIjI4+jV5kd9LgD64Yb8L0GD5BBJi6UgPdKAwT8FwLEBOyz3DvXFOv7kApzCQDjozAch
 KyArDMSYVY3BO4xcFmHVgkVXyL9bCmQ/swSrV72644N606A6G2HxDp1EwWQ5zdPPilBW
 DsJuOOT4mH9toGUcufpoNxD936zkS8+UwWH4S/qSVWhx31EONf6qbCFOQLzyW9Iw8wjP
 9hgtaHefuByDWR8Cskco2o9RCqXXyFSaLRqAbXIHPhlKU57C9AmingQwBKKXNNwpWFBN
 Sx4A==
X-Gm-Message-State: ACrzQf1HMy9cSut7mR+VPxrSDrzC6tNzZZEcLg+QcZBCC4pjvRj/Cgvd
 D29l8K2aKtLRrt8qTgnjrCExJlcgKJIjp4kQJTqwWYxfqnWObnyNQmav46Rec9hF3aVMLNAn74W
 2e9PnidTZXi5SPeTWtlB7y/8w6v6w58Q=
X-Received: by 2002:a0c:a90a:0:b0:4ad:715:897 with SMTP id
 y10-20020a0ca90a000000b004ad07150897mr22853503qva.114.1663763915361; 
 Wed, 21 Sep 2022 05:38:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7U8ct2OMZ5q+s1qVbAy37psgx6b30eEW9VLkeb1j0IHthWlR2veCtbjSkKuDPq+7gQ8/iK0x8CR9L81vDd6Qo=
X-Received: by 2002:a0c:a90a:0:b0:4ad:715:897 with SMTP id
 y10-20020a0ca90a000000b004ad07150897mr22853488qva.114.1663763915036; 
 Wed, 21 Sep 2022 05:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-17-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-17-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:38:24 +0200
Message-ID: <CABgObfbEuWvH5qg08+qNqsteYRJ6z242QynSm4zHPiP=ZDDG3w@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] target/i386: Use DISAS_TOO_MANY to exit after
 gen_io_start
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
> We can set is_jmp early, using only one if, and let that
> be overwritten by gen_repz_* etc.

Perhaps "be overwritten by gen_rep*'s calls to gen_jmp_rel". Code-wise,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/translate.c | 42 +++++++++----------------------------
>  1 file changed, 10 insertions(+), 32 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 527fb79895..cedc195837 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5605,14 +5605,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              }
>              if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>                  gen_io_start();
> +                s->base.is_jmp = DISAS_TOO_MANY;
>              }
>              gen_helper_rdrand(s->T0, cpu_env);
>              rm = (modrm & 7) | REX_B(s);
>              gen_op_mov_reg_v(s, dflag, rm, s->T0);
>              set_cc_op(s, CC_OP_EFLAGS);
> -            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -                gen_jmp(s, s->pc - s->cs_base);
> -            }
>              break;
>
>          default:
> @@ -6658,15 +6656,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> +            s->base.is_jmp = DISAS_TOO_MANY;
>          }
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
>              gen_repz_ins(s, ot);
> -            /* jump generated by gen_repz_ins */
>          } else {
>              gen_ins(s, ot);
> -            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -                gen_jmp(s, s->pc - s->cs_base);
> -            }
>          }
>          break;
>      case 0x6e: /* outsS */
> @@ -6679,15 +6674,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> +            s->base.is_jmp = DISAS_TOO_MANY;
>          }
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
>              gen_repz_outs(s, ot);
> -            /* jump generated by gen_repz_outs */
>          } else {
>              gen_outs(s, ot);
> -            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -                gen_jmp(s, s->pc - s->cs_base);
> -            }
>          }
>          break;
>
> @@ -6704,13 +6696,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> +            s->base.is_jmp = DISAS_TOO_MANY;
>          }
>          gen_helper_in_func(ot, s->T1, s->tmp2_i32);
>          gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
>          gen_bpt_io(s, s->tmp2_i32, ot);
> -        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -            gen_jmp(s, s->pc - s->cs_base);
> -        }
>          break;
>      case 0xe6:
>      case 0xe7:
> @@ -6722,14 +6712,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> +            s->base.is_jmp = DISAS_TOO_MANY;
>          }
>          gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
>          tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
>          gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
>          gen_bpt_io(s, s->tmp2_i32, ot);
> -        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -            gen_jmp(s, s->pc - s->cs_base);
> -        }
>          break;
>      case 0xec:
>      case 0xed:
> @@ -6741,13 +6729,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> +            s->base.is_jmp = DISAS_TOO_MANY;
>          }
>          gen_helper_in_func(ot, s->T1, s->tmp2_i32);
>          gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
>          gen_bpt_io(s, s->tmp2_i32, ot);
> -        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -            gen_jmp(s, s->pc - s->cs_base);
> -        }
>          break;
>      case 0xee:
>      case 0xef:
> @@ -6759,14 +6745,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> +            s->base.is_jmp = DISAS_TOO_MANY;
>          }
>          gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
>          tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
>          gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
>          gen_bpt_io(s, s->tmp2_i32, ot);
> -        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -            gen_jmp(s, s->pc - s->cs_base);
> -        }
>          break;
>
>          /************************/
> @@ -7432,11 +7416,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>          gen_update_eip_cur(s);
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> +            s->base.is_jmp = DISAS_TOO_MANY;
>          }
>          gen_helper_rdtsc(cpu_env);
> -        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -            gen_jmp(s, s->pc - s->cs_base);
> -        }
>          break;
>      case 0x133: /* rdpmc */
>          gen_update_cc_op(s);
> @@ -7893,11 +7875,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_update_eip_cur(s);
>              if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>                  gen_io_start();
> +                s->base.is_jmp = DISAS_TOO_MANY;
>              }
>              gen_helper_rdtscp(cpu_env);
> -            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -                gen_jmp(s, s->pc - s->cs_base);
> -            }
>              break;
>
>          default:
> @@ -8261,6 +8241,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
> +            s->base.is_jmp = DISAS_TOO_MANY;
>          }
>          if (b & 2) {
>              gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
> @@ -8271,9 +8252,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>              gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
>              gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
>              gen_op_mov_reg_v(s, ot, rm, s->T0);
> -            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
> -                gen_jmp(s, s->pc - s->cs_base);
> -            }
>          }
>          break;
>
> --
> 2.34.1
>


