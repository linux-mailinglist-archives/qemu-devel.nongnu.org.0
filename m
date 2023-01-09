Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED7662841
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:18:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEseP-0007rw-G2; Mon, 09 Jan 2023 08:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pEseK-0007oJ-J0
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:57:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pEseI-0004EM-UT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673272634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIExVQHEf4J+lYZFQ03wu91BDElJ3w0NOzSnC0lMLBk=;
 b=CsDixBTgCRIZMvkk3JmC48X+IF01SGc3nYPjLdaQ7VcXC6AsTrOsbH+YR9Y7GHs/aOxBwy
 TQ4wabCuUrDaIEyQ1f5ms4iRxpcB6lfDYkDvb7TAaW6nuwqM4LSJuDHjfwPt41Plbt0I6w
 Z1new8AWWnO2+JS8+kxL77oFVdD5y6E=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-0oPl6nXIPImfo5ngC-A9qQ-1; Mon, 09 Jan 2023 08:57:11 -0500
X-MC-Unique: 0oPl6nXIPImfo5ngC-A9qQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 n14-20020a9f314e000000b004114b0c125fso4276250uab.8
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 05:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIExVQHEf4J+lYZFQ03wu91BDElJ3w0NOzSnC0lMLBk=;
 b=mgT0z2PnQR52jyXXHIp2VJxUkr1gVUGwFHYp22pVCH4NKZ3tkNz/duS7+7IKrsxUT4
 0VEzOo2oNl0r0eqPBGMuYBMQaWyRMtZr3H8RoVdA/PpzWVL9iS1EVV3hFezVHRn1BohY
 fVHLbGalstOP3ZYG9maC7WXtAlmDwVzqAjl6EkA26ziXBicvLu4vEGdPVJF4ztmCDD1i
 BwWwcd0mC+AUZAnGJkgdSTbiUi+nEc96DaPOsRKJ2s0LbzL0UKIyucfmZh6Dt6THyU2m
 Ki54jPau1Y+2qKdAAiQTxQIQEpMjMdLkskzjzqAv9YVQYMUXawN9L/cbGIqnx7pJPs6B
 tzQw==
X-Gm-Message-State: AFqh2kp1T8BdcGG4VIr4KiAZczmJy1rin/+i3dQwt7+cmmZkSAXNXpwM
 LAEvjFCfP3aoEbH9lkCmhvwnrpAa7A8wesyLFeuTP5vuqQKkLNyzpjSOCUVSSh8S72ef/g+H9hu
 4oRNLh+8vrfnCo/U=
X-Received: by 2002:a05:6102:dd0:b0:3aa:8a33:ce9f with SMTP id
 e16-20020a0561020dd000b003aa8a33ce9fmr41234148vst.3.1673272630793; 
 Mon, 09 Jan 2023 05:57:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/CCon9jGOxFXPgZhLB6qm/9ZLePaJycnwBTcm1zzyk+j9VQPcWDng3G8cRajZ4OPW6Be44Q==
X-Received: by 2002:a05:6102:dd0:b0:3aa:8a33:ce9f with SMTP id
 e16-20020a0561020dd000b003aa8a33ce9fmr41234121vst.3.1673272630476; 
 Mon, 09 Jan 2023 05:57:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05620a290800b006fb8239db65sm5406634qkp.43.2023.01.09.05.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 05:57:10 -0800 (PST)
Message-ID: <cd41a799-3f5b-7503-66d7-c5a8c99611f9@redhat.com>
Date: Mon, 9 Jan 2023 14:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/4] s390x/pv: Implement a CGS check helper
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, frankja@linux.ibm.com,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-2-clg@kaod.org>
 <db93e8a0-1591-1646-e920-e25842d76ec9@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <db93e8a0-1591-1646-e920-e25842d76ec9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/9/23 14:34, Thomas Huth wrote:
> On 06/01/2023 08.53, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@redhat.com>
>>
>> When a protected VM is started with the maximum number of CPUs (248),
>> the service call providing information on the CPUs requires more
>> buffer space than allocated and QEMU disgracefully aborts :
>>
>>      LOADPARM=[........]
>>      Using virtio-blk.
>>      Using SCSI scheme.
>>      ...................................................................................
>>      qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long
>>
>> When protected virtualization is initialized, compute the maximum
>> number of vCPUs supported by the machine and return useful information
>> to the user before the machine starts in case of error.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/s390x/pv.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
>> index 8dfe92d8df..8a1c71436b 100644
>> --- a/hw/s390x/pv.c
>> +++ b/hw/s390x/pv.c
>> @@ -20,6 +20,7 @@
>>   #include "exec/confidential-guest-support.h"
>>   #include "hw/s390x/ipl.h"
>>   #include "hw/s390x/pv.h"
>> +#include "hw/s390x/sclp.h"
>>   #include "target/s390x/kvm/kvm_s390x.h"
>>   static bool info_valid;
>> @@ -249,6 +250,41 @@ struct S390PVGuestClass {
>>       ConfidentialGuestSupportClass parent_class;
>>   };
>> +/*
>> + * If protected virtualization is enabled, the amount of data that the
>> + * Read SCP Info Service Call can use is limited to one page. The
>> + * available space also depends on the Extended-Length SCCB (ELS)
>> + * feature which can take more buffer space to store feature
>> + * information. This impacts the maximum number of CPUs supported in
>> + * the machine.
>> + */
>> +static uint32_t s390_pv_get_max_cpus(void)
>> +{
>> +    int offset_cpu = s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
>> +        offsetof(ReadInfo, entries) : SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
>> +
>> +    return (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry);
>> +}
>> +
>> +static bool s390_pv_check_cpus(Error **errp)
>> +{
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    uint32_t pv_max_cpus = s390_pv_get_max_cpus();
>> +
>> +    if (ms->smp.max_cpus > pv_max_cpus) {
>> +        error_setg(errp, "Protected VMs support a maximum of %d CPUs",
>> +                   pv_max_cpus);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static bool s390_pv_guest_check(ConfidentialGuestSupport *cgs, Error **errp)
>> +{
>> +    return s390_pv_check_cpus(errp);
>> +}
>> +
>>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>>   {
>>       if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
>> @@ -261,6 +297,10 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>>           return -1;
>>       }
>> +    if (!s390_pv_guest_check(cgs, errp)) {
>> +        return -1;
>> +    }
>> +
>>       cgs->ready = true;
>>       return 0;
> 
> Looks good to me now.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

I think we could move the huge page test in s390_pv_guest_check() also.
We are finishing a discussion with Janosch on the runtime test and I will
send a v3.

Thanks,

C.



