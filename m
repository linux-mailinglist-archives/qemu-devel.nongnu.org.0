Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC75A0F8E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 13:48:55 +0200 (CEST)
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBLy-0006w4-4H
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 07:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBB1-0008Iq-N6
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBB0-0006IB-0O
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661427453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xs9hE46eEoU9jZvngREYo97z2OUP83YwtQiHzYsg4bs=;
 b=TDcEpq4y9J64MdHNFevg8hLYWuNF6wswK+imMh8vFnQhbTLk68uiuoQee9HZDMpJzjZUM7
 Zf2+Vjmzq9K1cCfCsezy5JLqBYtY9WS8wqkCkkvP2vQE8/21CpvV8FFRE2PlBlMmhy/9kz
 YiVVejEuhddl6RZgRrQ77Ezbpj75xs4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-ItUd1lyAMMa12QyKq60xZQ-1; Thu, 25 Aug 2022 07:37:32 -0400
X-MC-Unique: ItUd1lyAMMa12QyKq60xZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r10-20020a1c440a000000b003a538a648a9so10812042wma.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 04:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xs9hE46eEoU9jZvngREYo97z2OUP83YwtQiHzYsg4bs=;
 b=tRc8XaC/xKzAHNAoKHfVIeU1qeKjHdHRnIOwSbeUz67Xoq+5IWFLZVOWaVIlpKr9rt
 /XJ1o1QBwKUgK3JmTMQ4lLoiezuxpe3lNEc/nRNx05uLKR7j4fd1WEAdAEwh2L0WMf0m
 Y9ZUHchHl40FmeqRPBVn6aB5XttNPM8IEtSjGt+Be2BylNfNqT7NCM2m17tIE0rs7nB6
 8KANBef2YXsvPW+uGTtTtYmhDQEHXbMKmRWatSryvGnN/LEZ6aIb07GXLcBC/Wj0xC7h
 hyv50seSL6gsgRjBhWBL/E6Wn7jA8u2Mc0Q3AgF1iM4SksW8T1EwKS37DEooy+Ahagg9
 8WOQ==
X-Gm-Message-State: ACgBeo3VMrUuKKUemPeI3HC5PBh8k0BCEVMMne/kL0EpeX9Fr2qVC8+x
 x6m1DZosSfCazjBGmqLafZYcD7NdAURumJSfFP9ZLWs018Es+uRF4zfaSa4L0VH2mR4wuYMBMJ1
 YZaS95IrDXtizQSw=
X-Received: by 2002:a5d:5941:0:b0:225:3fc3:d923 with SMTP id
 e1-20020a5d5941000000b002253fc3d923mr2024137wri.522.1661427451058; 
 Thu, 25 Aug 2022 04:37:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5px9ryyxpSK9gzRssh95oKA1wvX1edsXHEKGEearqvQp6Efm38tr8I5kkkj4Jn/M1ZPFOP2w==
X-Received: by 2002:a5d:5941:0:b0:225:3fc3:d923 with SMTP id
 e1-20020a5d5941000000b002253fc3d923mr2024122wri.522.1661427450805; 
 Thu, 25 Aug 2022 04:37:30 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d4411000000b002252e5a6841sm19522636wrq.57.2022.08.25.04.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:37:30 -0700 (PDT)
Message-ID: <92b34ad3-052f-1e1b-6594-1d6110554d7b@redhat.com>
Date: Thu, 25 Aug 2022 13:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 19/51] tests/qtest: Build test-filter-{mirror, redirector}
 cases for posix only
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-20-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-20-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The test-filter-{mirror,redirector} cases use socketpair() API that
> is only available on POSIX and should only be built for POSIX.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/meson.build | 28 ++++++++++++++++++----------
>   1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 9e484e60ba..c97da5a062 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -42,6 +42,7 @@ qtests_cxl = \
>   qtests_i386 = \
>     (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
>     (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                     \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) +                 \
>     (have_tools ? ['ahci-test'] : []) +                                                       \
>     (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +           \
>     (config_all_devices.has_key('CONFIG_SGA') ? ['boot-serial-test'] : []) +                  \
> @@ -95,8 +96,7 @@ qtests_i386 = \
>      'vmgenid-test',
>      'migration-test',
>      'test-x86-cpuid-compat',
> -   'numa-test',
> -   'test-filter-redirector'
> +   'numa-test'
>     ]
>   
>   if dbus_display
> @@ -120,29 +120,34 @@ endif
>   qtests_x86_64 = qtests_i386
>   
>   qtests_alpha = ['boot-serial-test'] + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
>     (slirp.found() ? ['test-netfilter'] : []) + \
>     (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
>   
>   qtests_avr = [ 'boot-serial-test' ]
>   
>   qtests_hppa = ['boot-serial-test'] + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
>     (slirp.found() ? ['test-netfilter'] : []) + \
>     (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
>   
>   qtests_m68k = ['boot-serial-test'] + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
>     (slirp.found() ? ['test-netfilter'] : [])
>   
>   qtests_microblaze = ['boot-serial-test'] + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
>     (slirp.found() ? ['test-netfilter'] : [])
>   
>   qtests_microblazeel = qtests_microblaze
>   
>   qtests_mips = \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
>     (slirp.found() ? ['test-netfilter'] : []) + \
>     (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
>     (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
> @@ -152,7 +157,8 @@ qtests_mips64 = qtests_mips
>   qtests_mips64el = qtests_mips
>   
>   qtests_ppc = \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
>     (slirp.found() ? ['test-netfilter'] : []) + \
>     (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
>     (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
> @@ -174,13 +180,15 @@ qtests_sh4 = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-te
>   qtests_sh4eb = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
>   
>   qtests_sparc = ['prom-env-test', 'm48t59-test', 'boot-serial-test'] + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
>     (slirp.found() ? ['test-netfilter'] : [])
>   
>   qtests_sparc64 = \
>     (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
>     (slirp.found() ? ['test-netfilter'] : []) + \
> -  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
> +  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
>     ['prom-env-test', 'boot-serial-test']
>   
>   qtests_npcm7xx = \

It might be easier to introduce a new variable à la:

filter_qtests = \
   (slirp.found() ? ['test-netfilter'] : []) + \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) + \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : [])

And then add that to the qtest_ARCH variables instead?

  Thomas


