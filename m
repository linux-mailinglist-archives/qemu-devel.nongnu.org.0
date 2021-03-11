Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A383337C59
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:19:51 +0100 (CET)
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPuY-000174-L6
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKPrZ-0008Do-1p
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKPrM-0004iM-DK
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615486590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAx/akGp1SmQYkLiwdHfFLD+Hsn3RTisxe5LTpfOoNM=;
 b=gLIWJQ4Mg+ZVBax1ZtMmz5w41lcS/UCoouguEE2fa8NMOby6V/MyucLHL3LEBtia5fQYZQ
 e7amNxJ4YKMDFaY2AxhiN6lKad0jE9ovd/05V8vnwNVkXu8XsK607S0P9qM8Pc7tbIQCsI
 uh5AKEbv+NfQqwct0XZUkW0I941EdN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-rZxeKoETMdKjfrPLpU1tCQ-1; Thu, 11 Mar 2021 13:16:28 -0500
X-MC-Unique: rZxeKoETMdKjfrPLpU1tCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC424760C0;
 Thu, 11 Mar 2021 18:16:27 +0000 (UTC)
Received: from [10.36.115.26] (ovpn-115-26.ams2.redhat.com [10.36.115.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3EA319C78;
 Thu, 11 Mar 2021 18:16:26 +0000 (UTC)
Subject: Re: [PATCH v5 1/2] target/s390x: Implement the MVPG
 condition-code-option bit
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311161747.129834-1-david@redhat.com>
 <20210311161747.129834-2-david@redhat.com>
 <39285cf8-2214-2257-679d-231e0c6a0652@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <5b929a10-4561-d596-b43b-33ca4022ea54@redhat.com>
Date: Thu, 11 Mar 2021 19:16:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <39285cf8-2214-2257-679d-231e0c6a0652@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.03.21 18:52, Richard Henderson wrote:
> On 3/11/21 10:17 AM, David Hildenbrand wrote:
>> +#if !defined(CONFIG_USER_ONLY)
>> +    /*
>> +     * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
>> +     * to detect if there was an exception during tlb_fill().
>> +     */
>> +    env->tlb_fill_exc = 0;
>> +#endif
>> +    flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
>> +                               nofault, &haddr1, ra);
>> +#if !defined(CONFIG_USER_ONLY)
>> +    if (env->tlb_fill_exc) {
>> +        return env->tlb_fill_exc;
>> +    }
>> +#else
>> +    if (!haddr1) {
>> +        env->__excp_addr = vaddr1;
>> +        return PGM_ADDRESSING;
>> +    }
>> +#endif
> 
> The assumption of PGM_ADDRESSING is incorrect here -- it could still be
> PGM_PROTECTION, depending on how the page is mapped.
> 

Interesting, I was only looking at the s390x tlb_fill() implementation. 
But I assume these checks are performed in common code.

> I guess this should be done like
> 
> #ifdef CONFIG_USER_ONLY
>       flags = page_get_flags(vaddr1);
>       if (!flags & (access_type == MMU_DATA_LOAD
>                     ? PAGE_READ : PAGE_WRITE)) {
>           env->__excp_addr = vaddr1;
>           if (nofault) {
>               return (flags & PAGE_VALID
>                   ? PGM_PROTECTION : PGM_ADDRESSING);
>           }
>           raise exception.
>       }
>       haddr1 = g2h(vaddr1);
> #else
>       env->tlb_fill_exc = 0;
>       flags = probe_access_flags(...);
>       if (env->tlb_fill_exc) {
>           return env->tlb_fill_exc;
>       }
> #endif
> 
> which is pretty ugly, but no worse than what you have above.

Thanks, maybe I can factor that out in a nice way. I guess we could do 
the access via probe_access_flags() and only on error do the 
page_get_flags()?


-- 
Thanks,

David / dhildenb


