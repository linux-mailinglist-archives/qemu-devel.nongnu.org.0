Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533AC2E2768
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 14:43:11 +0100 (CET)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksQtZ-00033y-Mq
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 08:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1ksQsK-0002d0-G1
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 08:41:52 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1ksQsH-0004qo-HP
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 08:41:52 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D1rmv392HzkvG4;
 Thu, 24 Dec 2020 21:40:31 +0800 (CST)
Received: from [10.174.186.6] (10.174.186.6) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 24 Dec 2020 21:41:21 +0800
Subject: Re: [RFC PATCH v2] x86/cpu: initialize the CPU concurrently
To: Eduardo Habkost <ehabkost@redhat.com>
References: <90be4860-cbe0-25d4-ccca-75b96ecb4a3c@huawei.com>
 <20201221213620.GF6040@habkost.net>
From: Zhenyu Ye <yezhenyu2@huawei.com>
Message-ID: <e823060d-1a8a-a1d8-aa2f-1394c118bdae@huawei.com>
Date: Thu, 24 Dec 2020 21:41:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20201221213620.GF6040@habkost.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yezhenyu2@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.825,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>, "S. Tsirkin,
 Michael" <mst@redhat.com>, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Xiexiangyou <xiexiangyou@huawei.com>, yebiaoxiang <yebiaoxiang@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

Sorry for the delay.

On 2020/12/22 5:36, Eduardo Habkost wrote:
> On Mon, Dec 21, 2020 at 07:36:18PM +0800, Zhenyu Ye wrote:
>> Providing a optional mechanism to wait for all VCPU threads be
>> created out of qemu_init_vcpu(), then we can initialize the cpu
>> concurrently on the x86 architecture.
>>
>> This reduces the time of creating virtual machines. For example, when
>> the haxm is used as the accelerator, cpus_accel->create_vcpu_thread()
>> will cause at least 200ms for each cpu, extremely prolong the boot
>> time.
>>
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> Signed-off-by: eillon <yezhenyu2@huawei.com>
> 
> The patch is easier to follow now, but I have a question that may
> be difficult to answer:
> 
> What exactly is the meaning of cpu->created=true, and what
> exactly would break if we never wait for cpu->created==true at all?
> 
> I'm asking that because we might be introducing subtle races
> here, if some of the remaining CPU initialization code in
> x86_cpu_realizefn() [1] expects the VCPU thread to be already
> initialized.
> 
> The cpu_reset() call below is one such example (but probably not
> the only one).  cpu_reset() ends up calling
> kvm_arch_reset_vcpu(), which seems to assume kvm_init_vcpu() was
> already called.  With your patch, kvm_init_vcpu() might end up
> being called after kvm_arch_reset_vcpu().
> 

There's a chance that this happens.
Could we move these (after qemu_init_vcpu()) out of x86_cpu_realizefn()
to the x86_cpus_init(), after qemu_wait_all_vcpu_threads_init()?
Such as:

void x86_cpus_init()
{
	foreach (cpu) {
		x86_cpu_new();
	}

	qemu_wait_all_vcpu_threads_init();

	foreach (cpu) {
		x86_cpu_new_post();
	}
}

> Maybe a simpler alternative is to keep the existing thread
> creation logic, but changing hax_cpu_thread_fn() to do less work
> before calling cpu_thread_signal_created()?
> 
> In my testing (without this patch), creation of 8 KVM VCPU
> threads in a 4 core machine takes less than 3 ms.  Why is
> qemu_init_vcpu() taking so long on haxm?  Which parts of haxm
> initialization can be moved after cpu_thread_signal_created(), to
> make this better?
> 

The most time-consuming operation in haxm is ioctl(HAX_VM_IOCTL_VCPU_CREATE).
Saddly this can not be split.

Even if we fix the problem in haxm, other accelerators may also have
this problem.  So I think if we can make the x86_cpu_new() concurrently,
we should try to do it.

Thanks,
Zhenyu

