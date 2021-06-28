Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1963B6652
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:01:22 +0200 (CEST)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxthJ-0007fg-Pv
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxteO-0005s4-P3
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:58:20 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxteM-0003VK-IH
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:58:20 -0400
Received: by mail-ed1-x52f.google.com with SMTP id h17so26605551edw.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oFdOKH3B7EGmGgQST1EWEBinlP9pmSddKp8uGxgs0qo=;
 b=MywODT+pHsrGk5sgwCWYq6HuqL70lmew5QlHohICl0XpRGiedTzOktKJ6E7FTRmVkM
 ua5AiroR6JrwzKVBK5SrN+a1NfcZrCeUXmVZpNLyijM4yTaAh7E6cFvWeNDntK3VQUxx
 E8PAxv8YY9+94l5JowiX1CpJavMNmI8eHmP0ss6Ss98307hD4uE8ebqsja49Q5Y5RsA+
 bAKrx8wWw6/zdAvfooVls8M1btxutzh5l+23tIJQs9/b+k3nHvtWDV6OEEYOi9kAr5p4
 hVu5HkeCHbo/LoF9BVRuGgbM+bHaC2p2FInTw3I+m2iSzQAlqzt4lCKuL6A6A8B+4HIy
 LWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oFdOKH3B7EGmGgQST1EWEBinlP9pmSddKp8uGxgs0qo=;
 b=dT9eBOzyFCs8DBruQUWUzfbW90y6lzwUVQRv8HBS1yvk+hWFhI8m7ducm8xvCcuj2C
 0khx4t1mS1HMotJh0iemc3zgH/7TJvN7I/tE7rM8JFFCDMXCMU+GXWZ2wdkHj9Aneidf
 f2pl5ifPN9TLZa5AmUt7f+w6VuYd/l/SQaSTOk9Z1ZuODtYqFGBxv11zof9kZhMpXeTK
 S/gUgodcyA7gFS/QJyV0+Ch7d7bf6lCeM95hmdMn4z01lVJGlwieGgVD6r2Q1CafIRbo
 K8XQ7qyli8Cb2/QoZuK1/pmebLcdC2tm9xsxa1We3WQ6krViXi+yMSoyb3PyWqMmwevK
 zoFw==
X-Gm-Message-State: AOAM530IhIB7etHsjXPE9YOtmYJ1wv9Jq7YlFvz/KTkS+e/6hxl5NUWd
 KTJi1JdSJWyYIRc2SQiRpvm1GGC1scS7BEoan5Sraw==
X-Google-Smtp-Source: ABdhPJxLhoU519PnJcwhIAVnxVc/ZeEgiOzT5o2Xv5lsxMcUJru/cxv+HXWhtFWq/LhhR8qrGCrfoYXKdeEpAJ9XWVM=
X-Received: by 2002:a05:6402:5204:: with SMTP id
 s4mr33672058edd.52.1624895897002; 
 Mon, 28 Jun 2021 08:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
 <20210620221046.1526418-6-richard.henderson@linaro.org>
