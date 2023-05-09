Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE566FCD0D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:55:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwRXt-0004lm-Rq; Tue, 09 May 2023 13:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwRXq-0004lI-Ju
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwRXo-00083M-TG
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683654875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htAAoIOorxX9dywSuxYflalLwAotsxSpOXtfAKEkzz8=;
 b=HkZe+tpwmrxAEuqXAvNCxxvw0EPtjWUukCeWYp4QipKkoQObNZNkKayE+LPn1QbkGpMdms
 4yvzA9JtErVCvrnR7IKdXzOFDi30TqaRbPVZObh55QQR56gqLJL7lwmbwFZUVvKN4MJ5lL
 0qz3Cqt+V+WoFIwwgj3fUWjaNlzgQaY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632--hyJP3SRM7eBIdAzb0Yimw-1; Tue, 09 May 2023 13:54:34 -0400
X-MC-Unique: -hyJP3SRM7eBIdAzb0Yimw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50d89279d95so7997504a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 10:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683654873; x=1686246873;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=htAAoIOorxX9dywSuxYflalLwAotsxSpOXtfAKEkzz8=;
 b=h/F01uGTyHWVlGL0y1cwL6bPoGfQV5ShnRh7I9tCBTZYsEvonZVJRNI+PimCal4qQP
 QaJ8mtGOJG1pXKCAA2/8VgURz/6p4PIQSgJ44FONK5GQqisCMtxEhbdRM974826RkMfM
 dQTe0JgcRypJZnsIZwDimQH7wWxWtd/9hILKTgio2D6pexDPAQoDfoAXYPJqeBPd4GJn
 9QrqRWwwjsQbpNgSssD005NwjFgrHVfGiL0gPQbs6lsFOCCwW2Qti7SZNEFbbYcYzgHz
 /fggEC6XeUdzNvjaATvR5rVGzMx7sW5K1vvat4CrTl+8zyMVABanL6VDFDKb9gXcSo/m
 KCcw==
X-Gm-Message-State: AC+VfDzdt219XU6D2Pbff8Icb7rBLCL/9g6KJ9AE1cU6okk7d+I5PtWi
 ifSRxjPKqGeTeKGfXilG4S9q27OJcOfCWIhJyNYfX5LWv1vEGv9ScMaXSHi7O+U+sjcDshe/r18
 ZnVINNYKmMtkrZkJWX7Rtzfc=
X-Received: by 2002:aa7:ccc6:0:b0:50b:dfe2:91 with SMTP id
 y6-20020aa7ccc6000000b0050bdfe20091mr12680156edt.7.1683654872786; 
 Tue, 09 May 2023 10:54:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ51QdzVPcKarGL0rN8mrC3lQ0ZXFFyGfjqXVWDxZGGD+toxorIHI/ji4AndhuZPloLEvr9htA==
X-Received: by 2002:aa7:ccc6:0:b0:50b:dfe2:91 with SMTP id
 y6-20020aa7ccc6000000b0050bdfe20091mr12680143edt.7.1683654872418; 
 Tue, 09 May 2023 10:54:32 -0700 (PDT)
Received: from ?IPV6:2003:cf:d706:2e02:6e14:9279:969b:d328?
 (p200300cfd7062e026e149279969bd328.dip0.t-ipconnect.de.
 [2003:cf:d706:2e02:6e14:9279:969b:d328])
 by smtp.gmail.com with ESMTPSA id
 w17-20020aa7d291000000b0050c524253dasm1050312edq.20.2023.05.09.10.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 10:54:31 -0700 (PDT)
Message-ID: <40919a58-2bb2-f156-ddc0-49c117a8f031@redhat.com>
Date: Tue, 9 May 2023 19:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 11/11] cutils: Improve qemu_strtosz handling of fractions
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-12-eblake@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230508200343.791450-12-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08.05.23 22:03, Eric Blake wrote:
> We have several limitations and bugs worth fixing; they are
> inter-related enough that it is not worth splitting this patch into
> smaller pieces:
>
> * ".5k" should work to specify 512, just as "0.5k" does
> * "1.9999k" and "1." + "9"*50 + "k" should both produce the same
>    result of 2048 after rounding
> * "1." + "0"*350 + "1B" should not be treated the same as "1.0B";
>    underflow in the fraction should not be lost
> * "7.99e99" and "7.99e999" look similar, but our code was doing a
>    read-out-of-bounds on the latter because it was not expecting ERANGE
>    due to overflow. While we document that scientific notation is not
>    supported, and the previous patch actually fixed
>    qemu_strtod_finite() to no longer return ERANGE overflows, it is
>    easier to pre-filter than to try and determine after the fact if
>    strtod() consumed more than we wanted.  Note that this is a
>    low-level semantic change (when endptr is not NULL, we can now
>    successfully parse with a scale of 'E' and then report trailing
>    junk, instead of failing outright with EINVAL); but an earlier
>    commit already argued that this is not a high-level semantic change
>    since the only caller passing in a non-NULL endptr also checks that
>    the tail is whitespace-only.
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1629
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/unit/test-cutils.c | 51 +++++++++++------------
>   util/cutils.c            | 89 ++++++++++++++++++++++++++++------------
>   2 files changed, 88 insertions(+), 52 deletions(-)

