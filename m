Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8DC58DF42
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 20:43:16 +0200 (CEST)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLUCB-0004Fp-P9
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 14:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLUAB-0002P5-Oy
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 14:41:11 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLUA9-0000Q1-GS
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 14:41:11 -0400
Received: by mail-pf1-x436.google.com with SMTP id k14so9534732pfh.0
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 11:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lfDvXsYoygAD1/ubA8X8c3HuzdByKQvAOlDYjSs6+Lc=;
 b=kMgoX4PDV9T098U2mE/jI+5QVQk2LS/vBspvSmfvVDGdh+SlSAuJmEwNv7nCVCjS1b
 DwTunHQdajPpWwRvxqat3ELOgN+59+Cgb8amT57Mz6HYPkIBjEC3heailXwRO8KGka0x
 Le9CKVdeEFP02i8kNmg8eqdgTHZRlBZT8Z5QWz3VZ969dmKB/rVyZxFHHpuwPaO+iG2k
 1yaOyckFxNxtyHBIqb0KC60AVAVqUb6xvBeZlzt8MWFkqkOautQgBP+N9p/TPHG2V0xl
 +3bPCn4X6iagy8GNIosiA1rDAMYb19C6jyG1BYLfGlKeDnA0Xz9lsnGcq9KqV/XLo9Pc
 SlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lfDvXsYoygAD1/ubA8X8c3HuzdByKQvAOlDYjSs6+Lc=;
 b=pSrsOMUEGVsf+HRd8fWfjyOpPZz7OuVfV38ZkwuNXr84AouW0FgCU+O3Dg/4uHQ/fX
 iIvawQfXb8QTY6Oe9bnschbuHkCKBNrPIuktVuMumfF5Csh9se5hmRY/3U9gQj6dbGj9
 24ldaxg+/yWi2QmoIy/LJGYPDiez3v9+4j/nVi7GiMlr5oYdOAk5CEyGtUh+gO4ojaPv
 A6c2KV38ronngc8Fjvz8cvGcgl9j86wiKN2w7LhpQ7AVCFpDjYZkWoOMy06V8sVnXINq
 hkqLAQst/TgLpvfrls5RZBuTkrteNcH6i4qq39+x/hxeZqaW6QfHaUCmU32jFA3hiR71
 Zgvw==
X-Gm-Message-State: ACgBeo0f7mxufFNcH8h5+XNz8GSZ4AnNMOTbHAapwfaH1G3DAPQ5TTGx
 uK45flvJBM2OdM5Vwky0zAmE0w==
X-Google-Smtp-Source: AA6agR4olKM8Ta/NCNW6/TBRtDauK3l3DtDZsAn22dXlC1MNwOkzYy4p/9XlLP08Tnx+lis9JTiZsA==
X-Received: by 2002:a63:d847:0:b0:41a:dbc4:ef9e with SMTP id
 k7-20020a63d847000000b0041adbc4ef9emr20204829pgj.379.1660070467615; 
 Tue, 09 Aug 2022 11:41:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:409:90e8:ee9:8fec?
 ([2602:ae:154e:e201:409:90e8:ee9:8fec])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a170903230700b0016bdc98730bsm11284568plh.151.2022.08.09.11.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 11:41:06 -0700 (PDT)
Message-ID: <f97dd96c-730b-1446-4d6d-18cdb406db42@linaro.org>
Date: Tue, 9 Aug 2022 11:41:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/2] Update AVX512 support for xbzrle_encode_buffer
 function
Content-Language: en-US
To: ling xu <ling1.xu@intel.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, Zhou Zhao
 <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
