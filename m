Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E713FD944
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:09:59 +0200 (CEST)
Received: from localhost ([::1]:47380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLP42-0002pD-Br
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLOyz-0003vA-Ky
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLOyw-0001hn-Cj
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630497881;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avIdGQOT79cPPUzFbCa/tb70UMmmNKwwLNNbrnRmOsM=;
 b=fNpS7DQG2u/4AWAhS8uH63cGLYKGFaL7wMMYNoY/IqLIeKe10gYkiaXZEi73V1UlZAvLUl
 epvEMmTPOFvxL4dS5ivDZ4bRG+JqZB6FW0FW8fZt3ilj1SdxwgUw/xH7u1oXhiC5rPOr1r
 fe8GVNbiBv5xMzWqhTCbDKwSW2yJGks=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-ceRVCzaCMbiSR1bwOz45gg-1; Wed, 01 Sep 2021 08:04:40 -0400
X-MC-Unique: ceRVCzaCMbiSR1bwOz45gg-1
Received: by mail-wm1-f70.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so2726357wmd.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 05:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=avIdGQOT79cPPUzFbCa/tb70UMmmNKwwLNNbrnRmOsM=;
 b=r7d3cvmu0++ePwIAtzuBiWg6fsk30a0pvNNObljIRdw+HtD4/EpMVEPSN4Mn16UB65
 cpUdDoPilJsE2bYfOJMjmrnoNEP3PEDUy2U0/wayDD7b5SsGtPIh3RnE3Swx/z1/hRf8
 FTStaC4wqAONUP3aAFN2Gu23bLAharK/rUlHdnzQkDdbtrFOPDCkHR7s5Q2p3KRfwA1P
 tiA1Xf+q8az4hoEI9l6d12wF9J17a6gaFEyxjJDnhySc3Vc1yhNElst0XMKekBQiBPOU
 XtI9pzCTCodNkdaH2I9NJq2DbFG4svYoKR/JOK5rNSkl+06FKC+GonCTDIrWO2JfZgMZ
 4Iaw==
X-Gm-Message-State: AOAM531ibwZSji/hhye0TDwcjUHjo96tXEikbVr93mhYG1zL27UTSz2+
 bcII6cnIPSe5C9PKN8ZIsJaRzAAYWBWB7jJOmXDiY00OAEua3Yau6a0htcEPbGWid8RFuuU3cds
 XUKmYeq7alDOgc9E=
X-Received: by 2002:a7b:c3d9:: with SMTP id t25mr7858291wmj.14.1630497879716; 
 Wed, 01 Sep 2021 05:04:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB7+csufAW55Zadtm8KzUCnHWU+ElIng0j3jayvnjpHDAxpV3i7+HltZl5xh8gdRoA+zhdow==
X-Received: by 2002:a7b:c3d9:: with SMTP id t25mr7858249wmj.14.1630497879376; 
 Wed, 01 Sep 2021 05:04:39 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id d28sm20537273wrc.4.2021.09.01.05.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:04:38 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] hw/arm/smmuv3: Update implementation of CFGI
 commands based on device SID
To: "Li, Chunming" <Chunming.Li@verisilicon.com>,
 chunming <chunming_li1234@163.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-3-git-send-email-chunming_li1234@163.com>
 <7089ce3e-2b15-7cf3-86d9-231c69794138@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B0114302B8C@SHASXM03.verisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1bdba252-d63d-15cb-7365-4fbc666cd075@redhat.com>
Date: Wed, 1 Sep 2021 14:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B0114302B8C@SHASXM03.verisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/1/21 8:51 AM, Li, Chunming wrote:
>
>> -----Original Message-----
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: Tuesday, August 31, 2021 10:02 PM
>> To: chunming; peter.maydell@linaro.org
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; Wen, Jianxian; Liu,
>> Renwei; Li, Chunming
>> Subject: Re: [PATCH v5 2/4] hw/arm/smmuv3: Update implementation of
>> CFGI commands based on device SID
>>
>> Hi Chunming
>>
>> On 8/25/21 10:08 AM, chunming wrote:
>>> From: chunming <chunming.li@verisilicon.com>
>>>
>>> Replace "smmuv3_flush_config" with "g_hash_table_foreach_remove".
>> this replacement may have a potential negative impact on the
>> performance
>> for PCIe support, which is the main use case: a unique
>> g_hash_table_remove() is replaced by an iteration over all the config
>> hash keys.
>>
>> I wonder if you couldn't just adapt smmu_iommu_mr() and it case this
>> latter returns NULL for the current PCIe search, look up in the
>> platform
>> device list:
>>
>> peri_sdev_list?
> I think there are 2 scenes:
> 	1.  PCIe devices share same SID with peripheral devices.
>       2.  Multi peripheral devices share same SID.
> If we search PCIe 1st then search peri_sdev_list, there are 2 problems:
>       1.  The code is complex.
>       2.  We may need to search peri_sdev_list multi times. It may has performance impact.
why multiple times? 1st you look for a PCIe RID and then you look for
platform devices? Still I am dubious about the duplicate streamid case.
what I wanted to emphasize is at the moment I do not have a clear view
about your use case and I don't want to degrade the perf of the main use
case to support a yet to be defined one ;-)
>         
> The CFGI commands are only called when the SMMU device is removed.
> So we think there is no big performance impact.