[...]

> diff --git a/util/cutils.c b/util/cutils.c
> index 0e056a27a44..d1dfbc69d16 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c

[...]

> @@ -246,27 +244,66 @@ static int do_strtosz(const char *nptr, const char **end,
>               retval = -EINVAL;
>               goto out;
>           }
> -    } else if (*endptr == '.') {
> +    } else if (*endptr == '.' || (endptr == nptr && strchr(nptr, '.'))) {

What case is there where we have a fraction but *endptr != '.'?

>           /*
>            * Input looks like a fraction.  Make sure even 1.k works
> -         * without fractional digits.  If we see an exponent, treat
> -         * the entire input as invalid instead.
> +         * without fractional digits.  strtod tries to treat 'e' as an
> +         * exponent, but we want to treat it as a scaling suffix;
> +         * doing this requires modifying a copy of the fraction.
>            */
> -        double fraction;
> +        double fraction = 0.0;
>
> -        f = endptr;
> -        retval = qemu_strtod_finite(f, &endptr, &fraction);
> -        if (retval) {
> +        if (retval == 0 && *endptr == '.' && !isdigit(endptr[1])) {
> +            /* If we got here, we parsed at least one digit already. */
>               endptr++;
> -        } else if (memchr(f, 'e', endptr - f) || memchr(f, 'E', endptr - f)) {
> -            endptr = nptr;
> -            retval = -EINVAL;
> -            goto out;
>           } else {
> -            /* Extract into a 64-bit fixed-point fraction. */
> +            char *e;
> +            const char *tail;
> +            g_autofree char *copy = g_strdup(endptr);
> +
> +            e = strchr(copy, 'e');
> +            if (e) {
> +                *e = '\0';
> +            }
> +            e = strchr(copy, 'E');
> +            if (e) {
> +                *e = '\0';
> +            }
> +            /*
> +             * If this is a floating point, we are guaranteed that '.'
> +             * appears before any possible digits in copy.  If it is
> +             * not a floating point, strtod will fail.  Either way,
> +             * there is now no exponent in copy, so if it parses, we
> +             * know 0.0 <= abs(result) <= 1.0 (after rounding), and
> +             * ERANGE is only possible on underflow which is okay.
> +             */
> +            retval = qemu_strtod_finite(copy, &tail, &fraction);
> +            endptr += tail - copy;
> +        }
> +
> +        /* Extract into a 64-bit fixed-point fraction. */
> +        if (fraction == 1.0) {
> +            if (val == UINT64_MAX) {
> +                retval = -ERANGE;
> +                goto out;
> +            }
> +            val++;
> +        } else if (retval == -ERANGE) {
> +            /* See comments above about underflow */
> +            valf = 1;

It doesn’t really matter because even an EiB is just 2^60, and so 1 EiB 
* 2^-64 (the resolution of our fractional part) is still less than 1, but:

DBL_MIN * 0x1p64 is 2^-(1022-64) == 2^-958, i.e. much less than 1, so 
I’d set valf to 0 here.

(If you put “.00000000000000000001” into this, there won’t be an 
underflow, but the value is so small that valf ends up 0.  But if you 
put `.$(yes 0 | head -n 307 | tr -d '\n')1` into this, there will be an 
underflow, setting valf to 1, even though the value is smaller.)

Hanna

> +            retval = 0;
> +        } else {
>               valf = (uint64_t)(fraction * 0x1p64);
>           }
>       }
> +    if (retval) {
> +        goto out;
> +    }
> +    if (memchr(nptr, '-', endptr - nptr) != NULL) {
> +        endptr = nptr;
> +        retval = -EINVAL;
> +        goto out;
> +    }
>       c = *endptr;
>       mul = suffix_mul(c, unit);
>       if (mul > 0) {


