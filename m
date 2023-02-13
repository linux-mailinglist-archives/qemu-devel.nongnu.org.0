Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73F76954A1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 00:21:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRi6s-0007Tt-HC; Mon, 13 Feb 2023 18:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRi6q-0007Tc-F8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:19:44 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRi6o-0000Yn-Rt
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:19:44 -0500
Received: by mail-pl1-x633.google.com with SMTP id o8so12844354pls.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 15:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q0svNZeG/jbcisLHVb1NzmIffnwiWtGQlboXFUzeC1o=;
 b=wHs1f9uYhcI26NPcSjbdb+E4v70ncZqQuoj4INmuGym9uJ+Ejl6E3Ce25odSL+X0nU
 7CqYaiXy5YxURcTHgiQE88TXGzuK9J1FclMdk1ZnU2+xUtc1fRxRj4iMNMqhdxS0Citc
 IWkj51/ksAnPzURvbhuis7PZeVBqDttYKQo1wSEXg95zi8XcuA+kBY8L+50+KwEpzRbG
 YwB86DS/2elEjlVJtRNFP2uAPIn+AncpOri+0VG7l1LBVlzW/x/MU2WXt6lutfRwKdI/
 aeJax1T9Qxx+NAfNZHi0BIEsYeP8wvGUC6EDTOQDsNrIj7v3ILgxCj7Zf247yczPW1KY
 5HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q0svNZeG/jbcisLHVb1NzmIffnwiWtGQlboXFUzeC1o=;
 b=zIe6RIZsZ2+YaaCKIigXgbBXAgrrhj1cjfEkqbvs/DcAKZZA7eCgFZ12FfWAwhdxW5
 fmFHd/zcfTzjVC7FaK7niANUehMxQSp5LTF5KosK5m7X3IL8rEhNRNdR4VsvGpDX2spg
 wG7fVSCdhXKDiLOty/cX+tSM2QgAhn5Jh+6jc5fQ+e1iYFNso+XwECWqVoriFD6gupCr
 TZ3k+bsTXc58ffBgJtX7I92JrJddcvmbPCYc2scL0Y8pQH4//AhyA5SllWJEPJepaatp
 Y95+1X/ZU6MxFySMFCERuMp11rpM7Yfv4nUF9qxlmkNStIAKZz1h1KRPMpFpmAnbsyi2
 ZJJg==
X-Gm-Message-State: AO0yUKXG+63QP1rfq8JnB8pvGTgFtb7vgdiiJg/vYrwV08plvHP/suur
 f+OxK47/huh6NvnHhpuQqwo2Hg==
X-Google-Smtp-Source: AK7set+o6O2kZNjEwh8VCTooLtud9W5ypL1vUZxqnDaQM6N3zVyDlcEaDcqQLmiuEjWFykXxAIyovA==
X-Received: by 2002:a17:902:c946:b0:19a:7548:da30 with SMTP id
 i6-20020a170902c94600b0019a7548da30mr827181pla.3.1676330381293; 
 Mon, 13 Feb 2023 15:19:41 -0800 (PST)
Received: from [192.168.145.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 b2-20020a170902d30200b0019a733a75a2sm6725665plc.60.2023.02.13.15.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 15:19:40 -0800 (PST)
Message-ID: <0c477def-e852-53e3-9bf0-a9e3c313cf25@linaro.org>
Date: Mon, 13 Feb 2023 13:19:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] hw: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230212224730.51438-1-philmd@linaro.org>
 <20230212224730.51438-3-philmd@linaro.org>
 <88026156-1838-bb8e-c637-b59a26759cc3@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <88026156-1838-bb8e-c637-b59a26759cc3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 2/12/23 13:03, Philippe Mathieu-Daudé wrote:
> On 12/2/23 23:47, Philippe Mathieu-Daudé wrote:
>> DeviceState::parent_bus is an internal field and should be
>> accessed by the qdev_get_parent_bus() helper. Replace all
>> uses in hw/ except the QDev uses in hw/core/.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/audio/intel-hda.c                |  2 +-
>>   hw/block/fdc.c                      |  2 +-
>>   hw/block/swim.c                     |  2 +-
>>   hw/ide/qdev.c                       |  4 ++--
>>   hw/net/virtio-net.c                 |  2 +-
>>   hw/pci-bridge/pci_expander_bridge.c |  2 +-
>>   hw/scsi/scsi-bus.c                  |  2 +-
>>   hw/usb/bus.c                        |  2 +-
>>   hw/usb/desc.c                       |  2 +-
>>   hw/usb/dev-smartcard-reader.c       | 16 ++++++++--------
>>   10 files changed, 18 insertions(+), 18 deletions(-)
> 
> I missed:

Did you use a temporary rename of the field to catch all the uses?

>   void hda_codec_response(HDACodecDevice *dev, bool solicited, uint32_t response)
>   {
> -    HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
> +    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(DEVICE(dev)));

I'm never sure the cast is clearer than &dev->qdev.
But it seems the normal way in qemu...

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~


