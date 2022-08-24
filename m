Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425559F5A2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 10:48:00 +0200 (CEST)
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQm3J-0001t2-Hh
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 04:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQlxn-0007Ja-EF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:42:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oQlxj-0001DN-6b
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661330529;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0dJLfgGjX6gk3tZSSTgNt2h6YvNiUhae3fNw0mrJteE=;
 b=PSXMPbYkjgGZ0JcdyoM41PQMBP66Bd3EnelY7Y/ygFYjdVrqUwFzEj4vtk8kmED8AVbGYZ
 D6m0V6Zi/TtHVfH1yFi2CDTXKTwVy//8tuvNSSC2JXY0T/N//n2lh+NnDzX0DvuE8rbmZc
 yWjc7BokJQdXSwtgrFTkWf7OX6hJyEM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-K7uBi6R_NEGRREZF1jGW2Q-1; Wed, 24 Aug 2022 04:42:08 -0400
X-MC-Unique: K7uBi6R_NEGRREZF1jGW2Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so531038wma.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 01:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0dJLfgGjX6gk3tZSSTgNt2h6YvNiUhae3fNw0mrJteE=;
 b=GShZEyeHp3OUS+hzV/GWiIVcMCYZfEuiT6ayO1uiVrbZMl1d3lEJqKXaTINecTRlfy
 9dwgIGMgNg7zNw5OvviX3d6uqo8pvo1kpL4/KPVsoE/aFlzVHLTfpdFDq+d4v7LK29qn
 OVZ1PxBQEnuTcgJdQFmBx2TjK9CyJ/EMuEK+sPfa0L5e1LWaKgJ9JjaH3fTbR9IknJhq
 +eJ0a96GufJ2fQyny/LxlalDOsxReJGlXJ51cn+U8CWTfAPPXUyg2evJfs3Erc0VNEtw
 s5eQDnop79vcNR9kkZ0xQi69lMWRjQ/hhtj/kxyFeoVefIdeBgS/aDac13OIetmVhhyW
 gG/Q==
X-Gm-Message-State: ACgBeo2rnyYVEO8e3hvto+inAy+ZjsSg/oigodY/a8hcoQcG6Xjo7xeU
 v0MiDnKj417I09v/6hs7X1aLr+blC81ZK750Ck0K7RGOj6AZOrl6DD2ooI3wgaw/qSmg4oJB+wM
 YV3BsA7TXyi+aGxU=
X-Received: by 2002:adf:d1c4:0:b0:225:6f39:78ae with SMTP id
 b4-20020adfd1c4000000b002256f3978aemr1503047wrd.691.1661330526759; 
 Wed, 24 Aug 2022 01:42:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR43GS6RP/zLr1rlh5hQUqdyrh+hPKM2cGx8+/TSIAkBWiUlgMGhzmPueeNLgr8m3y8UMnsoFw==
X-Received: by 2002:adf:d1c4:0:b0:225:6f39:78ae with SMTP id
 b4-20020adfd1c4000000b002256f3978aemr1503033wrd.691.1661330526503; 
 Wed, 24 Aug 2022 01:42:06 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c198600b003a5b788993csm1141544wmq.42.2022.08.24.01.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 01:42:06 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: ling xu <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  Zhou Zhao
 <zhou.zhao@intel.com>,  Jun Jin <jun.i.jin@intel.com>
Subject: Re: [PATCH v5 1/2] Update AVX512 support for xbzrle_encode_buffer
In-Reply-To: <20220818093559.2342594-2-ling1.xu@intel.com> (ling xu's message
 of "Thu, 18 Aug 2022 17:35:58 +0800")
References: <20220818093559.2342594-1-ling1.xu@intel.com>
 <20220818093559.2342594-2-ling1.xu@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Wed, 24 Aug 2022 10:42:05 +0200
Message-ID: <874jy2yqw2.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ling xu <ling1.xu@intel.com> wrote:
> This commit updates code of avx512 support for xbzrle_encode_buffer function to
> accelerate xbzrle encoding speed. We add runtime check of avx512 and add
> benchmark for this feature. Compared with C version of
> xbzrle_encode_buffer function, avx512 version can achieve 50%-70%
> performance improvement on benchmarking. In addition, if dirty data is
> randomly located in 4K page, the avx512 version can achieve almost 140%
> performance gain.
>
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> ---
>  meson.build        |  16 ++++++
>  meson_options.txt  |   2 +
>  migration/ram.c    |  35 ++++++++++--
>  migration/xbzrle.c | 130 +++++++++++++++++++++++++++++++++++++++++++++
>  migration/xbzrle.h |   4 ++
>  5 files changed, 184 insertions(+), 3 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 30a380752c..c9d90a5bff 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2264,6 +2264,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
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


