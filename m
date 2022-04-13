Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBB24FF75A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 15:03:41 +0200 (CEST)
Received: from localhost ([::1]:44040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neceq-0003UF-99
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 09:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1necbd-0001tg-Rl
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:00:23 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1necbb-0004VP-1z
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:00:21 -0400
Received: by mail-ed1-x529.google.com with SMTP id u18so2280829eda.3
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6MBYcOZoTJYZVZaNDFSJ2CTVeXDxXK84chCBPsZDojU=;
 b=WQR3n7RUV9RGUTEsyMr077fp4LIPGThbjMaxHeoNz0sk1U3iEeQxMpbR8F7cwwgkZY
 UnpoZxynCcuzyZpUkhT0R6csIhyJIxR8EfKVC3zLpaBTWCeZ+AK2VtoMplxXDbNE9t+7
 8qzChBY/A4Bcl6ehY4RLw/oe5ukeh9lealgE9xhcudIJ1coSIHHSznckcu96szolrF6R
 fleTcucjQvr1TSb5TDGY9gaIu0BH68Qhi12HXeT6cKwBuHRwmMeRnakYyOQzO8w60Y2t
 rA8nyOYuwy7XOlFVemgV+xCzG16qblXQv9KdxmcOQvWr2RZzYyLB8GGhywgYIn8PPmq1
 NPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6MBYcOZoTJYZVZaNDFSJ2CTVeXDxXK84chCBPsZDojU=;
 b=TB/BBhkLfvQuj5KzHd/a//1BCA/ZK0NSsvRuvgPBy08nykPoXQZqa+renvjxw0iol+
 ppvogU63/xTOo7oHYEAjbQmRKSrguNYnyPLjbpwQq0tPjExgY+R4I6R9UX47gUtrkrat
 AwOaiHr6sPVMBZoTCeNfFzo+WpYtcREJwburem7J2PfTnVHZxPJ3hLDhLLdlG8tc1/XA
 ZPIornESNH3lWTyE2OlcajmOBL9W2Wm5twI/uEADuFKvhR9W6wjOy+w/+T3Ank7vCMhz
 IfPlgrm3V9NorgGE9UAhTNdYvqO713oPAMgvPZfHDD1/frZKW2DR1pdZMfNHyP7vgqtr
 5NcQ==
X-Gm-Message-State: AOAM5307Log6UgR0+nGx9hoUkISdkuR2igxi3cZTbkeb4Fy3LHE3Iq5h
 NJfUXD+EX+keBgT2crWQzWq2aw==
X-Google-Smtp-Source: ABdhPJzYLfQGVoz/2QEsqUrCG88YUVV5yx8dUL9ifFbAnfGj6aqlrubRstupe0KIRJfzdP2eLvN7pQ==
X-Received: by 2002:a05:6402:51c6:b0:419:8269:f33d with SMTP id
 r6-20020a05640251c600b004198269f33dmr42748221edd.264.1649854817252; 
 Wed, 13 Apr 2022 06:00:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a056402431400b00419315cc3e2sm1178134edc.61.2022.04.13.06.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 06:00:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C790A1FFB7;
 Wed, 13 Apr 2022 14:00:14 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-20-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 11/39] tcg: Pass the locked filepointer to tcg_dump_ops
