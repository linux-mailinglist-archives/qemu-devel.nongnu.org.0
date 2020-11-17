Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA582B5ED7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:10:38 +0100 (CET)
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezoi-0001Be-8T
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keznq-0000cB-4M
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keznn-0000DL-2J
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605614978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QGET5nWAJj61oaNhzzvotbvhX9oo77MvWrLoE3ym2fM=;
 b=T0rUGEayNYAqIJwSg840f6iOP2vW4BZ6K0gKdZ1Z8fR3m8axpie+X2Tc+FEZU9AtyDQ7yM
 NUHSS/IeMiU0Txy43rP9PHhQx6UCl+tP9yLv7FICtxMFsqS3YFwITjkoh8ED5/vKCZjPtZ
 zZT6xs2hZePheNntwxYUjApgBRqZRhI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-4ZZfqCe-O-aVr8ENbmOv1w-1; Tue, 17 Nov 2020 07:09:36 -0500
X-MC-Unique: 4ZZfqCe-O-aVr8ENbmOv1w-1
Received: by mail-wr1-f69.google.com with SMTP id w6so12903561wrk.1
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 04:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QGET5nWAJj61oaNhzzvotbvhX9oo77MvWrLoE3ym2fM=;
 b=rf6HhdZvdpxlenzGKSwsjN3nPPzJgfe2f9EHCsd6cjViB4t6B0mGyXO5QuMBArl4qA
 BRDUg3ZL1nkN4PPGe6BONoaoVU/aasBUnSvQ+39EHDmE1AMf0nZ1q63TmsASvcWyG46X
 SX3R7iLNaPKIGutQK2VdRt4p5DNeNJ8eavaoXGOiiOYcwpuI0ERURczW5GBznTA1hZBc
 JVLeXwMqcpcBmnvxBWSeZCDjV6nX7xpTym9PMurehCHiwa79yIVqqEMXqvEoMjZGz3NJ
 jqSTTCsorLBN9A1e8Pe+1ItnNZ/nNtP//0TbCYrmMr5eRHkfOqu+xOcDp1rnA+1FnWTa
 IJ4g==
X-Gm-Message-State: AOAM531IO1+rvscGjyyHymEqDCwC2GVB1UZQ5fa6Y7km2b1oajyfTwcj
 EFvW8mEBAzH/SbVjt6UHf6sXW01s39WRlARUcI3lsbH9aqPRwxc2qAl/CKc8VK/KhD2M459ogw2
 HOsGNzHXdwX9HLmY=
X-Received: by 2002:a1c:6405:: with SMTP id y5mr4075876wmb.150.1605614975604; 
 Tue, 17 Nov 2020 04:09:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9gdPOMvBxTR++wn6ZOxMiUoN4k1CglKXAz+tZqAUMfWC1gG6iziE0aTcpMiN5ZLDwIaOqZg==
X-Received: by 2002:a1c:6405:: with SMTP id y5mr4075840wmb.150.1605614975218; 
 Tue, 17 Nov 2020 04:09:35 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id c17sm27410205wro.19.2020.11.17.04.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 04:09:34 -0800 (PST)
Subject: Re: [PULL v3 26/32] s390x/pci: use a PCI Group structure
To: Cornelia Huck <cohuck@redhat.com>
References: <160426371498.24886.12193840637250368669.stgit@gimli.home>
 <160426456672.24886.4745091679423774723.stgit@gimli.home>
 <20201117124349.2e1e2fe3.cohuck@redhat.com>
 <3257afb9-b1ce-9104-6424-a9bcccce1bab@redhat.com>
 <20201117130607.30466d83.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d8e9c2d7-e56d-0a16-e659-706d045daa96@redhat.com>
Date: Tue, 17 Nov 2020 13:09:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117130607.30466d83.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 1:06 PM, Cornelia Huck wrote:
> On Tue, 17 Nov 2020 12:55:22 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 11/17/20 12:43 PM, Cornelia Huck wrote:
>>> On Sun, 01 Nov 2020 14:02:46 -0700
>>> Alex Williamson <alex.williamson@redhat.com> wrote:
>>>   
>>>> From: Pierre Morel <pmorel@linux.ibm.com>
>>>>
>>>> We use a S390PCIGroup structure to hold the information related to a
>>>> zPCI Function group.
>>>>
>>>> This allows us to be ready to support multiple groups and to retrieve
>>>> the group information from the host.
>>>>
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>>>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>>>> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
>>>> ---
>>>>  hw/s390x/s390-pci-bus.c         |   42 +++++++++++++++++++++++++++++++++++++++
>>>>  hw/s390x/s390-pci-inst.c        |   23 +++++++++++++--------
>>>>  include/hw/s390x/s390-pci-bus.h |   10 +++++++++
>>>>  3 files changed, 66 insertions(+), 9 deletions(-)  
>>>
>>> I just bisected a regression down to this commit.
>>>
>>> s390x tcg guest on x86, virtio-pci devices are not detected. The
>>> relevant feature bits are visible to the guest. Same breakage with
>>> different guest kernels.
>>>
>>> KVM guests and s390x tcg guests on s390x are fine, so I assume an
>>> endianness issue somewhere. Nothing jumps out to me, though.
> 
> (...)
>>>>      case CLP_QUERY_PCI_FNGRP: {
>>>>          ClpRspQueryPciGrp *resgrp = (ClpRspQueryPciGrp *)resh;
>>>> -        resgrp->fr = 1;
>>>> -        stq_p(&resgrp->dasm, 0);
>>>> -        stq_p(&resgrp->msia, ZPCI_MSI_ADDR);
>>>> -        stw_p(&resgrp->mui, DEFAULT_MUI);
>>>> -        stw_p(&resgrp->i, 128);
>>>> -        stw_p(&resgrp->maxstbl, 128);
>>>> -        resgrp->version = 0;
>>>>  
>>>> +        ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
>>>> +        S390PCIGroup *group;
>>>> +
>>>> +        group = s390_group_find(reqgrp->g);  
>>
>> -        group = s390_group_find(reqgrp->g);
>> +        group = s390_group_find(ldl_p(&reqgrp->g));
> 
> Yep, that's it :)
> 
> Do you want to send a proper patch, or should I do it?

Sent 5min ago ;)

Regards,

Phil.


