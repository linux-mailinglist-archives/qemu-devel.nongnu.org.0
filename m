Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BD57BDF8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 20:43:55 +0200 (CEST)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEEfq-0002Rx-QK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 14:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEEdv-0000yN-3P
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEEds-0004eY-S9
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658342512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WGqoitGwiaP7zxCwbAhuOvCzS2i5W+SPx0vnyO7lJM=;
 b=gKarkR+xrjVXpdG8IwHdGRziITAP6K36Q7NUSeEyjM62wl/pTdLqPEo3LWVMHItrqmaChg
 cpqzHxLrmczFXcsjtCwsGYWAutbt6PvTqBfv7ysKsHmuwHV//RKx5vL4yX1ODXHbzvtxwp
 woB7mQSXpba0JUAobIshrdipFaELkTY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-CcLNXVueMTCIAM43hPhfvg-1; Wed, 20 Jul 2022 14:41:50 -0400
X-MC-Unique: CcLNXVueMTCIAM43hPhfvg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r127-20020a1c4485000000b003a2fdeea756so1651101wma.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 11:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=6WGqoitGwiaP7zxCwbAhuOvCzS2i5W+SPx0vnyO7lJM=;
 b=eDmc8Bm01mZcGZJBjYO+ymkNTINPi+RbbJn2UAz+TFyWd8vSTseVWYvrlrzgTDMt+2
 zctGqUgs5T95LRrqDLmQDRzQtKHLHRO5gjP7twkpZY8Met6+BKR/oXyqylYKZUd0dN8I
 YNKjHlbVFiXVJMKIXlfHf0BvKp1nDrWmh2rqkiphJQNG2q+V1bbgJynFPdDqvVtfkeNA
 XIJbq0VtGeW8r1sPkHjAWQhNPVo5sQ/jsJY2U1VoUk3Eze1LFKDgVjznZhIU9lGDeaKy
 01kUWpWQzoebfOffrh9g/7SlXvgtAyCWt/brQG6+SFj+bRJAwR9G7x7H4Cbj+VBB4cmY
 25Vw==
X-Gm-Message-State: AJIora8uenoZ+TduJ5I5lsoSvM4vQnNGEfEK6o61zz4zoRPdek6BXShU
 VyPF+3NZvwNo55nZWg4RKUobATg+7bhlTfmLOxM9s0JEZFtroTugQMeyHcTh+A1gokIKOGA/V1b
 3L1F6U/zvXB2GNzE=
X-Received: by 2002:a7b:c316:0:b0:3a3:c83:9001 with SMTP id
 k22-20020a7bc316000000b003a30c839001mr5215224wmj.105.1658342509435; 
 Wed, 20 Jul 2022 11:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/CMc9u67P94+nP+4okJeJXSlRK1anacmaXLEMlpBuNEi0OgkAUW4eoT8CtxOkeGhiaeCpgw==
X-Received: by 2002:a7b:c316:0:b0:3a3:c83:9001 with SMTP id
 k22-20020a7bc316000000b003a30c839001mr5215195wmj.105.1658342509093; 
 Wed, 20 Jul 2022 11:41:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:e00:8d96:5dba:6bc4:6e89?
 (p200300cbc7060e008d965dba6bc46e89.dip0.t-ipconnect.de.
 [2003:cb:c706:e00:8d96:5dba:6bc4:6e89])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a5d4c83000000b0021baf5e590dsm16668628wrs.71.2022.07.20.11.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 11:41:48 -0700 (PDT)
Message-ID: <c61e0119-24e8-c1a3-d1c1-cd57b3feca02@redhat.com>
Date: Wed, 20 Jul 2022 20:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
In-Reply-To: <20220720120859.339788-1-Jason@zx2c4.com>
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

On 20.07.22 14:08, Jason A. Donenfeld wrote:
> In order for hosts running inside of TCG to initialize the kernel's
> random number generator, we should support the PRNO_TRNG instruction,
> backed in the usual way with the qemu_guest_getrandom helper. This is
> confirmed working on Linux 5.19-rc6.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  target/s390x/cpu_models.c        |  2 --
>  target/s390x/gen-features.c      |  2 ++
>  target/s390x/tcg/crypto_helper.c | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 1a562d2801..90aac3d795 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -421,8 +421,6 @@ static void check_consistency(const S390CPUModel *model)
>          { S390_FEAT_DFP_FAST, S390_FEAT_DFP },
>          { S390_FEAT_TRANSACTIONAL_EXE, S390_FEAT_STFLE_49 },
>          { S390_FEAT_EDAT_2, S390_FEAT_EDAT},
> -        { S390_FEAT_MSA_EXT_5, S390_FEAT_KIMD_SHA_512 },
> -        { S390_FEAT_MSA_EXT_5, S390_FEAT_KLMD_SHA_512 },
>          { S390_FEAT_MSA_EXT_4, S390_FEAT_MSA_EXT_3 },
>          { S390_FEAT_SIE_CMMA, S390_FEAT_CMM },
>          { S390_FEAT_SIE_CMMA, S390_FEAT_SIE_GSLS },
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index ad140184b9..3d333e2789 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -749,6 +749,8 @@ static uint16_t qemu_V7_0[] = {
>   */
>  static uint16_t qemu_MAX[] = {
>      S390_FEAT_VECTOR_ENH2,
> +    S390_FEAT_MSA_EXT_5,
> +    S390_FEAT_PRNO_TRNG,
>  };
>  
>  /****** END FEATURE DEFS ******/
> diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
> index 138d9e7ad9..afd29f9cf0 100644
> --- a/target/s390x/tcg/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -12,12 +12,38 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/guest-random.h"
>  #include "s390x-internal.h"
>  #include "tcg_s390x.h"
>  #include "exec/helper-proto.h"
>  #include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
>  
> +static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
> +                            uint64_t *buf_reg, uint64_t *len_reg)
> +{
> +        uint8_t tmp[256];
> +        uint64_t len = *len_reg;
> +        int reg_len = 64;
> +
> +        if (!(env->psw.mask & PSW_MASK_64)) {
> +                len = (uint32_t)len;
> +                reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
> +        }
> +
> +        while (len) {
> +                size_t block = MIN(len, sizeof(tmp));
> +
> +                qemu_guest_getrandom_nofail(tmp, block);
> +                for (size_t i = 0; i < block; ++i) {
> +                        cpu_stb_data_ra(env, wrap_address(env, *buf_reg), tmp[i], ra);
> +                        *buf_reg = deposit64(*buf_reg, 0, reg_len, *buf_reg + 1);
> +                        --*len_reg;
> +                }
> +                len -= block;
> +        }

Yeah, that's better, although kind-off hard to read.

We could process one guest page at a time, similar to how we handle
target/s390x/tcg/mem_helper.c:access_memset and friends nowadays.

But I won't force you to do that ;)

This here is good enough for now, with room for improvement regarding
efficiency.

I did not review the doc in detail once again, maybe I get to that later
this week.

-- 
Thanks,

David / dhildenb


