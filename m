Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512B15E6850
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:23:55 +0200 (CEST)
Received: from localhost ([::1]:37840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOzR-0004jT-SA
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obOK1-0007Co-Jc
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obOJz-0001kp-3h
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663861262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gM68OIFNsoSlqt2+sDsnmgZsC8ViJJLdH0XA2wzoFNE=;
 b=XE3/fubA49okahDOHvM+rHAH3Xa/cysbCT4KWj9QqZ9MlZxHIJK73+Od6MD3BFhoWTqE6b
 84hrwLRgfxNRuvLNuMTO6zn/4dotNkAPpt2YcQe9NNYZDEatg4dDYL0d4lw8N9ZDcQUG77
 B5/pcyXUqNmo6qjN69mosRdivywPntQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-312-WUTGi7-NPN6taUWKKQ-eLg-1; Thu, 22 Sep 2022 11:41:00 -0400
X-MC-Unique: WUTGi7-NPN6taUWKKQ-eLg-1
Received: by mail-ed1-f69.google.com with SMTP id
 f10-20020a0564021e8a00b00451be6582d5so6978510edf.15
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gM68OIFNsoSlqt2+sDsnmgZsC8ViJJLdH0XA2wzoFNE=;
 b=6J4EmJZwHSIIAn0oPolUQt9wNjGvFKOOTyPaSHg/W2hFiLKnTsRGEH/Q7NJjsUQ9Yf
 4fB//mVfSZNTiM8zL3HDx6vj8+2+ykQl359Xx3KVzu2sj+KV27zslMLsy4Owsdy/d2S8
 N2k1LnSKCTmEa3/LsSYesC+2j00YuxN5ysFBD8ZhauM+b/K7wIFe1cUGp/ry+FZtrxeS
 TBkHfBzPZrEdaa73a32/XT//geys2R6qHGpbLOsk8MEo0O++IxottzJCXHWNhVEQ75ky
 XNXgrHoUhX812NDu9QEZQBTGj6k3iDemKHrFP2m/r5d9J7jBSWZzOn2eiU5AvCKMlZ9g
 oyVQ==
X-Gm-Message-State: ACrzQf0Fsk6mLJgFgicG0htJw/Ql4SnlVv/vOLOwVc9nnYMW5R8vRGj+
 LOtGBMDhKs01RQGiSKeNr+KMLxv+wVEkxDp6w3hVZF8KM3JyiNbcnj4bkW4nGNfZJV5di8aN1Mx
 SgVkgjuC6jxpgfpk=
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr3420650ejb.294.1663861259245; 
 Thu, 22 Sep 2022 08:40:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bTBjsPa5eDPLBLhJ8hHPnuBpO/QJY3sqqxCTXf+Qr5gI8rYY9Mg/G2oKssFnL7aQ9vrWTTA==
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr3420632ejb.294.1663861259071; 
 Thu, 22 Sep 2022 08:40:59 -0700 (PDT)
Received: from [192.168.45.94] ([37.85.29.70])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a1709060c1200b00780f24b797dsm2842279ejf.108.2022.09.22.08.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:40:58 -0700 (PDT)
Message-ID: <89e89674-be5b-9585-aa1f-eaffb62e98bf@redhat.com>
Date: Thu, 22 Sep 2022 17:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 2/2] target/s390x: support PRNO_TRNG instruction
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220921100729.2942008-2-Jason@zx2c4.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220921100729.2942008-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/09/2022 12.07, Jason A. Donenfeld wrote:
> In order for hosts running inside of TCG to initialize the kernel's
> random number generator, we should support the PRNO_TRNG instruction,
> backed in the usual way with the qemu_guest_getrandom helper. This is
> confirmed working on Linux 5.19.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   target/s390x/gen-features.c      |  1 +
>   target/s390x/tcg/crypto_helper.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 14a7f2ae90..aaade67574 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -754,6 +754,7 @@ static uint16_t qemu_MAX[] = {
>       S390_FEAT_MSA_EXT_5,
>       S390_FEAT_KIMD_SHA_512,
>       S390_FEAT_KLMD_SHA_512,
> +    S390_FEAT_PRNO_TRNG,
>   };
>   
>   /****** END FEATURE DEFS ******/
> diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
> index 02073ec70b..0daa9a2dd9 100644
> --- a/target/s390x/tcg/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -14,6 +14,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/main-loop.h"
> +#include "qemu/guest-random.h"
>   #include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #include "exec/helper-proto.h"
> @@ -173,6 +174,31 @@ static int klmd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_bloc
>       return 0;
>   }
>   
> +static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
> +                            uint64_t *buf_reg, uint64_t *len_reg)
> +{
> +    uint8_t tmp[256];
> +    uint64_t len = *len_reg;
> +    int buf_reg_len = 64;
> +
> +    if (!(env->psw.mask & PSW_MASK_64)) {
> +        len = (uint32_t)len;
> +        buf_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
> +    }
> +
> +    while (len) {
> +        size_t block = MIN(len, sizeof(tmp));
> +
> +        qemu_guest_getrandom_nofail(tmp, block);
> +        for (size_t i = 0; i < block; ++i) {
> +            cpu_stb_data_ra(env, wrap_address(env, *buf_reg), tmp[i], ra);
> +            *buf_reg = deposit64(*buf_reg, 0, buf_reg_len, *buf_reg + 1);
> +            --*len_reg;
> +        }
> +        len -= block;
> +    }
> +}
> +
>   uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>                        uint32_t type)
>   {
> @@ -215,6 +241,10 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>               return klmd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1]);
>           }
>           break;
> +    case 114: /* CPACF_PRNO_TRNG */
> +        fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
> +        fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
> +        break;

Thanks, patch looks fine to me!

(if we ever have another instruction that uses fc 114, we might want to 
check "type" here, too, but that can also be added later, of course)

  Thomas


