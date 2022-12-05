Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F26642759
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 12:18:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p29UU-0006is-Hc; Mon, 05 Dec 2022 06:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p29U0-0006gb-95
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:18:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p29Tx-0002Ce-Ny
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 06:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670239076;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LetsqzFOTFV1U4h4ZlaC4eRX9cxd3NapeFOgJEvQjF0=;
 b=MbVx/unDOQgC8HtjcJ3N/asKQFxUO6luF59OebjN8nbEt8He6zEunIqTrEabCQH5BCJQCA
 zh4CB9wUytBZXeCyWBXLIHEOV5USZ0RZFHW4vI85oc8WCx8eUKbDQv5SwSdeM+pE5E3ShO
 tJ2EklxizU6AnmRUnHIfLNJk/pbzdYs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-pAy-6SLaMFyBs0BFzDR0UQ-1; Mon, 05 Dec 2022 06:17:55 -0500
X-MC-Unique: pAy-6SLaMFyBs0BFzDR0UQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23026185A78B;
 Mon,  5 Dec 2022 11:17:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6997F40C6EC3;
 Mon,  5 Dec 2022 11:17:54 +0000 (UTC)
Date: Mon, 5 Dec 2022 11:17:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, tstellar@redhat.com
Subject: Re: [PATCH 1/2] util/bufferiszero: Use __attribute__((target)) for
 avx2/avx512
Message-ID: <Y43TXpkMDYAZy18k@redhat.com>
References: <20221204015123.362726-1-richard.henderson@linaro.org>
 <20221204015123.362726-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221204015123.362726-2-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Dec 03, 2022 at 07:51:22PM -0600, Richard Henderson wrote:
> Use the attribute, which is supported by clang, instead of
> the #pragma, which is not supported and, for some reason,
> also not detected by the meson probe, so we fail by -Werror.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build         |  8 ++------
>  util/bufferiszero.c | 41 ++++++-----------------------------------
>  2 files changed, 8 insertions(+), 41 deletions(-)
> 


> diff --git a/util/bufferiszero.c b/util/bufferiszero.c
> index ec3cd4ca15..1790ded7d4 100644
> --- a/util/bufferiszero.c
> +++ b/util/bufferiszero.c
> @@ -64,18 +64,11 @@ buffer_zero_int(const void *buf, size_t len)
>  }
>  
>  #if defined(CONFIG_AVX512F_OPT) || defined(CONFIG_AVX2_OPT) || defined(__SSE2__)
> -/* Do not use push_options pragmas unnecessarily, because clang
> - * does not support them.
> - */
> -#if defined(CONFIG_AVX512F_OPT) || defined(CONFIG_AVX2_OPT)
> -#pragma GCC push_options
> -#pragma GCC target("sse2")
> -#endif
> -#include <emmintrin.h>

So the old code included emmintrin.h, and possibly either
immintrin.h / simmintrin.h, but the new code only
includes immintrin.h.

I'm not saying that's wrong, I'm just wondering why it is
changing, as it feels possibly tangential to the pragma
-> attribute conversion. Could you mention this in the
commit message, or split it to a separate cleanup patch
if its a functionally unrelated change.

> +#include <immintrin.h>
>  
>  /* Note that each of these vectorized functions require len >= 64.  */
>  
> -static bool
> +static bool __attribute__((target("sse2")))
>  buffer_zero_sse2(const void *buf, size_t len)
>  {
>      __m128i t = _mm_loadu_si128(buf);
> @@ -104,20 +97,9 @@ buffer_zero_sse2(const void *buf, size_t len)
>  
>      return _mm_movemask_epi8(_mm_cmpeq_epi8(t, zero)) == 0xFFFF;
>  }
> -#if defined(CONFIG_AVX512F_OPT) || defined(CONFIG_AVX2_OPT)
> -#pragma GCC pop_options
> -#endif
>  
>  #ifdef CONFIG_AVX2_OPT
> -/* Note that due to restrictions/bugs wrt __builtin functions in gcc <= 4.8,
> - * the includes have to be within the corresponding push_options region, and
> - * therefore the regions themselves have to be ordered with increasing ISA.
> - */
> -#pragma GCC push_options
> -#pragma GCC target("sse4")
> -#include <smmintrin.h>
> -
> -static bool
> +static bool __attribute__((target("sse4")))
>  buffer_zero_sse4(const void *buf, size_t len)
>  {
>      __m128i t = _mm_loadu_si128(buf);
> @@ -145,12 +127,7 @@ buffer_zero_sse4(const void *buf, size_t len)
>      return _mm_testz_si128(t, t);
>  }
>  
> -#pragma GCC pop_options
> -#pragma GCC push_options
> -#pragma GCC target("avx2")
> -#include <immintrin.h>
> -
> -static bool
> +static bool __attribute__((target("avx2")))
>  buffer_zero_avx2(const void *buf, size_t len)
>  {
>      /* Begin with an unaligned head of 32 bytes.  */
> @@ -176,15 +153,10 @@ buffer_zero_avx2(const void *buf, size_t len)
>  
>      return _mm256_testz_si256(t, t);
>  }
> -#pragma GCC pop_options
>  #endif /* CONFIG_AVX2_OPT */
>  
>  #ifdef CONFIG_AVX512F_OPT
> -#pragma GCC push_options
> -#pragma GCC target("avx512f")
> -#include <immintrin.h>
> -
> -static bool
> +static bool __attribute__((target("avx512f")))
>  buffer_zero_avx512(const void *buf, size_t len)
>  {
>      /* Begin with an unaligned head of 64 bytes.  */
> @@ -210,8 +182,7 @@ buffer_zero_avx512(const void *buf, size_t len)
>      return !_mm512_test_epi64_mask(t, t);
>  
>  }
> -#pragma GCC pop_options
> -#endif
> +#endif /* CONFIG_AVX512F_OPT */
>  
>  
>  /* Note that for test_buffer_is_zero_next_accel, the most preferred
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


