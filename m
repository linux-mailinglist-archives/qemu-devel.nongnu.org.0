Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21C3378D1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:09:47 +0100 (CET)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNse-0001zP-RR
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKNkE-000072-RY
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:01:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKNkA-0003Cu-7k
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615478456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcYFcV99+C+9T2dfwANjN/wW3GtgSw0SGQiaKildinU=;
 b=cu18wBxpXR6hEAItsOMm3lEs8pw/CaTiQg3p/1Zt3VxjHqKX3PTonoGvEzKTrvueIKlpAI
 s/0vzX9h/Ko125Zy+Gni4AsBAuDFrXsI4csEX0yS43rLvfuLrkkovltEGxsjGJOUxbfqyJ
 qyknp5g6PDUy8qgq3rr/pTFs++STolk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-TygrVv53PXmCQ_K6IcG7hw-1; Thu, 11 Mar 2021 11:00:54 -0500
X-MC-Unique: TygrVv53PXmCQ_K6IcG7hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA23DA40ED;
 Thu, 11 Mar 2021 16:00:50 +0000 (UTC)
Received: from [10.36.115.26] (ovpn-115-26.ams2.redhat.com [10.36.115.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F0B45D9F2;
 Thu, 11 Mar 2021 16:00:49 +0000 (UTC)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
To: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210303132850.459687-1-thuth@redhat.com>
 <a6cb6d81-8cf3-4e3a-29f4-1593e1fffec5@redhat.com>
 <6c21d4c1-6a4d-ab89-00e9-be9a7c86c09a@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a75e0e84-6714-af5a-9c9d-b09beaa82629@redhat.com>
Date: Thu, 11 Mar 2021 17:00:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6c21d4c1-6a4d-ab89-00e9-be9a7c86c09a@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.03.21 16:58, Richard Henderson wrote:
> On 3/11/21 8:03 AM, David Hildenbrand wrote:
>> As talked with Thomas off-list, there is no trusting on host==NULL
>> as well (see comment in struct S390Access). host==NULL simply
>> means we have to do individual ld/st.
> 
> I think that comment is stale with the use of probe_access instead of
> tlb_vaddr_to_host -- TLB_DIRTY is in fact handled now.

Yes, it might be worth exploring in which cases we will still have 
issues and updating the comment. LAP is certainly one.

>> +    env->tlb_fill_exc = 0;
>>        flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
>>                                   nofault, &haddr1, ra);
>> +    if (env->tlb_fill_exc) {
>> +        /* We cannot rely on TLB_INVALID_MASK or haddr being NULL. */
>> +        return env->tlb_fill_exc;
>> +    }
>>        if (unlikely(size2)) {
>>            /* The access crosses page boundaries. */
>>            vaddr2 = wrap_address(env, vaddr1 + size1);
>>            flags |= probe_access_flags(env, vaddr2, access_type, mmu_idx,
>>                                        nofault, &haddr2, ra);
>> +        if (env->tlb_fill_exc) {
>> +            /* We cannot rely on TLB_INVALID_MASK or haddr being NULL. */
>> +            return env->tlb_fill_exc;
> 
> But this is pretty clean, and definitely works.

Except that I need to special case CONFIG_USER_ONLY .... I'll send a v5 
later, then we can discuss when looking at the full diff (including an 
addon patch to handle r1/r2).

-- 
Thanks,

David / dhildenb


