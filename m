Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251933C246
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:38:57 +0100 (CET)
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqF6-0005pu-A7
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLq77-0003GP-CJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLq75-0007IG-3s
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615825837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGq8Zij8g6ZPp4GHO4BaenUVNH9dvYYQhtcuUJKEQi0=;
 b=Rpth3sbl6HSYHkc2LJ/oHvK2C6lX+SdtvJw9BmGYoyZwWNJZYsK8jLayyFTt/sB8HAy/b+
 Rxd0Y4TPVdGgSJpfFrcjMkWrRD6i8FcQU58swFHIQZNZGtgvOOncRRoMrx0cpp+6bf9kRe
 VQIqmlytX74BDmtFwgPr5lnbcpXcnMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-fobyjdTAPeeVdSqy1bKrtg-1; Mon, 15 Mar 2021 12:30:35 -0400
X-MC-Unique: fobyjdTAPeeVdSqy1bKrtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29690802B7E;
 Mon, 15 Mar 2021 16:30:34 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C097D10027C4;
 Mon, 15 Mar 2021 16:30:33 +0000 (UTC)
Subject: Re: [PATCH v2 1/1] utils: Use fixed-point arithmetic in qemu_strtosz
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210315155835.1970210-1-richard.henderson@linaro.org>
 <20210315155835.1970210-2-richard.henderson@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f3354658-68b5-3975-cf73-9bf615e9e649@redhat.com>
Date: Mon, 15 Mar 2021 11:30:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315155835.1970210-2-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
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
Cc: thuth@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 10:58 AM, Richard Henderson wrote:
> Once we've parsed the fractional value, extract it into an integral
> 64-bit fraction.  Perform the scaling with integer arithemetic, and
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

This tweak makes sense ;)

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

dropped, because valf is already 0. Okay.

>              endptr++;
>          } else if (memchr(f, 'e', endptr - f) || memchr(f, 'E', endptr - f)) {
>              endptr = nptr;
>              retval = -EINVAL;
>              goto out;
> -        } else if (fraction != 0) {
> -            mul_required = true;
> +        } else {
> +            /* Extract into a 64-bit fixed-point fraction. */
> +            valf = (uint64_t)(fraction * 0x1p64);

Nice.

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

More verbose, but definitely exact.

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

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