Nevertheless I think this is not a major issue indeed.

Thanks

Eric
>
>> Thanks
>>
>> Eric
>>
>>
>>
>>> "smmu_iommu_mr" function can't get MR according to SID for non
>> PCI/PCIe devices.
>>> Signed-off-by: chunming <chunming.li@verisilicon.com>
>>> ---
>>>  hw/arm/smmuv3.c              | 35 ++++++++++------------------------
>> -
>>>  include/hw/arm/smmu-common.h |  5 ++++-
>>>  2 files changed, 14 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 11d7fe8423..9f3f13fb8e 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -613,14 +613,6 @@ static SMMUTransCfg
>> *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>>>      return cfg;
>>>  }
>>>
>>> -static void smmuv3_flush_config(SMMUDevice *sdev)
>>> -{
>>> -    SMMUv3State *s = sdev->smmu;
>>> -    SMMUState *bc = &s->smmu_state;
>>> -
>>> -    trace_smmuv3_config_cache_inv(smmu_get_sid(sdev));
>>> -    g_hash_table_remove(bc->configs, sdev);
>>> -}
>>>
>>>  static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr
>> addr,
>>>                                        IOMMUAccessFlags flag, int
>> iommu_idx)
>>> @@ -964,22 +956,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>>>          case SMMU_CMD_CFGI_STE:
>>>          {
>>>              uint32_t sid = CMD_SID(&cmd);
>>> -            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
>>> -            SMMUDevice *sdev;
>>> +            SMMUSIDRange sid_range;
>>>
>>>              if (CMD_SSEC(&cmd)) {
>>>                  cmd_error = SMMU_CERROR_ILL;
>>>                  break;
>>>              }
>>>
>>> -            if (!mr) {
>>> -                break;
>>> -            }
>>> -
>>> +            sid_range.start = sid;
>>> +            sid_range.end = sid;
>>>              trace_smmuv3_cmdq_cfgi_ste(sid);
>>> -            sdev = container_of(mr, SMMUDevice, iommu);
>>> -            smmuv3_flush_config(sdev);
>>> -
>>> +            g_hash_table_foreach_remove(bs->configs,
>> smmuv3_invalidate_ste,
>>> +                                        &sid_range);
>>>              break;
>>>          }
>>>          case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL
>> */
>>> @@ -1006,21 +994,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>>>          case SMMU_CMD_CFGI_CD_ALL:
>>>          {
>>>              uint32_t sid = CMD_SID(&cmd);
>>> -            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
>>> -            SMMUDevice *sdev;
>>> +            SMMUSIDRange sid_range;
>>>
>>>              if (CMD_SSEC(&cmd)) {
>>>                  cmd_error = SMMU_CERROR_ILL;
>>>                  break;
>>>              }
>>>
>>> -            if (!mr) {
>>> -                break;
>>> -            }
>>> -
>>> +            sid_range.start = sid;
>>> +            sid_range.end = sid;
>>>              trace_smmuv3_cmdq_cfgi_cd(sid);
>>> -            sdev = container_of(mr, SMMUDevice, iommu);
>>> -            smmuv3_flush_config(sdev);
>>> +            g_hash_table_foreach_remove(bs->configs,
>> smmuv3_invalidate_ste,
>>> +                                        &sid_range);
>>>              break;
>>>          }
>>>          case SMMU_CMD_TLBI_NH_ASID:
>>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-
>> common.h
>>> index 95cd12a4b5..d016455d80 100644
>>> --- a/include/hw/arm/smmu-common.h
>>> +++ b/include/hw/arm/smmu-common.h
>>> @@ -159,7 +159,10 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova,
>> IOMMUAccessFlags perm,
>>>   */
>>>  SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
>>>
>>> -/* Return the iommu mr associated to @sid, or NULL if none */
>>> +/**
>>> + * Return the iommu mr associated to @sid, or NULL if none
>>> + * Only for PCI device, check smmu_find_peri_sdev for non PCI/PCIe
>> device
>>> + */
>>>  IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
>>>
>>>  #define SMMU_IOTLB_MAX_SIZE 256


