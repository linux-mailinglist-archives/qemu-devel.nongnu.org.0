Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1CD6EAAC1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:46:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppq9K-0008Uc-Qi; Fri, 21 Apr 2023 08:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppq9D-0008UA-NN
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:46:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppq9A-0004Wl-QQ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682081151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCTLJD+758rXxOWoD8EWGtSoYdLfamTWL7dcFdI4qwM=;
 b=HDH8Rhm9i/40K85g/AnmCpkIZvqbSQcjYFtqnHTMDR7uxhlvlImi6HJnagIhw+PWN7ZUZq
 N/DqMX5dyDOA4eocevvmo1Hk0WJ0i41X7S8aAeq5G/vYGxOfnCGac9ImUmVyL09lDmrMU0
 tRrQOeyaPPNBTVjfgNShVmb4RWKBBHg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-UZu87k5kORmBhNzSkHWmsQ-1; Fri, 21 Apr 2023 08:45:50 -0400
X-MC-Unique: UZu87k5kORmBhNzSkHWmsQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f171d38db3so10501895e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 05:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682081149; x=1684673149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PCTLJD+758rXxOWoD8EWGtSoYdLfamTWL7dcFdI4qwM=;
 b=bXC9Hk8Xi5gxzqG3WRKf5h+PGqyStN8KYWegZVOhE91oebVdRBq7xOYLm4uDjRl/RY
 9w5dIcsvv2tqpL0rPIcFk+yI42ID6rJiqDskYaip5D0gF0UOqasC6Mstthgbzc5zgIkU
 Bpdn/EXrlkyUyKauy2L19vYZ/GFpux7Z4WG9QcJBrMZYS9ninTp00n82kWMt7afucv+G
 FNcfHQeqPQFdAO/GR5s7urR5ry7QNmUI5fP2mDIKzbLf0P56e5aoVa9bYUDyjeqZyjjY
 EN8ZTgagBWXKAuJ/V0N8XB6wYi2yuClLIii9L0vmSQqp7b9D/be9wanIHqGGRc5gchGo
 J5Ng==
X-Gm-Message-State: AAQBX9fTnZ1bb+IouUMbK/EDvgPZnGHOGHM0dxRooBLQunW7NAc/7sKZ
 lQgrehCjEMrheqRLFjH7QPJLdwc8+5diUShN4/8e3ESuK3pfr8E8SQvFfdZAw2i2QERk1j4H5cp
 ii1awa2IPEJRtGv0=
X-Received: by 2002:a05:6000:11cf:b0:2f6:c7af:945c with SMTP id
 i15-20020a05600011cf00b002f6c7af945cmr3182885wrx.31.1682081149191; 
 Fri, 21 Apr 2023 05:45:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350aw0wpEPT+JXzHRBNGsOOvLb2UzgRKnoyFTxkbaCTswbKmS8csuVGJKgREp4R9HTQ51gnKJ4g==
X-Received: by 2002:a05:6000:11cf:b0:2f6:c7af:945c with SMTP id
 i15-20020a05600011cf00b002f6c7af945cmr3182879wrx.31.1682081148874; 
 Fri, 21 Apr 2023 05:45:48 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm4371523wrz.25.2023.04.21.05.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 05:45:48 -0700 (PDT)
Message-ID: <5a3f07f5-b560-c18c-ed20-ec7330b59a32@redhat.com>
Date: Fri, 21 Apr 2023 14:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] hw/pci-bridge: pci_expander_bridge: Fix wrong type
 and rework inheritance.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com
References: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
 <20230421041812-mutt-send-email-mst@kernel.org>
 <CAFEAcA8g2GeCmQkx3MvotqNVV7AOD7-6BxFckiYcooJj9-UFyg@mail.gmail.com>
 <20230421131908.000052f4@huawei.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421131908.000052f4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/04/2023 14.19, Jonathan Cameron via wrote:
> On Fri, 21 Apr 2023 09:59:57 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
>> On Fri, 21 Apr 2023 at 09:19, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Thu, Apr 20, 2023 at 03:27:48PM +0100, Jonathan Cameron wrote:
>>>> Peter Maydell highlighted an incorrect conversion to TYPE_PXB_DEVICE from
>>>> a device that didn't have that a an ancestor type. PXB_DEV() used instead of
>>>> PXB_CXL_DEV()/
>>>>
>>>> https://lore.kernel.org/qemu-devel/CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com/
>>>>
>>>> During the discussion it became clear that the inheritance of the various
>>>> TYPE_PXB*_DEVICE was unusual. This patchset first provides the minimal
>>>> fix then cleans up the inheritance of types based on functionality.
>>>>
>>>> There is also a rename to TYPE_PXB*_DEV to allow removal of some boilerplate.
>>>>
>>>> Before this series
>>>> TYPE_PXB_DEVICE, TYPE_PXB_PCIE_DEVICE and TYPE_PXB_CXL_DEVICE all
>>>> had TYPE_PCI_DEVICE as their direct parent though they shared a common
>>>> struct PXBDev for their state.  As a result this state contained
>>>> some data that was irrelevant for some the types.
>>>>
>>>> This series changes to
>>>> TYPE_PXB_CXL_DEV has a parent of TYPE_PXB_PCIE_DEV
>>>> TYPE_PXB_PCIE_DEV has a parent of TYPE_PXB_DEV
>>>> TYPE_PXB_DEV continues to have a parent of TYPE_PCI_DEVICE.
>>>>
>>>> Each of the TYPE_PXB*_DEV has a state structure adding those elements
>>>> to their parent that they need. This also allowed dropping a wrapping
>>>> structure for the CXL state as the PXBCXLDev structure already provides
>>>> the equivalent grouping.
>>>>
>>>> Patches are similar to those posted in the thread but rebased on v8.0.0.
>>>
>>> this conflicts with
>>>      Revert "hw/pxb-cxl: Support passthrough HDM Decoders unless overridden"
>>>
>>> I think you acked that one?
>>
>> We should take one or the other, but not both. If this patchset
>> is good then it's probably better to fix the bug rather than
>> revert the feature, I think.
> 
> If it's easy to drop the revert that would be my preference.

Yes, the patch has not been picked up yet, so we can simply forget about the 
revert.

  Thomas



