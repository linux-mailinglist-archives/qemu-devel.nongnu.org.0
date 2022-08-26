Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F75A25C1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:23:24 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWUk-0006gE-TL
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRWTB-0004iv-HS
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRWT8-0001l1-8o
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661509301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kJT6WDS6e5b4ZIBeTtW79SNDd/Vb95BqHfbXOn6h4w=;
 b=YSxeP2Q2yqiJNA2udo11J/lskxGalhYXiRfrfheGCH51MfZvPuACcFQWp9W75+tJXLzBoi
 Sbnmy8md22rPHs5bVcXLw7f8AOEnwWuH8irOyg+9rU5pE/Wp3eL/wJjBY1651zbBy3DF2F
 Y16rz2Ifao9/7XU56krRRz6W3YAqUA8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-q5Bjq6urOp-3dlvK9ykvbg-1; Fri, 26 Aug 2022 06:21:40 -0400
X-MC-Unique: q5Bjq6urOp-3dlvK9ykvbg-1
Received: by mail-ej1-f72.google.com with SMTP id
 ho13-20020a1709070e8d00b00730a655e173so449347ejc.8
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 03:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8kJT6WDS6e5b4ZIBeTtW79SNDd/Vb95BqHfbXOn6h4w=;
 b=2Y03EEQjPz6tR8qsB3acrKh0GjbEE4VZVQRRljdamZL79lrhl/3CdqKn2S9cnjueij
 WVkdXN5L7Es9+DwDguCLMqONzAtifcaSR0qfAQp/PeXGshUeYQgp0IVHZcwqsxO8BPTJ
 ZTmUmhE5V5jF5JsLAP6QwGEFQ+0Nf1UzUhCd5YURYccVuoHweO12NDJGseBe7keX3i6U
 O0YYBlZEO08P/BIVQ8glAqbq2i51dO2ryd5l3U3qjnaFf4FZt9a1ZoZvzWrRhGTChC3j
 9ZFfX6czfiB+mAM/WVBCPSPCVYQ5r/FWhuhgoo3hN6LBMqNWnEJg/qGeal13MBNI3Ceb
 ubkQ==
X-Gm-Message-State: ACgBeo2sjG4eruXWdyom5puBBlHKJWzSd2fByI/dvUres08rTwSeD+D0
 7F+5YCCO8BoLMYb2BoOfR6kB5toZQf18b5R8x9oRNLpEJSBAdZfS82fD7CfVIb+oFmvmRfqIICE
 k182waxwEO4gWr8g=
X-Received: by 2002:a17:907:7205:b0:739:1735:8b9a with SMTP id
 dr5-20020a170907720500b0073917358b9amr4961168ejc.244.1661509298867; 
 Fri, 26 Aug 2022 03:21:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5mPqrMnaMkgLjX7mgMZjEd+TxZt8YcummlD5/y9ti0XzOPW4sqyqISUMyTME10o32snrFe+Q==
X-Received: by 2002:a17:907:7205:b0:739:1735:8b9a with SMTP id
 dr5-20020a170907720500b0073917358b9amr4961154ejc.244.1661509298527; 
 Fri, 26 Aug 2022 03:21:38 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-42.web.vodafone.de.
 [109.43.179.42]) by smtp.gmail.com with ESMTPSA id
 j5-20020aa7ca45000000b0044629b54b00sm1058982edt.46.2022.08.26.03.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 03:21:38 -0700 (PDT)
Message-ID: <362c6915-c7fa-9eee-fe3d-1995fb55d5a1@redhat.com>
Date: Fri, 26 Aug 2022 12:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <Yu0UtNzyb81O0ND2@zx2c4.com>
 <20220809150331.84296-1-Jason@zx2c4.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v7 1/2] target/s390x: support SHA-512 extensions
In-Reply-To: <20220809150331.84296-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Finally, I'm also having some spare minutes to have a look on this ... 
First, thank you for your work here, it's very appreciated! Some more 
comments inline below (mostly cosmetics since I'm not very much into this 
crypto stuff)...

