Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A45F432000
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 16:39:18 +0200 (CEST)
Received: from localhost ([::1]:60574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcTnJ-0006U7-3k
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 10:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcTll-0005Ho-Ra
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcTlj-0000me-4J
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634567858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKb8UH0M94PWhqChe/EE5zqrWBPhbIYBeL505EvMi68=;
 b=NCATaYg8T5n72E3x5KpgD1u/SPJM6eVemmLWhLZGN8rokKMs2WgCJeKVopKj/TGzwEX/xD
 FJjYOKVJDwpMhTRcyrqkhnpMyKaKSzKSb2XWcbPKALLg9WfJBOwlDpxuEzutRHmi8JKCwV
 FoaLy1SUjesa6XJDGBw6sPWDj97kCB0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-e0f9BTkAOq2K1QrcbpxRuA-1; Mon, 18 Oct 2021 10:37:37 -0400
X-MC-Unique: e0f9BTkAOq2K1QrcbpxRuA-1
Received: by mail-ed1-f71.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so14576330edq.6
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 07:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OKb8UH0M94PWhqChe/EE5zqrWBPhbIYBeL505EvMi68=;
 b=10O+ejbnJXReP0q3xBci81OaHxw96WOZfmkZ40T6vKSKphbeFG6NM4rFoOsuc9irQO
 djuB4DRG45iAHGruf1Va+Xrk8VIvvqljsv+Gi3H1+KEUvWNP3MVbkWoj9SlPST97nHTL
 UNBfjFaOtKeg/LXFsCiaN46SKDY4i6nfz3R8GYCs/bPxkKH7OH8lEfQIEQxIBpuluFFA
 sYkq/Grz+5/FH6KV74zM259WkCxQwQ2ie5CiLDNo0m2HpxHx97IYif+M0BuVIQmiONue
 S9HbH6yzrBjM5gDEBCKn1J222HxAzT2FthSBaJkEIcUGDhRU010oEezjftwJT6GbgSNY
 YNlw==
X-Gm-Message-State: AOAM530Jzva95iTN6OcZsz1Z+54bVAq2tUl/uS87b2tJyq3xQlUtDKxF
 7AgZFgxAI8aQ/4bL9YMgxlaSfr2dNj1ZL/7G5sdcXq8BblU+A0ZcT/JQB6gHLC6t4eUuSI0lCz5
 cqpNWC5DksZgGgUA=
X-Received: by 2002:aa7:cd53:: with SMTP id v19mr25617404edw.8.1634567855872; 
 Mon, 18 Oct 2021 07:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDLN1u9veFBJicZjYsT4+0J5PFHddcIvaECs/RkYTWnreJqL3jnvuncAbLIz9stCLmQmeVkQ==
X-Received: by 2002:aa7:cd53:: with SMTP id v19mr25617366edw.8.1634567855566; 
 Mon, 18 Oct 2021 07:37:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bq4sm9085527ejb.43.2021.10.18.07.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 07:37:34 -0700 (PDT)
Message-ID: <139066ae-053c-8e55-da76-2b69f51f0717@redhat.com>
Date: Mon, 18 Oct 2021 16:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] chardev: don't exit() straight away on C-a x
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211018140226.838137-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211018140226.838137-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/21 16:02, Alex Bennée wrote:
> While there are a number of uses in the code-base of the exit(0)
> pattern it gets in the way of clean exit which can do all of it's
> house-keeping. In particular it was reported that you can crash
> plugins this way because TCG can still be running on other threads
> when the atexit callback is called.
> 
> Use qemu_system_shutdown_request() instead. I did a gentle rename of
> the runstate stub seeing as it now contains two functions.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Lukas Jünger <lukas.junger@greensocs.com>

That won't work with -no-shutdown, but you can just call qmp_quit() instead.

Paolo

> ---
>   chardev/char-mux.c                     | 3 ++-
>   stubs/{runstate-check.c => runstate.c} | 5 +++++
>   stubs/meson.build                      | 2 +-
>   3 files changed, 8 insertions(+), 2 deletions(-)
>   rename stubs/{runstate-check.c => runstate.c} (64%)
> 
> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
> index ada0c6866f..a46897fcd5 100644
> --- a/chardev/char-mux.c
> +++ b/chardev/char-mux.c
> @@ -28,6 +28,7 @@
>   #include "qemu/option.h"
>   #include "chardev/char.h"
>   #include "sysemu/block-backend.h"
> +#include "sysemu/runstate.h"
>   #include "chardev-internal.h"
>   
>   /* MUX driver for serial I/O splitting */
> @@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d, int ch)
>               {
>                    const char *term =  "QEMU: Terminated\n\r";
>                    qemu_chr_write_all(chr, (uint8_t *)term, strlen(term));
> -                 exit(0);
> +                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>                    break;
>               }
>           case 's':
> diff --git a/stubs/runstate-check.c b/stubs/runstate.c
> similarity index 64%
> rename from stubs/runstate-check.c
> rename to stubs/runstate.c
> index 2ccda2b70f..f47dbcd3e0 100644
> --- a/stubs/runstate-check.c
> +++ b/stubs/runstate.c
> @@ -5,3 +5,8 @@ bool runstate_check(RunState state)
>   {
>       return state == RUN_STATE_PRELAUNCH;
>   }
> +
> +void qemu_system_shutdown_request(ShutdownCause reason)
> +{
> +    return;
> +}
> diff --git a/stubs/meson.build b/stubs/meson.build
> index f6aa3aa94f..8f6a9f17e5 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -35,7 +35,7 @@ stub_ss.add(files('qtest.c'))
>   stub_ss.add(files('ram-block.c'))
>   stub_ss.add(files('ramfb.c'))
>   stub_ss.add(files('replay.c'))
> -stub_ss.add(files('runstate-check.c'))
> +stub_ss.add(files('runstate.c'))
>   stub_ss.add(files('sysbus.c'))
>   stub_ss.add(files('target-get-monitor-def.c'))
>   stub_ss.add(files('target-monitor-defs.c'))
> 


