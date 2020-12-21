Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D512DFB78
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 12:25:39 +0100 (CET)
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krJJq-0000tt-5G
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 06:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1krJHx-0000Ub-J1
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:23:42 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1krJHu-0002xX-Nl
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:23:41 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CzxsN6V9bzhvWF;
 Mon, 21 Dec 2020 19:22:48 +0800 (CST)
Received: from [10.174.186.6] (10.174.186.6) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0;
 Mon, 21 Dec 2020 19:23:13 +0800
Subject: Re: [RFC PATCH v1] x86/cpu: initialize the CPU concurrently
To: Eduardo Habkost <ehabkost@redhat.com>
References: <26a765fb-dae1-db33-a406-cef79d5c1d58@huawei.com>
 <20201218184754.GT3140057@habkost.net>
From: Zhenyu Ye <yezhenyu2@huawei.com>
Message-ID: <ea6a0aec-d63a-b67a-a4d4-ca09d5e3d6aa@huawei.com>
Date: Mon, 21 Dec 2020 19:23:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20201218184754.GT3140057@habkost.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yezhenyu2@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.299,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "S. Tsirkin, Michael" <mst@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Xiexiangyou <xiexiangyou@huawei.com>,
 yebiaoxiang <yebiaoxiang@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

Thanks for your review.

On 2020/12/19 2:47, Eduardo Habkost wrote:
> On Wed, Nov 25, 2020 at 07:54:17PM +0800, Zhenyu Ye wrote:
>> From 0b4318c9dbf6fa152ec14eab29837ea06e2d78e5 Mon Sep 17 00:00:00 2001
>> From: eillon <yezhenyu2@huawei.com>
>> Date: Wed, 25 Nov 2020 19:17:03 +0800
>> Subject: [PATCH] x86/cpu: initialize the CPU concurrently
>>
>> Currently we initialize cpu one by one in qemu_init_vcpu(), every cpu
>> should have to wait util cpu->created = true.  When cpus_accel->create_vcpu_thread
>> costs too long time or the number of CPUs is too large, this will prolong
>> the boot time.
>>
> 
> How long was boot time before and after the patch?
> 

When using haxm as the accelerator on windows, it takes at least
200ms to initialize one cpu.  For a 4-core VM, it takes:

	before		800ms -- 1000ms
	after		200ms

Information about the processor on the host:

	Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz


> 
> I suggest doing this "wait for all CPUs" step outside qemu_init_vcpu().
> 
> What about not making the last CPU special, and just providing a
> optional mechanism to wait for all VCPU threads after the CPU
> objects were created?  e.g.:
> 

Thanks for your suggestion and I will send PATCH v2 soon.

Thanks,
Zhenyu

