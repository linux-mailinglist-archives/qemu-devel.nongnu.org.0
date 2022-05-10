Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B3352115D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:48:13 +0200 (CEST)
Received: from localhost ([::1]:49204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMTU-0000Iv-6F
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1noLwL-00030O-FU
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:13:57 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45998 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1noLwJ-0006zx-J5
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:13:57 -0400
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxUNrOLHpi0eoPAA--.59752S3; 
 Tue, 10 May 2022 17:13:50 +0800 (CST)
Message-ID: <3c6fd51c-36ca-58f6-ea36-2c9dda70c40f@loongson.cn>
Date: Tue, 10 May 2022 17:13:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
 <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
 <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
 <CAFEAcA8y-ZVeEHDXUv2bAwKL9EumTmrJ-Xz1r23C7Lm0yajBdQ@mail.gmail.com>
 <402096bf-2a89-311e-6174-eac63b78f74a@linaro.org>
 <2dc9050b-00b2-e571-b553-f1d49c0d9a4a@loongson.cn>
 <edd5c684-03aa-ee73-e1a6-11afb89144c1@linaro.org>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <edd5c684-03aa-ee73-e1a6-11afb89144c1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxUNrOLHpi0eoPAA--.59752S3
X-Coremail-Antispam: 1UD129KBjvdXoWruF45AFyrWw45KrWDKryDZFb_yoWfCwc_Za
 47K348KwsFvFySkw4rtr45JFWxZ3yYkw1DtryjqFZ7G34SvF93Jrn29r18ua1UGa1qyrnr
 Jrnxu3y3J3yj9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbsxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
 ZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
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



在 2022/5/10 11:56, Richard Henderson 写道:
> On 5/9/22 19:54, maobibo wrote:
>> how about put address_space_iocsr as board rather than percpu since there is no concept
>> of "cpu package".
> 
> "cpu package" works ok as a device on the board.
> 
> I don't know if it's possible to have the iocsr address space controlled by the device, especially since it appears that the iocsr address space is *also* available -- or at least partially available -- in the main address space at base 0x1fe00000?

In the current hw implementation, iocsr/mmio address space can both be used for IPI/EXTIOI, in future mmio address space will be deprecated and removed, only iocsr will be used since it is easy for hw to abstract the interface.

In the next patch, main address space at base 0x1fe00000 for IPI/EXTIOI will be removed and only iocsr address space will be used. And iocsr address space can controlled by device also.
> 
> 
> r~


