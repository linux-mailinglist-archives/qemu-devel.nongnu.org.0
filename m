Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0C3F1BCD
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:43:05 +0200 (CEST)
Received: from localhost ([::1]:55270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjG3-0002HL-QT
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjDH-0006vK-AG
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjDF-0005zm-ME
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWbeGguC7Ob9phMGUDirs5P50yvjW99TPaeSAz9nMbc=;
 b=MiwW6h+L8d5MDxSKpYfC74Br9WRleaSYl5y3Ytg982MPZL2nYUkVn5SboYJqfJEA9h8BYj
 hm+/0Qyd4ABSUgd0VH+/x2bNW+jg6F3npUjwGURHdNzE3e+TIWtg9buPsVeNxz0KHPz8Ax
 t51kDEa87DRsbFtj1ct3Psx88Oco1J4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-AMzNjvGvOBuZUMEiBAhTyA-1; Thu, 19 Aug 2021 10:40:03 -0400
X-MC-Unique: AMzNjvGvOBuZUMEiBAhTyA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so1785479wrl.0
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SWbeGguC7Ob9phMGUDirs5P50yvjW99TPaeSAz9nMbc=;
 b=tFJoRAc9YbS6eW3JV3A97XSif8kfXeGVHE9rgynayP6HFygFeVAPUYNsb7rR9JfH+7
 cZy+QFSCyff3m3j8JwuRDJfjyDNE6HiC4gSzkk25aLOqHq7y+ew4OHEPF4BiX1ewC7Wa
 4gnbp7GbSoaxGk7mAoslrmL7BlLKdEP+notr8JoZK4PSH8vH6hKrHG0CI6qj8l70zNPY
 Ajwtcx0X04JxFSuXuzqqm32Ro19CH3Nv3gckROl6LlL652VPQwZWDF9oBGNpQki00eEy
 TSZSokHwxP0t4eI5gNKvAvM/GmpVeDcoL4ivUxVRPYyyBdydz0rzR284gf+F4ZzUGMdC
 aGJw==
X-Gm-Message-State: AOAM533Y+SDFlDWQ8ppPUTCguJfUQxeg/+qPc8674aJd5+geSHjge/U4
 U9K1pFNCKtU/GuM0JQDzYazCUjI3gkZmJT/g8GITmeMjDTIYHv4KM1DP3zjqO6kiZMALa7bwi25
 OjVXg9B3ytlJogDs=
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr13495288wmd.33.1629384002350; 
 Thu, 19 Aug 2021 07:40:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC8o0wqlDREGQoMLCvINCdadI9h/9W7YyYV47kdvSXGaM1Ccj53NCfeUpYfWzpiQ1pc4KnVQ==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr13495276wmd.33.1629384002225; 
 Thu, 19 Aug 2021 07:40:02 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m7sm7536938wmq.29.2021.08.19.07.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:40:01 -0700 (PDT)
Subject: Re: [PATCH] hw/dma/xlnx_csu_dma: Fix ptimer resource leak
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210819141527.2821842-1-philmd@redhat.com>
 <CAFEAcA-1aDG_DZDbWGy=uXDjPGdkcMaN8SRF9_i7KnbQes-_NQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <055214e9-a809-7ad5-f2b6-7ef1b0ccb229@redhat.com>
Date: Thu, 19 Aug 2021 16:39:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-1aDG_DZDbWGy=uXDjPGdkcMaN8SRF9_i7KnbQes-_NQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 4:21 PM, Peter Maydell wrote:
> On Thu, 19 Aug 2021 at 15:15, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Fixes: 35593573b25 ("hw/dma: Implement a Xilinx CSU DMA model")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/dma/xlnx_csu_dma.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
>> index 797b4fed8f5..0c1c19cab5a 100644
>> --- a/hw/dma/xlnx_csu_dma.c
>> +++ b/hw/dma/xlnx_csu_dma.c
>> @@ -660,6 +660,13 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
>>      s->r_size_last_word = 0;
>>  }
> 
> This is a sysbus device -- when can it ever get unrealized ?

Alright. Then we should add an assertion if a SysBusDevice has a
non-NULL unrealize() handler.


