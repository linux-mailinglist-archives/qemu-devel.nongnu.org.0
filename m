Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A5269EA51
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:40:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbIN-0002VO-OV; Tue, 21 Feb 2023 17:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUbIL-0002Uf-ST
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:39:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUbIJ-0001Qp-PZ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677019157;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vobajwav0FioYl0a+pld659tLF5Hc1HqhpkEd9dmvU0=;
 b=GXTrUJbsqbJ0/bt+iREPThzyrNm5/S2Iq69qmqz6dAwtWrCqtBHaUJ0ZNMRt7ts2ERPM9U
 /BVmOvEmTtBZkFqFnmQ0ivZdujji9KW3zXZWRSGbCEd5K4eyaJ046q4Ym1zjsPcv91iGym
 9MYHGDDjNBXddLokCU0/k6dx8yfoJD8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-Vw5tcrUYOQ-IE6iHM1PObg-1; Tue, 21 Feb 2023 17:39:16 -0500
X-MC-Unique: Vw5tcrUYOQ-IE6iHM1PObg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C1451C04342
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 22:39:16 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70259492B00;
 Tue, 21 Feb 2023 22:39:11 +0000 (UTC)
Subject: Re: [PATCH] kvm: dirty-ring: Fix race with vcpu creation
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Xiaohui Li <xiaohli@redhat.com>
References: <20220927154653.77296-1-peterx@redhat.com> <Y+A1DNtDVExAkCR1@x1n>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <67c44f3b-8aeb-878c-298b-d441f4a578ba@redhat.com>
Date: Wed, 22 Feb 2023 09:39:04 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <Y+A1DNtDVExAkCR1@x1n>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/6/23 10:00 AM, Peter Xu wrote:
> On Tue, Sep 27, 2022 at 11:46:53AM -0400, Peter Xu wrote:
>> It's possible that we want to reap a dirty ring on a vcpu that is during
>> creation, because the vcpu is put onto list (CPU_FOREACH visible) before
>> initialization of the structures.  In this case:
>>
>> qemu_init_vcpu
>>      x86_cpu_realizefn
>>          cpu_exec_realizefn
>>              cpu_list_add      <---- can be probed by CPU_FOREACH
>>          qemu_init_vcpu
>>              cpus_accel->create_vcpu_thread(cpu);
>>                  kvm_init_vcpu
>>                      map kvm_dirty_gfns  <--- kvm_dirty_gfns valid
>>
>> Don't try to reap dirty ring on vcpus during creation or it'll crash.
>>
>> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2124756
>> Reported-by: Xiaohui Li <xiaohli@redhat.com>
>> Signed-off-by: Peter Xu <peterx@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 5acab1767f..df5fabd3a8 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -757,6 +757,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
>>       uint32_t ring_size = s->kvm_dirty_ring_size;
>>       uint32_t count = 0, fetch = cpu->kvm_fetch_index;
>>   
>> +    /*
>> +     * It's possible that we race with vcpu creation code where the vcpu is
>> +     * put onto the vcpus list but not yet initialized the dirty ring
>> +     * structures.  If so, skip it.
>> +     */
>> +    if (!cpu->created) {
>> +        return 0;
>> +    }
>> +
>>       assert(dirty_gfns && ring_size);
>>       trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
>>   

Reviewed-by: Gavin Shan <gshan@redhat.com>


