Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3465D299
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:28:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2rm-0007IQ-1N; Wed, 04 Jan 2023 07:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD2rk-0007I3-7s
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:27:32 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD2ri-0002sn-6v
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:27:31 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso24076143wmb.3
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 04:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hLzdyhgVTM88j5OJjrDPGLWa67LwfAhsawd7HzxbNvk=;
 b=TOysUlZy+FrrQfNAnCAh7AVgK4nyg9mgvTtBWgEk4eOiho7e04HUNQnQCjcQjDZA5h
 2VxIfpx3/4xC7GCWhkooBsS4ITWNIgMCystJjrs6rn+jLixca+Yj/k53G2esFutmMzI1
 wwn9BigwJnruIElNH07oZHu3VLjvrSKa1sIiz8C3h9+nGg4C6ycXwuKaWtoDDiYxgo32
 XU0sKqN+vPIIeGXtQUihJIvj7oIZYa3L3oTF6/ubcSI5M/vi8h+XTVsYJHyhee7QYiSn
 S4SEWoSFAkVi2Od+5S1utw1GmxOJK/jDv7//ZKUnC7uUOnE2hUtyj7UBa6XoSMh9L/nx
 EAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hLzdyhgVTM88j5OJjrDPGLWa67LwfAhsawd7HzxbNvk=;
 b=sPLqewMNDR1GOXt5zyrf3+JeMPhQ38ltyxU0QtM3VzIHpldHEBKkBvBgSbSyEJikXF
 XIsMddr4Nrf2orOi6Khe7gYY0PBV51PKYTHrLCpdzsjy4NjprP+BYsDfDmlp5TfXLVQv
 ePa4DvpPHhaJNAkDEIbDeNrZ5Bv637LL/BV7zdV4bzhGUUAWzonzTPiTmLA06p8MRU2H
 /Vpq7wmI/MbQ8c3UvEhqkqDQzjnfN3XXKP3I0uvykYXJp7TtKSrAuD1B/75G6eCTLHdL
 mWNyhQviJzN41qyWEqPdvKZUgY2ffCN8TAzKDJEr/TeK3YG/BGVYg5hFQsFpcY1nurYb
 vG8A==
X-Gm-Message-State: AFqh2krK1ZT2s2DKqZqrSnkG4tMlWLC0zAyMnv+iSw3Ejz8qDxWfxQh3
 5KUfEs1UxHt0icY1+9P778bk9gz60mfpygLR
X-Google-Smtp-Source: AMrXdXufeIryv/+wmOhoHiLlF7VyA1zwsEqZrw3UqxtqWxQVxu7Ataw4ysNVLY0iZbrku9dbnV3Egg==
X-Received: by 2002:a05:600c:1c9d:b0:3d1:f3eb:c718 with SMTP id
 k29-20020a05600c1c9d00b003d1f3ebc718mr41805642wms.19.1672835248583; 
 Wed, 04 Jan 2023 04:27:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay39-20020a05600c1e2700b003cfa80443a0sm45476460wmb.35.2023.01.04.04.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 04:27:28 -0800 (PST)
Message-ID: <f6d28df9-8103-7b2d-c766-5f830a04375b@linaro.org>
Date: Wed, 4 Jan 2023 13:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to the
 legacy reg block
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, qemu devel list
 <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Ard Biesheuvel <ardb@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 Zhu Guihua <zhugh.fnst@cn.fujitsu.com>, Gu Zheng <guz.fnst@cn.fujitsu.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
References: <20230104090138.214862-1-lersek@redhat.com>
 <e81f78e2-301e-d920-cd03-6e17c591d677@linaro.org>
 <20230104113822.35d23254@imammedo.users.ipa.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104113822.35d23254@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 11:38, Igor Mammedov wrote:
> On Wed, 4 Jan 2023 10:34:09 +0100
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>> On 4/1/23 10:01, Laszlo Ersek wrote:
> [...]
>>> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
>>> index 53654f863830..ff14c3f4106f 100644
>>> --- a/hw/acpi/cpu_hotplug.c
>>> +++ b/hw/acpi/cpu_hotplug.c
>>> @@ -52,6 +52,9 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
>>>        .endianness = DEVICE_LITTLE_ENDIAN,
>>>        .valid = {
>>>            .min_access_size = 1,
>>> +        .max_access_size = 4,
>>> +    },
>>> +    .impl = {
>>>            .max_access_size = 1,
>>
>> Arguably:
>> Fixes: b8622725cf ("acpi_piix4: Add infrastructure to send CPU hot-plug
>> GPE to guest")
> 
> nope, this one is correct, as legacy interface used 1 byte access only

Yes, Laszlo explained elsewhere in the thread.


