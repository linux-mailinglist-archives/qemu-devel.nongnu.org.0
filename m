Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B16258C939
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:17:16 +0200 (CEST)
Received: from localhost ([::1]:59304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2d7-0005AA-PE
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oL2Yf-00081z-8n
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oL2Yb-0004l3-TD
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659964352;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kVt4KGhXvMalc2Ihwv6wEpoHwRyQFNIdwbZyYT9AVGY=;
 b=TfNrb2JhIUlw6KPUFBN/2qC2Tj2sJFUFu/gYioxQuOAlXJmACDamGmxdeQ5wtFrty5WjbR
 ModhTHLDDEbvyzHRfAJczdjewSiW7pgc0ri+bbULx/WkP2rzorFuIqloxMhXH+0qUmXQvn
 Ku8QMg8N2mYGT7yPM0pqIqERPymADRU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-bLUY6O_uPMO6cvonTMlI-w-1; Mon, 08 Aug 2022 09:12:31 -0400
X-MC-Unique: bLUY6O_uPMO6cvonTMlI-w-1
Received: by mail-wr1-f71.google.com with SMTP id
 i16-20020adfaad0000000b002207af3c7b2so1410786wrc.14
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 06:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=kVt4KGhXvMalc2Ihwv6wEpoHwRyQFNIdwbZyYT9AVGY=;
 b=DaDDHx9ulSNK5f0SsbcjdgyNikdxbtiM1sxTnyJ7OgXiu3gVo9qeMcLzezMTv+lCC8
 X+fiq1YpkapnK97Z1HhEBb8NKIrZG7j9JdVlTQ4hOF1BLudD8h/9I8bpn2qUeiNCOxas
 dEAxM/cldSp6ZlmhJpDGm7QP3IxsWZ+8jp3tAijZsezTuEFxXAZFJsaUVfxa4aIVQCay
 WTcUAb3pbdVGfu0GXjkBlUHnTiynkTe9T/Q5fzY25nP1hHi9rv5m+8OwIKdrORMRs1/x
 +iOohGaBwI5uRzoX6PqHUtNH0qUZLNzZWG3AE3bR+RXkj5FqwPbM98QwBgSL4YtZP2rL
 pO/w==
X-Gm-Message-State: ACgBeo3Gyw5ve7jYJLKq3ou9uMCBqip3nigRMFCHPw6VrXEgDEwKsvE5
 0qTXkwMnXGuPX8h+rRGDmWI7YlNRktLFYPPUr99XTTolyFjdp2bdy3sJ6DphlToWAUQFYkl85Cc
 CeZqBGr6J5Zg4P3w=
X-Received: by 2002:a05:6000:812:b0:220:5a66:ebd0 with SMTP id
 bt18-20020a056000081200b002205a66ebd0mr11743695wrb.519.1659964349983; 
 Mon, 08 Aug 2022 06:12:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5mVxVecWgSU4Xv+6AmUJX3Ex5GsI0D0qSOC27j6QJ1+/Nb6hmkEgBHcoHiddbRRN/PBGiorg==
X-Received: by 2002:a05:6000:812:b0:220:5a66:ebd0 with SMTP id
 bt18-20020a056000081200b002205a66ebd0mr11743672wrb.519.1659964349489; 
 Mon, 08 Aug 2022 06:12:29 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b0039747cf8354sm14536770wmq.39.2022.08.08.06.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 06:12:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: ling xu <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  Zhou Zhao
 <zhou.zhao@intel.com>,  Jun Jin <jun.i.jin@intel.com>
Subject: Re: [PATCH v3 1/2] Update AVX512 support for xbzrle_encode_buffer
 function
In-Reply-To: <20220808074837.1484760-2-ling1.xu@intel.com> (ling xu's message
 of "Mon, 8 Aug 2022 15:48:36 +0800")
References: <20220808074837.1484760-1-ling1.xu@intel.com>
 <20220808074837.1484760-2-ling1.xu@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 08 Aug 2022 15:12:27 +0200
Message-ID: <87r11qnakk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ling xu <ling1.xu@intel.com> wrote:
> This commit update runtime check of AVX512, and implements avx512 of
> xbzrle_encode_buffer function to accelerate xbzrle encoding speed.
> Compared with C version of xbzrle_encode_buffer function, avx512 version
> can achieve almost 60%-70% performance improvement on unit test provided
> by Qemu. In addition, we provide one more unit test called
> "test_encode_decode_random", in which dirty data are randomly located in
> 4K page, and this case can achieve almost 140% performance gain.
>
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> ---
>  meson.build        |  16 ++++
>  meson_options.txt  |   2 +
>  migration/ram.c    |  41 ++++++++++
>  migration/xbzrle.c | 181 +++++++++++++++++++++++++++++++++++++++++++++
>  migration/xbzrle.h |   4 +
>  5 files changed, 244 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index 294e9a8f32..4222b77e9f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2262,6 +2262,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
>      int main(int argc, char *argv[]) { return bar(argv[0]); }
>    '''), error_message: 'AVX512F not available').allowed())
>  
> +config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
> +  .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot enable AVX512BW') \
> +  .require(cc.links('''
> +    #pragma GCC push_options
> +    #pragma GCC target("avx512bw")
> +    #include <cpuid.h>
> +    #include <immintrin.h>
> +    static int bar(void *a) {
> +
> +      __m512i x = *(__m512i *)a;
> +      __m512i res= _mm512_abs_epi8(x);
> +      return res[1];
> +    }
> +    int main(int argc, char *argv[]) { return bar(argv[0]); }
> +  '''), error_message: 'AVX512BW not available').allowed())
> +
>  have_pvrdma = get_option('pvrdma') \
>    .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
>    .require(cc.compiles(gnu_source_prefix + '''
> diff --git a/meson_options.txt b/meson_options.txt
> index e58e158396..07194bf680 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -104,6 +104,8 @@ option('avx2', type: 'feature', value: 'auto',
>         description: 'AVX2 optimizations')
>  option('avx512f', type: 'feature', value: 'disabled',
>         description: 'AVX512F optimizations')
> +option('avx512bw', type: 'feature', value: 'auto',
> +       description: 'AVX512BW optimizations')
>  option('keyring', type: 'feature', value: 'auto',
>         description: 'Linux keyring support')
>  

[no clue about meson, it looks ok]

> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9ddbc..d9c1ac2f7a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -83,6 +83,35 @@
>  /* 0x80 is reserved in migration.h start with 0x100 next */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>  
> +#if defined(CONFIG_AVX512BW_OPT)
> +static bool IS_CPU_SUPPORT_AVX512BW;

An all caps global variable?

> +#include "qemu/cpuid.h"
> +static void __attribute__((constructor)) init_cpu_flag(void)
> +{
> +    unsigned max = __get_cpuid_max(0, NULL);
> +    int a, b, c, d;
> +    IS_CPU_SUPPORT_AVX512BW = false;
> +    if (max >= 1) {
> +        __cpuid(1, a, b, c, d);
> +         /* We must check that AVX is not just available, but usable.  */
> +        if ((c & bit_OSXSAVE) && (c & bit_AVX) && max >= 7) {
> +            int bv;
> +            __asm("xgetbv" : "=a"(bv), "=d"(d) : "c"(0));
> +            __cpuid_count(7, 0, a, b, c, d);
> +           /* 0xe6:
> +            *  XCR0[7:5] = 111b (OPMASK state, upper 256-bit of ZMM0-ZMM15
> +            *                    and ZMM16-ZMM31 state are enabled by OS)
> +            *  XCR0[2:1] = 11b (XMM state and YMM state are enabled by OS)
> +            */
> +            if ((bv & 0xe6) == 0xe6 && (b & bit_AVX512BW)) {
> +                IS_CPU_SUPPORT_AVX512BW = true;
> +            }
> +        }
> +    }
> +    return ;
> +}
> +#endif
> +
>  XBZRLECacheStats xbzrle_counters;
>  
>  /* struct contains XBZRLE cache and a static page
> @@ -802,9 +831,21 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
>      memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
>  
>      /* XBZRLE encoding (if there is no overflow) */
> +    #if defined(CONFIG_AVX512BW_OPT)
> +    if (likely(IS_CPU_SUPPORT_AVX512BW)) {

All distributions are go to have compile time support for AVX, but I am
not sure the percentage of machines that support avx

> +        encoded_len = xbzrle_encode_buffer_512(prev_cached_page, XBZRLE.current_buf,
> +                                               TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
> +                                               TARGET_PAGE_SIZE);
> +    } else {
> +        encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
> +                                           TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
> +                                           TARGET_PAGE_SIZE);
> +    }

