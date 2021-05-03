Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039023713DE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:54:56 +0200 (CEST)
Received: from localhost ([::1]:53364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWE3-00060a-40
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldWC8-0004h6-08
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldWC5-00089L-E9
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620039172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OwCrzQgttmr8wvWuygUit7j+teAooee3pksF0qVMw8=;
 b=W92ZxakeCMYgbo0ejlw83Llif9DjWf7CGn83Wo4lQyyFwArhfLV5yLaXcWlurmLnlOh6Pq
 fzPQfBB/7Ubbl1OioR4/Rc+HcEtKmt3dGOSGsXHPcq5qzEvzuu/kiGvcrpMXwinlaEuzRV
 zkU9bYlC2h8qr02uRiEapogcBr6f2S4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-QnI3KrazPtOcMY5nNODyGA-1; Mon, 03 May 2021 06:52:50 -0400
X-MC-Unique: QnI3KrazPtOcMY5nNODyGA-1
Received: by mail-wr1-f72.google.com with SMTP id
 63-20020adf84450000b029010dd0171a96so3123159wrf.21
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 03:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/OwCrzQgttmr8wvWuygUit7j+teAooee3pksF0qVMw8=;
 b=ZrhaE5jHOhMjBni5ifE0/9ANL140X55kKxal0FRZAlLPQkOoBUH8ZfE589w3XYxwQL
 vI1s6XTGyp5mHByYZyyrBZozJHk8et3fMLxaNlhRBvhxok40BbAvNCha9Q+cuS5kLxV/
 CaM15gmnZqIh3X7dKJKZsmrrGIqaYPe37e5yGf403XngBJEvEGGXfYbU+CYtIAtFind5
 mLgQa1p9hJWnHI1ZoSE/0MecX206EcnfPxUOdV1dqNdl9nO++lUw371HbxzTJ2bVfY9Y
 VmcY+kSIbdgbCziAw5RJ0+uHQ18dCTpGvrc1w/gBkpE36RZgYNJvzxs2RnjJYbXgKvHQ
 Ak/g==
X-Gm-Message-State: AOAM532QCYOD2bKHXwq+hCbhlZY+2mF+LsnH17PJFdaoqvSLlTYbWt0s
 K/eZawsFQHfDQa6idAp46J+njeFUDJP1sAtBw5d+tJLKEld+r+0fT2WDYpylfMCwzEfj4cHcac1
 3thTa3S98DazNkVw=
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr24511345wrn.262.1620039169850; 
 Mon, 03 May 2021 03:52:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwfuPWtQvOStI/SgQadXtSkgi3+3C0oZLR4dq6PFHX1lq6U/6jXqk/3MyCkIHs/kaOmRttSw==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr24511335wrn.262.1620039169655; 
 Mon, 03 May 2021 03:52:49 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id t206sm11139017wmb.11.2021.05.03.03.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 03:52:49 -0700 (PDT)
Subject: Re: [PATCH 2/2] Drop the deprecated unicore32 target
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210503084034.3804963-1-armbru@redhat.com>
 <20210503084034.3804963-3-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7e482318-7e44-a498-c129-fdf25d24ba0c@redhat.com>
Date: Mon, 3 May 2021 12:52:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503084034.3804963-3-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2021 10.40, Markus Armbruster wrote:
> Target unicore32 was deprecated in commit 8e4ff4a8d2b, v5.2.0.  See
> there for rationale.
> 
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
[...]
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index e914d34298..2592c4fbd5 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -198,14 +198,6 @@ from Linux upstream kernel, declare it deprecated.
>   System emulator CPUS
>   --------------------
>   
> -``unicore32`` CPUs (since 5.2.0)
> -''''''''''''''''''''''''''''''''
> -
> -The ``unicore32`` guest CPU support is deprecated and will be removed in
> -a future version of QEMU. Support for this CPU was removed from the
> -upstream Linux kernel, and there is no available upstream toolchain
> -to build binaries for it.
> -
>   ``Icelake-Client`` CPU Model (since 5.2.0)
>   ''''''''''''''''''''''''''''''''''''''''''
>   
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index e9850e4b96..b399084438 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -293,12 +293,19 @@ available to make sure that the code is still working, so it has been removed
>   without replacement.
>   
>   ``lm32`` CPUs (removed in 6.1.0)
> -'''''''''''''''''''''''''''
> +''''''''''''''''''''''''''''''''

Nit: That hunk should go into the previous patch.

> diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
> index 45b7bf81dc..b5b50537bf 100644
> --- a/fpu/softfloat-specialize.c.inc
> +++ b/fpu/softfloat-specialize.c.inc
> @@ -103,7 +103,7 @@ static inline bool snan_bit_is_one(float_status *status)
>   {
>   #if defined(TARGET_MIPS)
>       return status->snan_bit_is_one;
> -#elif defined(TARGET_HPPA) || defined(TARGET_UNICORE32) || defined(TARGET_SH4)
> +#elif defined(TARGET_HPPA) || defined(TARGET_SH4)
>       return 1;
>   #else
>       return 0;
> @@ -146,11 +146,10 @@ static FloatParts parts_default_nan(float_status *status)
>       /* snan_bit_is_one, set msb-1.  */
>       frac = 1ULL << (DECOMPOSED_BINARY_POINT - 2);
>   #else
> -    /* This case is true for Alpha, ARM, MIPS, OpenRISC, PPC, RISC-V,
> -     * S390, SH4, TriCore, and Xtensa.  I cannot find documentation
> -     * for Unicore32; the choice from the original commit is unchanged.
> -     * Our other supported targets, CRIS, Nios2, and Tile,
> -     * do not have floating-point.
> +    /*
> +     * This case is true for Alpha, ARM, MIPS, OpenRISC, PPC, RISC-V,
> +     * S390, SH4, TriCore, and Xtensa.  Our other supported targets,
> +     * CRIS, Nios2, and Tile, do not have floating-point.
>        */

I guess you'll get a conflict here with my moxie removal patch... but that 
should be easy to solve.

FWIW:
Acked-by: Thomas Huth <thuth@redhat.com>


