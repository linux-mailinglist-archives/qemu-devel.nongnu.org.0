Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87763017A6
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:34:59 +0100 (CET)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3NkQ-0008Ha-G9
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l3NjH-0007dR-On
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:33:47 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:63225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l3NjD-0000fz-Uv
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:33:46 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 596D07462BD;
 Sat, 23 Jan 2021 19:33:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 14A9B7456E3; Sat, 23 Jan 2021 19:33:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 12CD57456B4;
 Sat, 23 Jan 2021 19:33:37 +0100 (CET)
Date: Sat, 23 Jan 2021 19:33:37 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v4] tcg: Toggle page execution for Apple Silicon
In-Reply-To: <YAxlLvAbQzbHYwjB@SPB-NB-133.local>
Message-ID: <b5145cfa-994a-f06f-a26b-2566417e7a4b@eik.bme.hu>
References: <20210121184752.1395873-1-richard.henderson@linaro.org>
 <YAwOTAljKMLvHd7M@SPB-NB-133.local> <YAxlLvAbQzbHYwjB@SPB-NB-133.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: agraf@csgraf.de, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 23 Jan 2021, Roman Bolshakov wrote:
> On Sat, Jan 23, 2021 at 02:53:49PM +0300, Roman Bolshakov wrote:
>> On Thu, Jan 21, 2021 at 08:47:52AM -1000, Richard Henderson wrote:
>>> From: Roman Bolshakov <r.bolshakov@yadro.com>
>>>
>>> Pages can't be both write and executable at the same time on Apple
>>> Silicon. macOS provides public API to switch write protection [1] for
>>> JIT applications, like TCG.
>>>
>>> 1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
>>>
>>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>> Message-Id: <20210113032806.18220-1-r.bolshakov@yadro.com>
>>> [rth: Inline the qemu_thread_jit_* functions;
>>>  drop the MAP_JIT change for a follow-on patch.]
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>
>>> Supercedes: <20210113032806.18220-1-r.bolshakov@yadro.com>
>>>
>>> This is the version of Roman's patch that I'm queuing to tcg-next.
>>> What's missing from the full "Fix execution" patch is setting MAP_JIT
>>> for !splitwx in alloc_code_gen_buffer().
>>>
>>
>> Richard, thanks for updating the patch. I have no objections against
>> moving the functions and inlining them. However I'm seeing an issue that
>> wasn't present in v3:
>>
>> Process 37109 stopped                                                                                                                          * thread #6, stop reason = EXC_BAD_ACCESS (code=1, address=0xfffffffffffffd4f)
>>     frame #0: 0x00000001002f1c90 qemu-system-x86_64`tcg_emit_op(opc=INDEX_op_add_i64) at tcg.c:2531:5 [opt]                                       2528 TCGOp *tcg_emit_op(TCGOpcode opc)
>>    2529 {                                                                                                                                         2530     TCGOp *op = tcg_op_alloc(opc);
>> -> 2531     QTAILQ_INSERT_TAIL(&tcg_ctx->ops, op, link);
>>    2532     return op;
>>    2533 }
>>    2534
>> Target 0: (qemu-system-x86_64) stopped.
>> (lldb) bt
>> * thread #6, stop reason = EXC_BAD_ACCESS (code=1, address=0xfffffffffffffd4f)
>>   * frame #0: 0x00000001002f1c90 qemu-system-x86_64`tcg_emit_op(opc=INDEX_op_add_i64) at tcg.c:2531:5 [opt]
>>     frame #1: 0x000000010026f040 qemu-system-x86_64`tcg_gen_addi_i64 [inlined] tcg_gen_op3(opc=INDEX_op_add_i64, a1=4430334952, a2=4430333440,
>> a3=4430361496) at tcg-op.c:60:17 [opt]
>>     frame #2: 0x000000010026f038 qemu-system-x86_64`tcg_gen_addi_i64 [inlined] tcg_gen_op3_i64(opc=INDEX_op_add_i64, a1=<unavailable>, a2=<unav
>> ailable>, a3=<unavailable>) at tcg-op.h:94 [opt]
>>     frame #3: 0x000000010026f030 qemu-system-x86_64`tcg_gen_addi_i64 [inlined] tcg_gen_add_i64(ret=<unavailable>, arg1=<unavailable>, arg2=<una
>> vailable>) at tcg-op.h:618 [opt]
>>     frame #4: 0x000000010026f030 qemu-system-x86_64`tcg_gen_addi_i64(ret=<unavailable>, arg1=<unavailable>, arg2=<unavailable>) at tcg-op.c:123
>> 5 [opt]
>>     frame #5: 0x000000010021d1e0 qemu-system-x86_64`gen_lea_modrm_1(s=<unavailable>, a=(def_seg = 2, base = 5, index = -1, scale = 0, disp = -6
>> 89)) at translate.c:2101:9 [opt]
>>     frame #6: 0x000000010020eeec qemu-system-x86_64`disas_insn [inlined] gen_lea_modrm(env=0x0000000118610870, s=0x00000001700b6b00, modrm=<una
>> vailable>) at translate.c:2111:15 [opt]
>>     frame #7: 0x000000010020eec0 qemu-system-x86_64`disas_insn(s=0x00000001700b6b00, cpu=<unavailable>) at translate.c:5509 [opt]
>>     frame #8: 0x000000010020bb44 qemu-system-x86_64`i386_tr_translate_insn(dcbase=0x00000001700b6b00, cpu=<unavailable>) at translate.c:8573:15
>>  [opt]
>>     frame #9: 0x00000001002fbcf8 qemu-system-x86_64`translator_loop(ops=0x0000000100b209c8, db=0x00000001700b6b00, cpu=0x0000000118608000, tb=0
>> x0000000120017200, max_insns=512) at translator.c:0 [opt]
>>     frame #10: 0x000000010020b73c qemu-system-x86_64`gen_intermediate_code(cpu=<unavailable>, tb=<unavailable>, max_insns=<unavailable>) at tra
>> nslate.c:8635:5 [opt]
>>     frame #11: 0x0000000100257970 qemu-system-x86_64`tb_gen_code(cpu=0x0000000118608000, pc=<unavailable>, cs_base=0, flags=4194483, cflags=-16
>> 777216) at translate-all.c:1931:5 [opt]
>>     frame #12: 0x00000001002deb90 qemu-system-x86_64`cpu_exec [inlined] tb_find(cpu=0x0000000118608000, last_tb=0x0000000000000000, tb_exit=<un
>> available>, cf_mask=0) at cpu-exec.c:456:14 [opt]
>>     frame #13: 0x00000001002deb54 qemu-system-x86_64`cpu_exec(cpu=0x0000000118608000) at cpu-exec.c:812 [opt]
>>     frame #14: 0x00000001002bc0d0 qemu-system-x86_64`tcg_cpus_exec(cpu=0x0000000118608000) at tcg-cpus.c:57:11 [opt]
>>     frame #15: 0x000000010024c2cc qemu-system-x86_64`rr_cpu_thread_fn(arg=<unavailable>) at tcg-cpus-rr.c:217:21 [opt]
>>     frame #16: 0x00000001004b00b4 qemu-system-x86_64`qemu_thread_start(args=<unavailable>) at qemu-thread-posix.c:521:9 [opt]
>>     frame #17: 0x0000000191c4d06c libsystem_pthread.dylib`_pthread_start + 320
>>
>> I'm looking into the issue but perhaps we'll need v5.
>>
>
> Nope. The issue is not directly related to the patch and W^X. I think it
> can be applied.
>
> tcg_ctx->ops is somehow getting corrupted despite it's initialized
> properly during TCG start:
>
> (lldb) p tcg_ctx->ops
> (TCGContext::(anonymous union)) $18 = {
>  tqh_first = 0x0000008401010000
>  tqh_circ = {
>    tql_next = 0x0000008401010000
>    tql_prev = 0xfffffffffffffd4f
>  }
> }
>
> I've bisected it (with v3 of Apple Silicon fix for TCG) to:
>
> commit 8fe35e0444be88de4e3ab80a2a0e210a1f6d663d
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Mon Mar 30 20:42:43 2020 -0700
>
>    tcg/optimize: Use tcg_constant_internal with constant folding

