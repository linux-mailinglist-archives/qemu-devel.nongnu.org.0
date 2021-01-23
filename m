Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7FF3014EB
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 12:55:29 +0100 (CET)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3HVn-0006wP-J3
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 06:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l3HUN-0006VU-IJ
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 06:53:59 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:56950 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l3HUL-0002Fr-5L
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 06:53:59 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DD6E6413A8;
 Sat, 23 Jan 2021 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1611402830;
 x=1613217231; bh=AAQApwJF5v5cDIWyfGg0N45W0ztFF+bxVz/nG+HxGhg=; b=
 ajMkS6t8raYbtyiMGaBtO5PUdtILZkXmCwJ+DwivasZoR/vsP/QWn+eljUY78+AX
 veD+2T9Y8kIIwDm7Qe6yqJ/BKz/g7xuQXYyBKL/og7twi7TtFC2XhCY1vQVzjUsV
 /HhN/RX3cYr1gHWRqwq2AivLx2e3sdJI4HIKMc6/hA4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBtj5hPhGOUA; Sat, 23 Jan 2021 14:53:50 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5D5A8413A2;
 Sat, 23 Jan 2021 14:53:49 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 23
 Jan 2021 14:53:49 +0300
Date: Sat, 23 Jan 2021 14:53:48 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4] tcg: Toggle page execution for Apple Silicon
Message-ID: <YAwOTAljKMLvHd7M@SPB-NB-133.local>
References: <20210121184752.1395873-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210121184752.1395873-1-richard.henderson@linaro.org>
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
Cc: agraf@csgraf.de, qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 08:47:52AM -1000, Richard Henderson wrote:
> From: Roman Bolshakov <r.bolshakov@yadro.com>
> 
> Pages can't be both write and executable at the same time on Apple
> Silicon. macOS provides public API to switch write protection [1] for
> JIT applications, like TCG.
> 
> 1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
> 
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Message-Id: <20210113032806.18220-1-r.bolshakov@yadro.com>
> [rth: Inline the qemu_thread_jit_* functions;
>  drop the MAP_JIT change for a follow-on patch.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> Supercedes: <20210113032806.18220-1-r.bolshakov@yadro.com>
> 
> This is the version of Roman's patch that I'm queuing to tcg-next.
> What's missing from the full "Fix execution" patch is setting MAP_JIT
> for !splitwx in alloc_code_gen_buffer().
> 

Richard, thanks for updating the patch. I have no objections against
moving the functions and inlining them. However I'm seeing an issue that
wasn't present in v3:

Process 37109 stopped                                                                                                                          * thread #6, stop reason = EXC_BAD_ACCESS (code=1, address=0xfffffffffffffd4f)
    frame #0: 0x00000001002f1c90 qemu-system-x86_64`tcg_emit_op(opc=INDEX_op_add_i64) at tcg.c:2531:5 [opt]                                       2528 TCGOp *tcg_emit_op(TCGOpcode opc)
   2529 {                                                                                                                                         2530     TCGOp *op = tcg_op_alloc(opc);
-> 2531     QTAILQ_INSERT_TAIL(&tcg_ctx->ops, op, link);
   2532     return op;
   2533 }
   2534
Target 0: (qemu-system-x86_64) stopped.
(lldb) bt
* thread #6, stop reason = EXC_BAD_ACCESS (code=1, address=0xfffffffffffffd4f)
  * frame #0: 0x00000001002f1c90 qemu-system-x86_64`tcg_emit_op(opc=INDEX_op_add_i64) at tcg.c:2531:5 [opt]
    frame #1: 0x000000010026f040 qemu-system-x86_64`tcg_gen_addi_i64 [inlined] tcg_gen_op3(opc=INDEX_op_add_i64, a1=4430334952, a2=4430333440,
a3=4430361496) at tcg-op.c:60:17 [opt]
    frame #2: 0x000000010026f038 qemu-system-x86_64`tcg_gen_addi_i64 [inlined] tcg_gen_op3_i64(opc=INDEX_op_add_i64, a1=<unavailable>, a2=<unav
ailable>, a3=<unavailable>) at tcg-op.h:94 [opt]
    frame #3: 0x000000010026f030 qemu-system-x86_64`tcg_gen_addi_i64 [inlined] tcg_gen_add_i64(ret=<unavailable>, arg1=<unavailable>, arg2=<una
vailable>) at tcg-op.h:618 [opt]
    frame #4: 0x000000010026f030 qemu-system-x86_64`tcg_gen_addi_i64(ret=<unavailable>, arg1=<unavailable>, arg2=<unavailable>) at tcg-op.c:123
5 [opt]
    frame #5: 0x000000010021d1e0 qemu-system-x86_64`gen_lea_modrm_1(s=<unavailable>, a=(def_seg = 2, base = 5, index = -1, scale = 0, disp = -6
89)) at translate.c:2101:9 [opt]
    frame #6: 0x000000010020eeec qemu-system-x86_64`disas_insn [inlined] gen_lea_modrm(env=0x0000000118610870, s=0x00000001700b6b00, modrm=<una
