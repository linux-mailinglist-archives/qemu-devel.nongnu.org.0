Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0375A10B8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:39:51 +0200 (CEST)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRC9G-0005a1-2v
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRC3X-00017j-4p
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:33:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRC3U-0007Wn-PG
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661430831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PhpGNhPOg5S1xM6lJw7bHJ+ur8DAQ09YrH2rBLvl4DM=;
 b=fqP4GTQd2u91MxSuGUu2UIh5Hfuu7jj4wCMBfeYavaoNJyKOlX2ZjT0+qt/hk2ANlhKSZa
 RImrqO7DH1RVL/TZOl7Nrgk7jb+Zv3XSuuuxwZziWJ4gtg2xMPWsarFlaYvjjPADYvku1z
 j6ehLavyc0GuPfWXm6jgrIseYJKYMxU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-edc8W-RuPTiNWQXptnNaHg-1; Thu, 25 Aug 2022 08:33:50 -0400
X-MC-Unique: edc8W-RuPTiNWQXptnNaHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v64-20020a1cac43000000b003a4bea31b4dso2413838wme.3
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=PhpGNhPOg5S1xM6lJw7bHJ+ur8DAQ09YrH2rBLvl4DM=;
 b=sx/qov4+JqWMGkbaQtjCwvlPjOtXHLX4rclThbC+1o0gvnHMsHOXECUytZxswMHzeB
 1RGAnPOajjLt57K9J6xqjuEoviXS8iY8eSzq7Qq4xgNZxfOerGEvzgWSK8jGNtmdYTnS
 eWCelR0+FVqcy680Fu/rJa7t6zQOGvyQ8G9XPyN+i5NO+kADyHjxUK9MY+rD2o7hMHlY
 fIUXB68YKE5jc+VYHZPsI7IERE/OdJ4ma61nix43gNu1R1iscW3e6NuxLKizlo9VIncn
 mhaCHtilgKMz+UCS+88f9repGx5KrC8RyjPaprCbwnAHcbmE6chj+90HjUTmEv8gf6uI
 4rGA==
X-Gm-Message-State: ACgBeo1oRaWZFd6307j1uUJHDzeg7aNbJL7y1NTzEhz4yqivNMqEGre8
 nPChDGFqz5IqDVET7W2tgTOuQfiw11IBkBbHaq7ypXniZnn92HCGPkqIY21x/G6W7piZoS1Wgqn
 v8wYG2JUnM8kWNHs=
X-Received: by 2002:adf:ef04:0:b0:225:7539:b16e with SMTP id
 e4-20020adfef04000000b002257539b16emr2161095wro.557.1661430829646; 
 Thu, 25 Aug 2022 05:33:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5dXdi8L8OvEJLlgMtVDuZojjL7+WsH21qifZxTCJLOoZXUH6s5hTzrSrrHbL1y+360ZMkNiQ==
X-Received: by 2002:adf:ef04:0:b0:225:7539:b16e with SMTP id
 e4-20020adfef04000000b002257539b16emr2161084wro.557.1661430829450; 
 Thu, 25 Aug 2022 05:33:49 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0ac700b003a5ee64cc98sm5435528wmr.33.2022.08.25.05.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:33:49 -0700 (PDT)
Message-ID: <3245d6f2-563e-9e12-bd9f-b470d372a336@redhat.com>
Date: Thu, 25 Aug 2022 14:33:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 45/51] tests/qtest: prom-env-test: Use double quotes to
 pass the prom-env option
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-46-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-46-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2022 11.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Single quotes like -prom-env 'nvramrc=cafec0de 4000 l!' in the arguments
> are not removed in the Windows environment before it is passed to the
> QEMU executable. Such argument causes a failure in the QEMU prom-env
> option parser codes.
> 
> Change to use double quotes which works fine on all platforms.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/prom-env-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/prom-env-test.c b/tests/qtest/prom-env-test.c
> index c2b0448e55..39ccb59797 100644
> --- a/tests/qtest/prom-env-test.c
> +++ b/tests/qtest/prom-env-test.c
> @@ -58,8 +58,8 @@ static void test_machine(const void *machine)
>               " -machine " PSERIES_DEFAULT_CAPABILITIES;
>       }
>   
> -    qts = qtest_initf("-M %s -accel tcg %s -prom-env 'use-nvramrc?=true' "
> -                      "-prom-env 'nvramrc=%x %x l!' ", (const char *)machine,
> +    qts = qtest_initf("-M %s -accel tcg %s -prom-env \"use-nvramrc?=true\" "
> +                      "-prom-env \"nvramrc=%x %x l!\" ", (const char *)machine,
>                         extra_args, MAGIC, ADDRESS);
>       check_guest_memory(qts);
>       qtest_quit(qts);

Reviewed-by: Thomas Huth <thuth@redhat.com>


