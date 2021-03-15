Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046F33C187
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:21:44 +0100 (CET)
Received: from localhost ([::1]:54144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpyP-0002S0-H2
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLpuo-0007gJ-Ex
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLpuj-0002ou-UM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615825073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtLBH4DNT43vLj0ATEaPKxgtckEwdvba/iAUB6fSBR0=;
 b=auR31///SYyV6wM8qlMd6VSj8AI4tAuRrzeFvb4Vnu7kkaqOMaLCxvY4NRpcfijMYRXinB
 TysrzkUMDf+NVOHFwIwzpntioCEGaMyKZXoEDeiCiP17EIjvsv4Npw5vlQ3QCGasvnyzTs
 ftqHdytehBl+BExAqSV4b0gxJE+maeg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-1ejNItclN4OLMCEsRykp6Q-1; Mon, 15 Mar 2021 12:17:51 -0400
X-MC-Unique: 1ejNItclN4OLMCEsRykp6Q-1
Received: by mail-wr1-f72.google.com with SMTP id h21so15175138wrc.19
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XtLBH4DNT43vLj0ATEaPKxgtckEwdvba/iAUB6fSBR0=;
 b=aFOHFnut1OmZ097+4ZLGxa9GZ1g6wRQWWdo425uzok8PyBsOnKTc4jYV9c+Ia4fD0m
 2e5CuwiQEWUh6ReC566D6xI/L/qAr7ndhqbgVdXOtHKwTVgicMgE5jYPgFgTorTwa0Ei
 CkrXsSfBj9EEks15rJvvFF5Vx5NxXnhmzFrQYiNhp9o6OOKUAvLOGqR7I1nW9ElQHBLC
 x1H6h0qY5yTswVYFCO/HRQ0pHlO4Qr0xrpcQuMopVua8gCqMsKC4lOGSfiiMXBWF++M0
 ob4p0VC+x8VvoDp39uZ4QH4JRCZ9oh17Ir4zRuKnH7NyF8gdCdtKbzuK3d0stfGqkrYK
 nEvg==
X-Gm-Message-State: AOAM5300nXgtOoLrZD5yGvM0cjwsjBmjDj4OEo4Zjj7jqG4C0bjnuFQ2
 +R4QPF1VPaVhKxtixm68saw/mOsAa3OKG1ra5PQiZIZn4yUDWqC0W9XiBiC0gR2qVTFdV6hCN1x
 WCalqrgsr9vTbX6U=
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr469404wrn.338.1615825069994;
 Mon, 15 Mar 2021 09:17:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh8mGi3Srjlse46rRHvghhnYxOEV/PvGsPvcPHZzsbBFLLSJI4JrMBEvgWeQuENdAzDv+c1A==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr469388wrn.338.1615825069807;
 Mon, 15 Mar 2021 09:17:49 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w6sm20152192wrl.49.2021.03.15.09.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 09:17:49 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] utils: Use fixed-point arithmetic in qemu_strtosz
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210315155835.1970210-1-richard.henderson@linaro.org>
 <20210315155835.1970210-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d030bfa3-79a0-ebf0-0a6e-0fbab902dfe6@redhat.com>
Date: Mon, 15 Mar 2021 17:17:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315155835.1970210-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 4:58 PM, Richard Henderson wrote:
> Once we've parsed the fractional value, extract it into an integral
> 64-bit fraction.  Perform the scaling with integer arithemetic, and

Typo "arithmetic"

> simplify the overflow detection.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/unit/test-cutils.c |  2 +-
>  util/cutils.c            | 50 ++++++++++++++++++++++++++++------------
>  2 files changed, 36 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
> index bad3a60993..e025b54c05 100644
> --- a/tests/unit/test-cutils.c
> +++ b/tests/unit/test-cutils.c
> @@ -2128,7 +2128,7 @@ static void test_qemu_strtosz_float(void)
>      str = "12.345M";
>      err = qemu_strtosz(str, &endptr, &res);
>      g_assert_cmpint(err, ==, 0);
> -    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB));
> +    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB + 0.5));
>      g_assert(endptr == str + 7);
>  }
>  
> diff --git a/util/cutils.c b/util/cutils.c
> index d89a40a8c3..c442882b88 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -275,10 +275,9 @@ static int do_strtosz(const char *nptr, const char **end,
>      int retval;
>      const char *endptr, *f;
>      unsigned char c;
> -    bool mul_required = false, hex = false;
> -    uint64_t val;
> +    bool hex = false;
> +    uint64_t val, valf = 0;
>      int64_t mul;
> -    double fraction = 0.0;
>  
>      /* Parse integral portion as decimal. */
>      retval = qemu_strtou64(nptr, &endptr, 10, &val);
> @@ -308,17 +307,19 @@ static int do_strtosz(const char *nptr, const char **end,
>           * without fractional digits.  If we see an exponent, treat
>           * the entire input as invalid instead.
>           */
> +        double fraction;
> +
>          f = endptr;
>          retval = qemu_strtod_finite(f, &endptr, &fraction);
>          if (retval) {
> -            fraction = 0.0;
>              endptr++;
>          } else if (memchr(f, 'e', endptr - f) || memchr(f, 'E', endptr - f)) {
>              endptr = nptr;
>              retval = -EINVAL;
>              goto out;
> -        } else if (fraction != 0) {
> -            mul_required = true;

I'm glad you removed this float-equal warning:

util/cutils.c: In function ‘do_strtosz’:
util/cutils.c:320:29: error: comparing floating-point with ‘==’ or ‘!=’
is unsafe [-Werror=float-equal]
  320 |         } else if (fraction != 0) {
      |                             ^~
cc1: all warnings being treated as errors

> +        } else {
> +            /* Extract into a 64-bit fixed-point fraction. */
> +            valf = (uint64_t)(fraction * 0x1p64);
>          }
>      }
>      c = *endptr;
> @@ -333,16 +334,35 @@ static int do_strtosz(const char *nptr, const char **end,
>          mul = suffix_mul(default_suffix, unit);
>          assert(mul > 0);
>      }
> -    if (mul == 1 && mul_required) {
> -        endptr = nptr;
> -        retval = -EINVAL;
> -        goto out;
> +    if (mul == 1) {
> +        /* When a fraction is present, a scale is required. */
> +        if (valf != 0) {
> +            endptr = nptr;
> +            retval = -EINVAL;
> +            goto out;
> +        }
> +    } else {
> +        uint64_t valh, tmp;
> +
> +        /* Compute exact result: 64.64 x 64.0 -> 128.64 fixed point */
> +        mulu64(&val, &valh, val, mul);
> +        mulu64(&valf, &tmp, valf, mul);
> +        val += tmp;
> +        valh += val < tmp;
> +
> +        /* Round 0.5 upward. */
> +        tmp = valf >> 63;
> +        val += tmp;
> +        valh += val < tmp;
> +
> +        /* Report overflow. */
> +        if (valh != 0) {
> +            retval = -ERANGE;
> +            goto out;
> +        }
>      }
> -    if (val > (UINT64_MAX - ((uint64_t) (fraction * mul))) / mul) {
> -        retval = -ERANGE;
> -        goto out;
> -    }
> -    *result = val * mul + (uint64_t) (fraction * mul);
> +
> +    *result = val;
>      retval = 0;
>  
>  out:
> 


