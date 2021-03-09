Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077EF332D10
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:19:14 +0100 (CET)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJg0m-0000lp-Uf
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJf5y-0006RW-TH
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJf5q-0002G3-CX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615306821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jJJbOIxOY0Mxq+H2kcUM6uJwMCSAvdeDJz/Hci88oM=;
 b=gYojolVDbLntuoLfIPwjzCaBnihBZJsuh63w/dpfukK/ocMEe7Iov3MGbPTJDa2MzxF4vl
 SRTWjdCcFB8xAiK9kzvZgPnx0eJM7z0bBdep1oh2D+Dt0LC1ITT6klqRFimy6hK2skL39q
 cDVYizPDf9nhMYuxELvUC7Rd51gnFVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-IJO7rgPAP8Cvint-yo1Ckw-1; Tue, 09 Mar 2021 11:20:19 -0500
X-MC-Unique: IJO7rgPAP8Cvint-yo1Ckw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C96B80432E;
 Tue,  9 Mar 2021 16:20:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B62FB60C17;
 Tue,  9 Mar 2021 16:20:07 +0000 (UTC)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
 <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
 <759785ef-f29e-f05f-9f2f-357e71ae3680@huawei.com>
 <11854ebf-ed88-496d-8381-5385ef1b403a@redhat.com> <YEeM8eUUzm9AlaFI@work-vm>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
Message-ID: <48fd9bee-4542-533a-b893-7acf3744fe36@redhat.com>
Date: Tue, 9 Mar 2021 17:20:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEeM8eUUzm9AlaFI@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 jiangkunkun@huawei.com, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 wanghaibin.wang@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2021 15.57, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
>> On 09/03/2021 15.05, Keqian Zhu wrote:
>>>
>>>
>>> On 2021/3/9 21:48, Thomas Huth wrote:
>>>> On 17/12/2020 02.49, Keqian Zhu wrote:
>>>>> The parameters start and size are transfered from QEMU memory
>>>>> emulation layer. It can promise that they are TARGET_PAGE_SIZE
>>>>> aligned. However, KVM needs they are qemu_real_page_size aligned.
>>>>>
>>>>> Though no caller breaks this aligned requirement currently, we'd
>>>>> better add an explicit assert to avoid future breaking.
>>>>>
>>>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>>>> ---
>>>>>     accel/kvm/kvm-all.c | 7 +++++++
>>>>>     1 file changed, 7 insertions(+)
>>>>>
>>>>> ---
>>>>> v2
>>>>>     - Address Andrew's commment (Use assert instead of return err).
>>>>>
>>>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>>>> index f6b16a8df8..73b195cc41 100644
>>>>> --- a/accel/kvm/kvm-all.c
>>>>> +++ b/accel/kvm/kvm-all.c
>>>>> @@ -692,6 +692,10 @@ out:
>>>>>     #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
>>>>>     #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
>>>>>     +/*
>>>>> + * As the granule of kvm dirty log is qemu_real_host_page_size,
>>>>> + * @start and @size are expected and restricted to align to it.
>>>>> + */
>>>>>     static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>>>>                                       uint64_t size)
>>>>>     {
>>>>> @@ -701,6 +705,9 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>>>>         unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
>>>>>         int ret;
>>>>>     +    /* Make sure start and size are qemu_real_host_page_size aligned */
>>>>> +    assert(QEMU_IS_ALIGNED(start | size, psize));
>>>>
>>>> Sorry, but that was a bad idea: It triggers and kills my Centos 6 VM:
>>>>
>>>> $ qemu-system-x86_64 -accel kvm -hda ~/virt/images/centos6.qcow2 -m 1G
>>>> qemu-system-x86_64: ../../devel/qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.
>>>> Aborted (core dumped)
>>> Hi Thomas,
>>>
>>> I think this patch is ok, maybe it trigger a potential bug?
>>
>> Well, sure, there is either a bug somewhere else or in this new code. But it's certainly not normal that the assert() triggers, is it?
>>
>> FWIW, here's a backtrace:
>>
>> #0  0x00007ffff2c1584f in raise () at /lib64/libc.so.6
>> #1  0x00007ffff2bffc45 in abort () at /lib64/libc.so.6
>> #2  0x00007ffff2bffb19 in _nl_load_domain.cold.0 () at /lib64/libc.so.6
>> #3  0x00007ffff2c0de36 in .annobin_assert.c_end () at /lib64/libc.so.6
>> #4  0x0000555555ba25f3 in kvm_log_clear_one_slot
>>      (size=6910080, start=0, as_id=0, mem=0x555556e1ee00)
>>      at ../../devel/qemu/accel/kvm/kvm-all.c:691
>> #5  0x0000555555ba25f3 in kvm_physical_log_clear
>>      (section=0x7fffffffd0b0, section=0x7fffffffd0b0, kml=0x555556dbaac0)
>>      at ../../devel/qemu/accel/kvm/kvm-all.c:843
>> #6  0x0000555555ba25f3 in kvm_log_clear (listener=0x555556dbaac0, section=0x7fffffffd0b0)
>>      at ../../devel/qemu/accel/kvm/kvm-all.c:1253
>> #7  0x0000555555b023d8 in memory_region_clear_dirty_bitmap
>>      (mr=mr@entry=0x5555573394c0, start=start@entry=0, len=len@entry=6910080)
>>      at ../../devel/qemu/softmmu/memory.c:2132
>> #8  0x0000555555b313d9 in cpu_physical_memory_snapshot_and_clear_dirty
>>      (mr=mr@entry=0x5555573394c0, offset=offset@entry=0, length=length@entry=6910080, client=client@entry=0) at ../../devel/qemu/softmmu/physmem.c:1109
>> #9  0x0000555555b02483 in memory_region_snapshot_and_clear_dirty
>>      (mr=mr@entry=0x5555573394c0, addr=addr@entry=0, size=size@entry=6910080, client=client@entry=0)
>>      at ../../devel/qemu/softmmu/memory.c:2146
> 
> Could you please figure out which memory region this is?
> WTH is that size? Is that really the problem that the size is just
> crazy?

The answer is one stack frame below...

>> #10 0x0000555555babe99 in vga_draw_graphic (full_update=0, s=0x5555573394b0)
>>      at ../../devel/qemu/hw/display/vga.c:1661

The vga code basically does this:

     region_start = (s->start_addr * 4);
     region_end = region_start + (ram_addr_t)s->line_offset * height;
     region_end += width * depth / 8; /* scanline length */
     region_end -= s->line_offset;
     ...
     memory_region_snapshot_and_clear_dirty(... region_end - region_start...);

Thus it uses a size that is nowhere guaranteed to be a multiple
of the page size.

A similar usage can be seen in other devices, too (e.g. sm501.c),
so either there is a bug in the assert() statement, or we have
a problem with many devices...

  Thomas


