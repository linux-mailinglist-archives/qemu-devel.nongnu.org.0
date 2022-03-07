Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BE4CF34F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:10:08 +0100 (CET)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8RU-0001iN-0B
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:10:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR8IL-0001go-3Y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:00:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR8II-0000xG-Hr
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646640037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSqMEG+WKukEoVOQE7tTDUf93ay6xNNFS4SBj2CjUvI=;
 b=G5/j1mANIJnnD0g0mKNUaHy3p7dpYTiJ1wyTGbNo1Q0a+kCxCbEMM1x9uB/uMyPOooCi7f
 KOLQlGHQe50yYKrwwxKgeYpqVJ0DE89qJ17XgDYA2sWC7pxmpPayefJ8IU+o40p9mj0aod
 hTD7Y0/3H0zRD576WvJYyFE29us2Z8A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-KmC6enXgMFGmMi30vXPVog-1; Mon, 07 Mar 2022 03:00:36 -0500
X-MC-Unique: KmC6enXgMFGmMi30vXPVog-1
Received: by mail-wr1-f72.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so4237601wra.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HSqMEG+WKukEoVOQE7tTDUf93ay6xNNFS4SBj2CjUvI=;
 b=oW1W5BW82HwgH+xxachUEhWXFZzOw8Mo7ZXj1wuuwDSdjDafmnNYNNUo7Vlj0n7XVk
 phgU1o1ODZEMvPBKLSzM297kwVZ7uWrAWPV4I6slVvrI73D1mEmPE5MALhHrzCp/LHO3
 FHFbmft/iOHh/yIq0+VEXSgqMr9niE013SNetAfK5Q4GuufOfKViFOVxipA2il40zeT7
 9P9wGv+tpMeFdLKDTsxhvAiz4w5eivUIK4Oiqwc0KOdKQkRuu1iKgpiCE195Azf4OgDC
 E1bCDH/7oHKEikJMsHCdTLlQXLkKc0CP0D0/rh6nF9jwDD/S1Yn0E69yPSjx4Vnlialn
 iSYA==
X-Gm-Message-State: AOAM531FJe1Bopt2qDcIebPAzXh5J1rZWtyoK6tfa/6ZQT0YOz7ocdpx
 jGl7XpjlZJ0EaQKIzmZi8KnbUtdVZAuLvqjVNczsB+GlnWX50/vLd0fAyW7T7jA8HrBW1eUlCG+
 QA+KEJGtSEhohDsc=
X-Received: by 2002:a7b:c256:0:b0:389:bbf5:9941 with SMTP id
 b22-20020a7bc256000000b00389bbf59941mr668488wmj.157.1646640035005; 
 Mon, 07 Mar 2022 00:00:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzN3B1Ybu6IbBWZXMFMm6AIUq+uZnmnBuGil+/mXXJcSXTBKghG/AjIcOMZ3ktqVI/WaE8bAA==
X-Received: by 2002:a7b:c256:0:b0:389:bbf5:9941 with SMTP id
 b22-20020a7bc256000000b00389bbf59941mr668458wmj.157.1646640034715; 
 Mon, 07 Mar 2022 00:00:34 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a7bc948000000b003898dfd7990sm7004322wml.29.2022.03.07.00.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:00:34 -0800 (PST)
Message-ID: <9a95bfd3-24d2-bc8a-d723-3675eedadeb7@redhat.com>
Date: Mon, 7 Mar 2022 09:00:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/5] qtest/meson.build: check CONFIG_TCG for
 boot-serial-test in qtests_ppc
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220303153517.168943-1-danielhb413@gmail.com>
 <20220303153517.168943-3-danielhb413@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220303153517.168943-3-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: crosa@redhat.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2022 16.35, Daniel Henrique Barboza wrote:
> 'boot-serial-test' does not work with a QEMU built with --disable-tcg in
> a IBM POWER9 host. The reason is that without TCG QEMU will default to
> KVM acceleration, but then the KVM module in IBM POWER hosts aren't able
> to handle other CPUs.
> 
> The result is that the test will break with a KVM error when trying to
> ruin the ppce500 test:
> 
> $ QTEST_QEMU_BINARY=./qemu-system-ppc64 ./tests/qtest/boot-serial-test
> /ppc64/boot-serial/ppce500: qemu-system-ppc64: -accel tcg: invalid accelerator tcg
> error: kvm run failed Invalid argument
> NIP 0000000000f00000   LR 0000000000000000 CTR 0000000000000000 XER 0000000000000000 CPU#0
> MSR 0000000000000000 HID0 0000000000000000  HF 24020002 iidx 1 didx 1
> TB 00000000 00000000 DECR 0
> (...)
> ** (./tests/qtest/boot-serial-test:1935760): ERROR **: 07:44:03.010: Failed to find expected string. Please check '/tmp/qtest-boot-serial-sJ78sqg'
> 
> Fix it by checking CONFIG_TCG before compiling boot-serial-test.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   tests/qtest/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 0c2f2d94e1..deed640d7f 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -161,7 +161,8 @@ qtests_ppc = \
>     (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
>     (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
>     (config_all_devices.has_key('CONFIG_TCG') ? ['prom-env-test'] : []) +                      \
> -  ['boot-order-test', 'boot-serial-test']
> +  (config_all_devices.has_key('CONFIG_TCG') ? ['boot-serial-test'] : []) +                   \
> +  ['boot-order-test']
>   
>   qtests_ppc64 = \
>     qtests_ppc + \

Reviewed-by: Thomas Huth <thuth@redhat.com>


