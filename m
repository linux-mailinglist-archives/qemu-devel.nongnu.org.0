Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C82E9D3E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 19:42:34 +0100 (CET)
Received: from localhost ([::1]:42782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwUoK-00039l-DY
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 13:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1kwUlF-0002PZ-Ok
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 13:39:23 -0500
Received: from mail.csgraf.de ([188.138.100.120]:58842
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1kwUlB-0003bW-KG
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 13:39:21 -0500
Received: from Alexanders-Mini.alex.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id E132A390028F;
 Mon,  4 Jan 2021 19:39:13 +0100 (CET)
Subject: Re: [PATCH v2] tcg: Fix execution on Apple Silicon
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210103145055.11074-1-r.bolshakov@yadro.com>
 <87zh1o3epo.fsf@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <2ac32d95-9d15-e52e-c91e-93ca043e5f40@csgraf.de>
Date: Mon, 4 Jan 2021 19:39:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <87zh1o3epo.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 04.01.21 16:23, Alex Bennée wrote:
> Roman Bolshakov <r.bolshakov@yadro.com> writes:
>
>> Pages can't be both write and executable at the same time on Apple
>> Silicon. macOS provides public API to switch write protection [1] for
>> JIT applications, like TCG.
>>
>> 1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
>>
>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> ---
>> v1: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00073.html
>> Changes since v1:
>>
>>   - Pruned not needed fiddling with W^X and dropped symmetry from write
>>     lock/unlock and renamed related functions.
>>     Similar approach is used in JavaScriptCore [1].
>>
>>   - Moved jit helper functions to util/osdep
>>                                                                                                                                                    As outlined in osdep.h, this matches to (2):                                                                                                                                                                                                                                                    * In an ideal world this header would contain only:                                                                                            *  (1) things which everybody needs                                                                                                            *  (2) things without which code would work on most platforms but                                                                              *      fail to compile or misbehave on a minority of host OSes
>>
>>   - Fixed a checkpatch error
>>
>>   - Limit new behaviour only to macOS 11.0 and above, because of the
>>     following declarations:
>>
>>     __API_AVAILABLE(macos(11.0))
>>     __API_UNAVAILABLE(ios, tvos, watchos)
>>     void pthread_jit_write_protect_np(int enabled);
>>
>>     __API_AVAILABLE(macos(11.0))
>>     __API_UNAVAILABLE(ios, tvos, watchos)
>>     int pthread_jit_write_protect_supported_np(void);
>>
>>   1. https://bugs.webkit.org/attachment.cgi?id=402515&action=prettypatch
>>
>>   accel/tcg/cpu-exec.c      |  2 ++
>>   accel/tcg/translate-all.c |  6 ++++++
>>   include/qemu/osdep.h      |  3 +++
>>   tcg/tcg.c                 |  1 +
>>   util/osdep.c              | 22 ++++++++++++++++++++++
>>   5 files changed, 34 insertions(+)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 8689c54499..374060eb45 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -175,6 +175,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
>>       }
>>   #endif /* DEBUG_DISAS */
>>   
>> +    qemu_thread_jit_execute();
>>       ret = tcg_qemu_tb_exec(env, tb_ptr);
>>       cpu->can_do_io = 1;
>>       last_tb = (TranslationBlock *)(ret & ~TB_EXIT_MASK);
>> @@ -382,6 +383,7 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
>>   {
>>       uintptr_t old;
>>   
>> +    qemu_thread_jit_write();
>>       assert(n < ARRAY_SIZE(tb->jmp_list_next));
>>       qemu_spin_lock(&tb_next->jmp_lock);
>>   
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index b7d50a73d4..88ae5d35ef 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -1072,6 +1072,9 @@ static inline void *alloc_code_gen_buffer(void)
>>       size_t size = tcg_ctx->code_gen_buffer_size;
>>       void *buf;
>>   
>> +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)
>> +    flags |= MAP_JIT;
>> +#endif
>>       buf = mmap(NULL, size, prot, flags, -1, 0);
>>       if (buf == MAP_FAILED) {
>>           return NULL;
>> @@ -1485,7 +1488,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
>>   
>>   static void tb_phys_invalidate__locked(TranslationBlock *tb)
>>   {
>> +    qemu_thread_jit_write();
>>       do_tb_phys_invalidate(tb, true);
>> +    qemu_thread_jit_execute();
>>   }
>>   
>>   /* invalidate one TB
>> @@ -1687,6 +1692,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>   #endif
>>   
>>       assert_memory_lock();
>> +    qemu_thread_jit_write();
>>   
>>       phys_pc = get_page_addr_code(env, pc);
>>   
>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> index f9ec8c84e9..89abebcf5d 100644
>> --- a/include/qemu/osdep.h
>> +++ b/include/qemu/osdep.h
>> @@ -686,4 +686,7 @@ char *qemu_get_host_name(Error **errp);
>>    */
>>   size_t qemu_get_host_physmem(void);
>>   
>> +void qemu_thread_jit_write(void);
>> +void qemu_thread_jit_execute(void);
>> +
>>   #endif
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index 43c6cf8f52..ab8488f5d5 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -1065,6 +1065,7 @@ void tcg_prologue_init(TCGContext *s)
>>       s->pool_labels = NULL;
>>   #endif
>>   
>> +    qemu_thread_jit_write();
>>       /* Generate the prologue.  */
>>       tcg_target_qemu_prologue(s);
>>   
>> diff --git a/util/osdep.c b/util/osdep.c
>> index 66d01b9160..80ec7185da 100644
>> --- a/util/osdep.c
>> +++ b/util/osdep.c
>> @@ -606,3 +606,25 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
>>       return readv_writev(fd, iov, iov_cnt, true);
>>   }
>>   #endif
>> +
>> +#if defined(__APPLE__) && defined(MAC_OS_VERSION_11_0)


Will this be defined in future versions?


>> +static inline void qemu_thread_jit_write_protect(bool enabled)
>> +{
>> +    if (pthread_jit_write_protect_supported_np()) {


Do we need this call? Sounds like extra overhead to me.


>> +        pthread_jit_write_protect_np(enabled);
>> +    }
>> +}
>> +
>> +void qemu_thread_jit_execute(void)
>> +{
>> +    qemu_thread_jit_write_protect(true);
>> +}
>> +
>> +void qemu_thread_jit_write(void)
>> +{
>> +    qemu_thread_jit_write_protect(false);
>> +}
> What happens if you emulate a -smp 2 ARM guest? In this case MTTCG
> should be enabled (same guest ordering) but you run a risk of attempting
> to execute code while write is enabled.
>
> Is there any way to only change the mapping for the parts of the TB
> cache used by a thread? Otherwise we'll need additional logic in
> default_mttcg_enabled to ensure we don't accidentally enable it on Apple
> silicon.


The actual protection logic is per thread, so the MTTCG side thread 
won't be affected by the flips.

Given this super specific semantic that is impossible to mimic on other 
platforms, we should probably name the functions accordingly and make 
sure people understand this is *only* for macos.

Also, is there anything this patch doesn't do that the one from Joelle 
does? It seems a bit ... short.


Alex



