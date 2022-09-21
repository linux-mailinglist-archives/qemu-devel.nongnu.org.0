Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28AC5BFF8B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:07:55 +0200 (CEST)
Received: from localhost ([::1]:47248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0OI-0003bn-Up
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazVK-0001t0-CR
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazVI-000233-EW
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663765862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6qfdDAGCzG04eJQY4vMbZbQk1P/pIswjTBTjkDt8T/A=;
 b=jH0iVCeoeaCwfggVAwdcFGBsvXQ22qHE5uJlXPj9HrlLsgXp2Ldm8lR89S7/Tdo6KfVVMI
 B7BKy97qnvEKdYbQdy4cQxbL2lngpxg8gHPeKY/R6XypeKBTZuWmDaTiEXjdw+serd3/PI
 J5YiYW7LM7YXjQxmMz09OeBTz7eTZyM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-MgcuTa05O1eersfbHOzkXA-1; Wed, 21 Sep 2022 09:10:58 -0400
X-MC-Unique: MgcuTa05O1eersfbHOzkXA-1
Received: by mail-qt1-f198.google.com with SMTP id
 b10-20020ac8540a000000b0035ba387b0d1so4112388qtq.15
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6qfdDAGCzG04eJQY4vMbZbQk1P/pIswjTBTjkDt8T/A=;
 b=vXGlVzoA7MAK+jkoBSdbz1pqApqfdMfPWGrziw1x8b9o7Zyt5Aq95wk6P0DC5QPABo
 jbLVPlBtgU42ZAqISOzPFPetkzawnm3wwuM2YepI1j+XtX/HxJ0OinHM61hN0OxhCQY+
 Sf+hmeGzBi35zXjoq6wiKWwqEal8z9nNRqObSNZerOP1amylujGmj5h/tV+GFQsp0Sou
 iiXYKTa8gp3IIPan+NS50/iMTnRpGaqWbhGd+VqSweBx3Td5OML2iwlgSLEFptWSW2+A
 4WDG6TU/o3r0Lv+udCzWvAQdY2FDUNGk1BxXrP3mCDGV4VATvAeaFJ84+pL0KnGDxdpz
 qKNA==
X-Gm-Message-State: ACrzQf0p/V2fpicQCnpqcrX+wssQ8FOQ1jDgfaK4k6bZDND2uiIRsMyI
 TEc7SidqYzx/APPfhQEgcwOZER+6QgzSuBbDmCAb4wa/wlUWSSTnSUXtbMVtiuRUSTObPizl5I/
 PVoAfwZH9JoArKX9lGpGdlAMhenP5NtY=
X-Received: by 2002:a37:503:0:b0:6ce:8a8e:7625 with SMTP id
 3-20020a370503000000b006ce8a8e7625mr19723354qkf.288.1663765857684; 
 Wed, 21 Sep 2022 06:10:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7BfTF9l7pwES8nrZyk5bVnhKQYFhdNiN0s93PY1/VpF/JU/l7JAEEa8IyFUmznUDIi5dXXLVHRAhM5nPThuHU=
X-Received: by 2002:a37:503:0:b0:6ce:8a8e:7625 with SMTP id
 3-20020a370503000000b006ce8a8e7625mr19723330qkf.288.1663765857383; Wed, 21
 Sep 2022 06:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-21-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-21-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 15:10:46 +0200
Message-ID: <CABgObfa6Ovq9JJmA1ER9YERVGn9Vz-SkX0xUeLsuvTx+CAAv2A@mail.gmail.com>
Subject: Re: [PATCH v2 20/23] target/i386: Use gen_jmp_rel for gen_repz*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
> Subtract cur_insn_len to restart the current insn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I wouldn't mind squashing this with the jecxz/loop patch (and the
review comments there apply here too).

Paolo

> ---
>  target/i386/tcg/translate.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index e27f36e4e9..7a9e533c6e 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -224,7 +224,6 @@ STUB_HELPER(wrmsr, TCGv_env env)
>
>  static void gen_eob(DisasContext *s);
>  static void gen_jr(DisasContext *s);
> -static void gen_jmp(DisasContext *s, target_ulong eip);
>  static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
>  static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
>  static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
> @@ -1277,7 +1276,7 @@ static void gen_repz(DisasContext *s, MemOp ot,
>      if (s->repz_opt) {
>          gen_op_jz_ecx(s, s->aflag, l2);
>      }
> -    gen_jmp(s, s->base.pc_next - s->cs_base);
> +    gen_jmp_rel(s, MO_32, -cur_insn_len(s), 0);
>  }
>
>  #define GEN_REPZ(op) \
> @@ -1297,7 +1296,7 @@ static void gen_repz2(DisasContext *s, MemOp ot, int nz,
>      if (s->repz_opt) {
>          gen_op_jz_ecx(s, s->aflag, l2);
>      }
> -    gen_jmp(s, s->base.pc_next - s->cs_base);
> +    gen_jmp_rel(s, MO_32, -cur_insn_len(s), 0);
>  }
>
>  #define GEN_REPZ2(op) \
> @@ -2751,11 +2750,6 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
>      gen_jmp_tb(s, dest, tb_num);
>  }
>
> -static void gen_jmp(DisasContext *s, target_ulong eip)
> -{
> -    gen_jmp_tb(s, eip, 0);
> -}
> -
>  static inline void gen_ldq_env_A0(DisasContext *s, int offset)
>  {
>      tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
> --
> 2.34.1
>


