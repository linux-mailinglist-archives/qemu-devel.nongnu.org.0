Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEB699511
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:02:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdsf-00008z-6I; Thu, 16 Feb 2023 08:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdsc-0008Sd-5A
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:00:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdsa-0000Gz-3h
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:00:53 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso4124364wms.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e8udTHtKGUQdvs6n/CdVyauzVV7F1zXMceqB2/VovgU=;
 b=lxa0I6FfRv9A9uV9rY6SykpGdp+TPan8/4fX1Tw1dE0wK2eIvf9kOePAs6NkEjTrXR
 qECGoaEMObgJqzUPXxyi07G5N3wVPLYvwmWrtYk8YHHUicwPrXlIA1xSq5xpxbBZLsQU
 1+zdZTfQD7bjfI9xtQjgy5FfVi6D1dzwkQwc/D8KPMxlbTRlAisbUbZFUlTxe0XkkVl9
 A4Vf4qYsvXqpVAL/RZUwpstPPvfmebPH8jzSZS5ilqsCyx08Z+KeFsY7uySsBZXpqoX9
 wpT7qw70cvzSIfAEp7VywqTBajTuVlDGbKG+Tvws+Jjnu0i0XONCEjOmyWa8tiM+vdAx
 2MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e8udTHtKGUQdvs6n/CdVyauzVV7F1zXMceqB2/VovgU=;
 b=nMsZ37gt2xVtdZSlfiBJ0QX9yCsEL6OgL6xMWCI2hWE/iaEYcc5veFMmo4uDiAjUAn
 5SyH6wC99uQVwCFvl+332Dbghi/J5dU8B299A1EiB9AiTgwbNuRbWwbCk1nLm339fZcB
 Gl54UJQR+Y/CR0lAibwZAyWGIGdvAhcjTU/FjkL7NAGQRjQFOreuKzCEKrLLI3rHActi
 2F4p7PR7pI0EzaHeSlfm6uGFA0EPdaVk2Ola+G/tXnPIAi8EgnVnll1uqOgf6LGUrTlw
 p3I3eLwaBH/GVE60EmAMMx6uyD4A0Pka95nQReUE3FUwbjx69MrY5oxh/gpSKKT5xtkm
 dXuA==
X-Gm-Message-State: AO0yUKUO6hI1YdIoLpyZOAe+Z5PmYEpevBrnGRhMOKhn/lzgkVe6UCXH
 8f1/Be9V+2GANA1g3LR/g+iUGN8x22MOh/dB
X-Google-Smtp-Source: AK7set/OiS7Xf8WqeZiOlaz65zjhyGY/rElkbf1PlHG/iZYaKZQHwTGgKwIGvD4t8eaoUgBZkPSo7Q==
X-Received: by 2002:a05:600c:1652:b0:3e0:ffd4:bfb2 with SMTP id
 o18-20020a05600c165200b003e0ffd4bfb2mr4822252wmn.4.1676552450612; 
 Thu, 16 Feb 2023 05:00:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y5-20020a05600c364500b003dffe312925sm4942418wmq.15.2023.02.16.05.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 05:00:50 -0800 (PST)
Message-ID: <892b6b09-6adc-c935-ab3d-d55965792d5f@linaro.org>
Date: Thu, 16 Feb 2023 14:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 01/14] hw/char/serial-pci: Replace
 DO_UPCAST(PCISerialState) by PCI_SERIAL()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230213184338.46712-1-philmd@linaro.org>
 <20230213184338.46712-2-philmd@linaro.org>
 <f987749e-d7d8-7812-b118-2eb449ff09f6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f987749e-d7d8-7812-b118-2eb449ff09f6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 16/2/23 12:20, Thomas Huth wrote:
> On 13/02/2023 19.43, Philippe Mathieu-Daudé wrote:
>> Use the PCI_SERIAL() QOM type-checking macro to avoid DO_UPCAST().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/char/serial-pci.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
>> index 801b769aba..9689645cac 100644
>> --- a/hw/char/serial-pci.c
>> +++ b/hw/char/serial-pci.c
>> @@ -36,7 +36,10 @@
>>   #include "qom/object.h"
>>   struct PCISerialState {
>> +    /*< private >*/
>>       PCIDevice dev;
>> +    /*< public >*/
>> +
> 
> I'm not sure about this part of the patch. It does not seem to be 
> related to the other changes at all, and are you sure about which parts 
> are really "public" and which parts are "private"? If so, I'd like to 
> see a description about this in the commit message, preferably in a 
> separate patch. Also, why an empty line after the "public" comment?

This is how QOM style separates the object 'private' part -- the
inherited parent, used by the QOM-cast macros -- and the fields
specific to this object.
The private field *must* be the first one in the structure for the
cast macros to work.

Maybe this isn't a convention and we could make one, to unify the
API style. I'm open to better suggestion :)

I suppose I got custom to see it to distinct the QOM hierarchy and
now it helps me to detect what is QOM and what isn't.
Anyway I'll remove from this patch.


> Ack for the DO_UPCAST removal.

Thanks!


