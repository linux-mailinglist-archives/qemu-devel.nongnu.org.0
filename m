Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2F95529D7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 05:57:49 +0200 (CEST)
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3V1Q-000873-CJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 23:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o3Uzy-0006g2-JR
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 23:56:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35906 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o3Uzv-0005TL-Rl
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 23:56:18 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0xZQbFim_hQAA--.23985S3; 
 Tue, 21 Jun 2022 11:56:09 +0800 (CST)
Subject: Re: [PATCH v18 02/13] linux-user: Add LoongArch signal support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220620093401.3727352-1-gaosong@loongson.cn>
 <20220620093401.3727352-3-gaosong@loongson.cn>
 <60e4b2f3-8e62-bd81-7ef3-298863afe16c@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <978a16a0-8d4b-411d-5235-475aa2804857@loongson.cn>
Date: Tue, 21 Jun 2022 11:56:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <60e4b2f3-8e62-bd81-7ef3-298863afe16c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxP0xZQbFim_hQAA--.23985S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAw17tr4DWr18KFW8WF1rWFg_yoW5Zr43pF
 4kJrWkAFWUJrs5Cr1DJa18XFyrAr1kJa1UJr48X3WYyF4avr10gry7Wr4q9F1UAw4xGF12
 kF1j9wsxZrsrJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Richard

On 2022/6/21 上午12:23, Richard Henderson wrote:
> On 6/20/22 02:33, Song Gao wrote:
>> +static int restore_sigcontext(CPULoongArchState *env,
>> +                               struct target_sigcontext *sc)
>> +{
>> +    int i;
>> +    int ret = 0;
>> +    struct extctx_layout extctx;
>> +
>> +    memset(&extctx, 0, sizeof(struct extctx_layout));
>> +
>> +    __get_user(extctx.flags, &sc->sc_flags);
>> +
>> +    ret = parse_extcontext(sc, &extctx);
>> +    if (ret < 0) {
>> +        goto bad;
>> +    }
>> +
>> +    __get_user(env->pc, &sc->sc_pc);
>> +    for (i = 1; i < 32; ++i) {
>> +        __get_user(env->gpr[i], &sc->sc_regs[i]);
>> +    }
>> +
>> +    if (extctx.fpu.addr) {
>> +        copy_fpu_from_sigcontext(env, &extctx);
>> +        restore_fp_status(env);
>> +    }
>> +bad:
>> +    return ret;
>> +}
>
> This is missing lock_user/unlock_user somewhere.
> You can't use the double-underscore __get/__put_user without having 
> done that.
>
My understanding is that the struct exctx need 
lock_user_struct/unlock_user_struct,  then we can use __get/__put the 
struct extctx.
> You can use the non-underscore get_user in parse_extcontext, and 
> separately lock the target_fpu_context.  Failures must goto invalid.
>
>
>> +void setup_rt_frame(int sig, struct target_sigaction *ka,
>> +                    target_siginfo_t *info,
>> +                    target_sigset_t *set, CPULoongArchState *env)
>> +{
>> +    struct target_rt_sigframe *frame;
>> +    struct extctx_layout extctx;
>> +    abi_ulong frame_addr;
>> +    int i;
>> +
>> +    frame_addr = get_sigframe(ka, env, sizeof(*frame), &extctx);
>> +    trace_user_setup_rt_frame(env, frame_addr);
>> +    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
>> +        goto give_sigsegv;
>> +    }
>
> Similarly, this lock...
>
>> +
>> +    tswap_siginfo(&frame->rs_info, info);
>> +
>> +    __put_user(0, &frame->rs_uc.tuc_flags);
>> +    __put_user(0, &frame->rs_uc.tuc_link);
>> +    target_save_altstack(&frame->rs_uc.tuc_stack, env);
>> +
>> +    setup_sigcontext(env, &frame->rs_uc.tuc_mcontext, &extctx);
>
> ... fails to cover the extra memory allocated for extctx.
>
> This is why I suggested statically allocating the extra
> pieces of the signal frame *on write*.  You obviously
> cannot rely on the signal frame being identical on
> signal return -- the guest is allowed to create any valid
> context to give to rt_sigreturn.
>
I don’t know if my understanding is correct,

we can put the exctx or target_fpu_context into target_rt_sigframe, like 
this:
struct target_rt_sigframe {
     struct target_siginfo rs_info;
     struct target_ucontext rs_uc;
     struct extctx_layout rs_ext;
};
This way  that we just need lo lock/unlock target_rt_sigframe on 
setup_sigcontext/restore_sigcontext,

Thanks.
Song Gao


