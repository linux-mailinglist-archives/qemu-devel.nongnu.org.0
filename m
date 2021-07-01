Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C553B917D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 14:06:44 +0200 (CEST)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyvSt-0002kT-6w
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 08:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1lyvRZ-0001qQ-RE
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:05:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37630 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1lyvRT-0003iP-Lq
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:05:21 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr0Nwr91gYzobAA--.11038S3; 
 Thu, 01 Jul 2021 20:05:05 +0800 (CST)
Subject: Re: [PATCH 20/20] target/loongarch: Add linux-user emulation support
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
 <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
 <5188a660-4bec-45bd-81bc-25dd3ba38f9c@loongson.cn>
 <87y2arpu7u.fsf@linaro.org>
 <32f41893-ac70-1138-94b8-ca09748d2b69@loongson.cn>
 <f93f1192-38b9-6a19-1116-0002fdf1104c@redhat.com> <87k0mapbb5.fsf@linaro.org>
 <CAFEAcA_3vZWJ+9P-nBPOvDrmiECdHLbkoEiGvicUzAdaBAVnxw@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <d13c0d04-eef1-d61c-66a8-c3465ac96d1d@loongson.cn>
Date: Thu, 1 Jul 2021 20:05:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_3vZWJ+9P-nBPOvDrmiECdHLbkoEiGvicUzAdaBAVnxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr0Nwr91gYzobAA--.11038S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZr4kWF17trykCw13ur1xKrg_yoWkKFXEgr
 W29r97CanrCFW0qF4IyF15XFy2qrWIyry8Ary8ZrW3GFy8Ja48u34vgF1DZa4fGrWrArsx
 Kwn3XryI9w1q9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbT8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
 j40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
 4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021年07月01日 18:53, Peter Maydell 写道:
> On Thu, 1 Jul 2021 at 11:40, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>> I think we'd need some way of automatic regression testing for new
>>> targets. If your board has a serial UART that is easy to use, then
>>> please add a test in tests/qtest/boot-serial-test.c.
>>
>> You can also write a very minimal softmmu harness with either
>> semihosting or a debug port - currently we can run the tests for
>> x86/arm/alpha. See tests/tcg/multiarch/system and the various
>> boot.S/kernel.ld in tests/tcg/FOO/system and the Makefile.softmmu-target
>> in the relevant directories.
> 
> You can only use semihosting if your architecture has actually defined
> (ie written down in a spec document that you intend to adhere to)
> an ABI for it, though...
yes, the architecture is actually defined and real hw box is used already,
only that software does not go into upstream. We will wait for gcc compiler
merged into upstream and send a minimal softmmu version, and add bare-metal
test cases in tests/tcg/FOO/system directory.

However thanks for your guidance anyway.

regards
bibo, mao
> 
> -- PMM
> 


