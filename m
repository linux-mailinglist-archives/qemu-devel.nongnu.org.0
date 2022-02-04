Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD294A9C0E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:34:48 +0100 (CET)
Received: from localhost ([::1]:43226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0bo-0006sU-0a
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:34:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0Xr-00042z-Tp
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:30:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0Xp-0004bS-Az
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643988640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTy/hSpZbkTIpeWzwzWkZoW2kDVps/w53bosvIq6Hr0=;
 b=KxvGmuGtk1xqg7J2s8i+K1NkXNkAaziQu9MoxCsC86yT+GlNC84vNIh7OQ56hOsM7HyY+h
 fpZQTJkD4gvtbNzlD5lLsckpzo5zQ0Goh/lCQ9zKr7EQDBsVJwUeoIlfMh2YVdrERE081b
 6GeAmH6eGY3V76uIsfuLRWx9iCILoKs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-eWTqW3hvMYGOHOPqo7ry5A-1; Fri, 04 Feb 2022 10:30:33 -0500
X-MC-Unique: eWTqW3hvMYGOHOPqo7ry5A-1
Received: by mail-wr1-f69.google.com with SMTP id
 k7-20020adfb347000000b001dd761d46c7so2161018wrd.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KTy/hSpZbkTIpeWzwzWkZoW2kDVps/w53bosvIq6Hr0=;
 b=tc1eyMSwxhZ19L54crFJQRVula8ll8Ab6z0k19IZSgQ1rLeb/FgorMd1pCWwUNNQah
 /3iZ3NzupueYsJkK2H1RTj+jNQ89txN2bIoj69oslxuM2WlvCS0oz/kkIJUjWOnXDXIy
 QZ7iYINfki4nOOxeiXhkgFUoNO/On4zinv3SohGGw8lbZw393RKxTYP89clxKGi6uN6U
 kpSHWkg+hVo+myKMlmiLS1A1iUzgCgFB8hnjBUSC7RGOuuC5FFQenN6SBENenCtAWcAF
 ER4e/uQ9KyDv4BRNPFLxuOesAoL6zuTkJ3HQiyiSBJUhWtu9rCAVMbsS2MkS4hlTRb9c
 XGmg==
X-Gm-Message-State: AOAM5339wICZ97PXfLv6naw2tMl0yKt1lWrSZleGbdFo/6i/kC5eX3eI
 yU0djA5fUoprV1K5zUZdW76drEBQeIVu1DoPTY+I7Qbb+VD3Vnpw+uFPthdOuFd++lEPdj46Auo
 h38f6lxszb4ZY91E=
X-Received: by 2002:a1c:f309:: with SMTP id q9mr2651753wmq.173.1643988632744; 
 Fri, 04 Feb 2022 07:30:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywki0LqvcKvgdN2SJ/tbfCo57QF8Z09zomZ2BbTRUc5IJCLITk2JD01mZITTxcVr3/YJ4xcQ==
X-Received: by 2002:a1c:f309:: with SMTP id q9mr2651731wmq.173.1643988632484; 
 Fri, 04 Feb 2022 07:30:32 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id j9sm2232168wro.8.2022.02.04.07.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:30:31 -0800 (PST)
Message-ID: <020b5a0f-8856-cc79-16d2-ad21771eec65@redhat.com>
Date: Fri, 4 Feb 2022 16:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/10] linux-user: Add missing "qemu/timer.h" include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-10-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-10-f4bug@amsat.org>
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
 SPF_PASS=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.38, Philippe Mathieu-Daudé wrote:
> "qemu/timer.h" declares cpu_get_host_ticks().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/i386/cpu_loop.c | 1 +
>   linux-user/ppc/cpu_loop.c  | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index 29dfd7cd0c..90bffc1956 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -20,6 +20,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu-common.h"
>   #include "qemu.h"
> +#include "qemu/timer.h"
>   #include "user-internals.h"
>   #include "cpu_loop-common.h"
>   #include "signal-common.h"
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index 46e6ffd6d3..ffe39851ed 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -20,6 +20,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu-common.h"
>   #include "qemu.h"
> +#include "qemu/timer.h"
>   #include "user-internals.h"
>   #include "cpu_loop-common.h"
>   #include "signal-common.h"

Reviewed-by: Thomas Huth <thuth@redhat.com>


