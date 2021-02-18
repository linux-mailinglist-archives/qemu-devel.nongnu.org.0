Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF431E875
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:25:32 +0100 (CET)
Received: from localhost ([::1]:53620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgV1-0007rp-2k
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lCgTg-0007Ra-M1
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 05:24:08 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lCgTd-00072z-Dm
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 05:24:08 -0500
Received: by mail-lf1-x12f.google.com with SMTP id w36so5708924lfu.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 02:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bqdwgFevJp2gC4eHw/KjnoFjlEhpZvAVk5ywJewWpmg=;
 b=Rkpn4MM4X1gRczMnvnLIGL1vJXYM8fCh9JAvXARktXAFEePZSeUHHmdVeAVK45SE6z
 nyKaBSOx611z7U3mfvCEi8EjuLwey2gRjT+kRKOwnRyybKfbbFeznZ5e8D7VHlOoC97h
 N2WGuirOHKFFiDxCQAC9PD0EwgashyEcimGl7yRv7bEnFmKdE7CPUYI8YYcsT06huIVO
 zak1Nv/OhLeNljwAFboWCi6OnDaoprkRr+ZDLIeSLLCnH8GcM4xccHMaXFodihGGjksx
 1SDthrU5dU6ZdlgbCeqbuFZYNHp0hNTd/YrnUdYIJlwP22lMdOj5xvSfBOWyr5xCPYur
 16YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bqdwgFevJp2gC4eHw/KjnoFjlEhpZvAVk5ywJewWpmg=;
 b=ddti8Fid10UE9zoT+MAvjEApYOEXyALLso2tX4vSlPRFGdu/g/64F6r8VmR0+TvhJe
 4DRW9+Vu3I0LK2WZG/JcrUt1DNToC9s4SZcSGQYMJqmb/XKz8qKA96q1fMe811A5qnHR
 6wqRmIembGVT0jC0AVI036g4qghqg1BfTPMvHTrIdobNGxZJGuY7K8owBt9YjGvL2tFk
 d4d1FbwAN89ML7BE/gIj02LBWWzVkWGMXWrTi1fxDPnEvU943ijBrgUD+g5TfqY2gcxu
 f931z6xnsCUv2vz5iXy3zAdR5QbCtMo+U+bR2x/RDdvhaFXmEOn6VJ9w+vEjuIxlht2K
 5Psw==
X-Gm-Message-State: AOAM533nb5EDQOQ+IyMXY6t2bLn2GhlcODWIYwC9JyGmVHd1dISdfTHF
 Rvsz+ekuzAzA0JXf/EjUowk=
X-Google-Smtp-Source: ABdhPJy/4TvInhsmLm08763TCjLn1KLLGWUSj9boW6nBT8j2duXYfurhAIQybZh+wHeGwO+3QgSetA==
X-Received: by 2002:a05:6512:332a:: with SMTP id
 l10mr2125626lfe.165.1613643842343; 
 Thu, 18 Feb 2021 02:24:02 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id l15sm556307lfg.272.2021.02.18.02.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 02:24:01 -0800 (PST)
Date: Thu, 18 Feb 2021 11:24:00 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefan =?iso-8859-1?Q?Sandstr=F6m?= <Stefan.Sandstrom@axis.com>
Subject: Re: [PATCH] Correct CRIS TCG register lifetime management
Message-ID: <20210218102400.GP477672@toto>
References: <A13A6E43-EEAF-4781-87E1-3295F698A85C@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A13A6E43-EEAF-4781-87E1-3295F698A85C@axis.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 08:56:43AM +0000, Stefan Sandström wrote:
> From: Stefan Sandstrom <stefans@axis.com>
> 
> Add and fix deallocation of temporary TCG registers in CRIS code
> generation.

Thanks Stefan,

Unfortunately, this patch does not apply. I'm not sure why.
Perhaps it got corrupted by the email systems along the way.

git am -s ~/Mail/stefan.sandstrom
Applying: Correct CRIS TCG register lifetime management
error: corrupt patch at line 11
Patch failed at 0001 Correct CRIS TCG register lifetime management
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.40.0.2.32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted

How did you send out the patch? Can you try git-send-email?

Best regards,
Edgar



> 
> Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc
> Signed-off-by: Stefan Sandstrom <stefans@axis.com>
> ---
> target/cris/translate.c         | 146 ++++++++++++++++++++++++++++++----------
> target/cris/translate_v10.c.inc |  70 ++++++++++++-------
> 2 files changed, 156 insertions(+), 60 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index c893f87..ae903a5 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -177,9 +177,13 @@ static inline void t_gen_mov_TN_preg(TCGv tn, int r)
> {
>     assert(r >= 0 && r <= 15);
>     if (r == PR_BZ || r == PR_WZ || r == PR_DZ) {
> -        tcg_gen_mov_tl(tn, tcg_const_tl(0));
> +        TCGv c0 = tcg_const_tl(0);
> +        tcg_gen_mov_tl(tn, c0);
> +        tcg_temp_free(c0);
>     } else if (r == PR_VR) {
> -        tcg_gen_mov_tl(tn, tcg_const_tl(32));
> +        TCGv c32 = tcg_const_tl(32);
> +        tcg_gen_mov_tl(tn, c32);
> +        tcg_temp_free(c32);
>     } else {
>         tcg_gen_mov_tl(tn, cpu_PR[r]);
>     }
> @@ -255,8 +259,10 @@ static int cris_fetch(CPUCRISState *env, DisasContext *dc, uint32_t addr,
> 
> static void cris_lock_irq(DisasContext *dc)
> {
> +    TCGv c1 = tcg_const_tl(1);
>     dc->clear_locked_irq = 0;
> -    t_gen_mov_env_TN(locked_irq, tcg_const_tl(1));
> +    t_gen_mov_env_TN(locked_irq, c1);
> +    tcg_temp_free(c1);
> }
> 
> static inline void t_gen_raise_exception(uint32_t index)
> @@ -885,8 +891,10 @@ static void gen_tst_cc (DisasContext *dc, TCGv cc, int cond)
>     case CC_EQ:
>         if ((arith_opt || move_opt)
>                 && dc->cc_x_uptodate != (2 | X_FLAG)) {
> +            TCGv c0 = tcg_const_tl(0);
>             tcg_gen_setcond_tl(TCG_COND_EQ, cc,
> -                    cc_result, tcg_const_tl(0));
> +                    cc_result, c0);
> +            tcg_temp_free(c0);
>         } else {
>             cris_evaluate_flags(dc);
>             tcg_gen_andi_tl(cc,
> @@ -1330,14 +1338,17 @@ static int dec_addoq(CPUCRISState *env, DisasContext *dc)
> }
> static int dec_addq(CPUCRISState *env, DisasContext *dc)
> {
> +    TCGv c;
>     LOG_DIS("addq %u, $r%u\n", dc->op1, dc->op2);
> 
>     dc->op1 = EXTRACT_FIELD(dc->ir, 0, 5);
> 
>     cris_cc_mask(dc, CC_MASK_NZVC);
> 
> +    c = tcg_const_tl(dc->op1);
>     cris_alu(dc, CC_OP_ADD,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(dc->op1), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>     return 2;
> }
> static int dec_moveq(CPUCRISState *env, DisasContext *dc)
> @@ -1353,62 +1364,77 @@ static int dec_moveq(CPUCRISState *env, DisasContext *dc)
> }
> static int dec_subq(CPUCRISState *env, DisasContext *dc)
> {
> +    TCGv c;
>     dc->op1 = EXTRACT_FIELD(dc->ir, 0, 5);
> 
>     LOG_DIS("subq %u, $r%u\n", dc->op1, dc->op2);
> 
>     cris_cc_mask(dc, CC_MASK_NZVC);
> +    c = tcg_const_tl(dc->op1);
>     cris_alu(dc, CC_OP_SUB,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(dc->op1), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>     return 2;
> }
> static int dec_cmpq(CPUCRISState *env, DisasContext *dc)
> {
>     uint32_t imm;
> +    TCGv c;
>     dc->op1 = EXTRACT_FIELD(dc->ir, 0, 5);
>     imm = sign_extend(dc->op1, 5);
> 
>     LOG_DIS("cmpq %d, $r%d\n", imm, dc->op2);
>     cris_cc_mask(dc, CC_MASK_NZVC);
> 
> +    c = tcg_const_tl(imm);
>     cris_alu(dc, CC_OP_CMP,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(imm), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>     return 2;
> }
> static int dec_andq(CPUCRISState *env, DisasContext *dc)
> {
>     uint32_t imm;
> +    TCGv c;
>     dc->op1 = EXTRACT_FIELD(dc->ir, 0, 5);
>     imm = sign_extend(dc->op1, 5);
> 
>     LOG_DIS("andq %d, $r%d\n", imm, dc->op2);
>     cris_cc_mask(dc, CC_MASK_NZ);
> 
> +    c = tcg_const_tl(imm);
>     cris_alu(dc, CC_OP_AND,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(imm), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>     return 2;
> }
> static int dec_orq(CPUCRISState *env, DisasContext *dc)
> {
>     uint32_t imm;
> +    TCGv c;
>     dc->op1 = EXTRACT_FIELD(dc->ir, 0, 5);
>     imm = sign_extend(dc->op1, 5);
>     LOG_DIS("orq %d, $r%d\n", imm, dc->op2);
>     cris_cc_mask(dc, CC_MASK_NZ);
> 
> +    c = tcg_const_tl(imm);
>     cris_alu(dc, CC_OP_OR,
> -            cpu_R[dc->op2], cpu_R[dc->op2], tcg_const_tl(imm), 4);
> +            cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
> +    tcg_temp_free(c);
>     return 2;
> }
> static int dec_btstq(CPUCRISState *env, DisasContext *dc)
> {
> +    TCGv c;
>     dc->op1 = EXTRACT_FIELD(dc->ir, 0, 4);
>     LOG_DIS("btstq %u, $r%d\n", dc->op1, dc->op2);
> 
>     cris_cc_mask(dc, CC_MASK_NZ);
> +    c = tcg_const_tl(dc->op1);
>     cris_evaluate_flags(dc);
> -        gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc->op2],
> -            tcg_const_tl(dc->op1), cpu_PR[PR_CCS]);
> +    gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc->op2],
> +            c, cpu_PR[PR_CCS]);
> +    tcg_temp_free(c);
>     cris_alu(dc, CC_OP_MOVE,
>          cpu_R[dc->op2], cpu_R[dc->op2], cpu_R[dc->op2], 4);
>     cris_update_cc_op(dc, CC_OP_FLAGS, 4);
> @@ -1558,7 +1584,7 @@ static int dec_lsl_r(CPUCRISState *env, DisasContext *dc)
>     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
>     tcg_gen_andi_tl(t[1], t[1], 63);
>     cris_alu(dc, CC_OP_LSL, cpu_R[dc->op2], t[0], t[1], size);
> -    cris_alu_alloc_temps(dc, size, t);
> +    cris_alu_free_temps(dc, size, t);
>     return 2;
> }
> 
> @@ -1624,7 +1650,7 @@ static int dec_mulu_r(CPUCRISState *env, DisasContext *dc)
>     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
> 
>     cris_alu(dc, CC_OP_MULU, cpu_R[dc->op2], t[0], t[1], 4);
> -    cris_alu_alloc_temps(dc, size, t);
> +    cris_alu_free_temps(dc, size, t);
>     return 2;
> }
> 
> @@ -1801,27 +1827,31 @@ static int dec_or_r(CPUCRISState *env, DisasContext *dc)
> 
> static int dec_addi_r(CPUCRISState *env, DisasContext *dc)
> {
> -    TCGv t0;
> +    TCGv t0, c;
>     LOG_DIS("addi.%c $r%u, $r%u\n",
>             memsize_char(memsize_zz(dc)), dc->op2, dc->op1);
>     cris_cc_mask(dc, 0);
>     t0 = tcg_temp_new();
> -    tcg_gen_shl_tl(t0, cpu_R[dc->op2], tcg_const_tl(dc->zzsize));
> +    c = tcg_const_tl(dc->zzsize);
> +    tcg_gen_shl_tl(t0, cpu_R[dc->op2], c);
>     tcg_gen_add_tl(cpu_R[dc->op1], cpu_R[dc->op1], t0);
>     tcg_temp_free(t0);
> +    tcg_temp_free(c);
>     return 2;
> }
> 
> static int dec_addi_acr(CPUCRISState *env, DisasContext *dc)
> {
> -    TCGv t0;
> +    TCGv t0, c;
>     LOG_DIS("addi.%c $r%u, $r%u, $acr\n",
>           memsize_char(memsize_zz(dc)), dc->op2, dc->op1);
>     cris_cc_mask(dc, 0);
>     t0 = tcg_temp_new();
> -    tcg_gen_shl_tl(t0, cpu_R[dc->op2], tcg_const_tl(dc->zzsize));
> +    c = tcg_const_tl(dc->zzsize);
> +    tcg_gen_shl_tl(t0, cpu_R[dc->op2], c);
>     tcg_gen_add_tl(cpu_R[R_ACR], cpu_R[dc->op1], t0);
>     tcg_temp_free(t0);
> +    tcg_temp_free(c);
>     return 2;
> }
> 
> @@ -2051,18 +2081,26 @@ static int dec_setclrf(CPUCRISState *env, DisasContext *dc)
> 
> static int dec_move_rs(CPUCRISState *env, DisasContext *dc)
> {
> +    TCGv c2, c1;
>     LOG_DIS("move $r%u, $s%u\n", dc->op1, dc->op2);
> +    c1 = tcg_const_tl(dc->op1);
> +    c2 = tcg_const_tl(dc->op2);
>     cris_cc_mask(dc, 0);
> -        gen_helper_movl_sreg_reg(cpu_env, tcg_const_tl(dc->op2),
> -                                 tcg_const_tl(dc->op1));
> +    gen_helper_movl_sreg_reg(cpu_env, c2, c1);
> +    tcg_temp_free(c1);
> +    tcg_temp_free(c2);
>     return 2;
> }
> static int dec_move_sr(CPUCRISState *env, DisasContext *dc)
> {
> +    TCGv c2, c1;
>     LOG_DIS("move $s%u, $r%u\n", dc->op2, dc->op1);
> +    c1 = tcg_const_tl(dc->op1);
> +    c2 = tcg_const_tl(dc->op2);
>     cris_cc_mask(dc, 0);
> -        gen_helper_movl_reg_sreg(cpu_env, tcg_const_tl(dc->op1),
> -                                 tcg_const_tl(dc->op2));
> +    gen_helper_movl_reg_sreg(cpu_env, c1, c2);
> +    tcg_temp_free(c1);
> +    tcg_temp_free(c2);
>     return 2;
> }
> 
> @@ -2345,7 +2383,7 @@ static int dec_cmp_m(CPUCRISState *env, DisasContext *dc)
> 
> static int dec_test_m(CPUCRISState *env, DisasContext *dc)
> {
> -    TCGv t[2];
> +    TCGv t[2], c;
>     int memsize = memsize_zz(dc);
>     int insn_len;
>     LOG_DIS("test.%c [$r%u%s] op2=%x\n",
> @@ -2360,8 +2398,10 @@ static int dec_test_m(CPUCRISState *env, DisasContext *dc)
>     cris_cc_mask(dc, CC_MASK_NZ);
>     tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~3);
> 
> +    c = tcg_const_tl(0);
>     cris_alu(dc, CC_OP_CMP,
> -         cpu_R[dc->op2], t[1], tcg_const_tl(0), memsize_zz(dc));
> +         cpu_R[dc->op2], t[1], c, memsize_zz(dc));
> +    tcg_temp_free(c);
>     do_postinc(dc, memsize);
>     cris_alu_m_free_temps(t);
>     return insn_len;
> @@ -2713,6 +2753,7 @@ static int dec_jump_p(CPUCRISState *env, DisasContext *dc)
> /* Jump and save.  */
> static int dec_jas_r(CPUCRISState *env, DisasContext *dc)
> {
> +    TCGv c;
>     LOG_DIS("jas $r%u, $p%u\n", dc->op1, dc->op2);
>     cris_cc_mask(dc, 0);
>     /* Store the return address in Pd.  */
> @@ -2720,7 +2761,9 @@ static int dec_jas_r(CPUCRISState *env, DisasContext *dc)
>     if (dc->op2 > 15) {
>         abort();
>     }
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 4));
> +    c = tcg_const_tl(dc->pc + 4);
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
> 
>     cris_prepare_jmp(dc, JMP_INDIRECT);
>     return 2;
> @@ -2729,13 +2772,16 @@ static int dec_jas_r(CPUCRISState *env, DisasContext *dc)
> static int dec_jas_im(CPUCRISState *env, DisasContext *dc)
> {
>     uint32_t imm;
> +    TCGv c;
> 
>     imm = cris_fetch(env, dc, dc->pc + 2, 4, 0);
> 
>     LOG_DIS("jas 0x%x\n", imm);
>     cris_cc_mask(dc, 0);
> +    c = tcg_const_tl(dc->pc + 8);
>     /* Store the return address in Pd.  */
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 8));
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
> 
>     dc->jmp_pc = imm;
>     cris_prepare_jmp(dc, JMP_DIRECT);
> @@ -2745,13 +2791,16 @@ static int dec_jas_im(CPUCRISState *env, DisasContext *dc)
> static int dec_jasc_im(CPUCRISState *env, DisasContext *dc)
> {
>     uint32_t imm;
> +    TCGv c;
> 
>     imm = cris_fetch(env, dc, dc->pc + 2, 4, 0);
> 
>     LOG_DIS("jasc 0x%x\n", imm);
>     cris_cc_mask(dc, 0);
> +    c = tcg_const_tl(dc->pc + 8 + 4);
>     /* Store the return address in Pd.  */
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 8 + 4));
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
> 
>     dc->jmp_pc = imm;
>     cris_prepare_jmp(dc, JMP_DIRECT);
> @@ -2760,11 +2809,14 @@ static int dec_jasc_im(CPUCRISState *env, DisasContext *dc)
> 
> static int dec_jasc_r(CPUCRISState *env, DisasContext *dc)
> {
> +    TCGv c;
>     LOG_DIS("jasc_r $r%u, $p%u\n", dc->op1, dc->op2);
>     cris_cc_mask(dc, 0);
>     /* Store the return address in Pd.  */
>     tcg_gen_mov_tl(env_btarget, cpu_R[dc->op1]);
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 4 + 4));
> +    c = tcg_const_tl(dc->pc + 4 + 4);
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
>     cris_prepare_jmp(dc, JMP_INDIRECT);
>     return 2;
> }
> @@ -2789,13 +2841,16 @@ static int dec_bcc_im(CPUCRISState *env, DisasContext *dc)
> static int dec_bas_im(CPUCRISState *env, DisasContext *dc)
> {
>     int32_t simm;
> +    TCGv c;
> 
>     simm = cris_fetch(env, dc, dc->pc + 2, 4, 0);
> 
>     LOG_DIS("bas 0x%x, $p%u\n", dc->pc + simm, dc->op2);
>     cris_cc_mask(dc, 0);
> +    c = tcg_const_tl(dc->pc + 8);
>     /* Store the return address in Pd.  */
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 8));
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
> 
>     dc->jmp_pc = dc->pc + simm;
>     cris_prepare_jmp(dc, JMP_DIRECT);
> @@ -2805,12 +2860,15 @@ static int dec_bas_im(CPUCRISState *env, DisasContext *dc)
> static int dec_basc_im(CPUCRISState *env, DisasContext *dc)
> {
>     int32_t simm;
> +    TCGv c;
>     simm = cris_fetch(env, dc, dc->pc + 2, 4, 0);
> 
>     LOG_DIS("basc 0x%x, $p%u\n", dc->pc + simm, dc->op2);
>     cris_cc_mask(dc, 0);
> +    c = tcg_const_tl(dc->pc + 12);
>     /* Store the return address in Pd.  */
> -    t_gen_mov_preg_TN(dc, dc->op2, tcg_const_tl(dc->pc + 12));
> +    t_gen_mov_preg_TN(dc, dc->op2, c);
> +    tcg_temp_free(c);
> 
>     dc->jmp_pc = dc->pc + simm;
>     cris_prepare_jmp(dc, JMP_DIRECT);
> @@ -2819,6 +2877,7 @@ static int dec_basc_im(CPUCRISState *env, DisasContext *dc)
> 
> static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
> {
> +    TCGv c;
>     cris_cc_mask(dc, 0);
> 
>     if (dc->op2 == 15) {
> @@ -2851,8 +2910,9 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
>         tcg_gen_movi_tl(env_pc, dc->pc + 2);
> 
>         /* Breaks start at 16 in the exception vector.  */
> -        t_gen_mov_env_TN(trap_vector,
> -                tcg_const_tl(dc->op1 + 16));
> +        c = tcg_const_tl(dc->op1 + 16);
> +        t_gen_mov_env_TN(trap_vector, c);
> +        tcg_temp_free(c);
>         t_gen_raise_exception(EXCP_BREAK);
>         dc->is_jmp = DISAS_UPDATE;
>         break;
> @@ -3023,14 +3083,16 @@ static unsigned int crisv32_decoder(CPUCRISState *env, DisasContext *dc)
>     /* Single-stepping ?  */
>     if (dc->tb_flags & S_FLAG) {
>         TCGLabel *l1 = gen_new_label();
> +        TCGv c = tcg_const_tl(3);
>         tcg_gen_brcondi_tl(TCG_COND_NE, cpu_PR[PR_SPC], dc->pc, l1);
>         /* We treat SPC as a break with an odd trap vector.  */
>         cris_evaluate_flags(dc);
> -        t_gen_mov_env_TN(trap_vector, tcg_const_tl(3));
> +        t_gen_mov_env_TN(trap_vector, c);
>         tcg_gen_movi_tl(env_pc, dc->pc + insn_len);
>         tcg_gen_movi_tl(cpu_PR[PR_SPC], dc->pc + insn_len);
>         t_gen_raise_exception(EXCP_BREAK);
>         gen_set_label(l1);
> +        tcg_temp_free(c);
>     }
> #endif
>     return insn_len;
> @@ -3170,7 +3232,9 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>             dc->delayed_branch--;
>             if (dc->delayed_branch == 0) {
>                 if (tb->flags & 7) {
> -                    t_gen_mov_env_TN(dslot, tcg_const_tl(0));
> +                    TCGv c = tcg_const_tl(0);
> +                    t_gen_mov_env_TN(dslot, c);
> +                    tcg_temp_free(c);
>                 }
>                 if (dc->cpustate_changed || !dc->flagx_known
>                     || (dc->flags_x != (tb->flags & X_FLAG))) {
> @@ -3178,8 +3242,10 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>                 }
> 
>                 if (dc->clear_locked_irq) {
> +                    TCGv c = tcg_const_tl(0);
>                     dc->clear_locked_irq = 0;
> -                    t_gen_mov_env_TN(locked_irq, tcg_const_tl(0));
> +                    t_gen_mov_env_TN(locked_irq, c);
> +                    tcg_temp_free(c);
>                 }
> 
>                 if (dc->jmp == JMP_DIRECT_CC) {
> @@ -3200,7 +3266,9 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>                     dc->is_jmp = DISAS_TB_JUMP;
>                     dc->jmp = JMP_NOJMP;
>                 } else {
> -                    t_gen_cc_jmp(env_btarget, tcg_const_tl(dc->pc));
> +                    TCGv c = tcg_const_tl(dc->pc);
> +                    t_gen_cc_jmp(env_btarget, c);
> +                    tcg_temp_free(c);
>                     dc->is_jmp = DISAS_JUMP;
>                 }
>                 break;
> @@ -3219,7 +3287,9 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>             && num_insns < max_insns);
> 
>     if (dc->clear_locked_irq) {
> -        t_gen_mov_env_TN(locked_irq, tcg_const_tl(0));
> +        TCGv c = tcg_const_tl(0);
> +        t_gen_mov_env_TN(locked_irq, c);
> +        tcg_temp_free(c);
>     }
> 
>     npc = dc->pc;
> @@ -3233,8 +3303,10 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>     }
>     /* Broken branch+delayslot sequence.  */
>     if (dc->delayed_branch == 1) {
> +        TCGv c = tcg_const_tl(dc->pc - dc->ppc);
>         /* Set env->dslot to the size of the branch insn.  */
> -        t_gen_mov_env_TN(dslot, tcg_const_tl(dc->pc - dc->ppc));
> +        t_gen_mov_env_TN(dslot, c);
> +        tcg_temp_free(c);
>         cris_store_direct_jmp(dc);
>     }
> 
> diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
> index 86d78a8..f7cd67b 100644
> --- a/target/cris/translate_v10.c.inc
> +++ b/target/cris/translate_v10.c.inc
> @@ -228,6 +228,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
> {
>     int32_t imm, simm;
>     int op;
> +    TCGv c;
> 
>     /* sign extend.  */
>     imm = dc->ir & ((1 << 6) - 1);
> @@ -254,29 +255,37 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
>             LOG_DIS("moveq %d, $r%d\n", simm, dc->dst);
> 
>             cris_cc_mask(dc, CC_MASK_NZVC);
> +            c = tcg_const_tl(simm);
>             cris_alu(dc, CC_OP_MOVE, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(simm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>             break;
>         case CRISV10_QIMM_CMPQ:
>             LOG_DIS("cmpq %d, $r%d\n", simm, dc->dst);
> 
>             cris_cc_mask(dc, CC_MASK_NZVC);
> +            c = tcg_const_tl(simm);
>             cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(simm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>             break;
>         case CRISV10_QIMM_ADDQ:
>             LOG_DIS("addq %d, $r%d\n", imm, dc->dst);
> 
>             cris_cc_mask(dc, CC_MASK_NZVC);
> +            c = tcg_const_tl(imm);
>             cris_alu(dc, CC_OP_ADD, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(imm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>             break;
>         case CRISV10_QIMM_ANDQ:
>             LOG_DIS("andq %d, $r%d\n", simm, dc->dst);
> 
>             cris_cc_mask(dc, CC_MASK_NZVC);
> +            c = tcg_const_tl(simm);
>             cris_alu(dc, CC_OP_AND, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(simm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>             break;
>         case CRISV10_QIMM_ASHQ:
>             LOG_DIS("ashq %d, $r%d\n", simm, dc->dst);
> @@ -284,15 +293,17 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
>             cris_cc_mask(dc, CC_MASK_NZVC);
>             op = imm & (1 << 5);
>             imm &= 0x1f;
> +            c = tcg_const_tl(imm);
>             if (op) {
>                 cris_alu(dc, CC_OP_ASR, cpu_R[dc->dst],
> -                          cpu_R[dc->dst], tcg_const_tl(imm), 4);
> +                          cpu_R[dc->dst], c, 4);
>             } else {
>                 /* BTST */
>                 cris_update_cc_op(dc, CC_OP_FLAGS, 4);
>                 gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc->dst],
> -                           tcg_const_tl(imm), cpu_PR[PR_CCS]);
> +                           c, cpu_PR[PR_CCS]);
>             }
> +            tcg_temp_free(c);
>             break;
>         case CRISV10_QIMM_LSHQ:
>             LOG_DIS("lshq %d, $r%d\n", simm, dc->dst);
> @@ -303,22 +314,28 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
>             }
>             imm &= 0x1f;
>             cris_cc_mask(dc, CC_MASK_NZVC);
> +            c = tcg_const_tl(imm);
>             cris_alu(dc, op, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(imm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>             break;
>         case CRISV10_QIMM_SUBQ:
>             LOG_DIS("subq %d, $r%d\n", imm, dc->dst);
> 
>             cris_cc_mask(dc, CC_MASK_NZVC);
> +            c = tcg_const_tl(imm);
>             cris_alu(dc, CC_OP_SUB, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(imm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>             break;
>         case CRISV10_QIMM_ORQ:
>             LOG_DIS("andq %d, $r%d\n", simm, dc->dst);
> 
>             cris_cc_mask(dc, CC_MASK_NZVC);
> +            c = tcg_const_tl(simm);
>             cris_alu(dc, CC_OP_OR, cpu_R[dc->dst],
> -                     cpu_R[dc->dst], tcg_const_tl(simm), 4);
> +                     cpu_R[dc->dst], c, 4);
> +            tcg_temp_free(c);
>             break;
> 
>         case CRISV10_QIMM_BCC_R0:
> @@ -760,7 +777,6 @@ static unsigned int dec10_ind_move_m_r(CPUCRISState *env, DisasContext *dc,
>         tcg_gen_mov_tl(env_btarget, cpu_R[dc->dst]);
>         cris_prepare_jmp(dc, JMP_INDIRECT);
>         dc->delayed_branch = 1;
> -        return insn_len;
>     }
> 
>     tcg_temp_free(t);
> @@ -777,6 +793,7 @@ static unsigned int dec10_ind_move_r_m(DisasContext *dc, unsigned int size)
>     crisv10_prepare_memaddr(dc, addr, size);
>     gen_store_v10(dc, addr, cpu_R[dc->dst], size);
>     insn_len += crisv10_post_memaddr(dc, size);
> +    tcg_temp_free(addr);
> 
>     return insn_len;
> }
> @@ -796,11 +813,10 @@ static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
>         tcg_gen_mov_tl(env_btarget, t);
>         cris_prepare_jmp(dc, JMP_INDIRECT);
>         dc->delayed_branch = 1;
> -        return insn_len;
> +    } else {
> +        tcg_gen_mov_tl(cpu_PR[rd], t);
> +        dc->cpustate_changed = 1;
>     }
> -
> -    tcg_gen_mov_tl(cpu_PR[rd], t);
> -    dc->cpustate_changed = 1;
>     tcg_temp_free(addr);
>     tcg_temp_free(t);
>     return insn_len;
> @@ -824,8 +840,8 @@ static unsigned int dec10_ind_move_pr_m(DisasContext *dc)
>     } else {
>         gen_store_v10(dc, addr, cpu_PR[dc->dst], size);
>     }
> -    t0 = tcg_temp_new();
>     insn_len += crisv10_post_memaddr(dc, size);
> +    tcg_temp_free(addr);
>     cris_lock_irq(dc);
> 
>     return insn_len;
> @@ -927,7 +943,6 @@ static int dec10_ind_bound(CPUCRISState *env, DisasContext *dc,
>         tcg_gen_mov_tl(env_btarget, cpu_R[dc->dst]);
>         cris_prepare_jmp(dc, JMP_INDIRECT);
>         dc->delayed_branch = 1;
> -        return insn_len;
>     }
> 
>     tcg_temp_free(t);
> @@ -953,7 +968,6 @@ static int dec10_alux_m(CPUCRISState *env, DisasContext *dc, int op)
>         tcg_gen_mov_tl(env_btarget, cpu_R[dc->dst]);
>         cris_prepare_jmp(dc, JMP_INDIRECT);
>         dc->delayed_branch = 1;
> -        return insn_len;
>     }
> 
>     tcg_temp_free(t);
> @@ -1020,7 +1034,7 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
>     unsigned int size = dec10_size(dc->size);
>     uint32_t imm;
>     int32_t simm;
> -    TCGv t[2];
> +    TCGv t[2], c;
> 
>     if (dc->size != 3) {
>         switch (dc->opcode) {
> @@ -1041,8 +1055,10 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
>                 cris_alu_m_alloc_temps(t);
>                 insn_len += dec10_prep_move_m(env, dc, 0, size, t[0]);
>                 tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~3);
> +                c = tcg_const_tl(0);
>                 cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
> -                         t[0], tcg_const_tl(0), size);
> +                         t[0], c, size);
> +                tcg_temp_free(c);
>                 cris_alu_m_free_temps(t);
>                 break;
>             case CRISV10_IND_ADD:
> @@ -1138,7 +1154,9 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
>                 if (dc->mode == CRISV10_MODE_AUTOINC)
>                     insn_len += size;
> 
> -                t_gen_mov_preg_TN(dc, dc->dst, tcg_const_tl(dc->pc + insn_len));
> +                c = tcg_const_tl(dc->pc + insn_len);
> +                t_gen_mov_preg_TN(dc, dc->dst, c);
> +                tcg_temp_free(c);
>                 dc->jmp_pc = imm;
>                 cris_prepare_jmp(dc, JMP_DIRECT);
>                 dc->delayed_branch--; /* v10 has no dslot here.  */
> @@ -1147,7 +1165,9 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
>                     LOG_DIS("break %d\n", dc->src);
>                     cris_evaluate_flags(dc);
>                     tcg_gen_movi_tl(env_pc, dc->pc + 2);
> -                    t_gen_mov_env_TN(trap_vector, tcg_const_tl(dc->src + 2));
> +                    c = tcg_const_tl(dc->src + 2);
> +                    t_gen_mov_env_TN(trap_vector, c);
> +                    tcg_temp_free(c);
>                     t_gen_raise_exception(EXCP_BREAK);
>                     dc->is_jmp = DISAS_UPDATE;
>                     return insn_len;
> @@ -1155,7 +1175,9 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
>                 LOG_DIS("%d: jump.%d %d r%d r%d\n", __LINE__, size,
>                          dc->opcode, dc->src, dc->dst);
>                 t[0] = tcg_temp_new();
> -                t_gen_mov_preg_TN(dc, dc->dst, tcg_const_tl(dc->pc + insn_len));
> +                c = tcg_const_tl(dc->pc + insn_len);
> +                t_gen_mov_preg_TN(dc, dc->dst, c);
> +                tcg_temp_free(c);
>                 crisv10_prepare_memaddr(dc, t[0], size);
>                 gen_load(dc, env_btarget, t[0], 4, 0);
>                 insn_len += crisv10_post_memaddr(dc, size);
> @@ -1178,7 +1200,9 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
>             LOG_DIS("jmp pc=%x opcode=%d r%d r%d\n",
>                         dc->pc, dc->opcode, dc->dst, dc->src);
>             tcg_gen_mov_tl(env_btarget, cpu_R[dc->src]);
> -            t_gen_mov_preg_TN(dc, dc->dst, tcg_const_tl(dc->pc + insn_len));
> +            c = tcg_const_tl(dc->pc + insn_len);
> +            t_gen_mov_preg_TN(dc, dc->dst, c);
> +            tcg_temp_free(c);
>             cris_prepare_jmp(dc, JMP_INDIRECT);
>             dc->delayed_branch--; /* v10 has no dslot here.  */
>             break;
> -- 
> 1.8.3.1
> 

