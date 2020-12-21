Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992EB2DFB7F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 12:28:40 +0100 (CET)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krJMl-0002LT-Ni
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 06:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1krJL8-0001rl-Ts
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:26:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1krJL6-0004Q7-SN
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:26:58 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Czxwv3PkFzM7XR;
 Mon, 21 Dec 2020 19:25:51 +0800 (CST)
Received: from [10.174.186.6] (10.174.186.6) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0;
 Mon, 21 Dec 2020 19:26:39 +0800
Subject: Re: [RFC PATCH v1] x86/cpu: initialize the CPU concurrently
To: Igor Mammedov <imammedo@redhat.com>
References: <26a765fb-dae1-db33-a406-cef79d5c1d58@huawei.com>
 <20201218181719.79d5bced@redhat.com>
From: Zhenyu Ye <yezhenyu2@huawei.com>
Message-ID: <7edb4309-125a-8892-71cc-18e38832844e@huawei.com>
Date: Mon, 21 Dec 2020 19:26:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20201218181719.79d5bced@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yezhenyu2@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.299,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, "S. Tsirkin, Michael" <mst@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Xiexiangyou <xiexiangyou@huawei.com>, yebiaoxiang <yebiaoxiang@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor Mammedov,

Thanks for your review.

On 2020/12/19 1:17, Igor Mammedov wrote:
> On Wed, 25 Nov 2020 19:54:17 +0800
> Zhenyu Ye <yezhenyu2@huawei.com> wrote:
> 
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
>> This patch initializes the CPU concurrently.
> 
> could you benchmark and share results for before an after this patch?
> (It would be even better to add it as part of commit message)
> 

When using haxm as the accelerator on windows, it takes at least
200ms to initialize one cpu.  For a 4-core VM, it takes:

	before		800ms -- 1000ms
	after		200ms

Information about the processor on the host:

	Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz

See another email(to Eduardo) for more information.

Thanks,
Zhenyu

