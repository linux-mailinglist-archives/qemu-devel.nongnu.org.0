Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63D5662754
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:40:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsIG-0002ny-50; Mon, 09 Jan 2023 08:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEsIE-0002mr-AM
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEsIC-0002s3-NN
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673271263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gze03ROTdYq1f6K9Mi48laGhQ8KRq60vFd4CwVZDAHM=;
 b=UJEeQ9FWOf5QFSKaBDo2tlM9xykHaj5UiVuLXn39i6itWe0NBWxy7h4DsbwA35p+3Xsg+a
 Vp9YNrZu7UHYzqnVf/B2unIa+BEfR8NNgE6sUz8Cytgn6JLBY+uR7xJs6R7dpXyouJJXuS
 i4/bHScbKC/YrpH3zP2Fr4TC1I89bzg=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-iSITDqQQP1iLylXiJHAZbg-1; Mon, 09 Jan 2023 08:34:22 -0500
X-MC-Unique: iSITDqQQP1iLylXiJHAZbg-1
Received: by mail-vk1-f199.google.com with SMTP id
 g191-20020a1fb6c8000000b003d5f1d80ae2so2600734vkf.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 05:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gze03ROTdYq1f6K9Mi48laGhQ8KRq60vFd4CwVZDAHM=;
 b=sihksczBjwlRUYIBr6kUacqJoZe1Gh4mZX65rF+fJXj5F0NyIAHqVi5viPfkJ2TnUP
 wdl0IS25W2DUnfM3hNCmWtyNPynvAltRtK48o4Xkeqz2ntWV1Qkgd8j2rO0eDGtr2BMj
 uR3E50JX6e5Sbrn2ZRXWSMOd7far27nawXG5CeC4Eze3wpRwFy3dAtrWLykIJoUNo+yW
 Q5QhV+VM8GrhG8D6boNKIuVNm8qG7fas0dh5agw/ggfzg7TCh7meZa9c24lGmPbO3hDK
 T+RnwVOozAuuYU2KAhDJYSY1Mj5fT3Jlo0FroatvACXTBnwAM/Jpy8zpWm5ljWoRGE5g
 Hb2g==
X-Gm-Message-State: AFqh2kqe/t9pMEhjo8VJvRYbkH9IXw8kTLYdDYPR3rzgI/J/szVWdo6B
 a6ziOvQfSTPihtDVevgT0K2+7xW3Aon8YrA9TtO4q2mjHF5vZhK8Oky/Cv4Wky84RYzOuVv7e/t
 5p21kIwGxQH72deI=
X-Received: by 2002:a05:6102:1611:b0:3b1:2956:2517 with SMTP id
 cu17-20020a056102161100b003b129562517mr35731081vsb.9.1673271262117; 
 Mon, 09 Jan 2023 05:34:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuuSYdBoTt0H473S4uqqfbtVvzDRRGTU3ACk2/MeAxTMf6Yda25EA5LsftMH4GO0F3G9Fk2dA==
X-Received: by 2002:a05:6102:1611:b0:3b1:2956:2517 with SMTP id
 cu17-20020a056102161100b003b129562517mr35731051vsb.9.1673271261843; 
 Mon, 09 Jan 2023 05:34:21 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-179-204.web.vodafone.de.
 [109.43.179.204]) by smtp.gmail.com with ESMTPSA id
 bm39-20020a05620a19a700b00704d8ad2e11sm5329547qkb.42.2023.01.09.05.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 05:34:21 -0800 (PST)
Message-ID: <db93e8a0-1591-1646-e920-e25842d76ec9@redhat.com>
Date: Mon, 9 Jan 2023 14:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/4] s390x/pv: Implement a CGS check helper
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, frankja@linux.ibm.com,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-2-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230106075330.3662549-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 06/01/2023 08.53, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> When a protected VM is started with the maximum number of CPUs (248),
> the service call providing information on the CPUs requires more
> buffer space than allocated and QEMU disgracefully aborts :
> 
>      LOADPARM=[........]
>      Using virtio-blk.
>      Using SCSI scheme.
>      ...................................................................................
>      qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long
> 
> When protected virtualization is initialized, compute the maximum
> number of vCPUs supported by the machine and return useful information
> to the user before the machine starts in case of error.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/s390x/pv.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 8dfe92d8df..8a1c71436b 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -20,6 +20,7 @@
>   #include "exec/confidential-guest-support.h"
>   #include "hw/s390x/ipl.h"
>   #include "hw/s390x/pv.h"
> +#include "hw/s390x/sclp.h"
>   #include "target/s390x/kvm/kvm_s390x.h"
>   
>   static bool info_valid;
> @@ -249,6 +250,41 @@ struct S390PVGuestClass {
>       ConfidentialGuestSupportClass parent_class;
>   };
>   
> +/*
> + * If protected virtualization is enabled, the amount of data that the
> + * Read SCP Info Service Call can use is limited to one page. The
> + * available space also depends on the Extended-Length SCCB (ELS)
> + * feature which can take more buffer space to store feature
> + * information. This impacts the maximum number of CPUs supported in
> + * the machine.
> + */
> +static uint32_t s390_pv_get_max_cpus(void)
> +{
> +    int offset_cpu = s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
> +        offsetof(ReadInfo, entries) : SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
> +
> +    return (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry);
> +}
> +
> +static bool s390_pv_check_cpus(Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    uint32_t pv_max_cpus = s390_pv_get_max_cpus();
> +
> +    if (ms->smp.max_cpus > pv_max_cpus) {
> +        error_setg(errp, "Protected VMs support a maximum of %d CPUs",
> +                   pv_max_cpus);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static bool s390_pv_guest_check(ConfidentialGuestSupport *cgs, Error **errp)
> +{
> +    return s390_pv_check_cpus(errp);
> +}
> +
>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>   {
>       if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
> @@ -261,6 +297,10 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>           return -1;
>       }
>   
> +    if (!s390_pv_guest_check(cgs, errp)) {
> +        return -1;
> +    }
> +
>       cgs->ready = true;
>   
>       return 0;

Looks good to me now.

Reviewed-by: Thomas Huth <thuth@redhat.com>


