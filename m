Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE092B7D77
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 13:15:43 +0100 (CET)
Received: from localhost ([::1]:47564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfMNC-0006Ka-1k
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 07:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfMLY-0005Rg-AQ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfMLV-0001Q1-KW
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605701636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1oEiherJatWdkkqdyhsFB8aXq1Rs0nQu3w5F6NoZyxQ=;
 b=YtiX1+MHopqb49qR9gZEYP5WFm56ZRZzwMrS4SAy/FkcnCR8ltVkuzL53TnC/HbOT+wbHN
 ycXo9jar3C7K1wii9aGBwkZEkv9pSsHETdxmjrJZfP5t312U2Bg4FY6BIYiv+/7KxHAivG
 X8a3eXH/BjwqDWjnqe/yleZBZIqxAr8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-D6Xn1Hh7PK2cO23ADriUoQ-1; Wed, 18 Nov 2020 07:13:54 -0500
X-MC-Unique: D6Xn1Hh7PK2cO23ADriUoQ-1
Received: by mail-wm1-f72.google.com with SMTP id d2so948140wmd.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 04:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1oEiherJatWdkkqdyhsFB8aXq1Rs0nQu3w5F6NoZyxQ=;
 b=GnD32V5QxKx/2O12fiTJAfOh3wYCeJr7BU2ItL/X3QtOThKXXLHp6CdSBssBhkNnca
 iSje+ehRI4w7z1YW3DyVNFcNQ0/me+Toz4dkCZVY2rCyKOOZ69uiNUuSIFPv1wWoMraX
 iIDXNBA58e4P7eRuXWOQI54ksp8ZXPi0p3AmpmjNBt4D5T6E5Cy2kYM66uc2Zs0KbPRU
 ZKzUhJOFOO4THYEiSq8mbP9Xoy2eNOzMMSP8L2K3lgjygXeSd7k0LJai7o7q2mvLBg6W
 3LwUqi79grNoxdxqU+HuGTBU2rPZAFhxorrk8o+pLxkRYnrbvIFUTJuE6TvC7zs9xPC/
 9VlQ==
X-Gm-Message-State: AOAM531a83lATaKZYp4EVTeVyHbywLghXXPk/8blVxo5EoN3G06f9QWc
 Kt/gwFPyEMt+1qa9Wzkb/ciOnNXutxHwuzJBW7hmmZOpANE+Az22MnG0DAY/feL6gUWJ7T7idoC
 1SWJ0NNTmPzRcpMM=
X-Received: by 2002:a05:600c:4112:: with SMTP id
 j18mr4395145wmi.152.1605701633291; 
 Wed, 18 Nov 2020 04:13:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjBKSMdgMmzd3wvA3xeKvXjYmLSBIrBPzTmcn+LOb9Yyk6wuFy8gZHDx6JCZk41awtA+CgSA==
X-Received: by 2002:a05:600c:4112:: with SMTP id
 j18mr4395127wmi.152.1605701633106; 
 Wed, 18 Nov 2020 04:13:53 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id i11sm32877303wrm.1.2020.11.18.04.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 04:13:52 -0800 (PST)
Subject: Re: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by g_autofree
 need to be initialized
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cd63f998-e3fe-d93f-f515-a47103592e05@redhat.com>
Date: Wed, 18 Nov 2020 13:13:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 zhang.zhanghailiang@huawei.com, hskinnemoen@google.com, wuhaotsh@google.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:56 PM, Chen Qun wrote:
> According to the glib function requirements, we need initialise
>  the variable. Otherwise there will be compilation warnings:
> 
> glib-autocleanups.h:28:3: warning: ‘full_name’ may be
> used uninitialized in this function [-Wmaybe-uninitialized]
>    28 |   g_free (*pp);
>       |   ^~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>  tests/qtest/npcm7xx_timer-test.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
> index f08b0cd62a..83774a5b90 100644
> --- a/tests/qtest/npcm7xx_timer-test.c
> +++ b/tests/qtest/npcm7xx_timer-test.c
> @@ -512,11 +512,9 @@ static void test_disable_on_expiration(gconstpointer test_data)
>   */
>  static void tim_add_test(const char *name, const TestData *td, GTestDataFunc fn)
>  {

Or:

> -    g_autofree char *full_name;
  +    g_autofree char *full_name = NULL;

> -
> -    full_name = g_strdup_printf("npcm7xx_timer/tim[%d]/timer[%d]/%s",
> -                                tim_index(td->tim), timer_index(td->timer),
> -                                name);
> +    g_autofree char *full_name = g_strdup_printf(
> +        "npcm7xx_timer/tim[%d]/timer[%d]/%s", tim_index(td->tim),
> +        timer_index(td->timer), name);
>      qtest_add_data_func(full_name, td, fn);
>  }
>  
> 


