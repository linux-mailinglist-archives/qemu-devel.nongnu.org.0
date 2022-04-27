Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB0A511454
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:38:21 +0200 (CEST)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nje7n-0004Cj-58
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nje6Y-0003NK-Mh
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nje6V-00085j-7R
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651052217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rNnO3IU7tz0eQX2LZFN3nSnhjq4OkbmiqBU3SFTC5PE=;
 b=LG2tV0LLpnJVqNAS+nyDLTW8889pfbtvRP+DTWFaPYKAvcNgtpT1ADcDunrgewZkzdVgok
 wG6RheM4b19K5Tl9iVa6SH0XS2PRMNsj8nljL3aTc7YOLjx+42/lj6q/4qMXKcCFRnMulV
 vJ+pvmCb3xuNYop/JEj/h3lCivJrPpM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-jnvSs5oeNXmytbXN-ESpJg-1; Wed, 27 Apr 2022 05:36:56 -0400
X-MC-Unique: jnvSs5oeNXmytbXN-ESpJg-1
Received: by mail-wr1-f72.google.com with SMTP id
 l7-20020adfa387000000b0020acc61dbaeso532471wrb.7
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 02:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rNnO3IU7tz0eQX2LZFN3nSnhjq4OkbmiqBU3SFTC5PE=;
 b=f+LYTVeOhVtQdjSmIR37OSXy8oSECFtBkz4H6zOpsrqp5ah0q9wkw7BaV2B9MttXGn
 AOyvJ/HlN4/aVatOw4syt+ADNdKQNCVkxK3R7mq37l+/8iTZpn8dHZj9yYu71qKO6S2Z
 SxBBxXEelzpFN5Dlu8SDm4zLho/LOINd7M/NforzgeFjPfHvL0Lt5ryZFWLJ4GN0PKWz
 kDMIywHxOIRhlgOMVb8h4cMmvmW41A4qiopmojPmVcCmKDc4CVILrXzhcNy2uC7RcLG0
 UaPtveUyvkfa5bX3WCAfidAEerjjHqfLcIq+P3pubZfyzhGOhqEUzQ1Mdm5iZUKrUoyQ
 mgPw==
X-Gm-Message-State: AOAM5308Y1yTXWQfAAy0k4PFvq0KJRDxJeNzuDLDFWbmJ31Qz7n9m6WV
 U3ecPDqu22lOUiuHs1GAXoEeuvVAVK2vyn0hmwdd3SE3M9GFOCEOZOKylbRU7f62DwlRKlPnUti
 AsHfbeBiboea/3QY=
X-Received: by 2002:adf:d1c5:0:b0:20a:ef18:a09e with SMTP id
 b5-20020adfd1c5000000b0020aef18a09emr2012127wrd.466.1651052215485; 
 Wed, 27 Apr 2022 02:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoW54T2wEgQYS796c3CDoxLnUcKO81XrIsv8ZS8JA0alaeckp3wgkMZopHDBS+lgJuqreo8g==
X-Received: by 2002:adf:d1c5:0:b0:20a:ef18:a09e with SMTP id
 b5-20020adfd1c5000000b0020aef18a09emr2012109wrd.466.1651052215187; 
 Wed, 27 Apr 2022 02:36:55 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 w12-20020adf8bcc000000b002060e3da33fsm13221496wra.66.2022.04.27.02.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 02:36:54 -0700 (PDT)
Message-ID: <06a81083-ea77-8a35-ce55-0dd918bf1aef@redhat.com>
Date: Wed, 27 Apr 2022 11:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 02/26] Use QEMU_SANITIZE_ADDRESS
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220426092715.3931705-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Floppy" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2022 11.26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/fdc-test.c    | 2 +-
>   util/coroutine-ucontext.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index 4aa72f36431f..0b3c2c0d523f 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -550,7 +550,7 @@ static void fuzz_registers(void)
>   
>   static bool qtest_check_clang_sanitizer(void)
>   {
> -#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
> +#ifdef QEMU_SANITIZE_ADDRESS
>       return true;
>   #else
>       g_test_skip("QEMU not configured using --enable-sanitizers");
> diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
> index 904b375192ca..ed368e1a3ec3 100644
> --- a/util/coroutine-ucontext.c
> +++ b/util/coroutine-ucontext.c
> @@ -30,7 +30,7 @@
>   #include <valgrind/valgrind.h>
>   #endif
>   
> -#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
> +#ifdef QEMU_SANITIZE_ADDRESS
>   #ifdef CONFIG_ASAN_IFACE_FIBER
>   #define CONFIG_ASAN 1
>   #include <sanitizer/asan_interface.h>

Reviewed-by: Thomas Huth <thuth@redhat.com>


