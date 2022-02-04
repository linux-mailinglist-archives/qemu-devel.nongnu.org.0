Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BFA4A9C02
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:33:49 +0100 (CET)
Received: from localhost ([::1]:41672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0aq-0005k1-AX
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:33:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0Wd-0003T2-Gq
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:29:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0Wb-0004At-7H
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643988563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QrruDyW6g/F7VoaGIsGWoPEs/1uOsk8TZ4JQ+CYubs=;
 b=V1KKDB41dRDPuweGKFNCIaDtJfzkGUwPM2ynS7GaZv1oXowUzsInQ1tqHv8B/Jo2dazsnZ
 DBC/09R8pmql/dg+wM15tw1/1N6UoXEzXXEDC0m4Dz5inNz2hSMHg2UirV3Ook230ix/gn
 +N01tko80RIbJ6kBgQxd/WPHWqs26/A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-VebWtHNhPpiw_yEkII6F4A-1; Fri, 04 Feb 2022 10:29:20 -0500
X-MC-Unique: VebWtHNhPpiw_yEkII6F4A-1
Received: by mail-wr1-f72.google.com with SMTP id
 s25-20020adfa299000000b001d8d032255fso2149489wra.14
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8QrruDyW6g/F7VoaGIsGWoPEs/1uOsk8TZ4JQ+CYubs=;
 b=YBUsQ+3aEVYPhDja+X6PWF2bFaPzRYJEr4nFzFF5/74NyfiZeL8VA3wUWyUKLfOVx3
 Z259OpUbULtcxvOrhs5ZBf99XTCyZOYoak5zaMkzxFKTuZ+ONN0SVilUwOf6qRC0WhUs
 R54RV7kvtrUNhiEYE53GTE2YK9UGUFRh3luY4jKZdyEaI6xYw+vLmlfFzSpMNmnlOIIt
 4vckGV3NeUNvZ9q6VoVH8MF7vh9Wx9/XPNu0J+jIoFemE8jg8TdgqP72mASLllsgE1VZ
 mFNep8qFlzD3NbkzIjF0c55RNmuy3uT+ljBCHQiA9rqOX9t/NkD1mBHSXg39Es0fGeV2
 iatQ==
X-Gm-Message-State: AOAM531CXuMVY4rgvzYOIhe6I1bzt4foV+L29FP53dk6LVGl4un3klFS
 UXNJNDnW3W5D2w0/i/gPp8EO4s6yerdCKMLSPNESb7oBYzOVkaPNR15NYGhIOL3xpJn7PAQy9t6
 qZuOazs4CGMqW1VY=
X-Received: by 2002:adf:d090:: with SMTP id y16mr2821718wrh.18.1643988559017; 
 Fri, 04 Feb 2022 07:29:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw54YcYyYBs+FNztKbmr5mFAf7qFwryLgBPaSJYLqa0Oy/mHaoBnX0CfaCM3kiRrTBFo8nxbQ==
X-Received: by 2002:adf:d090:: with SMTP id y16mr2821703wrh.18.1643988558841; 
 Fri, 04 Feb 2022 07:29:18 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id bh19sm4227823wmb.1.2022.02.04.07.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:29:18 -0800 (PST)
Message-ID: <c1d88d16-7cba-6915-7d4d-2ad6e09890a4@redhat.com>
Date: Fri, 4 Feb 2022 16:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/10] target: Add missing "qemu/timer.h" include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-9-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-9-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.38, Philippe Mathieu-Daudé wrote:
> cpu_get_host_ticks() and NANOSECONDS_PER_SECOND are declared
> in "qemu/timer.h".

Seems like target/hppa/cpu.c uses neither of those? ... ok, but it uses 
timer_new_ns(), so the hunk is still ok. Maybe worth to mention it here in 
the commit description.

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/arm/cpu.c      | 1 +
>   target/arm/helper.c   | 1 +
>   target/hppa/cpu.c     | 1 +
>   target/riscv/csr.c    | 1 +
>   target/sparc/helper.c | 1 +
>   5 files changed, 5 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index cdbc4cdd01..9555f6707b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -20,6 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/qemu-print.h"
> +#include "qemu/timer.h"
>   #include "qemu-common.h"
>   #include "target/arm/idau.h"
>   #include "qemu/module.h"
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6dd241fbef..e39faa2a98 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -15,6 +15,7 @@
>   #include "exec/helper-proto.h"
>   #include "qemu/host-utils.h"
>   #include "qemu/main-loop.h"
> +#include "qemu/timer.h"
>   #include "qemu/bitops.h"
>   #include "qemu/crc32c.h"
>   #include "qemu/qemu-print.h"
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 37b763fca0..5f46ba801e 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -21,6 +21,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "qemu/qemu-print.h"
> +#include "qemu/timer.h"
>   #include "cpu.h"
>   #include "qemu/module.h"
>   #include "exec/exec-all.h"
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a4db40769b..45f04c701a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -19,6 +19,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
> +#include "qemu/timer.h"
>   #include "cpu.h"
>   #include "qemu/main-loop.h"
>   #include "exec/exec-all.h"
> diff --git a/target/sparc/helper.c b/target/sparc/helper.c
> index c7bcaa3a20..c4358bba84 100644
> --- a/target/sparc/helper.c
> +++ b/target/sparc/helper.c
> @@ -20,6 +20,7 @@
>   #include "qemu/osdep.h"
>   #include "cpu.h"
>   #include "exec/exec-all.h"
> +#include "qemu/timer.h"
>   #include "qemu/host-utils.h"
>   #include "exec/helper-proto.h"
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