References: <20220808074837.1484760-1-ling1.xu@intel.com>
 <20220808074837.1484760-2-ling1.xu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220808074837.1484760-2-ling1.xu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/22 00:48, ling xu wrote:
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
>   meson.build        |  16 ++++
>   meson_options.txt  |   2 +
>   migration/ram.c    |  41 ++++++++++
>   migration/xbzrle.c | 181 +++++++++++++++++++++++++++++++++++++++++++++
>   migration/xbzrle.h |   4 +
>   5 files changed, 244 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 294e9a8f32..4222b77e9f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2262,6 +2262,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
>       int main(int argc, char *argv[]) { return bar(argv[0]); }
>     '''), error_message: 'AVX512F not available').allowed())
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
>   have_pvrdma = get_option('pvrdma') \
>     .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
>     .require(cc.compiles(gnu_source_prefix + '''
> diff --git a/meson_options.txt b/meson_options.txt
> index e58e158396..07194bf680 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -104,6 +104,8 @@ option('avx2', type: 'feature', value: 'auto',
>          description: 'AVX2 optimizations')
>   option('avx512f', type: 'feature', value: 'disabled',
>          description: 'AVX512F optimizations')
> +option('avx512bw', type: 'feature', value: 'auto',
> +       description: 'AVX512BW optimizations')
>   option('keyring', type: 'feature', value: 'auto',
>          description: 'Linux keyring support')
>   
> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9ddbc..d9c1ac2f7a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -83,6 +83,35 @@
>   /* 0x80 is reserved in migration.h start with 0x100 next */
>   #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>   
> +#if defined(CONFIG_AVX512BW_OPT)
> +static bool IS_CPU_SUPPORT_AVX512BW;
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
>   XBZRLECacheStats xbzrle_counters;
>   
>   /* struct contains XBZRLE cache and a static page
> @@ -802,9 +831,21 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
>       memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
>   
>       /* XBZRLE encoding (if there is no overflow) */
> +    #if defined(CONFIG_AVX512BW_OPT)
> +    if (likely(IS_CPU_SUPPORT_AVX512BW)) {
> +        encoded_len = xbzrle_encode_buffer_512(prev_cached_page, XBZRLE.current_buf,
> +                                               TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
> +                                               TARGET_PAGE_SIZE);
> +    } else {
> +        encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
> +                                           TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
> +                                           TARGET_PAGE_SIZE);
> +    }
> +    #else
>       encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
>                                          TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
>                                          TARGET_PAGE_SIZE);
> +    #endif
>   
>       /*
>        * Update the cache contents, so that it corresponds to the data
> diff --git a/migration/xbzrle.c b/migration/xbzrle.c
> index 1ba482ded9..4db09fdbdb 100644
> --- a/migration/xbzrle.c
> +++ b/migration/xbzrle.c
> @@ -174,3 +174,184 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen)
>   
>       return d;
>   }
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
> +    uint32_t zrun_len = 0, nzrun_len = 0;
> +    int d = 0, i = 0, num = 0;
> +    uint8_t *nzrun_start = NULL;
> +    int count512s = (slen >> 6);
> +    int res = slen % 64;
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

Um, what?  This is a stupid version of "1ull << res".


> +        mask -= 1;
> +        __m512i r = SET_ZERO512(r);
> +        __m512i old_data = _mm512_mask_loadu_epi8(r, mask, old_buf + i);
> +        __m512i new_data = _mm512_mask_loadu_epi8(r, mask, new_buf + i);
> +        __mmask64 comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
> +
> +        int bytesToCheck = res;
> +        bool is_same = (comp & 0x1);
> +        while (bytesToCheck) {

Why have you unrolled this from the main loop?  That's the major advantage of using 
predicate registers, being able to fold the head (and/or tail) into the same loop.

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

Type error -- ctzl used with long long (which should be uint64_t).
You should be using ctz64().

> +                num = (num < bytesToCheck) ? num : bytesToCheck;

Why this test?  Don't you already know that ~comp != 0?

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

More generally, what benefit are you *really* getting out of avx512?  You're doing 
predicated loads and compares, but they're strictly length-based.  Then you're using the 
result of the comparison in serial.  I really can't imagine this being efficient at all.


r~

