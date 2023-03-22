Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A76C43A3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 07:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pesLA-0003vz-Sh; Wed, 22 Mar 2023 02:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesL6-0003v7-LJ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 02:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesL5-0005Lf-8M
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 02:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679467970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HlOVum3zlrby9qgk981B76YKheswNkAcgjOj8q+L4tA=;
 b=DozgMQGFW15ZrO2eHJeewwv8urLKyMRcEOvpEcPfvl04bXibhz6Efcjn+IiUiMuXCa4v1c
 x8Bk2kQ2cFZgQ4hibGk+dzmyo06gpYzZz8vhQdPlE5x3sqpRq+B29GHcQX8VQhJShr5wwZ
 Mud2misfwLHltjtE/OnCPM3Wa4e0MIE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-IJhjaWvwO0OcEIzL9Ognbw-1; Wed, 22 Mar 2023 02:52:41 -0400
X-MC-Unique: IJhjaWvwO0OcEIzL9Ognbw-1
Received: by mail-qv1-f70.google.com with SMTP id
 z14-20020a0cd78e000000b005adc8684170so8775896qvi.3
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 23:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679467961;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HlOVum3zlrby9qgk981B76YKheswNkAcgjOj8q+L4tA=;
 b=coPqoCaIzixFrpdV9sgnnGSWih3gRLW9WD+rrVWEJ0NJh6o2w62R8Xksqtt7GCSPgy
 +BJ6Gl1APnsvCkJvh3OgV/ocOmD4kQpeYYLXmZd5zgd5wl4o74UWA8ak3f1o5FOyFv1c
 9HhMK7dzINgCIHjaG8uZRLpS0mSMAOZierdTDJwhN9iZSJgvd9B79JRrtFmyv/ioQ7GF
 2CqqLTDeQex9wzsVFJRx3BFqelv06kARIlMlExCdb+pfTtM/Y8n48zusbZvPuzuybST7
 7NB2EQ+Pm7ucWh1VHJa9/PlIfGNs0yA2uohq9vAoHc19QSvK5mQ9qSDzI2xG0IYXnNZ1
 O9QQ==
X-Gm-Message-State: AO0yUKUzZkpNdlQUNyf6dj+ob8jpYxAQ6yZ8OnGScqq3OlQPtA7iIJ6L
 ueDEirSMkjSKXUFD/OuhmeBXi640ec5ieK1scrY0sqhU4oQyvWNNlEO3gq093kpdvDw/W+cBfVs
 cCZ0blz+I4okT4NA=
X-Received: by 2002:ac8:588c:0:b0:3bf:cff2:2c2f with SMTP id
 t12-20020ac8588c000000b003bfcff22c2fmr4037715qta.44.1679467961365; 
 Tue, 21 Mar 2023 23:52:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set+/guqhh3luA+mWyl0HAmbo18fmHg21YevV0Ldnzp2FMDAxvb7d8qkkS5T0CF0HOwi2aA6nZg==
X-Received: by 2002:ac8:588c:0:b0:3bf:cff2:2c2f with SMTP id
 t12-20020ac8588c000000b003bfcff22c2fmr4037701qta.44.1679467961140; 
 Tue, 21 Mar 2023 23:52:41 -0700 (PDT)
Received: from [192.168.8.106] (tmo-102-206.customers.d1-online.com.
 [80.187.102.206]) by smtp.gmail.com with ESMTPSA id
 t21-20020ac87615000000b003e0945575dasm5599388qtq.1.2023.03.21.23.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 23:52:40 -0700 (PDT)
Message-ID: <e549a0d6-77f2-6b1a-3dc4-46df1b8c9b42@redhat.com>
Date: Wed, 22 Mar 2023 07:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0 v2 2/3] target/s390x: Fix float_comp_to_cc()
 prototype
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-3-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230321161609.716474-3-clg@kaod.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/03/2023 17.16, Cédric Le Goater wrote:
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
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

Better to respond to v2:
Reviewed-by: Thomas Huth <thuth@redhat.com>