the else part is the same than the #else part
> +    #else
>      encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
>                                         TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
>                                         TARGET_PAGE_SIZE);
> +    #endif

So, why don't just create a new function pointer:

int (*xbzrle_encode_buffer_func)(uint8_t *old_buf, uint8_t *new_buf, int slen,
                                 uint8_t *dst, int dlen) = xbzrle_encode_buffer;


And aad into init_cpu_flag() something in the line of:

	xbzrle_encode_buffer_func = xbrrle_encode_buffer_512;

?


>      /*
>       * Update the cache contents, so that it corresponds to the data
> diff --git a/migration/xbzrle.c b/migration/xbzrle.c
> index 1ba482ded9..4db09fdbdb 100644
> --- a/migration/xbzrle.c
> +++ b/migration/xbzrle.c
> @@ -174,3 +174,184 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen)
>  
>      return d;
>  }
> +
> +#if defined(CONFIG_AVX512BW_OPT)
> +#pragma GCC push_options
> +#pragma GCC target("avx512bw")
> +
> +#include <immintrin.h>
> +#include <math.h>
> +#define SET_ZERO512(r) r = _mm512_set1_epi32(0)
> +int xbzrle_encode_buffer_512(uint8_t *old_buf, uint8_t *new_buf, int slen,
> +                             uint8_t *dst, int dlen)
> +{

This is just personal taste, but I would rename this to:

xbzrle_encode_buffer_avx512?

> +    uint32_t zrun_len = 0, nzrun_len = 0;
> +    int d = 0, i = 0, num = 0;
> +    uint8_t *nzrun_start = NULL;
> +    int count512s = (slen >> 6);
> +    int res = slen % 64;

res variable here means residual, normally we use "res" with meaning of
"result" in qemu.

> +    bool never_same = true;
> +    while (count512s--) {
> +        if (d + 2 > dlen) {
> +            return -1;
> +        }
> +        __m512i old_data = _mm512_mask_loadu_epi8(old_data,
> +                               0xffffffffffffffff, old_buf + i);
> +        __m512i new_data = _mm512_mask_loadu_epi8(new_data,
> +                                                 0xffffffffffffffff, new_buf + i);
> +        /* in mask bit 1 for same, 0 for diff */
> +        __mmask64  comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
> +
> +        int bytesToCheck = 64;
> +        bool is_same = (comp & 0x1);
> +        while (bytesToCheck) {
> +            if (is_same) {
> +                if (nzrun_len) {
> +                    d += uleb128_encode_small(dst + d, nzrun_len);
> +                    if (d + nzrun_len > dlen) {
> +                        return -1;
> +                    }
> +                    nzrun_start = new_buf + i - nzrun_len;
> +                    memcpy(dst + d, nzrun_start, nzrun_len);
> +                    d += nzrun_len;
> +                    nzrun_len = 0;
> +                }
> +                if (comp == 0xffffffffffffffff) {
> +                    i += 64;
> +                    zrun_len += 64;
> +                    break;
> +                }
> +                never_same = false;
> +                num = __builtin_ctzl(~comp);
> +                num = (num < bytesToCheck) ? num : bytesToCheck;
> +                zrun_len += num;
> +                bytesToCheck -= num;
> +                comp >>= num;
> +                i += num;
> +                if (bytesToCheck) {
> +                    /* still has different data after same data */
> +                    d += uleb128_encode_small(dst + d, zrun_len);
> +                    zrun_len = 0;
> +                } else {
> +                    break;
> +                }
> +            }
> +            if (never_same || zrun_len) {
> +                /*
> +                 * never_same only acts if
> +                 * data begins with diff in first count512s
> +                 */
> +                d += uleb128_encode_small(dst + d, zrun_len);
> +                zrun_len = 0;
> +                never_same = false;
> +            }
> +            /* has diff */
> +            if ((bytesToCheck == 64) && (comp == 0x0)) {
> +                i += 64;
> +                nzrun_len += 64;
> +                break;
> +            }
> +            num = __builtin_ctzl(comp);
> +            num = (num < bytesToCheck) ? num : bytesToCheck;
> +            nzrun_len += num;
> +            bytesToCheck -= num;
> +            comp >>= num;
> +            i += num;
> +            if (bytesToCheck) {
> +                /* mask like 111000 */
> +                d += uleb128_encode_small(dst + d, nzrun_len);
> +                /* overflow */
> +                if (d + nzrun_len > dlen) {
> +                    return -1;
> +                }
> +                nzrun_start = new_buf + i - nzrun_len;
> +                memcpy(dst + d, nzrun_start, nzrun_len);
> +                d += nzrun_len;
> +                nzrun_len = 0;
> +                is_same = true;
> +            }
> +        }
> +    }
> +    if (res) {
> +        /* the number of data is less than 64 */
> +        unsigned long long mask = pow(2, res);

Not your fault.

21st century.  Someone still use long long in a new API, sniff.

> +        mask -= 1;
> +        __m512i r = SET_ZERO512(r);
> +        __m512i old_data = _mm512_mask_loadu_epi8(r, mask, old_buf + i);
> +        __m512i new_data = _mm512_mask_loadu_epi8(r, mask, new_buf + i);
> +        __mmask64 comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
> +
> +        int bytesToCheck = res;
> +        bool is_same = (comp & 0x1);
> +        while (bytesToCheck) {
> +            if (is_same) {
> +                if (nzrun_len) {
> +                    d += uleb128_encode_small(dst + d, nzrun_len);
> +                    if (d + nzrun_len > dlen) {
> +                        return -1;
> +                    }
> +                    nzrun_start = new_buf + i - nzrun_len;
> +                    memcpy(dst + d, nzrun_start, nzrun_len);
> +                    d += nzrun_len;
> +                    nzrun_len = 0;
> +                }
> +                never_same = false;
> +                num = __builtin_ctzl(~comp);
> +                num = (num < bytesToCheck) ? num : bytesToCheck;
> +                zrun_len += num;
> +                bytesToCheck -= num;
> +                comp >>= num;
> +                i += num;
> +                if (bytesToCheck) {
> +                    /* diff after same */
> +                    d += uleb128_encode_small(dst + d, zrun_len);
> +                    zrun_len = 0;
> +                } else {
> +                    break;
> +                }
> +            }
> +
> +            if (never_same || zrun_len) {
> +                d += uleb128_encode_small(dst + d, zrun_len);
> +                zrun_len = 0;
> +                never_same = false;
> +            }
> +            /* has diff */
> +            num = __builtin_ctzl(comp);
> +            num = (num < bytesToCheck) ? num : bytesToCheck;
> +            nzrun_len += num;
> +            bytesToCheck -= num;
> +            comp >>= num;
> +            i += num;
> +            if (bytesToCheck) {
> +                d += uleb128_encode_small(dst + d, nzrun_len);
> +                /* overflow */
> +                if (d + nzrun_len > dlen) {
> +                    return -1;
> +                }
> +                nzrun_start = new_buf + i - nzrun_len;
> +                memcpy(dst + d, nzrun_start, nzrun_len);
> +                d += nzrun_len;
> +                nzrun_len = 0;
> +                is_same = true;
> +            }
> +        }
> +    }
> +
> +    if (zrun_len) {
> +        return (zrun_len == slen) ? 0 : d;
> +    }
> +    if (nzrun_len != 0) {
> +        d += uleb128_encode_small(dst + d, nzrun_len);
> +        /* overflow */
> +        if (d + nzrun_len > dlen) {
> +            return -1;
> +        }
> +        nzrun_start = new_buf + i - nzrun_len;
> +        memcpy(dst + d, nzrun_start, nzrun_len);
> +        d += nzrun_len;
> +    }
> +    return d;
> +}
> +#pragma GCC pop_options
> +#endif
> \ No newline at end of file
> diff --git a/migration/xbzrle.h b/migration/xbzrle.h
> index a0db507b9c..6247de5f00 100644
> --- a/migration/xbzrle.h
> +++ b/migration/xbzrle.h
> @@ -18,4 +18,8 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_buf, int slen,
>                           uint8_t *dst, int dlen);
>  
>  int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen);
> +#if defined(CONFIG_AVX512BW_OPT)
> +int xbzrle_encode_buffer_512(uint8_t *old_buf, uint8_t *new_buf, int slen,
> +                             uint8_t *dst, int dlen);
> +#endif
>  #endif


