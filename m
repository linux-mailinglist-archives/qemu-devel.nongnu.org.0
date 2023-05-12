Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A256570055C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 12:25:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxPvv-0002iX-RE; Fri, 12 May 2023 06:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxPve-0002fT-BK
 for qemu-devel@nongnu.org; Fri, 12 May 2023 06:23:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxPvX-0004Ow-8k
 for qemu-devel@nongnu.org; Fri, 12 May 2023 06:23:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b425so19168445e9.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 03:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683886985; x=1686478985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N68ilWCNl8zG0k8YElDl+VMOZi+Sris90Be+W7WtwZg=;
 b=M5gBA1YY+O189Ulm13TDgi0BLepzTP526QWken1UJCTZO58UhGFYBmY3uXdiP4A0Wi
 fQCQnngUjZeBboJWiqMMUfXu0WBy7EsggqJ7IOQrQQAtMbdWL4mlvqm6d4WYgYhFBhQc
 8Lr8eMGKu2QCdixwsDbE2hTa2Yx24TJab52RXvwPEJe6eVJ72jwXLa+CwBNhaHb3TZ8A
 XKVGu8v/BvotWsPR8q1vUJaxwZ1nGkC6eqZKMXTXipA+R+7LwRPtjDiCoIsT/ZjY6F0X
 LkXbRRwQg3UEUywJqA5RKymf7fmGYiQiqlNdyZrEVzP7ZcuOhSpkzWq8wFOoXgFcm4O3
 k5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683886985; x=1686478985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N68ilWCNl8zG0k8YElDl+VMOZi+Sris90Be+W7WtwZg=;
 b=XZ5T4ucP410fsCZgHFsfss+wFJ+h3K3/UmJwWj9Q57kKLmIZw40s8vc8bBfEI7VCAs
 8M17GJvyW6G0RdfbqzVA+Ws3+TduNr959wGuesZshlM0nCXex4ETdSv7pDgKxNg4/Zal
 fEjo3OfMmiHFinpuY9xCHe8Ve7co0smR538EL2XF716z1xyxMDT1nTwPGHc1GBPb/cue
 GfXfdxm49/gpZib1nQ1euri46i+DGeRLwzD2A96HHJiHS6dDdz4ktdd2ga/USf7iLARL
 0NgRE2MIIJenaO+tnNRjOiujN2pivw5iqo30n44wi3+3GT22wYCaUKGnXg9M99YM2mm8
 9NAQ==
X-Gm-Message-State: AC+VfDwfSCGbS2QwPowN0v58HsrjNJxuk1YhHdb+Etws6nMAUc4QX/kJ
 rUj5fgBad/cvI0iUoHbGzbe85w==
X-Google-Smtp-Source: ACHHUZ7PxHW+btMKhT1Cavxq2MccwnhRSPeticcddvBv/28Q4qoSO4iJDqzRsNLb4Vm3uNx/ldgEvA==
X-Received: by 2002:a1c:4c04:0:b0:3f4:2158:68ae with SMTP id
 z4-20020a1c4c04000000b003f4215868aemr14192519wmf.15.1683886984877; 
 Fri, 12 May 2023 03:23:04 -0700 (PDT)
Received: from [192.168.15.175] (153.red-88-29-177.dynamicip.rima-tde.net.
 [88.29.177.153]) by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm28184648wmq.26.2023.05.12.03.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 03:23:04 -0700 (PDT)
Message-ID: <997e44b4-a7dc-d63a-1aea-2597dc87fb0d@linaro.org>
Date: Fri, 12 May 2023 12:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] hw/arm: enable qxl for aarch64
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Hao Zeng <zenghao@kylinos.cn>, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512090803.1170154-1-zenghao@kylinos.cn>
 <20230512101122.00006c73@Huawei.com>
 <CAFEAcA8tWWWvOAS=GCTnGD=Sv6h5pUWf3Cy4ux-FeF8s_BjzVw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8tWWWvOAS=GCTnGD=Sv6h5pUWf3Cy4ux-FeF8s_BjzVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 12/5/23 11:56, Peter Maydell wrote:
> On Fri, 12 May 2023 at 10:11, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
>>
>> On Fri, 12 May 2023 17:08:03 +0800
>> Hao Zeng <zenghao@kylinos.cn> wrote:
>>
>>> Qemu does not support qxl graphics cards in arm, it is recommended to enable
>>>
>>> Signed-off-by: Hao Zeng <zenghao@kylinos.cn>
>>
>> Drive by comment.
>>
>>> ---
>>>   hw/arm/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index 0f42c556d7..0305a4f4f3 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -32,7 +32,7 @@ config ARM_VIRT
>>>       select VIRTIO_MEM_SUPPORTED
>>>       select ACPI_CXL
>>>       select ACPI_HMAT
>>> -
>>> +    select QXL
>> Keep the blank line here.
> 
> I don't understand why QXL is special here -- isn't it
> just another PCI card? We already "imply PCI_DEVICES"
> so I would have expected that to work.
> 
> I notice that the x86 "config PC" has an "imply QXL",
> though, so presumably it doesn't. Paolo, should this
> be fixed by making PCI_DEVICES pull in QXL, or by
> adding an "imply QXL" to the virt board ?
> 
> As a third option, the mips "config LOONGSON3V"
> has "imply QXL if SPICE".
> 
> I don't know what the right answer is here, but I
> suspect it should be the same thing in all three
> cases, not three different things :-)

I'm also confused because we already have in hw/display/Kconfig:

   config QXL
       bool
       depends on SPICE && PCI