Yes, known problem, see https://bugs.launchpad.net/qemu/+bug/1912065

Regards,
BALATON Zoltan

>    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> tcg/optimize.c | 108 ++++++++++++++++++++++++++-------------------------------
> 1 file changed, 49 insertions(+), 59 deletions(-)
>
> Although, it crashes with a bit different backtrace than provided above:
>
> Process 17251 stopped
> * thread #6, stop reason = EXC_BAD_ACCESS (code=1, address=0x10)
>    frame #0: 0x00000001002727a8 qemu-system-x86_64`tcg_opt_gen_mov [inlined] ts_is_copy(ts=<unavailable>) at optimize.c:68:25 [opt]
>   65
>   66   static inline bool ts_is_copy(TCGTemp *ts)
>   67   {
> -> 68       return ts_info(ts)->next_copy != ts;
>   69   }
>   70
>   71   /* Reset TEMP's state, possibly removing the temp for the list of copies.  */
> Target 0: (qemu-system-x86_64) stopped.
> (lldb) bt
> * thread #6, stop reason = EXC_BAD_ACCESS (code=1, address=0x10)
>  * frame #0: 0x00000001002727a8 qemu-system-x86_64`tcg_opt_gen_mov [inlined] ts_is_copy(ts=<unavailable>) at optimize.c:68:25 [opt]
>    frame #1: 0x00000001002727a4 qemu-system-x86_64`tcg_opt_gen_mov [inlined] ts_are_copies(ts1=0x00000001202e8e50, ts2=0x00000001202ef398) at optimize.c:163 [opt]
>    frame #2: 0x000000010027278c qemu-system-x86_64`tcg_opt_gen_mov(s=0x00000001202e8000, op=0x0000000119157710, dst=4834889296, src=4834915224) at optimize.c:191 [opt]
>    frame #3: 0x0000000100271740 qemu-system-x86_64`tcg_optimize(s=<unavailable>) at optimize.c:0:9 [opt]
>    frame #4: 0x00000001002f39c4 qemu-system-x86_64`tcg_gen_code(s=0x00000001202e8000, tb=0x0000000128020800) at tcg.c:4407:5 [opt]
>    frame #5: 0x00000001002b2688 qemu-system-x86_64`tb_gen_code(cpu=0x0000000118428000, pc=<unavailable>, cs_base=0, flags=4194483, cflags=-16777216) at translate-all.c:1961:21 [opt]
>    frame #6: 0x0000000100279460 qemu-system-x86_64`cpu_exec [inlined] tb_find(cpu=0x0000000118428000, last_tb=0x0000000000000000, tb_exit=<unavailable>, cf_mask=0) at cpu-exec.c:456:14 [opt]
>    frame #7: 0x0000000100279424 qemu-system-x86_64`cpu_exec(cpu=0x0000000118428000) at cpu-exec.c:812 [opt]
>    frame #8: 0x000000010026ea74 qemu-system-x86_64`tcg_cpus_exec(cpu=0x0000000118428000) at tcg-cpus.c:57:11 [opt]
>    frame #9: 0x0000000100284efc qemu-system-x86_64`rr_cpu_thread_fn(arg=<unavailable>) at tcg-cpus-rr.c:217:21 [opt]
>    frame #10: 0x00000001004cffe8 qemu-system-x86_64`qemu_thread_start(args=<unavailable>) at qemu-thread-posix.c:521:9 [opt]
>    frame #11: 0x0000000191c4d06c libsystem_pthread.dylib`_pthread_start + 320
>
> The problem is that ts2 in ts_are_copies() contains NULL state_ptr:
>
> (lldb) p *ts2
> (TCGTemp) $2 = {
>  reg = TCG_REG_X0
>  val_type = TEMP_VAL_DEAD
>  base_type = TCG_TYPE_I64
>  type = TCG_TYPE_I64
>  kind = TEMP_CONST
>  indirect_reg = 0
>  indirect_base = 0
>  mem_coherent = 0
>  mem_allocated = 0
>  temp_allocated = 1
>  val = -690
>  mem_base = 0x0000000000000000
>  mem_offset = 0
>  name = 0x0000000000000000
>  state = 0
>  state_ptr = 0x0000000000000000
> }
>
> -Roman
>
>