> +      __m512i x = *(__m512i *)a;
> +      __m512i res= _mm512_abs_epi8(x);

Cast is as ugly as hell, what about:

      __m512i *x = a;
      __m512i res = _mm512_abs_epi8(*x);

??

> +static void __attribute__((constructor)) init_cpu_flag(void)
> +{
> +    unsigned max = __get_cpuid_max(0, NULL);
> +    int a, b, c, d;
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
> +                xbzrle_encode_buffer_func = xbzrle_encode_buffer_avx512;
> +            }
> +        }
> +    }
> +    return ;

This return line is not needed.

> +}
> +#endif
> +
>  XBZRLECacheStats xbzrle_counters;
>  
>  /* struct contains XBZRLE cache and a static page
> @@ -802,9 +831,9 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
>      memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
>  
>      /* XBZRLE encoding (if there is no overflow) */
> -    encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
> -                                       TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
> -                                       TARGET_PAGE_SIZE);
> +    encoded_len = xbzrle_encode_buffer_func(prev_cached_page, XBZRLE.current_buf,
> +                                            TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
> +                                            TARGET_PAGE_SIZE);
>  
>      /*
>       * Update the cache contents, so that it corresponds to the data
> diff --git a/migration/xbzrle.c b/migration/xbzrle.c
> index 1ba482ded9..6da7f79625 100644
> --- a/migration/xbzrle.c
> +++ b/migration/xbzrle.c
> @@ -174,3 +174,133 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen)
>  
>      return d;
>  }
> +
> +#if defined(CONFIG_AVX512BW_OPT)
> +#pragma GCC push_options
> +#pragma GCC target("avx512bw")
> +#include <immintrin.h>
> +int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
> +                             uint8_t *dst, int dlen)
> +{
> +    uint32_t zrun_len = 0, nzrun_len = 0;
> +    int d = 0, i = 0, num = 0;
> +    uint8_t *nzrun_start = NULL;
> +    /* add 1 to include residual part in main loop */
> +    uint32_t count512s = (slen >> 6) + 1;
> +    /* countResidual is tail of data, i.e., countResidual = slen % 64 */
> +    uint32_t countResidual = slen & 0b111111;
> +    bool never_same = true;
> +    uint64_t maskResidual = 1;
> +    maskResidual <<= countResidual;
> +    maskResidual -=1;
> +    uint64_t comp = 0;
> +    int bytesToCheck = 0;
> +
> +    while (count512s) {
> +        if (d + 2 > dlen) {
> +            return -1;
> +        }
> +
> +        if(count512s != 1){
> +            __m512i old_data = _mm512_mask_loadu_epi8(old_data,
> +                                                      0xffffffffffffffff, old_buf + i);
> +            __m512i new_data = _mm512_mask_loadu_epi8(new_data,
> +                                                      0xffffffffffffffff, new_buf + i);
> +            comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
> +            bytesToCheck = 64;
> +            count512s--;
> +        } else {
> +            __m512i old_data = _mm512_mask_loadu_epi8(old_data,
> +                                                      maskResidual, old_buf + i);
> +            __m512i new_data = _mm512_mask_loadu_epi8(new_data,
> +                                                      maskResidual, new_buf + i);
> +            comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
> +            bytesToCheck = countResidual;
> +            count512s--;
> +        }

It is basically the same in both branches of the if, what about:

        int bytesToCheck = 64;
        uint86_t mask = 0xffffffffffffffff;

        /* I am assuming this is the opposit of the if condition */
        if(count512s == 1){
            mask = maskResidual;
            bytesToCheck = countResidual;
        }
        __m512i old_data = _mm512_mask_loadu_epi8(old_data, mask, old_buf + i);
        __m512i new_data = _mm512_mask_loadu_epi8(new_data, mask, new_buf + i);
        uint64_t comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
        count512s--;

BTW, once that we are here, why not to be consistent:

bool is_same;
uint64_t maskResidual;

just use always Cammel case or underscores, but half and half ....

Later, Juan.