vailable>) at translate.c:2111:15 [opt]
    frame #7: 0x000000010020eec0 qemu-system-x86_64`disas_insn(s=0x00000001700b6b00, cpu=<unavailable>) at translate.c:5509 [opt]
    frame #8: 0x000000010020bb44 qemu-system-x86_64`i386_tr_translate_insn(dcbase=0x00000001700b6b00, cpu=<unavailable>) at translate.c:8573:15
 [opt]
    frame #9: 0x00000001002fbcf8 qemu-system-x86_64`translator_loop(ops=0x0000000100b209c8, db=0x00000001700b6b00, cpu=0x0000000118608000, tb=0
x0000000120017200, max_insns=512) at translator.c:0 [opt]
    frame #10: 0x000000010020b73c qemu-system-x86_64`gen_intermediate_code(cpu=<unavailable>, tb=<unavailable>, max_insns=<unavailable>) at tra
nslate.c:8635:5 [opt]
    frame #11: 0x0000000100257970 qemu-system-x86_64`tb_gen_code(cpu=0x0000000118608000, pc=<unavailable>, cs_base=0, flags=4194483, cflags=-16
777216) at translate-all.c:1931:5 [opt]
    frame #12: 0x00000001002deb90 qemu-system-x86_64`cpu_exec [inlined] tb_find(cpu=0x0000000118608000, last_tb=0x0000000000000000, tb_exit=<un
available>, cf_mask=0) at cpu-exec.c:456:14 [opt]
    frame #13: 0x00000001002deb54 qemu-system-x86_64`cpu_exec(cpu=0x0000000118608000) at cpu-exec.c:812 [opt]
    frame #14: 0x00000001002bc0d0 qemu-system-x86_64`tcg_cpus_exec(cpu=0x0000000118608000) at tcg-cpus.c:57:11 [opt]
    frame #15: 0x000000010024c2cc qemu-system-x86_64`rr_cpu_thread_fn(arg=<unavailable>) at tcg-cpus-rr.c:217:21 [opt]
    frame #16: 0x00000001004b00b4 qemu-system-x86_64`qemu_thread_start(args=<unavailable>) at qemu-thread-posix.c:521:9 [opt]
    frame #17: 0x0000000191c4d06c libsystem_pthread.dylib`_pthread_start + 320

I'm looking into the issue but perhaps we'll need v5.

Best regards,
Roman

> 
> r~
> 
> ---
>  include/qemu/osdep.h      | 28 ++++++++++++++++++++++++++++
>  accel/tcg/cpu-exec.c      |  2 ++
>  accel/tcg/translate-all.c |  3 +++
>  tcg/tcg.c                 |  1 +
>  4 files changed, 34 insertions(+)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index a434382c58..b6ffdc15bf 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -119,6 +119,10 @@ extern int daemon(int, int);
>  #include "sysemu/os-posix.h"
>  #endif
>  
> +#ifdef __APPLE__
> +#include <AvailabilityMacros.h>
> +#endif
> +
>  #include "glib-compat.h"
>  #include "qemu/typedefs.h"
>  
> @@ -682,4 +686,28 @@ char *qemu_get_host_name(Error **errp);
>   */
>  size_t qemu_get_host_physmem(void);
>  
> +/*
> + * Toggle write/execute on the pages marked MAP_JIT
> + * for the current thread.
> + */
> +#if defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
> +static inline void qemu_thread_jit_execute(void)
> +{
> +    if (__builtin_available(macOS 11.0, *)) {
> +        pthread_jit_write_protect_np(true);
> +    }
> +}
> +
> +static inline void qemu_thread_jit_write(void)
> +{
> +    if (__builtin_available(macOS 11.0, *)) {
> +        pthread_jit_write_protect_np(false);
> +    }
> +}
> +#else
> +static inline void qemu_thread_jit_write(void) {}
> +static inline void qemu_thread_jit_execute(void) {}
> +#endif
> +
>  #endif
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 37d17c8e88..6d017e46dd 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -186,6 +186,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
>      }
>  #endif /* DEBUG_DISAS */
>  
> +    qemu_thread_jit_execute();
>      ret = tcg_qemu_tb_exec(env, tb_ptr);
>      cpu->can_do_io = 1;
>      /*
> @@ -410,6 +411,7 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
>  {
>      uintptr_t old;
>  
> +    qemu_thread_jit_write();
>      assert(n < ARRAY_SIZE(tb->jmp_list_next));
>      qemu_spin_lock(&tb_next->jmp_lock);
>  
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 73fef47148..d09c187e0f 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1670,7 +1670,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
>  
>  static void tb_phys_invalidate__locked(TranslationBlock *tb)
>  {
> +    qemu_thread_jit_write();
>      do_tb_phys_invalidate(tb, true);
> +    qemu_thread_jit_execute();
>  }
>  
>  /* invalidate one TB
> @@ -1872,6 +1874,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>  #endif
>  
>      assert_memory_lock();
> +    qemu_thread_jit_write();
>  
>      phys_pc = get_page_addr_code(env, pc);
>  
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 5110f6f39c..4d734130df 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1112,6 +1112,7 @@ void tcg_prologue_init(TCGContext *s)
>      s->pool_labels = NULL;
>  #endif
>  
> +    qemu_thread_jit_write();
>      /* Generate the prologue.  */
>      tcg_target_qemu_prologue(s);
>  
> -- 
> 2.25.1
> 

