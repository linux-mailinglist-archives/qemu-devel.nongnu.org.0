Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210104825D7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 21:59:33 +0100 (CET)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Ozr-0002aa-Od
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 15:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3OyJ-0001ul-66
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 15:57:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3OyG-0007Cb-0Q
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 15:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640984270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8k5ntJZA8LUbeJF+nQI5s9sz/7Emh/xX4tEZg2lpDc=;
 b=WLYQXhzHEt9focBUReD75GjkBYv/XWBOw4+UVOF2mhSv2hxMgSn96f/0WkNqVxQDD04MZq
 saDKNZdajlfq6vZgke7qc3mS8uxoPoXOHpF6ePfzjdqPa60ZKMzak6T3EWSglXHIrAI/G3
 t7CDIGLl8X6jfWNEo/TmipztLK6dncs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-F32JmCqNMvC_HtrIM6h4yw-1; Fri, 31 Dec 2021 15:57:49 -0500
X-MC-Unique: F32JmCqNMvC_HtrIM6h4yw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s23-20020adf9797000000b001a24674f0f7so7920413wrb.9
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 12:57:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G8k5ntJZA8LUbeJF+nQI5s9sz/7Emh/xX4tEZg2lpDc=;
 b=y4u/ZHWKbjGKDdis2ezlqnUAp6s/OiiXPXjHHhBhsFrUEg+ODgzcae4A/kZbSNGF97
 LyXOYKN5rBlfYalOmgQts2QKG5ola9RYYquUf9KQNW9nlVVIwuXQleFbqtamNKylQUGl
 BIbHc6q895LEyGqZPa4PoP5ldVQXQxM2LTJlVEcl79OGfrtRBvot3QRBV8+axgfZX/02
 I9gJ9azsE2P8gHVcm8bj1Nr3LycAcmccaG4jOaXbn+nwWQjF+cNFubPBPjVvArO74rRJ
 A3DNexmbAMKQ7UZW0kgdydoZXEuyXIaKbWQzeV672S3hOrOM/KAf4AP7Qhm/WDx9NgLx
 5/4Q==
X-Gm-Message-State: AOAM530DDDd/M+ZxQygYXbezFZY8e3ZwjQNp0YIGiIgy5ticjXZMZetr
 Ybha30zgPQq0lYmgQb2dS9Hu20Z/igK/K6g9VLXDoQDVr0aGZWOkqI94vCXtJXNoneD5KvJ26hT
 heIbqfDZ+sGnHCSI=
X-Received: by 2002:a5d:58ef:: with SMTP id f15mr30045323wrd.108.1640984268054; 
 Fri, 31 Dec 2021 12:57:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwZDzXlh+dnRuvvfbQ116wZqboIhwrmXpCWCJ+tRgZvLd+lZczxxTv/LPg5NdscBz09uzyNQ==
X-Received: by 2002:a5d:58ef:: with SMTP id f15mr30045312wrd.108.1640984267886; 
 Fri, 31 Dec 2021 12:57:47 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id b14sm25264105wri.112.2021.12.31.12.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 12:57:47 -0800 (PST)
Message-ID: <513b7c37-7860-d40f-4c2d-559b45d569f1@redhat.com>
Date: Fri, 31 Dec 2021 21:57:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL 00/20] Machine-next patches for 2021-12-31
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211231124754.1005747-1-philmd@redhat.com>
 <e515eae3-8098-0853-a5b6-48ebd75a5597@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <e515eae3-8098-0853-a5b6-48ebd75a5597@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 20:06, Richard Henderson wrote:
> On 12/31/21 4:47 AM, Philippe Mathieu-Daudé wrote:
>> The following changes since commit
>> 69f153667fce723ee546d2f047d66d0cfa67c3cc:

>> ----------------------------------------------------------------
>> Machine core patches
>>
>> - Clarify qdev_connect_gpio_out() documentation
>> - Rework test-smp-parse tests following QOM style
>> - Introduce CPU cluster topology support (Yanan Wang)
>> - MAINTAINERS updates (Yanan Wang, Li Zhijian, myself)
>>
>> ----------------------------------------------------------------

> 
> Applied, thanks.

Thanks :~)


