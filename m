Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435295A35B2
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 09:50:00 +0200 (CEST)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRqZq-000437-CB
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 03:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRqW5-0002V7-2z
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:46:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRqW0-00044Y-OT
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661586360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRmUf8e6jxxCB9UN7WT/AD9gQrQGHIJBA1UyKpK59y4=;
 b=fWKwSCrO7J7xc7IBLR3QQD25zJ+12QAFckYG1WbcFYtNGHYbLYozJ4SfAkEg76alNrtC7k
 sGZWOEeZVJz3SmtlPcS2uWc3M8XysFJ/s5Khzl0MQv3J+T653lqSYx7lmvQXWOOtXVe5LZ
 6wV3K25AKHJHXxbci8/nVIm8F/IcV44=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-kpBq20dQPvKJJt_4iWhm7A-1; Sat, 27 Aug 2022 03:45:58 -0400
X-MC-Unique: kpBq20dQPvKJJt_4iWhm7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 j3-20020a05600c1c0300b003a5e72421c2so4200417wms.1
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 00:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=dRmUf8e6jxxCB9UN7WT/AD9gQrQGHIJBA1UyKpK59y4=;
 b=Wnb2U2RMcU33t8QT+egNCcGBQG/IxPTFdVHFF5UCFDBbDVhpRmmZzixIkqboOgEfVt
 xJ45GY71wf0n6w0gj1GXawILWJsVA6WW+RjrI7YEc2Sly9bcr9xzNUQ5Bqp5iG3zMuZ8
 XIdVOCTkWJEraShCylNlAigbBX1qHaTpAvA+UiB38VdYvGsLDotpf8ZT3ChtheNtr99T
 0kblxB7seSAO3+R1kgbGwBCOGf8v8aFIa+wrAuuqs1qPD5Vq/x5y8xIwmgz1NzNMzOpZ
 f+1cygBgGnt/GVa2t7mndtmBTAU73Zu870lIL7kJ6foJysNm5gNXHlv83Y9vru9LgzND
 cRFg==
X-Gm-Message-State: ACgBeo0sLfg9NRWO75MtEHtTydk6UnNyzh+j5bwzzt92eVWNQ3PLvAHc
 dY7Yai55LGYoeSUHsRmF4Es1os4sZZlPcuMOChPWwwprygzqjpU0xpkHm1R2GamvkX7bY05tD7W
 jL2kxfKlwVJ11CCQ=
X-Received: by 2002:a05:6000:15c3:b0:225:6e25:a9e3 with SMTP id
 y3-20020a05600015c300b002256e25a9e3mr1585240wry.286.1661586357239; 
 Sat, 27 Aug 2022 00:45:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4av3GVBwGwFmrXWry/HydFHxKCugDiP268+VsEPLw5mgiCBHSMQqSwcmJ3geOh1ojfPgUsLw==
X-Received: by 2002:a05:6000:15c3:b0:225:6e25:a9e3 with SMTP id
 y3-20020a05600015c300b002256e25a9e3mr1585222wry.286.1661586356997; 
 Sat, 27 Aug 2022 00:45:56 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c2cc400b003a502c23f2asm1924359wmc.16.2022.08.27.00.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 00:45:56 -0700 (PDT)
Message-ID: <974e6fb1-6873-9f9c-71ec-788324c3091c@redhat.com>
Date: Sat, 27 Aug 2022 09:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-14-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 13/20] disas/nanomips: Add free() calls
In-Reply-To: <20220815072629.12865-14-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 15/08/2022 09.26, Milica Lazarevic wrote:
> The free() function is called for every string allocated using the
> strdup() function to prevent memory leaking.
> 
> The implementation of the several functions working with dynamically
> allocated strings is slightly changed so we can free those strings.
> 
> Almost every disassembly_function returns the result of the img_format()
> function, which returns a dynamically allocated string. To be able to
> free that string for every disassembly_function, a strdup() call is
> added for returning value of some disassembly functions like TLBGINV,
> TLBGINVF, TLBGP, etc.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 1117 +++++++++++++++++++++++++++++++++-----------
>   1 file changed, 841 insertions(+), 276 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 561e4ff095..551bcb3164 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -526,7 +526,9 @@ static const char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
>       for (uint64 counter = 0; counter != count; counter++) {
>           bool use_gp = gp && (counter == count - 1);
>           uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
> -        strcat(str, img_format(",%s", GPR(this_rt)));
> +        const char *dis_str = img_format(",%s", GPR(this_rt));
> +        strcat(str, dis_str);
> +        free((char *)dis_str);

When using glib, you could get rid of the free() here by declaring dis_str 
with g_autofree.

>       }
>   
>       return strdup(str);
> @@ -663,7 +665,9 @@ static int Disassemble(const uint16 *data, char *dis,
>                                   return -6;
>                               }
>                               type = table[i].type;
> -                            strcpy(dis, dis_fn(op_code));
> +                            const char *dis_str = dis_fn(op_code);
> +                            strcpy(dis, dis_str);
> +                            free((char *)dis_str);

dito

>                               return table[i].instructions_size;
>                           } else {
>                               strcpy(dis, "reserved instruction");
> @@ -1737,7 +1741,10 @@ static const char *ACLR(uint64 instruction)
>       const char *s = IMMEDIATE(copy(s_value));
>       const char *rs = GPR(copy(rs_value));
>   
> -    return img_format("ACLR %s, %s(%s)", bit, s, rs);
> +    const char *ret = img_format("ACLR %s, %s(%s)", bit, s, rs);
> +    free((char *)bit);
> +    free((char *)s);
> +    return ret;
>   }
>   
>   
> @@ -1833,7 +1840,9 @@ static const char *ADDIU_32_(uint64 instruction)
>       const char *rs = GPR(copy(rs_value));
>       const char *u = IMMEDIATE(copy(u_value));
>   
> -    return img_format("ADDIU %s, %s, %s", rt, rs, u);
> +    const char *ret = img_format("ADDIU %s, %s, %s", rt, rs, u);
> +    free((char *)u);

I really dislike the need of having these "(char *)" casts in the calls to 
free() everywhere.
IMHO, if a function allocated memory and the caller is required to free it, 
the memory belongs to the caller after the function has finished, so it 
would be better to return "char *" instead of "const char *" in these cases. 
"const char *" should be used in the cases where the return value points to 
static strings that the caller must not free.
(Apart from that, please consider to use g_autofree for the variables 
declaration everywhere you added a free() here ... that would make this 
patch way easier).

  Thomas


