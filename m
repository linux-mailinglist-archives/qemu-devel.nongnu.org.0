Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93A6FBFC3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 08:58:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHI6-0003Gu-Nk; Tue, 09 May 2023 02:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwHI4-0003Gl-KW
 for qemu-devel@nongnu.org; Tue, 09 May 2023 02:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwHI2-0004h1-Te
 for qemu-devel@nongnu.org; Tue, 09 May 2023 02:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683615458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IcRb/G/a+imj0yaMnb3fBCkB2HNHLBQYxd1T2MOyIHo=;
 b=JpZUPBu9/pzvuWXb/e1teigLe2IsUI7zMdjb6fvm3tqQCW6epzUo0cLlU2ksIUq8Ja2D9q
 WOIldag1/UYXLc6rrQB+y5bSqY4ymFbVJA2tghz+e8/7OgXy2HMksc7zJVz+wKfQSigzLi
 kaiIEjXqSJTWpKMn271GlyQlyBO1tbg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-Q-If3FP3NM2YJBy05DY67g-1; Tue, 09 May 2023 02:57:36 -0400
X-MC-Unique: Q-If3FP3NM2YJBy05DY67g-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30620ebd3c2so3329807f8f.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 23:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683615455; x=1686207455;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IcRb/G/a+imj0yaMnb3fBCkB2HNHLBQYxd1T2MOyIHo=;
 b=YfX/g7v498f8Bwc7fNHiOz3WtQcyy10K4Verq3XCtTwNbRdsq/s/DCHGGZi9luXxAQ
 +O88HA5EdYD0mE0pJQwLpGelysL5YEDao/YNfc+Nu9CH5calG2OQg6h4pai/mrwlukiv
 GeaClay3srZSogMPfqjXKHDIEBxz5AXs9550a4g5sxDCoMfXele9mFEQ3lpf1G63Q2Em
 TXH7Cc6cUxFjEDcRKGWkk5fFz6x9sN1Qn8NBk8B+/ENzjKK8igRrhiCaoAeYab6hC5d7
 tkoViLAldFhgaKyJNZNkkjO14kWBVbBgm7RQaC7VH3968PM1LTzsI04sYNdneK+xqewK
 yv9g==
X-Gm-Message-State: AC+VfDwC2k2mYwePxzWzYU8y9e3SJ0gQJvNOJr50rDB8JHU8BXEA+b8J
 2ng1pfF/mz/nigZ7DXeXlMJPiZDzoLDs8BE/Hb72izVvI8VGAlH1LivwP89pqYep6d5d/PVP45w
 Z3xXmIAVHwPHCbrs=
X-Received: by 2002:adf:e58b:0:b0:306:2df6:fa1f with SMTP id
 l11-20020adfe58b000000b003062df6fa1fmr8201781wrm.13.1683615455480; 
 Mon, 08 May 2023 23:57:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5jfESuk8MFq+LgpaXKBTXNe7s0MBUywDNRJb1ixJGp4/rIa5AVfXpsDIqVugoccMO1JudJng==
X-Received: by 2002:adf:e58b:0:b0:306:2df6:fa1f with SMTP id
 l11-20020adfe58b000000b003062df6fa1fmr8201773wrm.13.1683615455143; 
 Mon, 08 May 2023 23:57:35 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 s6-20020adff806000000b003068f5cca8csm13177458wrp.94.2023.05.08.23.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 23:57:34 -0700 (PDT)
Message-ID: <0c00c05d-8b93-3ab6-b540-2b12dedbf12c@redhat.com>
Date: Tue, 9 May 2023 08:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 11/35] arm/Kconfig: Do not build TCG-only boards on a
 KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
 <20230502121459.2422303-12-peter.maydell@linaro.org>
 <b5d0ea65-0485-382b-f59a-84a5596b63a2@redhat.com> <87bkj0cmd5.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87bkj0cmd5.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04/05/2023 14.27, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 02/05/2023 14.14, Peter Maydell wrote:
