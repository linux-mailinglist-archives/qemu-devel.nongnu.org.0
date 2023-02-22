Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF869EDC9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 05:06:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUgOa-0004zg-DT; Tue, 21 Feb 2023 23:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUgOW-0004yQ-LU
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUgOT-0003ZS-VG
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 23:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677038772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sfOru1lyx2dBtpuIzTxh2cJUllvvHTvgeoyGJ168de8=;
 b=fH4UYV54/fj1Z0+Kh+2oIXyl393Q2cMj88HG9VxpXNnmPp3ZHfRX6uAXvgTJh+aO+7xUgM
 MtlZn51UmS6QC+YSGOZWjCXVNsIS1q0ueVc4DhRj/JAXBq3Osc/97OmqsV7TQSerR88ARA
 2w9fkBHC1kesybZ4hlmBpe5yuOM5+aM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-Sh2pAt3RN5GfF9kDRooPGg-1; Tue, 21 Feb 2023 23:06:10 -0500
X-MC-Unique: Sh2pAt3RN5GfF9kDRooPGg-1
Received: by mail-ed1-f71.google.com with SMTP id
 q13-20020a5085cd000000b004af50de0bcfso6264657edh.15
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 20:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sfOru1lyx2dBtpuIzTxh2cJUllvvHTvgeoyGJ168de8=;
 b=sCJphsjfytcrat5eMu/hMUgMD6GwWc+z+OCVcu63RcxH5++Ys3Lykqyvts6O1VAidO
 J5j+ylQQGeGdtoPRDmQhF4kBhuX4C2iRA0nKZhgPSHfsnAwrrDB61f5NBw3QsdVEgvhG
 wM2hf1Y49slB+L86gCCeYinjuxngbDM35G7krYCzyfP+cD660+Cm3FJXtZUIacewgn49
 O3l/MilSvsqNl/BEhyDUUcOiD3AJcl8xQo70f2ar66GG4RKsH315e2PV953ZvQm272xb
 IWZWyRWXdFmMs3AhTjBYJTmBHjEuWpVx2tukTNlPo47WlHfhTcbibejLHZ8yl+RbUN/a
 5tQw==
X-Gm-Message-State: AO0yUKVmtlhRjkEKpZFldGP8nwUBmiBQ3sLHt+aqCbu/0IG+baFh24nC
 EM1PZwfcSmBx4p6ADxw4Z7sZUJr+wSHMLZVtQ5pb3OP6t43rfzb6qCCSvFq8Ykp99Ur0ntZBTFY
 M3q8cZvmYp3rvTxo=
X-Received: by 2002:aa7:dd51:0:b0:4ad:7af2:a2ce with SMTP id
 o17-20020aa7dd51000000b004ad7af2a2cemr5894775edw.6.1677038769285; 
 Tue, 21 Feb 2023 20:06:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/VPsuvlzGUwE+p9JtOdz1blG87Go6osspeHl225WWMsiL6sVALalyI84zCWcRR0WNcZEoEAA==
X-Received: by 2002:aa7:dd51:0:b0:4ad:7af2:a2ce with SMTP id
 o17-20020aa7dd51000000b004ad7af2a2cemr5894747edw.6.1677038769009; 
 Tue, 21 Feb 2023 20:06:09 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 q21-20020a50aa95000000b004ab4db9be14sm2585046edc.81.2023.02.21.20.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 20:06:08 -0800 (PST)
Message-ID: <f0eb7a7c-8505-ee8d-af5f-259c2627958b@redhat.com>
Date: Wed, 22 Feb 2023 05:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Corey Minyard <minyard@acm.org>, Laurent Vivier <lvivier@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/5] bulk: Replace [g_]assert(0) -> g_assert_not_reached()
In-Reply-To: <20230221232520.14480-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/02/2023 00.25, Philippe Mathieu-Daudé wrote:
> In order to avoid warnings such commit c0a6665c3c ("target/i386:
> Remove compilation errors when -Werror=maybe-uninitialized"),
> replace all assert(0) and g_assert(0) by g_assert_not_reached().
> 
> Remove any code following g_assert_not_reached().
> 
> See previous commit for rationale.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> 
> diff --git a/docs/spin/aio_notify_accept.promela b/docs/spin/aio_notify_accept.promela
> index 9cef2c955d..f929d30328 100644
> --- a/docs/spin/aio_notify_accept.promela
> +++ b/docs/spin/aio_notify_accept.promela
> @@ -118,7 +118,7 @@ accept_if_req_not_eventually_false:
>       if
>           :: req -> goto accept_if_req_not_eventually_false;
>       fi;
> -    assert(0);
> +    g_assert_not_reached();
>   }

This does not look like C code ... is it safe to replace the statement here?

> diff --git a/docs/spin/aio_notify_bug.promela b/docs/spin/aio_notify_bug.promela
> index b3bfca1ca4..ce6f5177ed 100644
> --- a/docs/spin/aio_notify_bug.promela
> +++ b/docs/spin/aio_notify_bug.promela
> @@ -106,7 +106,7 @@ accept_if_req_not_eventually_false:
>       if
>           :: req -> goto accept_if_req_not_eventually_false;
>       fi;
> -    assert(0);
> +    g_assert_not_reached();
>   }

dito

> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index f54f44d899..59c8032a21 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1347,49 +1347,42 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
>   
>   int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
>   {
> -    assert(0);
> -    return -1;
> +    g_assert_not_reached();
>   }
>   
>   int postcopy_ram_prepare_discard(MigrationIncomingState *mis)
>   {
> -    assert(0);
> -    return -1;
> +    g_assert_not_reached();
>   }
>   
>   int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
>                                    uint64_t client_addr, uint64_t rb_offset)
>   {
> -    assert(0);
> -    return -1;
> +    g_assert_not_reached();
>   }
>   
>   int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
>   {
> -    assert(0);
> -    return -1;
> +    g_assert_not_reached();
>   }
>   
>   int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
>                           RAMBlock *rb)
>   {
> -    assert(0);
> -    return -1;
> +    g_assert_not_reached();
>   }
>   
>   int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
>                           RAMBlock *rb)
>   {
> -    assert(0);
> -    return -1;
> +    g_assert_not_reached();
>   }
>   
>   int postcopy_wake_shared(struct PostCopyFD *pcfd,
>                            uint64_t client_addr,
>                            RAMBlock *rb)
>   {
> -    assert(0);
> -    return -1;
> +    g_assert_not_reached();
>   }
>   #endif

If we ever reconsider to allow compiling with G_DISABLE_ASSERT again, this 
will fail to compile since the return is missing now, so this is kind of 
ugly ... would it make sense to replace this with g_assert_true(0) instead? 
Or use abort() directly?

  Thomas


