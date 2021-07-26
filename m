Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407CA3D5670
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:24:56 +0200 (CEST)
Received: from localhost ([::1]:50504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wr1-0008Mx-Aw
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m7wqA-0007hB-A2
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:24:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41818 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m7wq3-0007tL-SZ
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:24:01 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf0Mjf_5gawEkAA--.23234S3; 
 Mon, 26 Jul 2021 17:23:49 +0800 (CST)
Subject: Re: [PATCH v2 04/22] target/loongarch: Add interrupt handling support
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-5-git-send-email-gaosong@loongson.cn>
 <bc0364e8-8cf3-da3a-a264-d82f3959b279@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <17389330-9d83-4500-cd4d-9808a28fd205@loongson.cn>
Date: Mon, 26 Jul 2021 17:23:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bc0364e8-8cf3-da3a-a264-d82f3959b279@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf0Mjf_5gawEkAA--.23234S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GF18KFy3Aw4DJF4DZF18Krg_yoWftFg_Ww
 47uw1UXr1DJ3yUtr1UZry3Zw17JF1Ut34xtr4Ykr1UGw15Jrs5Jr15Xwn5Ar1fGr48Jr17
 JrWYq3WayF1UWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbhxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.091,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard.

On 07/23/2021 06:47 AM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> +bool loongarch_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>> +{
>> +    if (interrupt_request & CPU_INTERRUPT_HARD) {
>> +        LoongArchCPU *cpu = LOONGARCH_CPU(cs);
>> +        CPULoongArchState *env = &cpu->env;
>> +
>> +        if (cpu_loongarch_hw_interrupts_enabled(env) &&
>> +            cpu_loongarch_hw_interrupts_pending(env)) {
>> +            cs->exception_index = EXCP_INTE;
>> +            env->error_code = 0;
>> +            loongarch_cpu_do_interrupt(cs);
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
> 
> Not sure what you're doing here, with user-only.  None of these conditions apply.
> 

OK, I'll remove it.

Thanks
Song Gao.