>>> From: Fabiano Rosas <farosas@suse.de>
>>>
>>> Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
>>> statements in Kconfig. That way they won't be selected when
>>> CONFIG_TCG=n.
>>>
>>> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
>>> keep the two default.mak files not empty and keep aarch64-default.mak
>>> including arm-default.mak. That way we don't surprise anyone that's
>>> used to altering these files.
>>>
>>> With this change we can start building with --disable-tcg.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Message-id: 20230426180013.14814-12-farosas@suse.de
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    configs/devices/aarch64-softmmu/default.mak |  4 --
>>>    configs/devices/arm-softmmu/default.mak     | 37 ------------------
>>>    hw/arm/Kconfig                              | 42 ++++++++++++++++++++-
>>>    3 files changed, 41 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs/devices/aarch64-softmmu/default.mak
>>> index cf43ac8da11..70e05a197dc 100644
>>> --- a/configs/devices/aarch64-softmmu/default.mak
>>> +++ b/configs/devices/aarch64-softmmu/default.mak
>>> @@ -2,7 +2,3 @@
>>>    
>>>    # We support all the 32 bit boards so need all their config
>>>    include ../arm-softmmu/default.mak
>>> -
>>> -CONFIG_XLNX_ZYNQMP_ARM=y
>>> -CONFIG_XLNX_VERSAL=y
>>> -CONFIG_SBSA_REF=y
>>> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
>>> index cb3e5aea657..647fbce88d3 100644
>>> --- a/configs/devices/arm-softmmu/default.mak
>>> +++ b/configs/devices/arm-softmmu/default.mak
>>> @@ -4,40 +4,3 @@
>>>    # CONFIG_TEST_DEVICES=n
>>>    
>>>    CONFIG_ARM_VIRT=y
>>> -CONFIG_CUBIEBOARD=y
>>> -CONFIG_EXYNOS4=y
>>> -CONFIG_HIGHBANK=y
>>> -CONFIG_INTEGRATOR=y
>>> -CONFIG_FSL_IMX31=y
>>> -CONFIG_MUSICPAL=y
>>> -CONFIG_MUSCA=y
>>> -CONFIG_CHEETAH=y
>>> -CONFIG_SX1=y
>>> -CONFIG_NSERIES=y
>>> -CONFIG_STELLARIS=y
>>> -CONFIG_STM32VLDISCOVERY=y
>>> -CONFIG_REALVIEW=y
>>> -CONFIG_VERSATILE=y
>>> -CONFIG_VEXPRESS=y
>>> -CONFIG_ZYNQ=y
>>> -CONFIG_MAINSTONE=y
>>> -CONFIG_GUMSTIX=y
>>> -CONFIG_SPITZ=y
>>> -CONFIG_TOSA=y
>>> -CONFIG_Z2=y
>>> -CONFIG_NPCM7XX=y
>>> -CONFIG_COLLIE=y
>>> -CONFIG_ASPEED_SOC=y
>>> -CONFIG_NETDUINO2=y
>>> -CONFIG_NETDUINOPLUS2=y
>>> -CONFIG_OLIMEX_STM32_H405=y
>>> -CONFIG_MPS2=y
>>> -CONFIG_RASPI=y
>>> -CONFIG_DIGIC=y
>>> -CONFIG_SABRELITE=y
>>> -CONFIG_EMCRAFT_SF2=y
>>> -CONFIG_MICROBIT=y
>>> -CONFIG_FSL_IMX25=y
>>> -CONFIG_FSL_IMX7=y
>>> -CONFIG_FSL_IMX6UL=y
>>> -CONFIG_ALLWINNER_H3=y
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index 87c1a29c912..2d7c4579559 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -35,20 +35,24 @@ config ARM_VIRT
>>>    
>>>    config CHEETAH
>>>        bool
>>> +    default y if TCG && ARM
>>>        select OMAP
>>>        select TSC210X
>>>    
>>>    config CUBIEBOARD
>>>        bool
>>> +    default y if TCG && ARM
>>>        select ALLWINNER_A10
>> ...
>>
>>    Hi!
>>
>> Sorry for not noticing this earlier, but I have to say that I really dislike
>> this change, since it very much changes the way we did our machine
>> configuration so far.
>> Until now, you could simply go to configs/devices/*-softmmu/*.mak and only
>> select the machines you wanted to have with "...=y" and delete everything
>> else. Now you have to know *all* the machines that you do *not* want to have
>> in your build and disable them with "...=n" in that file. That's quite ugly,
>> especially for the arm target that has so many machines. (ok, you could also
>> do a "--without-default-devices" configuration to get rid of the machines,
>> but that also disables all other kind of devices that you then have to
>> specify manually).
>>
> 
> Would leaving the CONFIGs as 'n', but commented out in the .mak files be
> of any help? If I understand your use case, you were probably just
> deleting the CONFIG=y for the boards you don't want. So now you'd be
> uncommenting the CONFIG=n instead.
> 
> Alternatively, we could revert the .mak part of this change, convert
> default.mak into tcg.mak and kvm.mak, and use those transparently
> depending on whether --disable-tcg is present in the configure line.
> 
> But there's probably a better way still that I'm not seeing here, let's
> see what others think.

I pondered about it for a while, but I also don't have a better solution, so 
yes, I guess that "# CONFIG_xxx=n" idea is likely still the best solution 
right now.

  Thomas



