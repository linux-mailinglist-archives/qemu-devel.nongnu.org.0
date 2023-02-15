Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D6698442
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNFd-0005LG-DX; Wed, 15 Feb 2023 14:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNFS-0005Ip-09
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:15:25 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNFP-0002HG-9L
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:15:21 -0500
Received: by mail-pl1-x62e.google.com with SMTP id h4so13406120pll.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WS252iTK5F5GvYrKuMhB0jQsbv6AKPLNdJ2R2BusyTc=;
 b=owtJE2QTPSMKO7Td5c6m7j0pbhsCHuuhe76Tjq+vu8QGlC47zi8sCusZjWvtQGwGXn
 njrRMTVa7/7C7Y9xIyOBjy7ZQ4tenBdkuXaoI0Ml8xLs8cSgwpeIIVoqBf4+E45n7gEr
 FlFvBgBrgEDR6QoOY6PI6O+H7T8sZWtYIIxs4oV2SoS3cOGWRSeFIQVmCBfO9nsHy+VL
 WzuWxRdao6bWx3fgSsW2VmsaqYQ+AZi5r5IEqboTPkfEdqCDPfWcdSWUOH/QDJLhuPDH
 vHBP9F8Ib3XCkunyXICLmhfzX3nczmu3HttbOtOw/ke/SKYS0XL5MDpgrbZLJ4a/LWTR
 HdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WS252iTK5F5GvYrKuMhB0jQsbv6AKPLNdJ2R2BusyTc=;
 b=oCS4GWn9aNXVDdqSrh5851mcb3pSVI04HWlvjLb0CdJv5jyoL3XqNCVIZVwjhf9BVE
 m/nWskxq7hTHMildQSb/hT0DznDlfrOUd4zko8yQpOf0kf34rEAy1bU3rd9LxPlem8OF
 6Nbn9evGbGAId919eGvPcZWr3llcRKty9BNDT/rO+LrENnl9sxmEIKgqLCW2zps36QX3
 1PDr399tLQe3Obbjaf/e6kJLkH4uo8F67Q7JaB/O4c1LVoXzota02HggUdcbvAOg3uET
 D0xylLVk3EBstu5lPiYN8vISk+cgF5YkVFjDl89DrWvND1dpgdTsDQjpoBDa3PbHlQZP
 +K1A==
X-Gm-Message-State: AO0yUKUpLTw8jYqE0+pn/89hTU1oSk5xCP1GTlSlYXFS62xLi7P/rCl3
 xb/uvN6jomwgm53uT4a77d1F9A==
X-Google-Smtp-Source: AK7set8phpN8jJkJB4z+h2Z/3HgbFw1ML6dOWiG0ObLPp+vkGBmidvuz93+ImfESIxJvMiZ03TxT/Q==
X-Received: by 2002:a17:902:e88a:b0:198:dd3f:2847 with SMTP id
 w10-20020a170902e88a00b00198dd3f2847mr4043287plg.21.1676488517191; 
 Wed, 15 Feb 2023 11:15:17 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 v5-20020a170902e8c500b0019a8283f272sm8806055plg.81.2023.02.15.11.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:15:16 -0800 (PST)
Message-ID: <d863b543-6cdd-4cf8-6b94-832acc938e4e@linaro.org>
Date: Wed, 15 Feb 2023 09:15:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/20] hw/ide: Rename ide_init2() ->
 ide_bus_init_output_irq()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-15-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> ide_init2() initializes a IDEBus, and set its output IRQ.
> To emphasize this, rename it as ide_bus_init_output_irq().
> 
> Mechanical change using:
> 
>    $ sed -i -e 's/ide_init2/ide_bus_init_output_irq/g' \
>          $(git grep -l ide_init2)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/ahci.c             | 2 +-
>   hw/ide/cmd646.c           | 2 +-
>   hw/ide/core.c             | 4 ++--
>   hw/ide/isa.c              | 2 +-
>   hw/ide/macio.c            | 2 +-
>   hw/ide/microdrive.c       | 2 +-
>   hw/ide/mmio.c             | 2 +-
>   hw/ide/piix.c             | 3 ++-
>   hw/ide/sii3112.c          | 2 +-
>   hw/ide/via.c              | 2 +-
>   include/hw/ide/internal.h | 4 ++--
>   11 files changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

