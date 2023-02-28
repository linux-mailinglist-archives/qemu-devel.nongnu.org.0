Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A8F6A5A14
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0DJ-0005Lh-6B; Tue, 28 Feb 2023 08:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0DH-0005L8-8K
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:40:15 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0DF-0001MI-I5
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:40:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso6111614wmb.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gh7jaywPR2p36nrG2F2vzsgUd5bkt5snk+aCe9GwSEs=;
 b=H+U+BOicOkKvC+LuM4QFPdem7PfRnHpsDDXum3yTSIPzEA1/4tawYwY+1I+zlqE5Jj
 /69zxWKqjVbZ3SnBhsjqbU+VLsZnY8i9dS4I8CDqyEMjBIM3Kz6m61BfvTO9xIvalY0t
 Z7zrK2liaqFoypY/8SG/Q4S//uV7fmaS/IzB0CRp7tf/Fp2vSABEJJFXvQHNhtkaFMCG
 FM/LaCY59xTlk6wMitNx6jj+ED42y/kwpw/gfQKBJ/4C6fTqzYoCZ0vwVvi4rTId23SG
 lzI32ssXwUjx08xKGOMENXuqApzkiVUWvWRs/knRRNb5rDrY6a4IA79/bczia9oKAASY
 dzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gh7jaywPR2p36nrG2F2vzsgUd5bkt5snk+aCe9GwSEs=;
 b=qJ6TpcZoYisQPxfBE0cacqcSisRbuYDnXpSeKT5PfVd5dOoP2HkfUaHM+QbhDIVKNC
 5/6rzprxJw6bVw5sqSw+/aU8lmGevDdv8yqNhGAjd9M6QQZokVxy3uCwo9lxhhw+ORzB
 b16rzEhEenbB7bXrZjOxosqzvm2KXdUjcVG7NXqPuSBYlThI+JvkOyUW70tLlVJCL/zC
 23/n1F5sC2zpuANenhcMbQgFQ4TKXlbzeLqZGQTOOTAfj/qz0iKDQpsPsdmadnQyaiei
 r5FPsur/K5FqFomYlol+uCwd9cp8plOgkUN+qDxM1Ddp1xVe+neUW5yF7WsIzDIlw8NL
 BcsQ==
X-Gm-Message-State: AO0yUKUQSKSj3N3cdiszF3VaUUtKXH5xvR0w8mYF9Z5NoAg0hoRAtB4w
 ogH90KdmSdeonsbSAn8OgBc3PWiR7iCrUphn
X-Google-Smtp-Source: AK7set9SfwL82yCV7HAziPQa2+9eqaNJvH/tG97aHZ/ii6uQX5tVwNMJb1WG1/q6keGhVCoCkYJxhA==
X-Received: by 2002:a05:600c:1f06:b0:3e2:1d3d:ec41 with SMTP id
 bd6-20020a05600c1f0600b003e21d3dec41mr2315245wmb.20.1677591611603; 
 Tue, 28 Feb 2023 05:40:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003e200d3b2d1sm12573202wmj.38.2023.02.28.05.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:40:11 -0800 (PST)
Message-ID: <092be240-8e2f-4ef1-aefc-f5622be4b314@linaro.org>
Date: Tue, 28 Feb 2023 14:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/7] hw/net/eepro100: Finish QDev conversion
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20230213101048.94519-1-philmd@linaro.org>
 <e432c04d-6682-596f-c5bc-5266a38bbe0d@linaro.org>
In-Reply-To: <e432c04d-6682-596f-c5bc-5266a38bbe0d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

Hi Jason, do you Ack this series?

On 23/2/23 16:16, Philippe Mathieu-Daudé wrote:
> ping
> 
> On 13/2/23 11:10, Philippe Mathieu-Daudé wrote:
>> Convert EEPRO100 to use the latest QDev conventions / style.
>>
>> v1:
>> https://lore.kernel.org/qemu-devel/20230213070820.76881-9-philmd@linaro.org/
>>
>> Based-on: <20230213070423.76428-1-philmd@linaro.org>
>>            hw/qdev: Housekeeping around qdev_get_parent_bus()
>>
>> Philippe Mathieu-Daudé (7):
>>    hw/net/eepro100: Abort if pci_add_capability() ever fail
>>    hw/net/eepro100: Introduce TYPE_EEPRO100 QOM abstract parent
>>    hw/net/eepro100: Convert reset handler to DeviceReset
>>    hw/net/eepro100: Pass E100PCIDeviceInfo as class init data
>>    hw/net/eepro100: Remove instance
>>      EEPRO100State::has_extended_tcb_support
>>    hw/net/eepro100: Remove instance's EEPRO100State::device
>>    hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100()
>>
>>   hw/net/eepro100.c | 147 ++++++++++++++++++++++------------------------
>>   1 file changed, 69 insertions(+), 78 deletions(-)
>>
> 


