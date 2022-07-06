Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B37556864B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:59:23 +0200 (CEST)
Received: from localhost ([::1]:47194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92kb-0000PT-VU
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1o92id-00080d-7D
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:57:19 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39264 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1o92ia-0004KB-8q
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:57:18 -0400
Received: from smtpclient.apple (unknown [111.199.64.159])
 by APP-05 (Coremail) with SMTP id zQCowAAXH7OAasVii4AMCw--.30528S2;
 Wed, 06 Jul 2022 18:57:04 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YsRwyMONg0+mHVsL@apples>
Date: Wed, 6 Jul 2022 18:57:04 +0800
Cc: qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <43986990-9A3F-426F-8127-3DAAD43524EC@ict.ac.cn>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <YsRwyMONg0+mHVsL@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowAAXH7OAasVii4AMCw--.30528S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4xXF4rtFWxGw4kZryrZwb_yoWkCrb_ur
 W5t3yjy34jyrs3tFySyF13Ar12gF45A3W2v345Kry7tas5tr909F4qvryfuFyfGa9Ykr9x
 Jw1Uta42g34IgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFAYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5PpnJUUUUU==
X-Originating-IP: [111.199.64.159]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

at 1:11 AM, Klaus Jensen <its@irrelevant.dk> wrote:

> On Jul  5 22:24, Jinhao Fan wrote:
>> Add property "ioeventfd" which is enabled by default. When this is
>> enabled, updates on the doorbell registers will cause KVM to signal
>> an event to the QEMU main loop to handle the doorbell updates.
>> Therefore, instead of letting the vcpu thread run both guest VM and
>> IO emulation, we now use the main loop thread to do IO emulation and
>> thus the vcpu thread has more cycles for the guest VM.
> 
> This is not entirely accurate.
> 
> Yes, the ioeventfd causes the doorbell write to be handled by the main
> iothread, but previously we did not do any substantial device emulation
> in the vcpu thread either. That is the reason why we only handle the
> bare minimum of the doorbell write and then defer any work until the
> timer fires on the main iothread.
> 
> But with this patch we just go ahead and do the work (nvme_process_sq)
> immediately since we are already in the main iothread.
> 

Thanks for pointing this out. I previously thought the timers are fired in
the vcpu threads. I misunderstood why this optimization works but
accidentally got the code right.


