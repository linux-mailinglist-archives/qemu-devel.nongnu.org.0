Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7B9302542
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:06:18 +0100 (CET)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41ZR-0007X5-Uw
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l41Xd-0006uz-00
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:04:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l41XX-00008C-Dt
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611579856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+W7HWSYYU3keNC0sje/T66WtR6nU4fl4sKIMeQkDXJs=;
 b=OWZLOFcRB+Uj6zQgB2WEXnomCCnmkQV2a7IlC+UtCwCfmYc0qwoioK/aR42ijNHvied79N
 wSHI75e+oyyLdfqbU2X5MN0rEKSlAzVZY81ZK3VqbSfJv2J/CDu2lYmFTQshyftijbNN4y
 WLf3u17SZJjy82TgIOdO8aUwgWr/f1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-ZPognXBGOZa_GSkNGhUFyA-1; Mon, 25 Jan 2021 08:04:12 -0500
X-MC-Unique: ZPognXBGOZa_GSkNGhUFyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7312E190D347;
 Mon, 25 Jan 2021 13:04:11 +0000 (UTC)
Received: from [10.36.115.13] (ovpn-115-13.ams2.redhat.com [10.36.115.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2844D;
 Mon, 25 Jan 2021 13:04:09 +0000 (UTC)
Subject: Re: [PATCH] s390x/cpu_model: disallow unpack for --only-migratable
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210125125312.138491-1-borntraeger@de.ibm.com>
 <12198ce5-8164-1e15-685d-d19f0aa234b4@redhat.com>
 <90bb436e-bbf2-6d77-587a-0fb5b22d13cd@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <97eae34e-5568-0150-fee1-ffdc438948e0@redhat.com>
Date: Mon, 25 Jan 2021 14:04:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <90bb436e-bbf2-6d77-587a-0fb5b22d13cd@de.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.01.21 13:59, Christian Borntraeger wrote:
> 
> 
> On 25.01.21 13:57, David Hildenbrand wrote:
>> On 25.01.21 13:53, Christian Borntraeger wrote:
>>> secure execution (aka protected virtualization) guests cannot be
>>> migrated at the moment. Disallow the unpack facility if the user
>>> specifies --only-migratable.
>>>
>>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>> ---
>>>  target/s390x/cpu_models.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
>>> index 35179f9dc7ba..0fa082ae2546 100644
>>> --- a/target/s390x/cpu_models.c
>>> +++ b/target/s390x/cpu_models.c
>>> @@ -26,6 +26,7 @@
>>>  #include "qapi/qmp/qdict.h"
>>>  #ifndef CONFIG_USER_ONLY
>>>  #include "sysemu/arch_init.h"
>>> +#include "sysemu/sysemu.h"
>>>  #include "hw/pci/pci.h"
>>>  #endif
>>>  #include "qapi/qapi-commands-machine-target.h"
>>> @@ -878,6 +879,11 @@ static void check_compatibility(const S390CPUModel *max_model,
>>>          return;
>>>      }
>>>  
>>> +    if (only_migratable && test_bit(S390_FEAT_UNPACK, model->features)) {
>>> +        error_setg(errp, "The unpack facility is not compatible with "
>>> +                   "the --only-migratable option");
>>
>> return; ?
> 
> of course.
> 
>>
>>
>> This implies that a VM with "-cpu host" might not start anymore, right?
> 
> Only if --only-migratable is set.
> 

Right, that's what I meant

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


