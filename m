Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9562530EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:01:59 +0200 (CEST)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7h9-00010s-13
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1nt7cY-0005lZ-8h
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:57:15 -0400
Received: from mail-m17639.qiye.163.com ([59.111.176.39]:21864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1nt7cR-0001l5-4U
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:57:10 -0400
Received: from [0.0.0.0] (unknown
 [IPV6:240e:3b7:3279:ade0:7183:2320:bad7:f528])
 by mail-m17639.qiye.163.com (Hmail) with ESMTPA id C4B3738031A;
 Mon, 23 May 2022 20:47:09 +0800 (CST)
Subject: Re: PCI memory sync question (kvm,dpdk,e1000,packet stalled)
To: Stefan Hajnoczi <stefanha@gmail.com>, ASM <asm@asm.pp.ru>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, dmitry.fleytman@gmail.com
References: <CAMmAVbWzrYWZBXwKxSd-f5SXmq6qP1ok8abvyKJhp3=REEaMPA@mail.gmail.com>
 <CAMmAVbXNMjk=FasuySEcUa0U8CqGkCghehsJsWbVV2VHCAPA-w@mail.gmail.com>
 <20191121140502.GX439743@stefanha-x1.localdomain>
 <CAMmAVbW5a+v_dJ6NM3erwouOqpXyTzL36_W566SL1KuPFPFSEw@mail.gmail.com>
 <20191219145817.GG1624084@stefanha-x1.localdomain>
 <CAMmAVbVoHcTiBnOVtFb5MS3V-in0u=4k4WPHcpxGtYF8Pv5bKQ@mail.gmail.com>
 <20200102110504.GG121208@stefanha-x1.localdomain>
From: Ding Hui <dinghui@sangfor.com.cn>
Message-ID: <3dbd93db-e098-7a07-6000-4e055ffe8c94@sangfor.com.cn>
Date: Mon, 23 May 2022 20:47:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20200102110504.GG121208@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRpDGU9WTUlDGh5NGklDGE
 NKVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OE06Ijo6Az00TDcITwgjFko8
 DzUKFE1VSlVKTU5ISEpLS0hLT0JCVTMWGhIXVR8SFRwTDhI7CBoVHB0UCVUYFBZVGBVFWVdZEgtZ
 QVlJT0seQUgZTEFISUxCQRofHktBTEpDSEFJSElLQRkaH0xBHU5JQ1lXWQgBWUFNSkhJNwY+
X-HM-Tid: 0a80f0f50133d994kuwsc4b3738031a
Received-SPF: pass client-ip=59.111.176.39;
 envelope-from=dinghui@sangfor.com.cn; helo=mail-m17639.qiye.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi ASM

I think I meet the almost exactly same issue with ASM (qemu e1000 tap, 
guest run dpdk), in our environment, rather than your github project

It seems that the desc (not only status filed, we also traced 
buffer_addr and csum) changed to old value suddenly after guest dpdk set 
status to 0

So I googled the issue, and found the bug at 
https://bugs.launchpad.net/qemu/+bug/1853123 and this mail list.

Can you tell me what's your workaround, and do you find out the root cause?

Thanks a lot

On 2020/1/2 19:05, Stefan Hajnoczi wrote:
> On Mon, Dec 30, 2019 at 01:10:15PM +0300, ASM wrote:
>>> It could be a bug in QEMU's e1000 emulation - maybe it's not doing
>>> things in the correct order and causes a race condition with the DPDK
>>> polling driver - or it could be a bug in the DPDK e1000 driver regarding
>>> the order in which the descriptor ring and RX Head/Tail MMIO registers
>>> are updated.
>>
>>
>> What did I understand:
>> * DPDK and Kernel drivers work like simular with ring. It don't
>> analize Head, but check STATUS.
>> This is a bit strange but completely correct driver behavior. If the
>> driver writes to memory, it expects
>> this value to be written. The problem is definitely not in the DPDK
>> and in the kernel driver.
>> * This problem appears on KVM, but not appears on tcg.
>> * Most similar to a bug in QEMU e1000 emulation. The e1000 emulation
>> read and writes to some
>> memory and same times, same as dpdk driver.
>>
>>
>> As I understand it, KVM explicitly prohibits access to shared memory.
>> It is obvious that us need to
>> protect (RCU) all STATUS registers of all buffers. There can be a lot
>> of buffers and they can be
>> scattered throughout the memory.
> 
> I don't agree with this reasoning because these descriptor rings are
> designed to support simultaneous access by the driver and the device (if
> done with care!).  What QEMU and the driver are attempting is typical.
> 
> The important thing for safe shared memory access is that both the
> driver and the device know who is allowed to write to a memory location
> at a point in time.  As long as both the driver and device don't write
> to the same location it is possible to safely use the data structure.
> 
> The typical pattern that a driver or device uses to publish information
> is:
> 
>    1. Fill in all fields but don't set the STATUS bit yet.
>    2. Memory barrier or other memory ordering directive to ensure that
>       fields have been written.  This operation might be implicit.
>    3. Set the STATUS bit in a separate operation.
> 
> On the read side there should be:
> 
>    1. Load the STATUS field and check the bit.  If it's clear then try
>       again.
>    2. Memory barrier or other memory ordering directive to ensure that
>       fields have been written.  This operation might be implicit.
>    3. Load all the fields.
> 
> Can you explain why the STATUS fields need to be protected?  My
> understanding is that the STATUS field is owned by the device at this
> point in time.  The device writes to the STATUS field and the driver
> polls it - this is safe.
> 
> I think the issue is bugs in the code.  The DPDK code looks questionable
> (https://git.dpdk.org/dpdk/tree/drivers/net/e1000/em_rxtx.c#n715):
> 
>    volatile struct e1000_rx_desc *rxdp;
>    ...
>    rxdp = &rx_ring[rx_id];
>    status = rxdp->status;
>    if (! (status & E1000_RXD_STAT_DD))
>        break;
>    rxd = *rxdp;
> 
> Although there is a conditional branch on rxdp->status, the CPU may load
> *rxdp before loading rxdp->status.  These pointers are volatile but
> that's not enough to prevent the CPU from reordering memory accesses
> (the compiler emits regular load instructions without memory ordering
> directives).
> 
> This is probably not the bug that you're seeing, but it suggests there
> are more problems.
> 
> Stefan
> 


-- 
Thanks,
- Ding Hui