On 09/08/2022 17.03, Jason A. Donenfeld wrote:
> In order to fully support MSA_EXT_5, we have to support the SHA-512
> special instructions. So implement those.
> 
> The implementation began as something TweetNacl-like, and then was
> adjusted to be useful here. It's not very beautiful, but it is quite
> short and compact, which is what we're going for.
 >
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   target/s390x/gen-features.c      |   3 +
>   target/s390x/tcg/crypto_helper.c | 157 +++++++++++++++++++++++++++++++
>   2 files changed, 160 insertions(+)

If you've got some spare time, it would be great to have a test for the new 
functions in the tests/tcg/s390x/ folder, too (but otherwise we can still 
add them later).

> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index ad140184b9..85ab69d04e 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -749,6 +749,9 @@ static uint16_t qemu_V7_0[] = {
>    */
>   static uint16_t qemu_MAX[] = {
>       S390_FEAT_VECTOR_ENH2,
> +    S390_FEAT_MSA_EXT_5,
> +    S390_FEAT_KIMD_SHA_512,
> +    S390_FEAT_KLMD_SHA_512,
>   };

I think we likely have to fence the bits off for older machine type 
versions, like it has been done in commit 4f9b6c7ddb2 for example. However, 
the patch for the new 7.2 machine type is not merged yet (but I've queued it 
on https://gitlab.com/thuth/qemu/-/commits/s390x-next/ ), so you either have 
to pick that manually into your branch, or we fix it up later (which would 
be ok for me, too).

>   /****** END FEATURE DEFS ******/
> diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
> index 138d9e7ad9..4d45de8faa 100644
> --- a/target/s390x/tcg/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -1,10 +1,12 @@
>   /*
>    *  s390x crypto helpers
>    *
> + *  Copyright (C) 2022 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.

Please drop the "All rights reserved" ... it does not have any legal meaning 
anymore, and also sounds weird in the Open Source context. See:

  https://en.wikipedia.org/wiki/All_rights_reserved#Obsolescence

>    *  Copyright (c) 2017 Red Hat Inc
>    *
>    *  Authors:
>    *   David Hildenbrand <david@redhat.com>
> + *   Jason A. Donenfeld <Jason@zx2c4.com>
>    *
>    * This work is licensed under the terms of the GNU GPL, version 2 or later.
>    * See the COPYING file in the top-level directory.
> @@ -18,6 +20,153 @@
>   #include "exec/exec-all.h"
>   #include "exec/cpu_ldst.h"
>   
> +static uint64_t R(uint64_t x, int c) { return (x >> c) | (x << (64 - c)); }
> +static uint64_t Ch(uint64_t x, uint64_t y, uint64_t z) { return (x & y) ^ (~x & z); }
> +static uint64_t Maj(uint64_t x, uint64_t y, uint64_t z) { return (x & y) ^ (x & z) ^ (y & z); }
> +static uint64_t Sigma0(uint64_t x) { return R(x, 28) ^ R(x, 34) ^ R(x, 39); }
> +static uint64_t Sigma1(uint64_t x) { return R(x, 14) ^ R(x, 18) ^ R(x, 41); }
> +static uint64_t sigma0(uint64_t x) { return R(x, 1) ^ R(x, 8) ^ (x >> 7); }
> +static uint64_t sigma1(uint64_t x) { return R(x, 19) ^ R(x, 61) ^ (x >> 6); }
> +
> +static const uint64_t K[80] = {
> +    0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
> +    0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
> +    0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
> +    0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
> +    0x72be5d74f27b896fULL, 0x80deb1fe3b1696b1ULL, 0x9bdc06a725c71235ULL,
> +    0xc19bf174cf692694ULL, 0xe49b69c19ef14ad2ULL, 0xefbe4786384f25e3ULL,
> +    0x0fc19dc68b8cd5b5ULL, 0x240ca1cc77ac9c65ULL, 0x2de92c6f592b0275ULL,
> +    0x4a7484aa6ea6e483ULL, 0x5cb0a9dcbd41fbd4ULL, 0x76f988da831153b5ULL,
> +    0x983e5152ee66dfabULL, 0xa831c66d2db43210ULL, 0xb00327c898fb213fULL,
> +    0xbf597fc7beef0ee4ULL, 0xc6e00bf33da88fc2ULL, 0xd5a79147930aa725ULL,
> +    0x06ca6351e003826fULL, 0x142929670a0e6e70ULL, 0x27b70a8546d22ffcULL,
> +    0x2e1b21385c26c926ULL, 0x4d2c6dfc5ac42aedULL, 0x53380d139d95b3dfULL,
> +    0x650a73548baf63deULL, 0x766a0abb3c77b2a8ULL, 0x81c2c92e47edaee6ULL,
> +    0x92722c851482353bULL, 0xa2bfe8a14cf10364ULL, 0xa81a664bbc423001ULL,
> +    0xc24b8b70d0f89791ULL, 0xc76c51a30654be30ULL, 0xd192e819d6ef5218ULL,
> +    0xd69906245565a910ULL, 0xf40e35855771202aULL, 0x106aa07032bbd1b8ULL,
> +    0x19a4c116b8d2d0c8ULL, 0x1e376c085141ab53ULL, 0x2748774cdf8eeb99ULL,
> +    0x34b0bcb5e19b48a8ULL, 0x391c0cb3c5c95a63ULL, 0x4ed8aa4ae3418acbULL,
> +    0x5b9cca4f7763e373ULL, 0x682e6ff3d6b2b8a3ULL, 0x748f82ee5defb2fcULL,
> +    0x78a5636f43172f60ULL, 0x84c87814a1f0ab72ULL, 0x8cc702081a6439ecULL,
> +    0x90befffa23631e28ULL, 0xa4506cebde82bde9ULL, 0xbef9a3f7b2c67915ULL,
> +    0xc67178f2e372532bULL, 0xca273eceea26619cULL, 0xd186b8c721c0c207ULL,
> +    0xeada7dd6cde0eb1eULL, 0xf57d4f7fee6ed178ULL, 0x06f067aa72176fbaULL,
> +    0x0a637dc5a2c898a6ULL, 0x113f9804bef90daeULL, 0x1b710b35131c471bULL,
> +    0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
> +    0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
> +    0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL
> +};
> +
> +static int kimd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
> +                       uint64_t *message_reg, uint64_t *len_reg, uint8_t *stack_buffer)
> +{
> +    enum { MAX_BLOCKS_PER_RUN = 64 }; /* This is arbitrary, just to keep interactivity. */
> +    uint64_t z[8], b[8], a[8], w[16], t;
> +    uint64_t message = message_reg ? *message_reg : 0, len = *len_reg, processed = 0;

The line is very long, could you please declare message and len on separate 
lines?

> +    int i, j, message_reg_len = 64, blocks = 0, cc = 0;
> +
> +    if (!(env->psw.mask & PSW_MASK_64)) {
> +        len = (uint32_t)len;
> +        message_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
> +    }
> +
> +    for (i = 0; i < 8; ++i) {
> +        z[i] = a[i] = cpu_ldq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), ra);

Quite a long line again, maybe split it like this:

       abi_ptr addr = wrap_address(env, parameter_block + 8 * i);
       z[i] = a[i] = cpu_ldq_be_data_ra(env, addr, ra);

> +    }
> +
> +    while (len >= 128) {
> +        if (++blocks > MAX_BLOCKS_PER_RUN) {
> +            cc = 3;
> +            break;
> +        }
> +
> +        for (i = 0; i < 16; ++i) {
> +            if (message) {
> +                w[i] = cpu_ldq_be_data_ra(env, wrap_address(env, message + 8 * i), ra);

Long line again, please split.

> +            } else {
> +                w[i] = be64_to_cpu(((uint64_t *)stack_buffer)[i]);
> +            }
> +        }
> +
> +        for (i = 0; i < 80; ++i) {
> +            for (j = 0; j < 8; ++j) {
> +                b[j] = a[j];
> +            }
> +            t = a[7] + Sigma1(a[4]) + Ch(a[4], a[5], a[6]) + K[i] + w[i % 16];
> +            b[7] = t + Sigma0(a[0]) + Maj(a[0], a[1], a[2]);
> +            b[3] += t;
> +            for (j = 0; j < 8; ++j) {
> +                a[(j + 1) % 8] = b[j];
> +            }
> +            if (i % 16 == 15) {
> +                for (j = 0; j < 16; ++j) {
> +                    w[j] += w[(j + 9) % 16] + sigma0(w[(j + 1) % 16]) + sigma1(w[(j + 14) % 16]);
> +                }
> +            }
> +        }
> +
> +        for (i = 0; i < 8; ++i) {
> +            a[i] += z[i];
> +            z[i] = a[i];
> +        }
> +
> +        if (message) {
> +            message += 128;
> +        } else {
> +            stack_buffer += 128;
> +        }
> +        len -= 128;
> +        processed += 128;
> +    }
> +
> +    for (i = 0; i < 8; ++i) {
> +        cpu_stq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), z[i], ra);
> +    }
> +
> +    if (message_reg) {
> +        *message_reg = deposit64(*message_reg, 0, message_reg_len, message);
> +    }
> +    *len_reg -= processed;
> +    return cc;
> +}
> +
> +static int klmd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
> +                        uint64_t *message_reg, uint64_t *len_reg)
> +{
> +    uint8_t x[256];
> +    uint64_t i, message, len;
> +    int j, message_reg_len = 64, cc;
> +
> +    cc = kimd_sha512(env, ra, parameter_block, message_reg, len_reg, NULL);
> +    if (cc) {
> +        return cc;
> +    }
> +
> +    message = *message_reg;
> +    len = *len_reg;
> +    if (!(env->psw.mask & PSW_MASK_64)) {
> +        len = (uint32_t)len;
> +        message_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
> +    }
> +
> +    for (i = 0; i < len; ++i) {
> +        x[i] = cpu_ldub_data_ra(env, wrap_address(env, message + i), ra);
> +    }
> +    memset(x + i, 0, sizeof(x) - i);
> +    x[i] = 128;
> +    i = i < 112 ? 128 : 256;
> +    for (j = 0; j < 16; ++j) {
> +        x[i - 16 + j] = cpu_ldub_data_ra(env, wrap_address(env, parameter_block + 64 + j), ra);
> +    }
> +    if (kimd_sha512(env, ra, parameter_block, NULL, &i, x)) {
> +        g_assert_not_reached(); /* It must handle at least 2 blocks. */
> +    }
> +    *message_reg = deposit64(*message_reg, 0, message_reg_len, message + len);
> +    *len_reg -= len;
> +    return 0;
> +}
> +
>   uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>                        uint32_t type)
>   {
> @@ -52,6 +201,14 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>               cpu_stb_data_ra(env, param_addr, subfunc[i], ra);

So for KIMD and KLMD, I think we now have to set the bit that corresponds to 
SHA-512 in the query status information, too? Otherwise the guest might not 
use the function if it thinks that it is not available?

>           }
>           break;
> +    case 3: /* CPACF_*_SHA_512 */
> +        switch (type) {
> +        case S390_FEAT_TYPE_KIMD:
> +            return kimd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1], NULL);
> +        case S390_FEAT_TYPE_KLMD:
> +            return klmd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1]);
> +        }
> +        break;
>       default:
>           /* we don't implement any other subfunction yet */
>           g_assert_not_reached();

  Thomas


