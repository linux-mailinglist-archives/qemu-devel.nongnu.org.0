Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9188B52E457
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 07:29:19 +0200 (CEST)
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrvCQ-0002ZG-1A
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 01:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangwenliang.1995@bytedance.com>)
 id 1nrv9Y-0001pw-Id
 for qemu-devel@nongnu.org; Fri, 20 May 2022 01:26:20 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangwenliang.1995@bytedance.com>)
 id 1nrv9S-0004Nc-3s
 for qemu-devel@nongnu.org; Fri, 20 May 2022 01:26:16 -0400
Received: by mail-pf1-x431.google.com with SMTP id y41so6843746pfw.12
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 22:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:in-reply-to:content-transfer-encoding;
 bh=fdNwaxFrm9HFLfOL0VlvICZLFltxdcxYlQCK0s7OZOg=;
 b=oGTm5S3SjdMghtuQuq1Q7MQHME8CobcZr9+bBMQzlQo0H32LgOITRKlXSNWbrxO9wk
 7dcY4DedRFS1y1KCrm24G6sRqYYloVXE1wAvcBGUquYjlp6KMu74Dl6DSCmU8DVEw1DP
 G5Dm4wrf9ud0quqy2q4KI9z5VOSaDHAVYMgrruNU5sZQ/u9jeOpiHhvVbyBmaXXlHMN7
 iMHu/YPhZIKv2f4wvu2/J6CzWsBqfrfXAHBTpSK/1WoOw7jKipXwVscroYe6WlRVvQpI
 WQl3vstGAorRcAe+8notOqgymN36V6hAxnFtm3m2L1axFhctE2ZHlOY+yjv84sZkqxv4
 lfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=fdNwaxFrm9HFLfOL0VlvICZLFltxdcxYlQCK0s7OZOg=;
 b=3TChz9CSic2INC3RpjatLSlq3LKlJqMTLJ1zg9J3+lSiCmvLgI8x0p1Ut38367lErm
 Dhfv2CqnQTrDKyiAalQ30venufEfwzDyhWRgFqsBzFg8yqmZo8HL64S3dY5g/q6BgJxM
 Fu39Qf/ohSVXUck95xi361PYMxKzZKT7N2i/s1Zyy1QpvdZ1jkERshRefhq4Fp0pHQK4
 K0ENDu0CRwJD/cJLMcgEcyy+nqNCShxmR9oNEFGuPRf2lG5Mw+t6uLJQnB+O+aikNiif
 9n6MHK970j+Usbf0pAAfdhoNMnNBYoVJ8HVUNGtv6BfRyuGsJhPAmGEwekXGDi0asd+p
 icYQ==
X-Gm-Message-State: AOAM531goBoI6R3+ar3FWenCe78h+EK8fjshOC5MQ5GroxpUJXsmGPIM
 iKJRIOpBZO6LOL3tgUPIcv66VA==
X-Google-Smtp-Source: ABdhPJwhnmLuDeWhWcwJsYblaTzlgOFq2Vy4v15GWcZKO8BS8Zdlh3Ai56iSq9tYqVbOJLwL8mVi7Q==
X-Received: by 2002:a63:5a09:0:b0:3c2:5dfa:285c with SMTP id
 o9-20020a635a09000000b003c25dfa285cmr6980863pgb.381.1653024367990; 
 Thu, 19 May 2022 22:26:07 -0700 (PDT)
Received: from ?IPV6:2408:8207:2434:25c0:d880:cd6:e882:4c95?
 ([2408:8207:2434:25c0:d880:cd6:e882:4c95])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170902db0a00b0015e8d4eb1d9sm4738276plx.35.2022.05.19.22.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 22:26:07 -0700 (PDT)
Message-ID: <32d9bea4-d44b-ec80-3169-da1439bb21aa@bytedance.com>
Date: Fri, 20 May 2022 13:26:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [External] Re: [PATCH] hw/pci/pcie.c: Fix invalid PCI_EXP_LNKCAP
 setting
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1652971559-22126-1-git-send-email-wangwenliang.1995@bytedance.com>
 <20220519124909-mutt-send-email-mst@kernel.org>
From: Wenliang Wang <wangwenliang.1995@bytedance.com>
Cc: marcel.apfelbaum@gmail.com, qemu-devel@nongnu.org
In-Reply-To: <20220519124909-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=wangwenliang.1995@bytedance.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As PCI_EXP_LNKCAP is never masked when loading, this patch does affect 
cross version migration. It seems we need machine type compat to deal 
with that. What do you suggest, Michael?

On 5/20/22 12:49 AM, Michael S. Tsirkin wrote:
> On Thu, May 19, 2022 at 10:45:59PM +0800, Wenliang Wang wrote:
>> pcie_cap_fill_slot_lnk() wrongly set PCI_EXP_LNKCAP when slot speed
>> and width is not set, causing strange downstream port link cap
>> (Speed unknown, Width x0) and pcie devices native hotplug error on Linux:
>>
>> [    3.545654] pcieport 0000:02:00.0: pciehp: link training error: status 0x2000
>> [    3.547143] pcieport 0000:02:00.0: pciehp: Failed to check link status
>>
>> We do not touch PCI_EXP_LNKCAP when speed=0 or width=0, as pcie_cap_v1_fill()
>> already do the default setting for us.
>>
>> Signed-off-by: Wenliang Wang <wangwenliang.1995@bytedance.com>
> 
> 
> do we need machine type compat dance with this?
> can you check whether this affects cross version
> migration please?
> 
>> ---
>>   hw/pci/pcie.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
>> index 68a62da..c82e7fc 100644
>> --- a/hw/pci/pcie.c
>> +++ b/hw/pci/pcie.c
>> @@ -92,6 +92,11 @@ static void pcie_cap_fill_slot_lnk(PCIDevice *dev)
>>           return;
>>       }
>>   
>> +    /* Use default LNKCAP setting */
>> +    if (s->speed == 0 || s->width == 0) {
>> +        return;
>> +    }
>> +
>>       /* Clear and fill LNKCAP from what was configured above */
>>       pci_long_test_and_clear_mask(exp_cap + PCI_EXP_LNKCAP,
>>                                    PCI_EXP_LNKCAP_MLW | PCI_EXP_LNKCAP_SLS);
>> -- 
>> 2.7.4
> 

