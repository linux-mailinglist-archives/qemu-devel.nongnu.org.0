Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731C35541D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:42:58 +0200 (CEST)
Received: from localhost ([::1]:38372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTl2n-0003fK-I3
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTkxS-0006yw-4w
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:37:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTkxJ-0002r5-Vz
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617712637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WE/0+VKoxu51PDqovmV0vWeK9VNfpOOjbCpw7K6nJc=;
 b=DKsG4OLgSImF/OiAMSuo+TASwseYWGBNkFlW1NCLYX10DUhcxkuWpAqctLVKMOaDtL+IXN
 8POpS+sshrgVkioF4Xbqr2argW/vb8iWmtAvvc/Zd4WgABn9xtZif1O0LWwWxWB+vpJAMn
 +DykiCDpK84wI7etXBDrvQEPq8Imvis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-OHmF_feFPIevwriBWq8UMQ-1; Tue, 06 Apr 2021 08:37:14 -0400
X-MC-Unique: OHmF_feFPIevwriBWq8UMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91CC2107ACCD;
 Tue,  6 Apr 2021 12:37:13 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E062160C33;
 Tue,  6 Apr 2021 12:37:11 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210402084731.93-1-yuzenghui@huawei.com>
 <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
 <CAFEAcA-87+rOJa6kBZU2J2ACO07h1DDZe6MTcBCUrx_Zwp3UHg@mail.gmail.com>
 <24c077d2-0e0e-02bc-0f92-4086be7e8982@redhat.com>
 <CAFEAcA-ehqeCw4kEFKXHefaT9_9GDO=xSG9cG_SOgedOpCoE5Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f7dda3fe-bfc2-35b1-6928-adb5e1278728@redhat.com>
Date: Tue, 6 Apr 2021 14:37:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ehqeCw4kEFKXHefaT9_9GDO=xSG9cG_SOgedOpCoE5Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Prem Mallappa <prem.mallappa@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 4/6/21 2:31 PM, Peter Maydell wrote:
> On Tue, 6 Apr 2021 at 13:23, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Peter,
>>
>> On 4/6/21 12:44 PM, Peter Maydell wrote:
>>> On Tue, 6 Apr 2021 at 11:10, Auger Eric <eric.auger@redhat.com> wrote:
>>>>
>>>> Hi Zenghui,
>>>>
>>>> On 4/2/21 10:47 AM, Zenghui Yu wrote:
>>>>> The GSIV values in SMMUv3 IORT node are not correct as they don't match
>>>>> the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
>>>>> our emulated vSMMU.
>>>>>
>>>>> Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
>>>>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
>>>> Acked-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> Eric, when you send an acked-by tag do you mean to say that you've
>>> reviewed the patch, or merely that you think it's basically the
>>> right thing but you haven't actually looked at the details?
>>
>> I mean I have reviewed the patch carefully and I think it is good to go.
>> I thought that as a maintainer for the arm smmu component I was supposed
>> to send an A-b instead of an R-b.
> 
> The usual meaning I think is that "Acked-by" means "I'm the maintainer,
> I've seen this going by, and I'm basically OK with this" (ie it's you
> saying "I'm not NAKing it") -- so it's not as "strong" as a "Reviewed-by"
> tag (which means "I've reviewed it").

Hum OK, I thought it was stronger than the R-b. So in the future, wrt
the SMMU component, I will give an R-b as I always do a proper review.

Thanks

Eric
> 
> thanks
> -- PMM
> 


