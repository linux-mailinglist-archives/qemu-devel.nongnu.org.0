Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B5366D57
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 15:57:01 +0200 (CEST)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZDLg-0006vs-0C
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 09:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZDKI-0006Ih-8m
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 09:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZDKD-0002Go-Rr
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 09:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619013327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elYDIEgVD6HnltqZOeOrDAIgtq7FbAVRqhWKq+zak9E=;
 b=NmlD9NtyD4uIPpfaCq4MQdkYw83tjpkTrwyB6MWZnRFf5hYYNKesmH9sDhWYABPwW/L9kc
 knONjaJGQRV4IE0m5OeqwUBr8K1W6wXE9N7Y3Z+QVFKcpago3uOqdd2f0uuI4Awj7XBeaR
 zo+sw+bzyQHnbz21/3FHrV6vTCIX6RQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-qbB6bK2lNk6bJxUoVktH-w-1; Wed, 21 Apr 2021 09:55:25 -0400
X-MC-Unique: qbB6bK2lNk6bJxUoVktH-w-1
Received: by mail-ej1-f71.google.com with SMTP id
 c18-20020a17090603d2b029037c77ad778eso5897838eja.1
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 06:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=elYDIEgVD6HnltqZOeOrDAIgtq7FbAVRqhWKq+zak9E=;
 b=Olo8VJ0j10DzMqBlmrkA5TezE1eenrs4vPLPVjmNJk4Ig1GnPbfieWyt/PQkAmmyxE
 T9Y1uWmdgDxtFXf8ILyf60Z4Ry/8P5xyQicgIfz/uh4nj8Ug0882t+jQLAB4LPsneVTZ
 MJpsWBFG0l33meE4myGS7S0qE2YJm+w1hDA4Xqk+kQii7Cx9awoawfOvpKjdI4rvRYqM
 AYZaADkjR48+HL542Qz72CtsS7Wyc1Sb31UTXC0c9fCCt7s+vTKt8pcv1lQP+m/vyti/
 J0O2mDjiiqRAb48ih0nzBqby37GaYEiU5Dqjm4wOvKvYlc6JjFtqAD9ZKvRrqrjNng8K
 93Tw==
X-Gm-Message-State: AOAM530pQJIedI30c7ongcq3AthvwnrIQ290fLPUKkndX7hMoPtoUNSM
 WVu0NOkA5K0H4rHKj0GCj78AWcRLSupVe98QQXNfSqaNDRjqJXR9FZBlzEXB5yrkN6PDZ8UxDDs
 bWeOO8ECX/MFiBqo=
X-Received: by 2002:a05:6402:1157:: with SMTP id
 g23mr38687014edw.303.1619013324761; 
 Wed, 21 Apr 2021 06:55:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNNfnIrKCoz4NBiXFKyyzvfoIyAV5VbXb02hzv39iC49gima0hhZFYwc1aiIAkh5YJktx/3w==
X-Received: by 2002:a05:6402:1157:: with SMTP id
 g23mr38686994edw.303.1619013324565; 
 Wed, 21 Apr 2021 06:55:24 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o6sm3425112edw.24.2021.04.21.06.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 06:55:23 -0700 (PDT)
Subject: Re: [PATCH] Fix typo in CFI build documentation
To: Serge Guelton <sguelton@redhat.com>, qemu-devel@nongnu.org
References: <1618933722-18022-1-git-send-email-sguelton@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fb5eb9f9-7087-6a95-34e2-a23fd045e8bb@redhat.com>
Date: Wed, 21 Apr 2021 15:55:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1618933722-18022-1-git-send-email-sguelton@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Serge,

Cc'ing qemu-trivial@

On 4/20/21 5:48 PM, serge-sans-paille wrote:
> Signed-off-by: serge-sans-paille <sguelton@redhat.com>

It looks your git-config is misconfigured... Maybe you used
an incorrect profile :) Can you repost please?

> ---
>  docs/devel/control-flow-integrity.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

For the fix:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
> index d89d707..e6b73a4 100644
> --- a/docs/devel/control-flow-integrity.rst
> +++ b/docs/devel/control-flow-integrity.rst
> @@ -39,7 +39,7 @@ later).
>  Given the use of LTO, a version of AR that supports LLVM IR is required.
>  The easies way of doing this is by selecting the AR provided by LLVM::
>  
> - AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
> + AR=llvm-ar-9 CC=clang-9 CXX=clang++-9 /path/to/configure --enable-cfi
>  
>  CFI is enabled on every binary produced.
>  
> @@ -131,7 +131,7 @@ lld with version 11+.
>  In other words, to compile with fuzzing and CFI, clang 11+ is required, and
>  lld needs to be used as a linker::
>  
> - AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
> + AR=llvm-ar-11 CC=clang-11 CXX=clang++-11 /path/to/configure --enable-cfi \
>                             -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
>  
>  and then, compile the fuzzers as usual.
> 


