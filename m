Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11ED6C439B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 07:51:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pesJo-0002ga-Fz; Wed, 22 Mar 2023 02:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesJm-0002g0-Aq
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 02:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesJk-00058t-PI
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 02:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679467887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Om/BqAS+6Qkgf6oi5KtAEk/YqimFFpnS8U2HOARM8l4=;
 b=cq0USmn9Mkk//xKkjwEXBiUH2qCqRGBX1mqzppOlFdOAeGJy2VmV2CFfYhp1KOMwQDFkaP
 IwhcEOwvlQ/pFlgZ81BHfl8TuwDvL46BPyqzY9Jk1Qi1cN7Pf3YJZKgJwoFU51UuVlQcFc
 EN5HR9jB+WJeWewiQxFWVZXX8mHFB0w=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-SzMlFCb8MOqOZXq5KtLrwQ-1; Wed, 22 Mar 2023 02:51:25 -0400
X-MC-Unique: SzMlFCb8MOqOZXq5KtLrwQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 b34-20020a05620a272200b007460c05a463so8246728qkp.1
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 23:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679467885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Om/BqAS+6Qkgf6oi5KtAEk/YqimFFpnS8U2HOARM8l4=;
 b=jXs3wVo2cJ217ttfRRJMJBuzbRzzSXNrPbrTyNcNk6GpZGw1mX7Rhcw45kHOuOu/gx
 87Q3QvkaTlowOhDHOty388oSKYaBAK21LdPfCT0CO685OLMJd1wXzai2yR0mtSw7IXwz
 rPjz+8e49QCHWaF9DYIgeNcj04iSC23X2wztinWH/85RGNpB140IQj+2qSYkQJtgDXv2
 umcUT7KOx/ciFhxoZ7vqdqeLdjaSPb1ADE/0LhqAfO4t/gWOons0sMO8Gdb7uMIR1p3t
 bOIw7Ujo2m/OPZdn26y5ZTOyh/NoAyNiXam1uEmCJce5Sn9n13xbTMnCq68PoG5Sj5HP
 Jz+g==
X-Gm-Message-State: AO0yUKVbNFzKwkykLcfX7d2WGFo27uv4HYURavcsiTlZJokIaV+Y6GxE
 48TRzLqg8sdJ5gQKM/P8sigBl3e2UNddfSq0srIFDqsYECXZf5vqIS97TTBhtuaF0WTZr17PBtK
 Y8LKK15U0uXp7nsg=
X-Received: by 2002:a05:622a:24e:b0:3bf:a7c1:46a9 with SMTP id
 c14-20020a05622a024e00b003bfa7c146a9mr4386709qtx.40.1679467885386; 
 Tue, 21 Mar 2023 23:51:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set8ecW0t5GVm4x5C3nlFWutPWf6BQQlv3Y1Gzo9IQ5uuzJmj62Kk6g/7IxBNqmCKsaiUU6N0xQ==
X-Received: by 2002:a05:622a:24e:b0:3bf:a7c1:46a9 with SMTP id
 c14-20020a05622a024e00b003bfa7c146a9mr4386695qtx.40.1679467885152; 
 Tue, 21 Mar 2023 23:51:25 -0700 (PDT)
Received: from [192.168.8.106] (tmo-102-206.customers.d1-online.com.
 [80.187.102.206]) by smtp.gmail.com with ESMTPSA id
 x14-20020ac8538e000000b003e38d6c013dsm190422qtp.60.2023.03.21.23.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 23:51:24 -0700 (PDT)
Message-ID: <639ea29c-26a4-5a6a-aa54-bb41e1a066ec@redhat.com>
Date: Wed, 22 Mar 2023 07:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0 2/3] target/s390x: Fix float_comp_to_cc() prototype
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-3-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230321083322.663561-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/03/2023 09.33, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../target/s390x/tcg/fpu_helper.c:123:5: error: conflicting types for ‘float_comp_to_cc’ due to enum/integer mismatch; have ‘int(CPUS390XState *, FloatRelation)’ {aka ‘int(struct CPUArchState *, FloatRelation)’} [-Werror=enum-int-mismatch]
> 
>    123 | int float_comp_to_cc(CPUS390XState *env, FloatRelation float_compare)
>        |     ^~~~~~~~~~~~~~~~
> In file included from ../target/s390x/tcg/fpu_helper.c:23:
> ../target/s390x/s390x-internal.h:302:5: note: previous declaration of ‘float_comp_to_cc’ with type ‘int(CPUS390XState *, int)’ {aka ‘int(struct CPUArchState *, int)’}
>    302 | int float_comp_to_cc(CPUS390XState *env, int float_compare);
>        |     ^~~~~~~~~~~~~~~~
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Fixes: 71bfd65c5f ("softfloat: Name compare relation enum")
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   target/s390x/s390x-internal.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
> index 5d4361d35b..825252d728 100644
> --- a/target/s390x/s390x-internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -11,6 +11,7 @@
>   #define S390X_INTERNAL_H
>   
>   #include "cpu.h"
> +#include "fpu/softfloat.h"
>   
>   #ifndef CONFIG_USER_ONLY
>   typedef struct LowCore {
> @@ -299,7 +300,7 @@ uint32_t set_cc_nz_f128(float128 v);
>   uint8_t s390_softfloat_exc_to_ieee(unsigned int exc);
>   int s390_swap_bfp_rounding_mode(CPUS390XState *env, int m3);
>   void s390_restore_bfp_rounding_mode(CPUS390XState *env, int old_mode);
> -int float_comp_to_cc(CPUS390XState *env, int float_compare);
> +int float_comp_to_cc(CPUS390XState *env, FloatRelation float_compare);
>   
>   #define DCMASK_ZERO             0x0c00
>   #define DCMASK_NORMAL           0x0300

Reviewed-by: Thomas Huth <thuth@redhat.com>


