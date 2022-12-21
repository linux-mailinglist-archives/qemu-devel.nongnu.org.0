Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A0C652E91
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vP7-0005ff-Jp; Wed, 21 Dec 2022 04:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7vP4-0005en-B0; Wed, 21 Dec 2022 04:28:46 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7vP1-0004df-Fx; Wed, 21 Dec 2022 04:28:45 -0500
Received: from [192.168.106.127]
 (dynamic-095-117-119-107.95.117.pool.telefonica.de [95.117.119.107])
 by csgraf.de (Postfix) with ESMTPSA id 44B2760802DD;
 Wed, 21 Dec 2022 10:28:40 +0100 (CET)
Message-ID: <50590ff2-3135-62a4-580e-72c53574f8cb@csgraf.de>
Date: Wed, 21 Dec 2022 10:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] hw/arm/virt: Consolidate GIC finalize logic
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20221220230414.47876-1-agraf@csgraf.de>
 <20221220230414.47876-2-agraf@csgraf.de>
 <2e2a7246-5b79-637d-cbfe-65bc686d523e@huawei.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <2e2a7246-5b79-637d-cbfe-65bc686d523e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hey Zengui,

On 21.12.22 04:35, Zenghui Yu wrote:
> On 2022/12/21 7:04, Alexander Graf wrote:
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index c7dd59d7f1..365d19f7a3 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -109,12 +109,12 @@ typedef enum VirtMSIControllerType {
>>  } VirtMSIControllerType;
>>
>>  typedef enum VirtGICType {
>> -    VIRT_GIC_VERSION_MAX,
>> -    VIRT_GIC_VERSION_HOST,
>> -    VIRT_GIC_VERSION_2,
>> -    VIRT_GIC_VERSION_3,
>> -    VIRT_GIC_VERSION_4,
>> -    VIRT_GIC_VERSION_NOSEL,
>> +    VIRT_GIC_VERSION_MAX = 0,
>> +    VIRT_GIC_VERSION_HOST = 1,
>> +    VIRT_GIC_VERSION_NOSEL = 2,
>> +    VIRT_GIC_VERSION_2 = (1 << 2),
>> +    VIRT_GIC_VERSION_3 = (1 << 3),
>> +    VIRT_GIC_VERSION_4 = (1 << 4),
>
> This would break the ACPI case. When building the MADT, we currently
> write the raw vms->gic_version value into "GIC version" field of the
> GICD structure. This happens to work because VIRT_GIC_VERSION_x == x (by
> luck, I think). We may need to fix build_madt() before this change.


Ouch, thanks a lot for the catch! I don't think it's by luck - the 
versions are put very deliberately at a place where they equal the gic 
number. But I agree that it's missing a comment - I'll add one for 
clarification and make sure the defines looks explicit in v2.


Alex


