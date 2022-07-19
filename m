Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469FF57978E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:22:24 +0200 (CEST)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDkMx-0008PP-Bu
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDk2G-0006Fn-C2
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDk2C-0005pb-S5
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658224854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5qFpdlugz3FZYLiUkBEWQoPcMWr5nJu23kl89pzHdY=;
 b=L97ZJ/G2XwPjT9D4iwAiN4OWc5mVStJ8qAS9w/cPD/Edlm7nwul9kw41UrCokLnbys0wZy
 Hj309hT04sBbFimyauUa71BnVWNyjbuVd0rDcnwfCPq6bpUkkqZeUOaNsEKWw5mgbdwIMr
 CpQ/BbXuIUZRCNDpoXotpCFUhtC/XTk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-47ZMAy45M2OJHsXt9-8_XQ-1; Tue, 19 Jul 2022 06:00:47 -0400
X-MC-Unique: 47ZMAy45M2OJHsXt9-8_XQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a6-20020a05600c348600b003a2d72b7a15so10028661wmq.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 03:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=m5qFpdlugz3FZYLiUkBEWQoPcMWr5nJu23kl89pzHdY=;
 b=lYAuenkILQegObe+Ob7eRF7BbnD3/EnEyGi40LQpozpTaI7T2zfy74u6atWZDVj0VT
 KPLUiwLr0ZbV004lJ6hWmqSyNR3Db2AEnx14lbRx9v8mDpYpGwwre6K3NZFUET/MLP7F
 4R6kbt7pfvI/sKlxDJ9m9pE0d1Ky6UrG962LPI1T/xpTTwbSCBQWsA/4Zbd+jaKoLLNd
 9y3z1GhzsYR5fQT1U2SHzvfhW51bTh/BRAFrL6eZcDc4507L6B319gTRjK4dkJlq7Rc3
 I0pn2PRgjL5kD2fnicVdMsisgGT0aWyK0YpD9+sfXbmgaF3tZ6GeWErxktIdEaF7NqdM
 CGDw==
X-Gm-Message-State: AJIora/KlyHFb3NQnWr9ST3xtquDPhrzK/7Dm1TWLROz08qeu1u2idVZ
 jh998uUqgxP/jvk4fLsDLVsewNSC7ZXnoJ0XxoQMEB4PN19BRpoM0wIB2pjFLMjKwimHMOk3wks
 1t19QYeTPqnIgnPY=
X-Received: by 2002:a05:600c:3507:b0:3a1:9fbb:4d62 with SMTP id
 h7-20020a05600c350700b003a19fbb4d62mr28907986wmq.161.1658224846411; 
 Tue, 19 Jul 2022 03:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQZtHrEyaIzO31Yfx6J3x6RvJC7GZlm6vV2wlJSbQoiFY09lbgHolTW/2lNW1ZC7cCVotL9Q==
X-Received: by 2002:a05:600c:3507:b0:3a1:9fbb:4d62 with SMTP id
 h7-20020a05600c350700b003a19fbb4d62mr28907950wmq.161.1658224846045; 
 Tue, 19 Jul 2022 03:00:46 -0700 (PDT)
Received: from [10.33.198.128] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1c2104000000b00397402ae674sm21989743wmh.11.2022.07.19.03.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 03:00:45 -0700 (PDT)
Message-ID: <70076dcc-795e-0986-acde-8fcf3a33823d@redhat.com>
Date: Tue, 19 Jul 2022 12:00:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>, David Hildenbrand <david@redhat.com>
References: <20220712164627.581570-1-Jason@zx2c4.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH qemu] target/s390x: support PRNO_TRNG instruction
In-Reply-To: <20220712164627.581570-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


  Hi Jason,

thanks for you patch! Additionally to the things that David already 
mentioned, please have also a look at my comments below...

On 12/07/2022 18.46, Jason A. Donenfeld wrote:
> In order for hosts running inside of TCG to initialize the kernel's
> random number generator, we should support the PRNO_TRNG instruction,
> backed in the usual way with the qemu_guest_getrandom helper. This is
> confirmed working on Linux 5.19-rc6.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   target/s390x/gen-features.c      |  2 ++
>   target/s390x/tcg/crypto_helper.c | 23 +++++++++++++++++++++++
>   2 files changed, 25 insertions(+)
...> diff --git a/target/s390x/tcg/crypto_helper.c 
b/target/s390x/tcg/crypto_helper.c
> index 138d9e7ad9..cefdfd114e 100644
> --- a/target/s390x/tcg/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -12,12 +12,28 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/main-loop.h"
> +#include "qemu/guest-random.h"
>   #include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #include "exec/helper-proto.h"
>   #include "exec/exec-all.h"
>   #include "exec/cpu_ldst.h"
>   
> +static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
> +                            uint64_t buf, uint64_t len)
> +{
> +        uint64_t addr = wrap_address(env, buf);

I think you have to limit "len" to the lower 32-bit if not running in 64-bit 
mode.

> +        uint8_t tmp[256];
> +
> +        while (len) {
> +                size_t block = MIN(len, sizeof(tmp));
> +                qemu_guest_getrandom_nofail(tmp, block);
> +                for (size_t i = 0; i < block; ++i)
> +                        cpu_stb_data_ra(env, addr++, tmp[i], ra);
> +                len -= block;
> +        }
> +}
> +
>   uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>                        uint32_t type)
>   {
> @@ -52,6 +68,13 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>               cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
>           }
>           break;
> +    case 114: {
> +        const uint64_t ucbuf = env->regs[r1], ucbuf_len = env->regs[r1 + 1];
> +        const uint64_t cbuf = env->regs[r2], cbuf_len = env->regs[r2 + 1];

According to the Principles of Operation:

"A specification exception is recognized and no other
action is taken if any of the following conditions exist:
...
The R1 or R2 fields designate an odd-numbered
register or general register 0. This exception is
recognized regardless of the function code."

It would be good to have that check here, too.

> +        fill_buf_random(env, ra, ucbuf, ucbuf_len);
> +        fill_buf_random(env, ra, cbuf, cbuf_len);
> +        break;
> +    }
>       default:
>           /* we don't implement any other subfunction yet */
>           g_assert_not_reached();

  Thomas


