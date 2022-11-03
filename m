Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D07617B51
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:05:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqY22-0007gt-QS; Thu, 03 Nov 2022 07:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqY1z-0007e7-7R
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:05:07 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqY1w-0000vP-RL
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:05:06 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so3123133wms.0
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 04:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7a339BsWicADxvCMiVOXljj5qNk7vJxR2k5q02mnOH0=;
 b=netWtmg4zlNG6kPnmNeF2xjGdnej3og6aJ4D3Iu7VGXVw/qY3f2+Z7sq1Ys4ye/egL
 fngSHwKiWbFdzAe/x2eU0c5p8xlyEgR4NkLWb7DfQgCVXLXGSVdOGpmJLAV1M40BH4xm
 EoxOJCq2awP2DAzF0yE+7DK8NOC+i4kQjMSwFrmAggJj1VPKPy3aqUguhxYrDRMKBOZ/
 sTsR8RFwn/BfRF7rs9o0xC9ZOU5KK183k9TLlEYSYpclKHQ50lL5bi2sQYeSKoY1HQ5/
 fq8ccBAhOudbrXVij1exyEWzQMyyiX8qolNp4xGQyLj9nQYi5Wn9ggYWf9J+Q1lNr5/6
 K0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7a339BsWicADxvCMiVOXljj5qNk7vJxR2k5q02mnOH0=;
 b=NeUv0FHQsg+5ewwgB4uTN9fj04wn1iI5k9EAoq84bVV9Wgw7w1xBjcJq93vPWhujyo
 RB7cwmNUSYyLBfwKW5Npyk4aDim9iM1aExmum6lVJ9KOGhQIz6U2iC4zGVLjngCreR0p
 akF5iKgjDQKoNS/9zx9cufQWlMQLVbK5840fhVPbgkJHgAZmlmlOfew2lPDcauyxRY6f
 9JPr+rNv0XpB0M0w4ypYMXWU53oTHcpPVfd4tqOZVvJ+8YAQrvcP4EPIV0g0KmRD4OKP
 ZqFFsIaWscnhAeDg5NLZw5hAyl7VvZAfTgpra06x93ign3QtKx8U6737nlQZdtQJH5fk
 dIlQ==
X-Gm-Message-State: ACrzQf2POnrjqP0nzBrNfHP7YqQBxTILBG76uXsLCLFF/9Yw2RfQpaZp
 eddlbcd0iTgXKDskFaN1BDaF7A==
X-Google-Smtp-Source: AMsMyM6kLmhW2YrWSrgTgHdpnZzBm04O07fWwL6DBOGanqy/1VZz6ZIzrz7eEcLqviBbAcl5faJ97w==
X-Received: by 2002:a05:600c:1987:b0:3c6:fd37:7776 with SMTP id
 t7-20020a05600c198700b003c6fd377776mr29798341wmq.72.1667473501705; 
 Thu, 03 Nov 2022 04:05:01 -0700 (PDT)
Received: from [192.168.182.175] (216.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.216]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffbc4000000b002367ad808a9sm570304wrs.30.2022.11.03.04.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:05:01 -0700 (PDT)
Message-ID: <0000bf1f-51f7-a17e-9cef-75635dd47d91@linaro.org>
Date: Thu, 3 Nov 2022 12:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] tests/qtest/e1000e-test: Use e1000_regs.h
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221103095416.110162-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221103095416.110162-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/11/22 10:54, Akihiko Odaki wrote:
> The register definitions in tests/qtest/e1000e-test.c had names
> different from hw/net/e1000_regs.h, which made it hard to understand
> what test codes corresponds to the implementation. Use
> hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
> these duplications.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/e1000e-test.c | 66 ++++++---------------------------------
>   1 file changed, 10 insertions(+), 56 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


