Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8D7332A62
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:26:59 +0100 (CET)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeGA-00052q-NZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJdc4-0007IB-PD
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJdc1-0005uQ-Rl
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615301128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVTw4auZoA1sQ5f6tNBsrZgImX3Q8mIkVMkXXJga3ko=;
 b=Y8T3thRbJo38s0K7pA9MnEzvHgKl+Fi5VDdaLz2cDhMEZZfmOyz3jint9txTzgnH3Fy7MF
 xlYaqLH8oLXQMvHi/BOM0SO86/NBU6dUP6ylD3s/V4St4cpOeIDLwgKur5t643P/TIZuY0
 02m3Bid5GlaTsWxVqPV+QFuYbFVz4Qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-1-DLu99kMwyqQA-IFoMSFA-1; Tue, 09 Mar 2021 09:45:27 -0500
X-MC-Unique: 1-DLu99kMwyqQA-IFoMSFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1274800D62;
 Tue,  9 Mar 2021 14:45:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 762AD5C233;
 Tue,  9 Mar 2021 14:45:14 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
To: Keqian Zhu <zhukeqian1@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
 <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
 <759785ef-f29e-f05f-9f2f-357e71ae3680@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <11854ebf-ed88-496d-8381-5385ef1b403a@redhat.com>
Date: Tue, 9 Mar 2021 15:45:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <759785ef-f29e-f05f-9f2f-357e71ae3680@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2021 15.05, Keqian Zhu wrote:
> 
> 
> On 2021/3/9 21:48, Thomas Huth wrote:
>> On 17/12/2020 02.49, Keqian Zhu wrote:
>>> The parameters start and size are transfered from QEMU memory
>>> emulation layer. It can promise that they are TARGET_PAGE_SIZE
>>> aligned. However, KVM needs they are qemu_real_page_size aligned.
>>>
>>> Though no caller breaks this aligned requirement currently, we'd
>>> better add an explicit assert to avoid future breaking.
>>>
>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>> ---
>>>    accel/kvm/kvm-all.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> ---
>>> v2
>>>    - Address Andrew's commment (Use assert instead of return err).
>>>
>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>> index f6b16a8df8..73b195cc41 100644
>>> --- a/accel/kvm/kvm-all.c
>>> +++ b/accel/kvm/kvm-all.c
>>> @@ -692,6 +692,10 @@ out:
>>>    #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
>>>    #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
>>>    +/*
>>> + * As the granule of kvm dirty log is qemu_real_host_page_size,
>>> + * @start and @size are expected and restricted to align to it.
>>> + */
>>>    static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>>                                      uint64_t size)
>>>    {
>>> @@ -701,6 +705,9 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>>        unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
>>>        int ret;
>>>    +    /* Make sure start and size are qemu_real_host_page_size aligned */
>>> +    assert(QEMU_IS_ALIGNED(start | size, psize));
>>
>> Sorry, but that was a bad idea: It triggers and kills my Centos 6 VM:
>>
>> $ qemu-system-x86_64 -accel kvm -hda ~/virt/images/centos6.qcow2 -m 1G
>> qemu-system-x86_64: ../../devel/qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.
>> Aborted (core dumped)
> Hi Thomas,
> 
> I think this patch is ok, maybe it trigger a potential bug?

Well, sure, there is either a bug somewhere else or in this new code. But it's certainly not normal that the assert() triggers, is it?

FWIW, here's a backtrace:

#0  0x00007ffff2c1584f in raise () at /lib64/libc.so.6
#1  0x00007ffff2bffc45 in abort () at /lib64/libc.so.6
#2  0x00007ffff2bffb19 in _nl_load_domain.cold.0 () at /lib64/libc.so.6
#3  0x00007ffff2c0de36 in .annobin_assert.c_end () at /lib64/libc.so.6
#4  0x0000555555ba25f3 in kvm_log_clear_one_slot
     (size=6910080, start=0, as_id=0, mem=0x555556e1ee00)
     at ../../devel/qemu/accel/kvm/kvm-all.c:691
#5  0x0000555555ba25f3 in kvm_physical_log_clear
     (section=0x7fffffffd0b0, section=0x7fffffffd0b0, kml=0x555556dbaac0)
     at ../../devel/qemu/accel/kvm/kvm-all.c:843
#6  0x0000555555ba25f3 in kvm_log_clear (listener=0x555556dbaac0, section=0x7fffffffd0b0)
     at ../../devel/qemu/accel/kvm/kvm-all.c:1253
#7  0x0000555555b023d8 in memory_region_clear_dirty_bitmap
     (mr=mr@entry=0x5555573394c0, start=start@entry=0, len=len@entry=6910080)
     at ../../devel/qemu/softmmu/memory.c:2132
#8  0x0000555555b313d9 in cpu_physical_memory_snapshot_and_clear_dirty
     (mr=mr@entry=0x5555573394c0, offset=offset@entry=0, length=length@entry=6910080, client=client@entry=0) at ../../devel/qemu/softmmu/physmem.c:1109
#9  0x0000555555b02483 in memory_region_snapshot_and_clear_dirty
     (mr=mr@entry=0x5555573394c0, addr=addr@entry=0, size=size@entry=6910080, client=client@entry=0)
     at ../../devel/qemu/softmmu/memory.c:2146
#10 0x0000555555babe99 in vga_draw_graphic (full_update=0, s=0x5555573394b0)
     at ../../devel/qemu/hw/display/vga.c:1661
#11 0x0000555555babe99 in vga_update_display (opaque=0x5555573394b0)
     at ../../devel/qemu/hw/display/vga.c:1784
#12 0x0000555555babe99 in vga_update_display (opaque=0x5555573394b0)
     at ../../devel/qemu/hw/display/vga.c:1757
#13 0x00005555558ddd32 in graphic_hw_update (con=0x555556a11800)
     at ../../devel/qemu/ui/console.c:279
#14 0x00005555558dccd2 in dpy_refresh (s=0x555556c17da0) at ../../devel/qemu/ui/console.c:1742
#15 0x00005555558dccd2 in gui_update (opaque=opaque@entry=0x555556c17da0)
     at ../../devel/qemu/ui/console.c:209
#16 0x0000555555dbd520 in timerlist_run_timers (timer_list=0x555556937c50)
     at ../../devel/qemu/util/qemu-timer.c:574
#17 0x0000555555dbd520 in timerlist_run_timers (timer_list=0x555556937c50)
     at ../../devel/qemu/util/qemu-timer.c:499
#18 0x0000555555dbd74a in qemu_clock_run_timers (type=<optimized out>)
     at ../../devel/qemu/util/qemu-timer.c:670
#19 0x0000555555dbd74a in qemu_clock_run_all_timers () at ../../devel/qemu/util/qemu-timer.c:670

Looks like something in the vga code calls this with size=6910080
and thus triggers the alignment assertion?

  Thomas


