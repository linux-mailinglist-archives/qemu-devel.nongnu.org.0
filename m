Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CB466BDE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 22:57:02 +0100 (CET)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msu4b-0007sN-O2
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 16:57:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1msu34-0007Ac-5K
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 16:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1msu2z-0003Cd-UF
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 16:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638482120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scIKq1d+8FyZabA5j1D9HpC1tDRf0B8+LaEsU+0UK0I=;
 b=LVVYSID3s29Ux9DPuPYVh0C0haYLHZJ9rD3FNN9mvyO9KgSx83/7kqS1IDDVKkDCj60/g9
 oSJWHWN+oeuJK6uEIgfQV5vjoyXjty7K76H+AwOQakAHy254kPzFJMok3WLhvR5youTV5g
 XUcDREA77eaS+PYTUGwnTnr/Dc0G0cQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-M6EuoovdM7aju72ko-UgZQ-1; Thu, 02 Dec 2021 16:55:19 -0500
X-MC-Unique: M6EuoovdM7aju72ko-UgZQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so2370235wmg.2
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 13:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=scIKq1d+8FyZabA5j1D9HpC1tDRf0B8+LaEsU+0UK0I=;
 b=Cmz25e/uX7CbZ6b4PpUh4A3lCrj0PcL7L+k3EptY+NEsOBCFMW6ZOVL+NRdnl0FndE
 FFXTzcjIbKyPIGDgYlzfdYaEzd0U8FQZDA2v/7VoTpPkEJtY83Vt9yWiS8k+uwGwtbUS
 tO8QDXaj/T8iDkMJ00GjozmKwj+opd9rdU/QCNY1vEGFlurKmn+RYM3Ep7ADVnPtLYJP
 KTXDxZhIrRJhCIKM0IT7/yAIseiPkZedSAppKPGjgdlPrVRZnrnxi8xMKHL0K0mXXpsu
 bbEAbqY+7sNeQWVwu7jyS3q8ZdeqVgKtc5rjNAo7J+39WpEhyX86YAkTqreJjOXA2cya
 jerg==
X-Gm-Message-State: AOAM531gP1m7V9yPv20Dq3lBZxly7clA0MAlIsr9xsENmLLTBSRExMfN
 5tcJJEFGP0iJFSMo/Su3t7y+Isv0sLbYWttXix7ixpDXGui2VyZN1vwK5RTutgnzVe9ZcnHz3sl
 SopzOsdAslmUWv0s=
X-Received: by 2002:adf:db47:: with SMTP id f7mr17591956wrj.113.1638482118159; 
 Thu, 02 Dec 2021 13:55:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz908MrYwKmChxcVy85v0HjfAacmRcK2acF9chBa+EuUhXfmQUH5wM6/DFmp8kU/jjltWeB0w==
X-Received: by 2002:adf:db47:: with SMTP id f7mr17591922wrj.113.1638482117863; 
 Thu, 02 Dec 2021 13:55:17 -0800 (PST)
Received: from ?IPV6:2003:d8:2f44:9200:3344:447e:353c:bf0b?
 (p200300d82f4492003344447e353cbf0b.dip0.t-ipconnect.de.
 [2003:d8:2f44:9200:3344:447e:353c:bf0b])
 by smtp.gmail.com with ESMTPSA id p5sm847572wrd.13.2021.12.02.13.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 13:55:17 -0800 (PST)
Message-ID: <57fca588-8bae-213e-8353-58e9a487d939@redhat.com>
Date: Thu, 2 Dec 2021 22:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-2-mjrosato@linux.ibm.com>
 <123ecaef-0f76-614c-2f6d-cdb824a84f56@redhat.com>
 <a5b6d5d7-e11a-9b7a-651f-feda4f2c3781@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <a5b6d5d7-e11a-9b7a-651f-feda4f2c3781@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.3, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.12.21 18:11, Matthew Rosato wrote:
> On 12/2/21 11:43 AM, David Hildenbrand wrote:
>> On 02.12.21 17:41, Matthew Rosato wrote:
>>> The current default PCI group being used can technically collide with a
>>> real group ID passed from a hostdev.  Let's instead use a group ID that comes
>>> from a special pool that is architected to be reserved for simulated devices.
>>>
>>> Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
>>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>>> ---
>>>   include/hw/s390x/s390-pci-bus.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
>>> index aa891c178d..2727e7bdef 100644
>>> --- a/include/hw/s390x/s390-pci-bus.h
>>> +++ b/include/hw/s390x/s390-pci-bus.h
>>> @@ -313,7 +313,7 @@ typedef struct ZpciFmb {
>>>   } ZpciFmb;
>>>   QEMU_BUILD_BUG_MSG(offsetof(ZpciFmb, fmt0) != 48, "padding in ZpciFmb");
>>>   
>>> -#define ZPCI_DEFAULT_FN_GRP 0x20
>>> +#define ZPCI_DEFAULT_FN_GRP 0xFF
>>>   typedef struct S390PCIGroup {
>>>       ClpRspQueryPciGrp zpci_group;
>>>       int id;
>>>
>>
>> What happens if we migrate a VM from old to new QEMU? Won't the guest be
>> able to observe the change?
>>
> 
> Yes, technically --  But # itself is not really all that important, it 
> is provided from CLP Q PCI FN to be subsequently used as input into Q 
> PCI FNGRP -- With the fundamental notion being that all functions that 
> share the same group # share the same group CLP info.  Whether the 
> number is, say, 1 or 5 doesn't matter so much.
> 
> However..  0xF0 and greater are the only values reserved for hypervisor 
> use.  By using 0x20 we run the risk of accidentally conflating simulated 
> devices and real hardware, hence the desire to change it.
> 
> Is your concern about a migrated guest with a virtio device trying to do 
> a CLP QUERY PCI FNGRP using 0x20 on a new QEMU?  I suppose we could 
> modify 'clp_service_call, case CLP_QUERY_PCI_FNGRP' to silently catch 
> simulated devices trying to use something other than the default group, 
> e.g.:
> 
> if ((pbdev->fh & FH_SHM_EMUL) &&
>      (pbdev->zpci_fn.pfgid != ZPCI_DEFAULT_FN_GRP)) {
>          /* Simulated device MUST have default group */
> 	pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
> 	group = s390_group_find(ZPCI_DEFAULT_FN_GRP);
> }
> 
> What do you think?
> 

Good question, I'm certainly not a zPCI expert. However if you think
that we cannot really break migration in a sane use case, I'm fine with
it as well :)

The question about breaking migration just popped up in my head when I
stumbled over this patch.

-- 
Thanks,

David / dhildenb