Date: Wed, 13 Apr 2022 10:08:28 +0100
In-reply-to: <20220326132534.543738-20-richard.henderson@linaro.org>
Message-ID: <87r161xhnl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We have already looked up and locked the filepointer.
> Use fprintf instead of qemu_log directly for output
> in and around tcg_dump_ops.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 109 ++++++++++++++++++++++++++----------------------------
>  1 file changed, 52 insertions(+), 57 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 892f640fce..25e987d881 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1808,7 +1808,11 @@ static inline TCGReg tcg_regset_first(TCGRegSet d)
>      }
>  }
>=20=20
> -static void tcg_dump_ops(TCGContext *s, bool have_prefs)
> +/* Return only the number of characters output -- no error return. */
> +#define ne_fprintf(...) \
> +    ({ int ret_ =3D fprintf(__VA_ARGS__); ret_ >=3D 0 ? ret_ : 0; })
> +
> +static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
>  {
>      char buf[128];
>      TCGOp *op;
> @@ -1824,7 +1828,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_p=
refs)
>=20=20
>          if (c =3D=3D INDEX_op_insn_start) {
>              nb_oargs =3D 0;
> -            col +=3D qemu_log("\n ----");
> +            col +=3D ne_fprintf(f, "\n ----");
>=20=20
>              for (i =3D 0; i < TARGET_INSN_START_WORDS; ++i) {
>                  target_ulong a;
> @@ -1833,7 +1837,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_p=
refs)
>  #else
>                  a =3D op->args[i];
>  #endif
> -                col +=3D qemu_log(" " TARGET_FMT_lx, a);
> +                col +=3D ne_fprintf(f, " " TARGET_FMT_lx, a);
>              }
>          } else if (c =3D=3D INDEX_op_call) {
>              const TCGHelperInfo *info =3D tcg_call_info(op);
> @@ -1844,7 +1848,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_p=
refs)
>              nb_iargs =3D TCGOP_CALLI(op);
>              nb_cargs =3D def->nb_cargs;
>=20=20
> -            col +=3D qemu_log(" %s ", def->name);
> +            col +=3D ne_fprintf(f, " %s ", def->name);
>=20=20
>              /*
>               * Print the function name from TCGHelperInfo, if available.
> @@ -1852,15 +1856,15 @@ static void tcg_dump_ops(TCGContext *s, bool have=
_prefs)
>               * but the actual function pointer comes from the plugin.
>               */
>              if (func =3D=3D info->func) {
> -                col +=3D qemu_log("%s", info->name);
> +                col +=3D ne_fprintf(f, "%s", info->name);
>              } else {
> -                col +=3D qemu_log("plugin(%p)", func);
> +                col +=3D ne_fprintf(f, "plugin(%p)", func);
>              }
>=20=20
> -            col +=3D qemu_log(",$0x%x,$%d", info->flags, nb_oargs);
> +            col +=3D ne_fprintf(f, ",$0x%x,$%d", info->flags, nb_oargs);
>              for (i =3D 0; i < nb_oargs; i++) {
> -                col +=3D qemu_log(",%s", tcg_get_arg_str(s, buf, sizeof(=
buf),
> -                                                       op->args[i]));
> +                col +=3D ne_fprintf(f, ",%s", tcg_get_arg_str(s, buf, si=
zeof(buf),
> +                                                            op->args[i])=
);
>              }
>              for (i =3D 0; i < nb_iargs; i++) {
>                  TCGArg arg =3D op->args[nb_oargs + i];
> @@ -1868,34 +1872,32 @@ static void tcg_dump_ops(TCGContext *s, bool have=
_prefs)
>                  if (arg !=3D TCG_CALL_DUMMY_ARG) {
>                      t =3D tcg_get_arg_str(s, buf, sizeof(buf), arg);
>                  }
> -                col +=3D qemu_log(",%s", t);
> +                col +=3D ne_fprintf(f, ",%s", t);
>              }
>          } else {
> -            col +=3D qemu_log(" %s ", def->name);
> +            col +=3D ne_fprintf(f, " %s ", def->name);
>=20=20
>              nb_oargs =3D def->nb_oargs;
>              nb_iargs =3D def->nb_iargs;
>              nb_cargs =3D def->nb_cargs;
>=20=20
>              if (def->flags & TCG_OPF_VECTOR) {
> -                col +=3D qemu_log("v%d,e%d,", 64 << TCGOP_VECL(op),
> -                                8 << TCGOP_VECE(op));
> +                col +=3D ne_fprintf(f, "v%d,e%d,", 64 << TCGOP_VECL(op),
> +                                  8 << TCGOP_VECE(op));
>              }
>=20=20
>              k =3D 0;
>              for (i =3D 0; i < nb_oargs; i++) {
> -                if (k !=3D 0) {
> -                    col +=3D qemu_log(",");
> -                }
> -                col +=3D qemu_log("%s", tcg_get_arg_str(s, buf, sizeof(b=
uf),
> -                                                      op->args[k++]));
> +                const char *sep =3D  k ? "," : "";
> +                col +=3D ne_fprintf(f, "%s%s", sep,
> +                                  tcg_get_arg_str(s, buf, sizeof(buf),
> +                                                  op->args[k++]));
>              }
>              for (i =3D 0; i < nb_iargs; i++) {
> -                if (k !=3D 0) {
> -                    col +=3D qemu_log(",");
> -                }
> -                col +=3D qemu_log("%s", tcg_get_arg_str(s, buf, sizeof(b=
uf),
> -                                                      op->args[k++]));
> +                const char *sep =3D  k ? "," : "";
> +                col +=3D ne_fprintf(f, "%s%s", sep,
> +                                  tcg_get_arg_str(s, buf, sizeof(buf),
> +                                                  op->args[k++]));
>              }
>              switch (c) {
>              case INDEX_op_brcond_i32:
> @@ -1910,9 +1912,9 @@ static void tcg_dump_ops(TCGContext *s, bool have_p=
refs)
>              case INDEX_op_cmpsel_vec:
>                  if (op->args[k] < ARRAY_SIZE(cond_name)
>                      && cond_name[op->args[k]]) {
> -                    col +=3D qemu_log(",%s", cond_name[op->args[k++]]);
> +                    col +=3D ne_fprintf(f, ",%s", cond_name[op->args[k++=
]]);
>                  } else {
> -                    col +=3D qemu_log(",$0x%" TCG_PRIlx, op->args[k++]);
> +                    col +=3D ne_fprintf(f, ",$0x%" TCG_PRIlx, op->args[k=
++]);
>                  }
>                  i =3D 1;
>                  break;
> @@ -1927,12 +1929,12 @@ static void tcg_dump_ops(TCGContext *s, bool have=
_prefs)
>                      unsigned ix =3D get_mmuidx(oi);
>=20=20
>                      if (op & ~(MO_AMASK | MO_BSWAP | MO_SSIZE)) {
> -                        col +=3D qemu_log(",$0x%x,%u", op, ix);
> +                        col +=3D ne_fprintf(f, ",$0x%x,%u", op, ix);
>                      } else {
>                          const char *s_al, *s_op;
>                          s_al =3D alignment_name[(op & MO_AMASK) >> MO_AS=
HIFT];
>                          s_op =3D ldst_name[op & (MO_BSWAP | MO_SSIZE)];
> -                        col +=3D qemu_log(",%s%s,%u", s_al, s_op, ix);
> +                        col +=3D ne_fprintf(f, ",%s%s,%u", s_al, s_op, i=
x);
>                      }
>                      i =3D 1;
>                  }
> @@ -1950,9 +1952,9 @@ static void tcg_dump_ops(TCGContext *s, bool have_p=
refs)
>                          name =3D bswap_flag_name[flags];
>                      }
>                      if (name) {
> -                        col +=3D qemu_log(",%s", name);
> +                        col +=3D ne_fprintf(f, ",%s", name);
>                      } else {
> -                        col +=3D qemu_log(",$0x%" TCG_PRIlx, flags);
> +                        col +=3D ne_fprintf(f, ",$0x%" TCG_PRIlx, flags);
>                      }
>                      i =3D k =3D 1;
>                  }
> @@ -1967,49 +1969,42 @@ static void tcg_dump_ops(TCGContext *s, bool have=
_prefs)
>              case INDEX_op_brcond_i32:
>              case INDEX_op_brcond_i64:
>              case INDEX_op_brcond2_i32:
> -                col +=3D qemu_log("%s$L%d", k ? "," : "",
> -                                arg_label(op->args[k])->id);
> +                col +=3D ne_fprintf(f, "%s$L%d", k ? "," : "",
> +                                  arg_label(op->args[k])->id);
>                  i++, k++;
>                  break;
>              default:
>                  break;
>              }
>              for (; i < nb_cargs; i++, k++) {
> -                col +=3D qemu_log("%s$0x%" TCG_PRIlx, k ? "," : "", op->=
args[k]);
> +                col +=3D ne_fprintf(f, "%s$0x%" TCG_PRIlx, k ? "," : "",
> +                                  op->args[k]);
>              }
>          }
>=20=20
>          if (have_prefs || op->life) {
> -
> -            QemuLogFile *logfile;
> -
> -            rcu_read_lock();
> -            logfile =3D qatomic_rcu_read(&qemu_logfile);
> -            if (logfile) {
> -                for (; col < 40; ++col) {
> -                    putc(' ', logfile->fd);
> -                }
> +            for (; col < 40; ++col) {
> +                putc(' ', f);
>              }
> -            rcu_read_unlock();
>          }
>=20=20
>          if (op->life) {
>              unsigned life =3D op->life;
>=20=20
>              if (life & (SYNC_ARG * 3)) {
> -                qemu_log("  sync:");
> +                ne_fprintf(f, "  sync:");
>                  for (i =3D 0; i < 2; ++i) {
>                      if (life & (SYNC_ARG << i)) {
> -                        qemu_log(" %d", i);
> +                        ne_fprintf(f, " %d", i);
>                      }
>                  }
>              }
>              life /=3D DEAD_ARG;
>              if (life) {
> -                qemu_log("  dead:");
> +                ne_fprintf(f, "  dead:");
>                  for (i =3D 0; life; ++i, life >>=3D 1) {
>                      if (life & 1) {
> -                        qemu_log(" %d", i);
> +                        ne_fprintf(f, " %d", i);
>                      }
>                  }
>              }
> @@ -2020,28 +2015,28 @@ static void tcg_dump_ops(TCGContext *s, bool have=
_prefs)
>                  TCGRegSet set =3D op->output_pref[i];
>=20=20
>                  if (i =3D=3D 0) {
> -                    qemu_log("  pref=3D");
> +                    ne_fprintf(f, "  pref=3D");
>                  } else {
> -                    qemu_log(",");
> +                    ne_fprintf(f, ",");
>                  }
>                  if (set =3D=3D 0) {
> -                    qemu_log("none");
> +                    ne_fprintf(f, "none");
>                  } else if (set =3D=3D MAKE_64BIT_MASK(0, TCG_TARGET_NB_R=
EGS)) {
> -                    qemu_log("all");
> +                    ne_fprintf(f, "all");
>  #ifdef CONFIG_DEBUG_TCG
>                  } else if (tcg_regset_single(set)) {
>                      TCGReg reg =3D tcg_regset_first(set);
> -                    qemu_log("%s", tcg_target_reg_names[reg]);
> +                    ne_fprintf(f, "%s", tcg_target_reg_names[reg]);
>  #endif
>                  } else if (TCG_TARGET_NB_REGS <=3D 32) {
> -                    qemu_log("%#x", (uint32_t)set);
> +                    ne_fprintf(f, "%#x", (uint32_t)set);
>                  } else {
> -                    qemu_log("%#" PRIx64, (uint64_t)set);
> +                    ne_fprintf(f, "%#" PRIx64, (uint64_t)set);

checkpatch saw these lines change and complains:

  ERROR: Don't use '#' flag of printf format ('%#') in format strings, use =
'0x' prefix instead

probably worth fixing up as we go.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

