Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D593633CA12
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:41:13 +0100 (CET)
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwpk-0006xG-Qg
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lLwmO-0004RV-2i
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:37:44 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:44888 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lLwmL-0006sd-Md
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:37:43 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 72BFA412DB;
 Mon, 15 Mar 2021 23:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1615851458;
 x=1617665859; bh=PlP7vyHRvC/rZti3/2EuHR3e8o38hAHDfs+pxykpzHw=; b=
 g7IaJ/WJnv2dwn3FfCjJP/mFUJR0HYNsAlYEfdxARq9nFlM4rlEdS0ZDCau7OccK
 qleqJCRSY84il0+jM81LllNE01pqabidQ7DygEbxz0gP3ahBGCtUYa5AUK1sEyYe
 P+sH1CIuQfR10XHigjq2DM91MN/VisZPoCjMJqu9mG4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSwIa7U1eaXQ; Tue, 16 Mar 2021 02:37:38 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E06C441209;
 Tue, 16 Mar 2021 02:37:37 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Mar 2021 02:37:37 +0300
Date: Tue, 16 Mar 2021 02:37:36 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 03/29] tcg: Re-order tcg_region_init vs
 tcg_prologue_init
Message-ID: <YE/vwNCE7EEukXll@SPB-NB-133.local>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
 <20210314212724.1917075-4-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210314212724.1917075-4-richard.henderson@linaro.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 14, 2021 at 03:26:58PM -0600, Richard Henderson wrote:
> Instead of delaying tcg_region_init until after tcg_prologue_init
> is complete, do tcg_region_init first and let tcg_prologue_init
> shrink the first region by the size of the generated prologue.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tcg-all.c       | 11 ---------
>  accel/tcg/translate-all.c |  3 +++
>  bsd-user/main.c           |  1 -
>  linux-user/main.c         |  1 -
>  tcg/tcg.c                 | 52 ++++++++++++++-------------------------
>  5 files changed, 22 insertions(+), 46 deletions(-)
> 
> diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
> index e378c2db73..f132033999 100644
> --- a/accel/tcg/tcg-all.c
> +++ b/accel/tcg/tcg-all.c
> @@ -111,17 +111,6 @@ static int tcg_init(MachineState *ms)
>  
>      tcg_exec_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
>      mttcg_enabled = s->mttcg_enabled;
> -
> -    /*
> -     * Initialize TCG regions only for softmmu.
> -     *
> -     * This needs to be done later for user mode, because the prologue
> -     * generation needs to be delayed so that GUEST_BASE is already set.
> -     */
> -#ifndef CONFIG_USER_ONLY
> -    tcg_region_init();

Note that tcg_region_init() invokes tcg_n_regions() that depends on
qemu_tcg_mttcg_enabled() that evaluates mttcg_enabled. Likely you need
to move "mttcg_enabled = s->mttcg_enabled;" before tcg_exec_init() to
keep existing behaviour.

