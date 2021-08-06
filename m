Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D263E2687
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 10:56:02 +0200 (CEST)
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBve5-0003ZW-Ap
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 04:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBvcy-0002pR-35
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:54:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBvcw-0002zI-KZ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628240090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Og5SNoQU1D9V8rQhO9tlpkC0wDOa6QJM/m0aK4/xDEU=;
 b=ZyhhwAR/ylDDtZCYE9f+T4ATXbOwcfIjATWzNb5D4vKuHetQHJjEAh8vdvXmAFYZpIG8mt
 gm3T62WEXf13ySyMnQe357SKslfuQPgTii4s8k9EvqOK+/JSeN4b7BvkCMFIAmuDdQDcYr
 bWSTNf222qO0Hs0GiaMB3SgfYyyyo7g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-NnEzIPxfOquWDmFkmjgewg-1; Fri, 06 Aug 2021 04:54:48 -0400
X-MC-Unique: NnEzIPxfOquWDmFkmjgewg-1
Received: by mail-wm1-f71.google.com with SMTP id
 205-20020a1c04d60000b02902e6620dfe4bso436583wme.0
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 01:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Og5SNoQU1D9V8rQhO9tlpkC0wDOa6QJM/m0aK4/xDEU=;
 b=WpFJhdfX52gFwmpkVs1/55fk8SVOe56zQPGFSkhQqz31bSSn9d/RQazURturqkoRkQ
 4bFIduDMbn17xsVPgwqkTYzk2mXeYtd8DWGbSZ7katlOsrEvFw8XtAWLpbuFzzjCHaDZ
 6NF+l9JhESf7uZu+xZ5acpHiFAqwoGzosonAUQ8554/cyGdE80Cs/Lb6fjLKZObB7yWw
 /aNwpqvfzwPWqnmtNeDeJaHsfoWS3r5gwPvO3oEZQUJ0oh/K5uUBg5kkItTOYBDzznJb
 7zy7a85w6ik2huhGxoMATqTBjsq/17h9jjGEg+GdgUEpcetdCprDVO5jQRJ3EtTZo7z5
 MCVw==
X-Gm-Message-State: AOAM533+JMF27EAhan32zntgyRtQoJGLoeT4bYcBLYhze7O5bnQIAbU4
 Mqjp9vpGMwQBCnld3wahR8MtVXvi9+8jBfpde+YL8JS+Y+SGMdxfQ9/5V+7mOagmGIzoYmlD7GR
 xarcRTcrVDaXedsI=
X-Received: by 2002:a5d:4751:: with SMTP id o17mr9543661wrs.252.1628240087805; 
 Fri, 06 Aug 2021 01:54:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfVXnm8hxcc3VNac99hh/HPFc5F0TN7NpANkTg3jnHjqxYhIMlYwPnp1vbNSZWuANlp7bDHw==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr9543641wrs.252.1628240087592; 
 Fri, 06 Aug 2021 01:54:47 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id q14sm8998148wrm.66.2021.08.06.01.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:54:47 -0700 (PDT)
Subject: Re: [PATCH v1 11/12] hw/s390x/s390-skeys: check if an address is
 valid before dumping the key
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-12-david@redhat.com>
 <fd12be48-6c8c-9afa-ed4b-c5eb674cae88@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <afa957c0-63e5-6d48-c35c-5f9b8437c0c8@redhat.com>
Date: Fri, 6 Aug 2021 10:54:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fd12be48-6c8c-9afa-ed4b-c5eb674cae88@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 10:53, Thomas Huth wrote:
> On 05/08/2021 17.28, David Hildenbrand wrote:
>> Let's validate the given address and report a proper error in case it's
>> not. All call paths now properly check the validity of the given GFN.
>> Remove the TODO.
>>
>> The errors inside the getter and setter should only trigger if something
>> really goes wrong now, for example, with a broken migration stream. Or
>> when we forget to update the storage key allocation with memory hotplug.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>    hw/s390x/s390-skeys.c | 12 +++++++-----
>>    1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
>> index 56a47fe180..53e16f1b9c 100644
>> --- a/hw/s390x/s390-skeys.c
>> +++ b/hw/s390x/s390-skeys.c
>> @@ -18,6 +18,7 @@
>>    #include "qapi/qmp/qdict.h"
>>    #include "qemu/error-report.h"
>>    #include "sysemu/memory_mapping.h"
>> +#include "exec/address-spaces.h"
>>    #include "sysemu/kvm.h"
>>    #include "migration/qemu-file-types.h"
>>    #include "migration/register.h"
>> @@ -86,6 +87,12 @@ void hmp_info_skeys(Monitor *mon, const QDict *qdict)
>>            return;
>>        }
>>    
>> +    if (!address_space_access_valid(&address_space_memory,
>> +                                    addr & TARGET_PAGE_MASK, TARGET_PAGE_SIZE,
>> +                                    false, MEMTXATTRS_UNSPECIFIED)) {
>> +        monitor_printf(mon, "Error: The given address is not valid\n");
> 
> I think the code should return here?

Whoops, very right. Thanks!


-- 
Thanks,

David / dhildenb


