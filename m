Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5A2434668
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:04:35 +0200 (CEST)
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6aQ-0007ho-FJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1md6Z3-0005xM-Pn
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:03:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43762 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1md6Yy-0000Fz-4K
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:03:09 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz2k5uW9hWBgdAA--.30136S3; 
 Wed, 20 Oct 2021 14:37:46 +0800 (CST)
Subject: Re: [PATCH v7 16/21] target/loongarch: Add disassembler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-17-git-send-email-gaosong@loongson.cn>
 <f55bffde-64ec-d390-2942-4ec4b2bbedbc@xen0n.name>
 <9ba04d0a-44bb-1ebd-31f4-35c282842b4a@linaro.org>
 <75f4be9c-47b7-415f-4468-093b74130481@xen0n.name>
 <8e1da0c0-5f24-abca-78de-2304c1453904@linaro.org>
 <95bb07bb-d1ad-c166-8af4-b2ac9ae7dcdf@amsat.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <c3b80ba4-aaa8-4530-3857-ffa218f6c618@loongson.cn>
Date: Wed, 20 Oct 2021 14:37:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <95bb07bb-d1ad-c166-8af4-b2ac9ae7dcdf@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz2k5uW9hWBgdAA--.30136S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw17uFWDWrWxuFy8JrykGrg_yoW8GFW7pa
 92kasrKF4Dt3y0yrn2g3W7Xa1UtF48JFn8Xan5Xry8A3Z0g343Xrn7Kan8Ca43Cr1xC34U
 ZF4jqa43Zr4kZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn, peterx@redhat.com, laurent@vivier.eu,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, philmd@redhat.com, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, all.

On 10/19/2021 02:57 AM, Philippe Mathieu-Daudé wrote:
> On 10/18/21 20:33, Richard Henderson wrote:
>> On 10/18/21 11:18 AM, WANG Xuerui wrote:
>>> On 10/19/21 01:29, Richard Henderson wrote:
>>>> On 10/18/21 8:38 AM, WANG Xuerui wrote:
>>>>>
>>>>> For now any implementation would suffice, and I already saw one or
>>>>> two bugs in the output during my TCG host work, but it surely would
>>>>> be nice to switch to generated decoder in the future. The
>>>>> loongarch-opcodes tables could be extended to support peculiarities
>>>>> as exhibited in the v1.00 ISA manual and binutils implementation,
>>>>> via additional attributes, and I'm open to such contributions.
>>>>
>>>> Perhaps it would be easiest to re-use the decodetree description?
>>>> See e.g. target/openrisc/disas.c.
>>>>
>>> Indeed; I didn't thought of disassemblers in target/ instead of
>>> disas/. That would be the most elegant way forward!
>>
>>
>> The one quirk will be that so far using decodetree for disas is limited
>> to the target, whereas you'll want this for host as well.  It shouldn't
>> be a big deal, just a small matter of the correct build rules.
> 
> Oh, good to know. OTOH I expect very few developers to look at
> host disas.
> 

Sorry to reply too late, I asked for leave yesterday.

This patch refers to disas/riscv.c. 

I didn't notice target/openrisc/disas.c before.  Thanks for Richard' advice.


Thanks
Song Gao 