In-Reply-To: <20210620221046.1526418-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 16:57:39 +0100
Message-ID: <CAFEAcA8i+a9xOfvqn6U_8udEPR7rXpSp2-JNDguyqWp8YkF0MQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] target/nios2: Convert to TranslatorOps
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Jun 2021 at 23:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 130 ++++++++++++++++++++-------------------
>  1 file changed, 67 insertions(+), 63 deletions(-)
>
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 31653b7912..06705c894d 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -803,75 +803,72 @@ static void gen_exception(DisasContext *dc, uint32_t excp)
>  }
>
>  /* generate intermediate code for basic block 'tb'.  */
> -void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
> +static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>  {
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
>      CPUNios2State *env = cs->env_ptr;
> -    DisasContext dc1, *dc = &dc1;
> -    int num_insns;
> -
> -    /* Initialize DC */
> -
> -    dc->base.tb = tb;
> -    dc->base.singlestep_enabled = cs->singlestep_enabled;
> -    dc->base.is_jmp = DISAS_NEXT;
> -    dc->base.pc_first = tb->pc;
> -    dc->base.pc_next = tb->pc;
> +    target_ulong pc = dc->base.pc_first;

The local variable doesn't really seem necessary -- you could just
write "dc->pc = dc->base.pc_first" and then use "dc->pc" in the
calculation of page_insns.

> +    int page_insns;
>
>      dc->zero    = NULL;
> -    dc->pc      = tb->pc;
> +    dc->pc      = pc;
>      dc->mem_idx = cpu_mmu_index(env, false);
>
> -    /* Set up instruction counts */
> -    num_insns = 0;
> -    if (max_insns > 1) {
> -        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & ~TARGET_PAGE_MASK)) / 4;
> -        if (max_insns > page_insns) {
> -            max_insns = page_insns;
> -        }
> -    }
> +    /* Bound the number of insns to execute to those left on the page.  */
> +    page_insns = -(pc | TARGET_PAGE_MASK) / 4;
> +    dc->base.max_insns = MIN(page_insns, dc->base.max_insns);
> +}
>
> -    gen_tb_start(tb);
> -    do {
> -        tcg_gen_insn_start(dc->pc);
> -        num_insns++;
> +static void nios2_tr_tb_start(DisasContextBase *db, CPUState *cs)
> +{
> +}
>
> -        if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
> -            gen_exception(dc, EXCP_DEBUG);
> -            /* The address covered by the breakpoint must be included in
> -               [tb->pc, tb->pc + tb->size) in order to for it to be
> -               properly cleared -- thus we increment the PC here so that
> -               the logic setting tb->size below does the right thing.  */
> -            dc->pc += 4;
> -            break;
> -        }
> +static void nios2_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
> +{
> +    tcg_gen_insn_start(dcbase->pc_next);
> +}
>
> -        if (num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
> -            gen_io_start();
> -        }
> +static bool nios2_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
> +                                      const CPUBreakpoint *bp)
> +{
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
>
> -        /* Decode an instruction */
> -        handle_instruction(dc, env);
> +    gen_exception(dc, EXCP_DEBUG);
> +    /*
> +     * The address covered by the breakpoint must be included in
> +     * [tb->pc, tb->pc + tb->size) in order to for it to be
> +     * properly cleared -- thus we increment the PC here so that
> +     * the logic setting tb->size below does the right thing.
> +     */
> +    dc->pc += 4;

Don't we need to increment dc->base.pc_next here, not dc->pc? The
generic setting of tb->size in accel/tcg uses "db->pc_next - db->pc_first".

Side note: that comment about "setting tb->size below" seems to have
been copied-and-pasted into most of the front-ends, but it's wrong:
the setting of tb->size is no longer "below" but in the common code.

(More generally, some followup patches rationalizing the use of
dc->pc along the lines of the Arm dc->pc_curr vs dc->base.pc_next
might help. There seems to be a fair amount of code which uses
"dc->pc + 4" that could be using pc_next instead.)

> +    return true;

The arm versions of the breakpoint_check hook also set dc->base.is_jmp
to DISAS_NORETURN.
Are they doing that unnecessarily, or do we need to do that here ?

> +}
>
> -        dc->pc += 4;
> +static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
> +{
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +    CPUNios2State *env = cs->env_ptr;
>
> -        /* Translation stops when a conditional branch is encountered.
> -         * Otherwise the subsequent code could get translated several times.
> -         * Also stop translation when a page boundary is reached.  This
> -         * ensures prefetch aborts occur at the right place.  */
> -    } while (!dc->base.is_jmp &&
> -             !tcg_op_buf_full() &&
> -             num_insns < max_insns);
> +    /* Decode an instruction */
> +    handle_instruction(dc, env);
> +
> +    dc->base.pc_next += 4;
> +    dc->pc += 4;

This isn't wrong, but I think that a setup like the Arm translator
that does
       dc->pc_curr = s->base.pc_next;
       code = cpu_ldl_code(env, s->base.pc_next);
       s->base.pc_next += 4;
       /* dispatch to handler function here */

would be nicer (dunno whether clearer to do as a single thing or
first to do this conversion and then do a followup patch).

thanks
-- PMM

