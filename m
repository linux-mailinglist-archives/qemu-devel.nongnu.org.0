Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70C2B5EBD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:56:44 +0100 (CET)
Received: from localhost ([::1]:36482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezbH-0001AW-6g
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keza9-0008Db-0F
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:55:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keza6-0003Fn-A9
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605614127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IRxW/EvgciW9zYb6OosE/60Ezqo9Dww3pGSERixsP9E=;
 b=dyGprxIMT7lVINEgrYNa1o6tGqZxY1wFfJMNEwT3jtvV/2MyQ8XNACmWjWYRfLy+WJtMo3
 qZAMKrge3MAw9778VCDH5p8EaLFcZNgQ4C0J5yx/wJSSSBQUTIx91+cZTpQqxeUQ6q8LID
 oVPpAblwY6CyDQjiW+DaB3QigFttAkc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-iOabvZLEOyuq-0gukNjCiQ-1; Tue, 17 Nov 2020 06:55:25 -0500
X-MC-Unique: iOabvZLEOyuq-0gukNjCiQ-1
Received: by mail-wm1-f69.google.com with SMTP id h2so1631766wmm.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IRxW/EvgciW9zYb6OosE/60Ezqo9Dww3pGSERixsP9E=;
 b=t7HPdbBVh9bKaGv8dC33OKGCevWN8g+8tstbfVn9+GDT2F5zqPBhTy3Vc+uoKXn035
 lDEHH0xy2zrvbfCcTlB/j0s2THEcDehINqgAsl2I7roBqRnx/sjYo8Nna+L6KQjxjqZB
 LdtePHzvtjiMwSklLEG195xkrr6aI65dIVmve/wyvzUCcloGMWhUyW+6o6bpcSa3waYu
 WEABOST5mtybkbsYB3q+DxgW9Iocd10O8ZU+aIecIfqR8JeGprgC1heuPYEx7nxWyp1v
 9F91wZ8z51ncz3Rw7oAcV9lK9XmqYqRSaGRn4T+qfOXTaxrjNjnWa1vOUbnq2dIZdIjq
 IhBg==
X-Gm-Message-State: AOAM530gzQyyUU3mVVWxMMRB6GRL19ROGtWrQJ/mOy3PN2p2GT138TbO
 09b1ARtW/duF1HqD3nrS+6mp0RP/FgEZT6iK1+rnIBx9m2fuHDJkanNZlTtE199BekUNXgcLLv5
 KA0ssqwfv6Vusnck=
X-Received: by 2002:adf:de12:: with SMTP id b18mr25385585wrm.187.1605614124564; 
 Tue, 17 Nov 2020 03:55:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDW3eTBnr2NuFOjDVjzxw1MBugZ1Iik9yUOrIhNFndivDJyhbYbovlTiY6FPgsY03ApkwTJw==
X-Received: by 2002:adf:de12:: with SMTP id b18mr25385553wrm.187.1605614124228; 
 Tue, 17 Nov 2020 03:55:24 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o17sm3255075wmd.34.2020.11.17.03.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 03:55:23 -0800 (PST)
Subject: Re: [PULL v3 26/32] s390x/pci: use a PCI Group structure
To: Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <160426371498.24886.12193840637250368669.stgit@gimli.home>
 <160426456672.24886.4745091679423774723.stgit@gimli.home>
 <20201117124349.2e1e2fe3.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3257afb9-b1ce-9104-6424-a9bcccce1bab@redhat.com>
Date: Tue, 17 Nov 2020 12:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117124349.2e1e2fe3.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-s390x@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 12:43 PM, Cornelia Huck wrote:
> On Sun, 01 Nov 2020 14:02:46 -0700
> Alex Williamson <alex.williamson@redhat.com> wrote:
> 
>> From: Pierre Morel <pmorel@linux.ibm.com>
>>
>> We use a S390PCIGroup structure to hold the information related to a
>> zPCI Function group.
>>
>> This allows us to be ready to support multiple groups and to retrieve
>> the group information from the host.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
>> ---
>>  hw/s390x/s390-pci-bus.c         |   42 +++++++++++++++++++++++++++++++++++++++
>>  hw/s390x/s390-pci-inst.c        |   23 +++++++++++++--------
>>  include/hw/s390x/s390-pci-bus.h |   10 +++++++++
>>  3 files changed, 66 insertions(+), 9 deletions(-)
> 
> I just bisected a regression down to this commit.
> 
> s390x tcg guest on x86, virtio-pci devices are not detected. The
> relevant feature bits are visible to the guest. Same breakage with
> different guest kernels.
> 
> KVM guests and s390x tcg guests on s390x are fine, so I assume an
> endianness issue somewhere. Nothing jumps out to me, though.
> 
>>
>> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
>> index 218717397ae1..4c7f06d5cf95 100644
>> --- a/hw/s390x/s390-pci-bus.c
>> +++ b/hw/s390x/s390-pci-bus.c
>> @@ -738,6 +738,46 @@ static void s390_pci_iommu_free(S390pciState *s, PCIBus *bus, int32_t devfn)
>>      object_unref(OBJECT(iommu));
>>  }
>>  
>> +static S390PCIGroup *s390_group_create(int id)
>> +{
>> +    S390PCIGroup *group;
>> +    S390pciState *s = s390_get_phb();
>> +
>> +    group = g_new0(S390PCIGroup, 1);
>> +    group->id = id;
>> +    QTAILQ_INSERT_TAIL(&s->zpci_groups, group, link);
>> +    return group;
>> +}
>> +
>> +S390PCIGroup *s390_group_find(int id)
>> +{
>> +    S390PCIGroup *group;
>> +    S390pciState *s = s390_get_phb();
>> +
>> +    QTAILQ_FOREACH(group, &s->zpci_groups, link) {
>> +        if (group->id == id) {
>> +            return group;
>> +        }
>> +    }
>> +    return NULL;
>> +}
>> +
>> +static void s390_pci_init_default_group(void)
>> +{
>> +    S390PCIGroup *group;
>> +    ClpRspQueryPciGrp *resgrp;
>> +
>> +    group = s390_group_create(ZPCI_DEFAULT_FN_GRP);
>> +    resgrp = &group->zpci_group;
>> +    resgrp->fr = 1;
>> +    stq_p(&resgrp->dasm, 0);
>> +    stq_p(&resgrp->msia, ZPCI_MSI_ADDR);
>> +    stw_p(&resgrp->mui, DEFAULT_MUI);
>> +    stw_p(&resgrp->i, 128);
>> +    stw_p(&resgrp->maxstbl, 128);
>> +    resgrp->version = 0;
>> +}
>> +
>>  static void s390_pcihost_realize(DeviceState *dev, Error **errp)
>>  {
>>      PCIBus *b;
>> @@ -766,7 +806,9 @@ static void s390_pcihost_realize(DeviceState *dev, Error **errp)
>>      QTAILQ_INIT(&s->pending_sei);
>>      QTAILQ_INIT(&s->zpci_devs);
>>      QTAILQ_INIT(&s->zpci_dma_limit);
>> +    QTAILQ_INIT(&s->zpci_groups);
>>  
>> +    s390_pci_init_default_group();
>>      css_register_io_adapters(CSS_IO_ADAPTER_PCI, true, false,
>>                               S390_ADAPTER_SUPPRESSIBLE, errp);
>>  }
>> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
>> index 4eadd9e79416..c25b2a67efe0 100644
>> --- a/hw/s390x/s390-pci-inst.c
>> +++ b/hw/s390x/s390-pci-inst.c
>> @@ -298,21 +298,25 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>>          stq_p(&resquery->edma, ZPCI_EDMA_ADDR);
>>          stl_p(&resquery->fid, pbdev->fid);
>>          stw_p(&resquery->pchid, 0);
>> -        stw_p(&resquery->ug, 1);
>> +        stw_p(&resquery->ug, ZPCI_DEFAULT_FN_GRP);
>>          stl_p(&resquery->uid, pbdev->uid);
>>          stw_p(&resquery->hdr.rsp, CLP_RC_OK);
>>          break;
>>      }
>>      case CLP_QUERY_PCI_FNGRP: {
>>          ClpRspQueryPciGrp *resgrp = (ClpRspQueryPciGrp *)resh;
>> -        resgrp->fr = 1;
>> -        stq_p(&resgrp->dasm, 0);
>> -        stq_p(&resgrp->msia, ZPCI_MSI_ADDR);
>> -        stw_p(&resgrp->mui, DEFAULT_MUI);
>> -        stw_p(&resgrp->i, 128);
>> -        stw_p(&resgrp->maxstbl, 128);
>> -        resgrp->version = 0;
>>  
>> +        ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
>> +        S390PCIGroup *group;
>> +
>> +        group = s390_group_find(reqgrp->g);

-        group = s390_group_find(reqgrp->g);
+        group = s390_group_find(ldl_p(&reqgrp->g));

>> +        if (!group) {
>> +            /* We do not allow access to unknown groups */
>> +            /* The group must have been obtained with a vfio device */
>> +            stw_p(&resgrp->hdr.rsp, CLP_RC_QUERYPCIFG_PFGID);
>> +            goto out;
>> +        }
>> +        memcpy(resgrp, &group->zpci_group, sizeof(ClpRspQueryPciGrp));
>>          stw_p(&resgrp->hdr.rsp, CLP_RC_OK);
>>          break;
>>      }
>> @@ -787,7 +791,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>>      }
>>      /* Length must be greater than 8, a multiple of 8 */
>>      /* and not greater than maxstbl */
>> -    if ((len <= 8) || (len % 8) || (len > pbdev->maxstbl)) {
>> +    if ((len <= 8) || (len % 8) ||
>> +        (len > pbdev->pci_group->zpci_group.maxstbl)) {
>>          goto specification_error;
>>      }
>>      /* Do not cross a 4K-byte boundary */


