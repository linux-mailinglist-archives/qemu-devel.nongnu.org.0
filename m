Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C66B06F2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 13:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZso2-0001O9-7S; Wed, 08 Mar 2023 07:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZsny-0001Nm-Qm
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 07:22:03 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZsnu-0001Rr-09
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 07:22:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso1022480wmp.4
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 04:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678278114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ITJh3yDJnJ8ui/OX10hhXNqvD+nYe+C6pQqEZaoYDw=;
 b=qEE+HLwkQzqAObdIbYfDhdblwPRnknATW9EKFW/bc5WNPqSPFfjz5gRYgwLH5+qXka
 oHUaZSsPlEBcIuk8JfF7QuBpJvkcqK2D23pU7+K+LokIUhRbCpfzl4O0u3Bxa7qHSlLg
 yxuT4IE7TMlWs2VIZkKTPcXILVJVYXA42VK/xrPGI+VMX9LHDTI+9KU7FhGqPfDQP8B6
 cMRcB0WBRpywkKwM8ixcSG22Qa4McE723XaZXCdH9c36M1djoSpFdM1An60Jou4oaC3m
 Wfvmhb0CHi58QGSc8O8o67znCinupyJ7JHICJfKkeuBogzwE8o+a+5nXRNlrrg0Lf9bf
 +QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678278114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ITJh3yDJnJ8ui/OX10hhXNqvD+nYe+C6pQqEZaoYDw=;
 b=tmfyUBtpFt0gBy/YjTjfPyXyH7sHFgH2mdVkbj37Y2FY54sI2QYzQj3BvX3PrInALn
 749vg5lqY0rvFsPqvGsCqpemRm5b62UnAEM7HRpCbBm1DeryzUGhtIm/aOJtkJfy43tP
 24ww6nvtcf4HuS7IUGsMlW4PzL12lGJlYtXLyP6RRG8JiTIBgoGCp62BTPcFurMjizlJ
 QWe+emyVEgAf8SM5aNhQgsDmAY20/CVCgCPt74nkDFtVT2lRH1kzJMJOjR00RI/XYVQl
 xn3o33qHlYgu0Q4PJSD6T8EdHHhp1WIGgMcPYan3o81BJ+qsqxKm3huJu0LxplLhzePl
 JIdA==
X-Gm-Message-State: AO0yUKU+zfCe8pGzI4xDaqdf9Miu10PklRPTB/DgGjtR5L3645X3smx5
 9NEvjFleaW/84K9oj30oyRljow==
X-Google-Smtp-Source: AK7set9/gKfdbF+XPPRlF+UIT3ewUoc5DLdnk94+HYqpam0XhbCU2Qhv9sgmwZbxiRYR83czKh0aRQ==
X-Received: by 2002:a05:600c:4f11:b0:3df:ef18:b0a1 with SMTP id
 l17-20020a05600c4f1100b003dfef18b0a1mr16044162wmq.12.1678278114695; 
 Wed, 08 Mar 2023 04:21:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b003e2058a7109sm19513859wmb.14.2023.03.08.04.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 04:21:54 -0800 (PST)
Message-ID: <197b027e-1bbf-bd44-f78b-e01d535f3ac1@linaro.org>
Date: Wed, 8 Mar 2023 13:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/51] Net patches
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Igor Mammedov <imammedo@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
 <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
 <4b67f103-0df3-891c-2a0f-466a82e89732@linaro.org>
 <CACGkMEsuy_eCGcLy2C8-BybbwGC4ak9+Gfv9EeiG6DAZrLjZdQ@mail.gmail.com>
 <719692c2-6401-fd6a-8718-1dd5e6ff1f85@linaro.org>
 <20230308071628-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230308071628-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/3/23 13:17, Michael S. Tsirkin wrote:
> On Wed, Mar 08, 2023 at 08:40:42AM +0100, Philippe Mathieu-Daudé wrote:
>> On 8/3/23 07:56, Jason Wang wrote:
>>> On Wed, Mar 8, 2023 at 4:43 AM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> On 7/3/23 18:01, Peter Maydell wrote:
>>>>> On Tue, 7 Mar 2023 at 07:08, Jason Wang <jasowang@redhat.com> wrote:
>>>>>>
>>>>>> The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:
>>>>>>
>>>>>>      Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)
>>>>>>
>>>>>> are available in the git repository at:
>>>>>>
>>>>>>      https://github.com/jasowang/qemu.git tags/net-pull-request
>>>>>>
>>>>>> for you to fetch changes up to c19b566a3898510ec2b3e881b3fb78614b240414:
>>>>>>
>>>>>>      hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100() (2023-03-07 14:55:39 +0800)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>
>>>>> build-oss-fuzz failed on something involving fuzzing eepro100:
>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3889073821
>>>> Jason, please drop my patches. I'll look at that failure.
>>
>> Before "hw/net/eepro100: Convert reset handler to DeviceReset",
>> e100_pci_reset() is only called once from DeviceRealize _before_
>> the device is realized.
>>
>> After, 1/ it can be called multiple times and 2/ it seems to do
>> stuffs that really belong to DeviceRealize (should be called once),
>> in particular pci_add_capability().
>>
>> I *think* it should be illegal to call pci_add_capability() _after_
>> a device is realized. Auditing pci_add_capability(), there is only
>> one other use before realize: amdvi_sysbus_realize() in
>> hw/i386/amd_iommu.c.
> 
> Calling pci_add_capability when VM is running is likely to confuse
> guests, yes.

Thanks for confirming. Similar pattern: msi_init().

While trying to fix that in hw/i386/amd_iommu.c I realized this device
isn't in a good shape, almost unmaintained: 2 bugfixes in since 7 years,
the other commits are generic API cleanups. I'll post the series and
we can discuss that there.

