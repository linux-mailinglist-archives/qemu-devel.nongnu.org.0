Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B707258AA2F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:33:49 +0200 (CEST)
Received: from localhost ([::1]:41404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvaO-0001eb-ST
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJvVC-0006Ma-Kx
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:28:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJvV9-0003v0-35
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:28:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659698901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdQV0YXRpKt8+eLEEtauuIlM4rF0xXOUlLpyIoe9SEk=;
 b=CpWTmToI/WpmRfyvFL2soZyK7cilgYA3Ml5SVWEEBxTQAheCEVauXq+0s2oyVCvV2qtaUX
 WZxUajDfvgEkCTKKLxkb37tAbUfRWP69kWUvquElxOBb18kWEPYe7UMkiCfly03+Ijw2Og
 8XbW4UzsO+v462c3Rk1Bb4Pkd+ngw3o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-CXSeEZ9AMh6F50VLI1qV0w-1; Fri, 05 Aug 2022 07:28:20 -0400
X-MC-Unique: CXSeEZ9AMh6F50VLI1qV0w-1
Received: by mail-wr1-f72.google.com with SMTP id
 u17-20020adfa191000000b0021ed2209fccso408787wru.16
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 04:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=EdQV0YXRpKt8+eLEEtauuIlM4rF0xXOUlLpyIoe9SEk=;
 b=CE0JakCNxBfHjM/LZ3+OdQGqlEGkAXaDNZN6xLtzu84rVDXsGhSbGpoISLQq/Plyu3
 DWMOgOfMl2Wmr3Nfwb6lt2sdtCIGI24994zKukCeax6ePk8ftGw2OHjurbTN2JBZMUPB
 yG3BjLR2VZjA46Uxd1Inlw4VuunCfdKDTXZ+3Hf6fJDEOACeHRMjO7uxxYxGzr9HeERv
 rlJv52PS90go+RazBaA/u9rPxFDKr9SPq5tnxdz0rsqn50TnczUJzGVPzXwCoPnlehnb
 uUX26if7MUgNluJ2JwU5zOTehkCvBsInGMv5UYQNDu1n9VwqHw45aPjAa/lsAGGdVjxH
 JXzA==
X-Gm-Message-State: ACgBeo05eOqRuFjtz+XJaHdZf76or0Jkb6vAftxiX8IrZlbrieeNhSor
 CTs8uR6jQSbzyIyYQdH/bhVrKgGos4EHuhXoGS7qX8Gwa9DlXUGRToQUfxuWMAkZFeI84MKrXNu
 Za/IIGR1oyT/fDQA=
X-Received: by 2002:a05:6000:1547:b0:221:7a23:ab67 with SMTP id
 7-20020a056000154700b002217a23ab67mr829501wry.515.1659698899487; 
 Fri, 05 Aug 2022 04:28:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7a7DWRzgeade4kWdjhxmZLM7HGyU0+bhH1HpGdvhc6x/Rx6ip8/7tOvguwF3rmzDG7xtzo+A==
X-Received: by 2002:a05:6000:1547:b0:221:7a23:ab67 with SMTP id
 7-20020a056000154700b002217a23ab67mr829482wry.515.1659698899231; 
 Fri, 05 Aug 2022 04:28:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52?
 (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de.
 [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0021e4829d359sm3644604wrm.39.2022.08.05.04.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 04:28:18 -0700 (PDT)
Message-ID: <6ad7580d-ee43-d744-8eed-cd363c4fb911@redhat.com>
Date: Fri, 5 Aug 2022 13:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220803125108.626995-2-Jason@zx2c4.com>
 <20220803171536.1314717-1-Jason@zx2c4.com>
 <20220803171536.1314717-2-Jason@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 2/2] target/s390x: support SHA-512 extensions
In-Reply-To: <20220803171536.1314717-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.08.22 19:15, Jason A. Donenfeld wrote:
> In order to fully support MSA_EXT_5, we have to also support the SHA-512
> special instructions. So implement those.
> 
> The implementation began as something TweetNacl-like, and then was
> adjusted to be useful here. It's not very beautiful, but it is quite
> short and compact, which is what we're going for.
> 

NIT: we could think about reversing the order of patches. IIRC, patch #1
itself would trigger a warning when starting QEMU. Having this patch
first make sense logically.

> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  target/s390x/gen-features.c      |   2 +
>  target/s390x/tcg/crypto_helper.c | 157 +++++++++++++++++++++++++++++++
>  2 files changed, 159 insertions(+)
> 
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 3d333e2789..b6d804fa6d 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -751,6 +751,8 @@ static uint16_t qemu_MAX[] = {
>      S390_FEAT_VECTOR_ENH2,
>      S390_FEAT_MSA_EXT_5,
>      S390_FEAT_PRNO_TRNG,
> +    S390_FEAT_KIMD_SHA_512,
> +    S390_FEAT_KLMD_SHA_512,
>  };
>  
>  /****** END FEATURE DEFS ******/
> diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
> index 8ad4ef1ace..bb4823107c 100644
> --- a/target/s390x/tcg/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -1,10 +1,12 @@
>  /*
>   *  s390x crypto helpers
>   *
> + *  Copyright (C) 2022 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
>   *  Copyright (c) 2017 Red Hat Inc
>   *
>   *  Authors:
>   *   David Hildenbrand <david@redhat.com>
> + *   Jason A. Donenfeld <Jason@zx2c4.com>
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
>   * See the COPYING file in the top-level directory.
> @@ -19,6 +21,153 @@
>  #include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
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

I'd just use a #define outside of the function for that.

> +    uint64_t z[8], b[8], a[8], w[16], t;
> +    uint64_t message = message_reg ? *message_reg : 0, len = *len_reg, processed = 0;
> +    int i, j, reg_len = 64, blocks = 0, cc = 0;
> +
> +    if (!(env->psw.mask & PSW_MASK_64)) {
> +        len = (uint32_t)len;
> +        reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
> +    }


I'd call that message_reg_len. (same in other function)


> +
> +    for (i = 0; i < 8; ++i) {
> +        z[i] = a[i] = cpu_ldq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), ra);

I assume if we get any exception here, we simply didn't make any progress.

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

dito

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

I wonder what happens if we get an exception somewhere in the middle
here ... fortunately we can only involve 2 pages.

> +    }
> +
> +    if (message_reg) {
> +        *message_reg = deposit64(*message_reg, 0, reg_len, message);
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
> +    int j, reg_len = 64, cc;
> +
> +    cc = kimd_sha512(env, ra, parameter_block, message_reg, len_reg, NULL);
> +    if (cc) {
> +        return cc;
> +    }

Doesn't kimd_sha512() update the length register? And if we return with
cc=3, we'd be in trouble, no?



One idea could be to simply only process one block at a time. Read all
inputs first for that block and handle it completely without any
register modifications. Perform all memory writes in a single call.


Further, I wonder if we should factor out the core of kimd_sha512() to
only work on temp buffers without any loading/storing of memory, and let
only kimd_sha512/klmd_sha512 perform all loading/storing. Then it's much
cleaner who modifies what.

If you run out if ideas, I can give it a shot next week to see if I can
clean handling up a bit..

-- 
Thanks,

David / dhildenb


