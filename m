Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03760F1EF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:11:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxuT-00023y-QL; Thu, 27 Oct 2022 04:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onxtF-0001S3-Mo
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onxtB-0001Xi-PP
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666857920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kiVqPx6WzKgITKnYhdH2TjnlWUBARdiwwDg7KFfkxuc=;
 b=ak3w3u3upWBJKOahDThQbOmPGSL6fIkbMN4l/WmOw4v5zmkqeUbun7AIMsYt7IaCOWAslq
 S2jab62/cbsBYMyZwo1rVJqtPtk+INrSaLAHtYqMDjKbMEhqHF99FhoxLNbvbV4K7Io07Y
 W2Tcg8UfOeOwA/CiTQE44F4Om3m/1Gs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-3AVXq3KPO2yLAH3m3aAXIA-1; Thu, 27 Oct 2022 04:05:18 -0400
X-MC-Unique: 3AVXq3KPO2yLAH3m3aAXIA-1
Received: by mail-wm1-f69.google.com with SMTP id
 az35-20020a05600c602300b003c5273b79fdso2428795wmb.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kiVqPx6WzKgITKnYhdH2TjnlWUBARdiwwDg7KFfkxuc=;
 b=IGvzo0hFJ0MedeBIEK35M7GlAs2d5K53sdXyla4FLeRJowlyJyWXp5+qc9RiAPbqhe
 g0AS6HehS/2t1vMWNg/9y7I60L7uI65W7SjojPGRrdHXeJzHCTfuaIAQWJlMXJqK0UYo
 Tk/fovzlC+IvgctmfdYr9N4Jxq0fd1wy62hdeKpJDUpyn+V86QVtrI79M/Y9ETV+hdY/
 wvaDwGgWC3l//4kMjdADvb5ulfVxXZFoDldz+QHUISeWy1cscw+oDwtEX3g75X57s9De
 Hg3r8zZ7IiLt3mE98DOoVs+UhKtL+AuickazI6ssjbG6NcKRF1ZwY0Dssyib47IfWkbh
 h15Q==
X-Gm-Message-State: ACrzQf3A1MsvTm6XBg0CIdklRioz5a9Q4ulfA1dZGnxz+u0XZDKXgNgG
 gzmcEw/PYDdShcmWhXwAp6Y1lomCQcoRZH1PC45rLaQbp0z2+UGFNPtIjmHSX7olfeaRKL60fKS
 ulXeQu9iX8NSTPlQ=
X-Received: by 2002:a5d:564c:0:b0:236:6089:cc50 with SMTP id
 j12-20020a5d564c000000b002366089cc50mr16772349wrw.520.1666857917498; 
 Thu, 27 Oct 2022 01:05:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6cGBa1vemygTiBh25vWQYc58I/twK3ikaEvNvyVh2CEHaa+xC3Ddfcg8NjWQQDBKWDKZN91A==
X-Received: by 2002:a5d:564c:0:b0:236:6089:cc50 with SMTP id
 j12-20020a5d564c000000b002366089cc50mr16772311wrw.520.1666857917143; 
 Thu, 27 Oct 2022 01:05:17 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6d88000000b0022b315b4649sm597481wrs.26.2022.10.27.01.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 01:05:16 -0700 (PDT)
Message-ID: <a45185d1-16dc-6a31-6f1e-13b97fdb31e2@redhat.com>
Date: Thu, 27 Oct 2022 10:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v10 1/9] s390x/cpu topology: core_id sets s390x CPU
 topology
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-2-pmorel@linux.ibm.com>
 <65c3bfd263b03ca524444cdf5f96d937f582f2d7.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <65c3bfd263b03ca524444cdf5f96d937f582f2d7.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/2022 21.25, Janis Schoetterl-Glausch wrote:
> On Wed, 2022-10-12 at 18:20 +0200, Pierre Morel wrote:
>> In the S390x CPU topology the core_id specifies the CPU address
>> and the position of the core withing the topology.
>>
>> Let's build the topology based on the core_id.
>> s390x/cpu topology: core_id sets s390x CPU topology
>>
>> In the S390x CPU topology the core_id specifies the CPU address
>> and the position of the cpu withing the topology.
>>
>> Let's build the topology based on the core_id.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   include/hw/s390x/cpu-topology.h |  45 +++++++++++
>>   hw/s390x/cpu-topology.c         | 132 ++++++++++++++++++++++++++++++++
>>   hw/s390x/s390-virtio-ccw.c      |  21 +++++
>>   hw/s390x/meson.build            |   1 +
>>   4 files changed, 199 insertions(+)
>>   create mode 100644 include/hw/s390x/cpu-topology.h
>>   create mode 100644 hw/s390x/cpu-topology.c
>>
>> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
>> new file mode 100644
>> index 0000000000..66c171d0bc
>> --- /dev/null
>> +++ b/include/hw/s390x/cpu-topology.h
>> @@ -0,0 +1,45 @@
>> +/*
>> + * CPU Topology
>> + *
>> + * Copyright 2022 IBM Corp.
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
>> + * your option) any later version. See the COPYING file in the top-level
>> + * directory.
>> + */
>> +#ifndef HW_S390X_CPU_TOPOLOGY_H
>> +#define HW_S390X_CPU_TOPOLOGY_H
>> +
>> +#include "hw/qdev-core.h"
>> +#include "qom/object.h"
>> +
>> +typedef struct S390TopoContainer {
>> +    int active_count;
>> +} S390TopoContainer;
>> +
>> +#define S390_TOPOLOGY_CPU_IFL 0x03
>> +#define S390_TOPOLOGY_MAX_ORIGIN ((63 + S390_MAX_CPUS) / 64)
>> +typedef struct S390TopoTLE {
>> +    uint64_t mask[S390_TOPOLOGY_MAX_ORIGIN];
>> +} S390TopoTLE;
> 
> Since this actually represents multiple TLEs, you might want to change the
> name of the struct to reflect this. S390TopoTLEList maybe?

Didn't TLE mean "Topology List Entry"? (by the way, Pierre, please explain 
this three letter acronym somewhere in this header in a comment)...

So expanding the TLE, this would mean S390TopoTopologyListEntryList ? ... 
this is getting weird... Also, this is not a "list" in the sense of a linked 
list, as one might expect at a first glance, so this is all very confusing 
here. Could you please come up with some better naming?

  Thomas