> -#endif /* !CONFIG_USER_ONLY */
> -
>      return 0;
>  }
>  
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index f32df8b240..b9057567f4 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1339,6 +1339,9 @@ void tcg_exec_init(unsigned long tb_size, int splitwx)
>                                 splitwx, &error_fatal);
>      assert(ok);
>  
> +    /* TODO: allocating regions is hand-in-glove with code_gen_buffer. */
> +    tcg_region_init();
> +
>  #if defined(CONFIG_SOFTMMU)
>      /* There's no guest base to take into account, so go ahead and
>         initialize the prologue now.  */
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 798aba512c..3669d2b89e 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -994,7 +994,6 @@ int main(int argc, char **argv)
>         generating the prologue until now so that the prologue can take
>         the real value of GUEST_BASE into account.  */
>      tcg_prologue_init(tcg_ctx);
> -    tcg_region_init();
>  
>      /* build Task State */
>      memset(ts, 0, sizeof(TaskState));
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 4f4746dce8..1bc48ca954 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -850,7 +850,6 @@ int main(int argc, char **argv, char **envp)
>         generating the prologue until now so that the prologue can take
>         the real value of GUEST_BASE into account.  */
>      tcg_prologue_init(tcg_ctx);
> -    tcg_region_init();
>  
>      target_cpu_copy_regs(env, regs);
>  
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 2991112829..0a2e5710de 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1204,32 +1204,18 @@ TranslationBlock *tcg_tb_alloc(TCGContext *s)
>  
>  void tcg_prologue_init(TCGContext *s)
>  {
> -    size_t prologue_size, total_size;
> -    void *buf0, *buf1;
> +    size_t prologue_size;
>  
>      /* Put the prologue at the beginning of code_gen_buffer.  */
> -    buf0 = s->code_gen_buffer;
> -    total_size = s->code_gen_buffer_size;
> -    s->code_ptr = buf0;
> -    s->code_buf = buf0;
> +    tcg_region_assign(s, 0);
> +    s->code_ptr = s->code_gen_ptr;
> +    s->code_buf = s->code_gen_ptr;

Pardon me for asking a naive question, what's the difference between
s->code_buf and s->code_gen_buf and, respectively, s->code_ptr and
s->code_gen_ptr?

Thanks,
Roman

>      s->data_gen_ptr = NULL;
>  
> -    /*
> -     * The region trees are not yet configured, but tcg_splitwx_to_rx
> -     * needs the bounds for an assert.
> -     */
> -    region.start = buf0;
> -    region.end = buf0 + total_size;
> -
>  #ifndef CONFIG_TCG_INTERPRETER
> -    tcg_qemu_tb_exec = (tcg_prologue_fn *)tcg_splitwx_to_rx(buf0);
> +    tcg_qemu_tb_exec = (tcg_prologue_fn *)tcg_splitwx_to_rx(s->code_ptr);
>  #endif
>  
> -    /* Compute a high-water mark, at which we voluntarily flush the buffer
> -       and start over.  The size here is arbitrary, significantly larger
> -       than we expect the code generation for any one opcode to require.  */
> -    s->code_gen_highwater = s->code_gen_buffer + (total_size - TCG_HIGHWATER);
> -
>  #ifdef TCG_TARGET_NEED_POOL_LABELS
>      s->pool_labels = NULL;
>  #endif
> @@ -1246,32 +1232,32 @@ void tcg_prologue_init(TCGContext *s)
>      }
>  #endif
>  
> -    buf1 = s->code_ptr;
> +    prologue_size = tcg_current_code_size(s);
> +
>  #ifndef CONFIG_TCG_INTERPRETER
> -    flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(buf0), (uintptr_t)buf0,
> -                        tcg_ptr_byte_diff(buf1, buf0));
> +    flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),
> +                        (uintptr_t)s->code_buf, prologue_size);
>  #endif
>  
> -    /* Deduct the prologue from the buffer.  */
> -    prologue_size = tcg_current_code_size(s);
> -    s->code_gen_ptr = buf1;
> -    s->code_gen_buffer = buf1;
> -    s->code_buf = buf1;
> -    total_size -= prologue_size;
> -    s->code_gen_buffer_size = total_size;
> +    /* Deduct the prologue from the first region.  */
> +    region.start = s->code_ptr;
>  
> -    tcg_register_jit(tcg_splitwx_to_rx(s->code_gen_buffer), total_size);
> +    /* Recompute boundaries of the first region. */
> +    tcg_region_assign(s, 0);
> +
> +    tcg_register_jit(tcg_splitwx_to_rx(region.start),
> +                     region.end - region.start);
>  
>  #ifdef DEBUG_DISAS
>      if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
>          FILE *logfile = qemu_log_lock();
>          qemu_log("PROLOGUE: [size=%zu]\n", prologue_size);
>          if (s->data_gen_ptr) {
> -            size_t code_size = s->data_gen_ptr - buf0;
> +            size_t code_size = s->data_gen_ptr - s->code_gen_ptr;
>              size_t data_size = prologue_size - code_size;
>              size_t i;
>  
> -            log_disas(buf0, code_size);
> +            log_disas(s->code_gen_ptr, code_size);
>  
>              for (i = 0; i < data_size; i += sizeof(tcg_target_ulong)) {
>                  if (sizeof(tcg_target_ulong) == 8) {
> @@ -1285,7 +1271,7 @@ void tcg_prologue_init(TCGContext *s)
>                  }
>              }
>          } else {
> -            log_disas(buf0, prologue_size);
> +            log_disas(s->code_gen_ptr, prologue_size);
>          }
>          qemu_log("\n");
>          qemu_log_flush();
> -- 
> 2.25.1
> 

