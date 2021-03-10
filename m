Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09023332E8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 02:59:10 +0100 (CET)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJo7y-00057V-11
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 20:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lJo6m-0004a3-IT; Tue, 09 Mar 2021 20:57:56 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:4045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lJo6j-0007lj-Ra; Tue, 09 Mar 2021 20:57:56 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DwFYG4Rt3zkWMw;
 Wed, 10 Mar 2021 09:56:18 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 09:57:38 +0800
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
To: Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
 <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
 <759785ef-f29e-f05f-9f2f-357e71ae3680@huawei.com>
 <11854ebf-ed88-496d-8381-5385ef1b403a@redhat.com> <YEeM8eUUzm9AlaFI@work-vm>
 <20210309160814.GA763132@xz-x1>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <5405458f-bc77-e477-badf-0011359e7d0b@huawei.com>
Date: Wed, 10 Mar 2021 09:57:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210309160814.GA763132@xz-x1>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 jiangkunkun@huawei.com, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 wanghaibin.wang@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/3/10 0:08, Peter Xu wrote:
> On Tue, Mar 09, 2021 at 02:57:53PM +0000, Dr. David Alan Gilbert wrote:
>> * Thomas Huth (thuth@redhat.com) wrote:
>>> On 09/03/2021 15.05, Keqian Zhu wrote:
>>>>
>>>>
>>>> On 2021/3/9 21:48, Thomas Huth wrote:
>>>>> On 17/12/2020 02.49, Keqian Zhu wrote:
[...]

>>>
>>> #0  0x00007ffff2c1584f in raise () at /lib64/libc.so.6
>>> #1  0x00007ffff2bffc45 in abort () at /lib64/libc.so.6
>>> #2  0x00007ffff2bffb19 in _nl_load_domain.cold.0 () at /lib64/libc.so.6
>>> #3  0x00007ffff2c0de36 in .annobin_assert.c_end () at /lib64/libc.so.6
>>> #4  0x0000555555ba25f3 in kvm_log_clear_one_slot
>>>     (size=6910080, start=0, as_id=0, mem=0x555556e1ee00)
>>>     at ../../devel/qemu/accel/kvm/kvm-all.c:691
>>> #5  0x0000555555ba25f3 in kvm_physical_log_clear
>>>     (section=0x7fffffffd0b0, section=0x7fffffffd0b0, kml=0x555556dbaac0)
>>>     at ../../devel/qemu/accel/kvm/kvm-all.c:843
>>> #6  0x0000555555ba25f3 in kvm_log_clear (listener=0x555556dbaac0, section=0x7fffffffd0b0)
>>>     at ../../devel/qemu/accel/kvm/kvm-all.c:1253
>>> #7  0x0000555555b023d8 in memory_region_clear_dirty_bitmap
>>>     (mr=mr@entry=0x5555573394c0, start=start@entry=0, len=len@entry=6910080)
>>>     at ../../devel/qemu/softmmu/memory.c:2132
>>> #8  0x0000555555b313d9 in cpu_physical_memory_snapshot_and_clear_dirty
>>>     (mr=mr@entry=0x5555573394c0, offset=offset@entry=0, length=length@entry=6910080, client=client@entry=0) at ../../devel/qemu/softmmu/physmem.c:1109
>>> #9  0x0000555555b02483 in memory_region_snapshot_and_clear_dirty
>>>     (mr=mr@entry=0x5555573394c0, addr=addr@entry=0, size=size@entry=6910080, client=client@entry=0)
>>>     at ../../devel/qemu/softmmu/memory.c:2146
>>
>> Could you please figure out which memory region this is?
>> WTH is that size? Is that really the problem that the size is just
>> crazy?
> 
> It seems vga_draw_graphic() could call memory_region_snapshot_and_clear_dirty()
> with not-page-aligned size.  cpu_physical_memory_snapshot_and_clear_dirty()
> actually took care of most of it on alignment, however still the "length"
> parameter got passed in without alignment check or so.
> 
> Cc Gerd too.
> 
> I'm not sure how many use cases are there like this.. if there're a lot maybe
> we can indeed drop this assert patch, but instead in kvm_log_clear_one_slot()
> we should ALIGN_DOWN the size to smallest host page size. Say, if we need to
> clear dirty bit for range (0, 0x1020), we should only clean (0, 0x1000) since
> there can still be dirty data on range (0x1020, 0x2000).
Right, the @start and @size should be properly aligned by kvm_log_clear_one_slot().
We shouldn't clear areas that beyond what caller expected.

An assert here is not properly.

Thanks,
Keqian
> 
> Thanks,
> 
>>
>> Dave
>>
>>> #10 0x0000555555babe99 in vga_draw_graphic (full_update=0, s=0x5555573394b0)
>>>     at ../../devel/qemu/hw/display/vga.c:1661
>>> #11 0x0000555555babe99 in vga_update_display (opaque=0x5555573394b0)
>>>     at ../../devel/qemu/hw/display/vga.c:1784
>>> #12 0x0000555555babe99 in vga_update_display (opaque=0x5555573394b0)
>>>     at ../../devel/qemu/hw/display/vga.c:1757
>>> #13 0x00005555558ddd32 in graphic_hw_update (con=0x555556a11800)
>>>     at ../../devel/qemu/ui/console.c:279
>>> #14 0x00005555558dccd2 in dpy_refresh (s=0x555556c17da0) at ../../devel/qemu/ui/console.c:1742
>>> #15 0x00005555558dccd2 in gui_update (opaque=opaque@entry=0x555556c17da0)
>>>     at ../../devel/qemu/ui/console.c:209
>>> #16 0x0000555555dbd520 in timerlist_run_timers (timer_list=0x555556937c50)
>>>     at ../../devel/qemu/util/qemu-timer.c:574
>>> #17 0x0000555555dbd520 in timerlist_run_timers (timer_list=0x555556937c50)
>>>     at ../../devel/qemu/util/qemu-timer.c:499
>>> #18 0x0000555555dbd74a in qemu_clock_run_timers (type=<optimized out>)
>>>     at ../../devel/qemu/util/qemu-timer.c:670
>>> #19 0x0000555555dbd74a in qemu_clock_run_all_timers () at ../../devel/qemu/util/qemu-timer.c:670
>>>
>>> Looks like something in the vga code calls this with size=6910080
>>> and thus triggers the alignment assertion?
>>>
>>>  Thomas
>> -- 
>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>>
> 

