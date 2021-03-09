Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11C33281F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:07:31 +0100 (CET)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJd1G-0006lr-F9
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lJczf-0005X1-3O; Tue, 09 Mar 2021 09:05:51 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lJczc-0004Xs-Ox; Tue, 09 Mar 2021 09:05:50 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dvxlg03YGzjWZG;
 Tue,  9 Mar 2021 22:04:15 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 22:05:35 +0800
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Andrew Jones <drjones@redhat.com>, Peter Xu
 <peterx@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
 <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <759785ef-f29e-f05f-9f2f-357e71ae3680@huawei.com>
Date: Tue, 9 Mar 2021 22:05:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <65c92236-5212-f725-047a-cb1d231eff25@redhat.com>
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/3/9 21:48, Thomas Huth wrote:
> On 17/12/2020 02.49, Keqian Zhu wrote:
>> The parameters start and size are transfered from QEMU memory
>> emulation layer. It can promise that they are TARGET_PAGE_SIZE
>> aligned. However, KVM needs they are qemu_real_page_size aligned.
>>
>> Though no caller breaks this aligned requirement currently, we'd
>> better add an explicit assert to avoid future breaking.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>   accel/kvm/kvm-all.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> ---
>> v2
>>   - Address Andrew's commment (Use assert instead of return err).
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index f6b16a8df8..73b195cc41 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -692,6 +692,10 @@ out:
>>   #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
>>   #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
>>   +/*
>> + * As the granule of kvm dirty log is qemu_real_host_page_size,
>> + * @start and @size are expected and restricted to align to it.
>> + */
>>   static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>                                     uint64_t size)
>>   {
>> @@ -701,6 +705,9 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>       unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
>>       int ret;
>>   +    /* Make sure start and size are qemu_real_host_page_size aligned */
>> +    assert(QEMU_IS_ALIGNED(start | size, psize));
> 
> Sorry, but that was a bad idea: It triggers and kills my Centos 6 VM:
> 
> $ qemu-system-x86_64 -accel kvm -hda ~/virt/images/centos6.qcow2 -m 1G
> qemu-system-x86_64: ../../devel/qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.
> Aborted (core dumped)
Hi Thomas,

I think this patch is ok, maybe it trigger a potential bug?

Thanks,
Keqian

> 
> Can we please revert this patch?
> 
>  Thomas
> 
> .
> 

