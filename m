Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9F5BFE82
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:57:56 +0200 (CEST)
Received: from localhost ([::1]:41482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazIY-0006nA-N4
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayr6-0000QZ-9t
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:29:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayr4-0002Ht-S9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663763369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fy/lfeG0nEDaiNJGt7ab/wtyfS9LEo+35SdaJYP+tu0=;
 b=TjBDplp8119dtzkDkj49GexnbGdOdqaRlqzq7PLqF8/qMsMrmgFcXSiZnksMVBRFktVdmu
 CkhCdE7Xf/I+k2gk8LObXh9rNoNGHyMxvpvOF7zBtZxNGDOJWFZoIVCuMIdi427hCEmkiz
 +7RY98NE5bKTlTsqdmJaPuXgxypduLc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-_GjyqPh8N4Cxw0kId7i9xg-1; Wed, 21 Sep 2022 08:29:28 -0400
X-MC-Unique: _GjyqPh8N4Cxw0kId7i9xg-1
Received: by mail-qt1-f200.google.com with SMTP id
 u9-20020a05622a14c900b0035cc7e8cbaeso4025848qtx.19
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fy/lfeG0nEDaiNJGt7ab/wtyfS9LEo+35SdaJYP+tu0=;
 b=lxLX+xC2/PXG0PaunN96e5obkKGUOo/AMBGTL/rGb63PtOgr+LzoVV5KwQ+nzQN9tc
 Nume1cSmhDTAppv6vcs1LLnMb9DisDoKC2KufG4bG8uVIfWml+jEfVJsa2cyPdTfXoUR
 NJBwXRgF7c1OUiYTWlsYvmWu1mGvmLC6Bzdjj1um94KlOQGA+/f/+l4yEcGh1F+gFVQJ
 tAt+p2a/25jvw9oaLGgPjLN04hhTA8Pujl4FnQOj8eUSuFNcjOfklVtxdCAsV6Ehc9WY
 H2hshYjxnr8NuPwWf6gNiYrGR9YM2plNCPsIY3rmvozTE2xoxeSZl+T26smCWgZVGjrL
 1ptQ==
X-Gm-Message-State: ACrzQf0OzUsiLtcNitE5EiCvRdANUtzwhIyIDu/gj/q5Zh4DRtRZmelx
 Uh9+QDAkJWCWRS5DUz0b9LYaQQaapKdarGFLJW+oLl4Se51HMz1CNNdWPFhy/VImSq5irRk110y
 lPppgONG3aiRlJT9JWTIkqwgknDnG1s4=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr22602989qvb.17.1663763367960; 
 Wed, 21 Sep 2022 05:29:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Py5m3oHEq7Rh17ldwBo7ScDtJhx8z4Nv188bB3oFk68jJieIh3AFutE6lgPJmH2Orha6y4xl9yY65gukZUq4=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr22602974qvb.17.1663763367674; Wed, 21
 Sep 2022 05:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-15-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-15-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:29:14 +0200
Message-ID: <CABgObfaGEU_0Q9nMsDOhmyqRGpubb=L3fsWbnrRN951v6FcLxA@mail.gmail.com>
Subject: Re: [PATCH v2 14/23] target/i386: Truncate values for lcall_real to
 i32
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
> Use i32 not int or tl for eip and cs arguments.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>  target/i386/helper.h         | 2 +-
>  target/i386/tcg/seg_helper.c | 6 ++----
>  target/i386/tcg/translate.c  | 3 ++-
>  3 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/target/i386/helper.h b/target/i386/helper.h
> index ac3b4d1ee3..39a3c24182 100644
> --- a/target/i386/helper.h
> +++ b/target/i386/helper.h
> @@ -37,7 +37,7 @@ DEF_HELPER_2(lldt, void, env, int)
>  DEF_HELPER_2(ltr, void, env, int)
>  DEF_HELPER_3(load_seg, void, env, int, int)
>  DEF_HELPER_4(ljmp_protected, void, env, int, tl, tl)
> -DEF_HELPER_5(lcall_real, void, env, int, tl, int, int)
> +DEF_HELPER_5(lcall_real, void, env, i32, i32, int, i32)
>  DEF_HELPER_5(lcall_protected, void, env, int, tl, int, tl)
>  DEF_HELPER_2(iret_real, void, env, int)
>  DEF_HELPER_3(iret_protected, void, env, int, int)
> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index bffd82923f..539189b4d1 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -1504,14 +1504,12 @@ void helper_ljmp_protected(CPUX86State *env, int new_cs, target_ulong new_eip,
>  }
>
>  /* real mode call */
> -void helper_lcall_real(CPUX86State *env, int new_cs, target_ulong new_eip1,
> -                       int shift, int next_eip)
> +void helper_lcall_real(CPUX86State *env, uint32_t new_cs, uint32_t new_eip,
> +                       int shift, uint32_t next_eip)
>  {
> -    int new_eip;
>      uint32_t esp, esp_mask;
>      target_ulong ssp;
>
> -    new_eip = new_eip1;
>      esp = env->regs[R_ESP];
>      esp_mask = get_sp_mask(env->segs[R_SS].flags);
>      ssp = env->segs[R_SS].base;
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 1997f8d291..427ee72442 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5302,7 +5302,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>                                             tcg_const_tl(s->pc - s->cs_base));
>              } else {
>                  tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
> -                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
> +                tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
> +                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->tmp3_i32,
>                                        tcg_const_i32(dflag - 1),
>                                        tcg_const_i32(s->pc - s->cs_base));
>              }
> --
> 2.34.1
>


