Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443206B8E38
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 10:11:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc0gE-0000KG-7Y; Tue, 14 Mar 2023 05:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pc0g8-0000Jc-3u
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 05:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pc0g5-0000Nc-EY
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 05:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678785039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evy3Kqrdp/XL4Kq5amPL095JHogzGhiiPGE+ZH2riAQ=;
 b=AJdO0DwZOTKPg6loE3uanFvOTXUJVKum+5y68Y0s8kjHPewopOrI/HCc/BG5wcjAzuiYR6
 e7kzoo244EAfEpEvZKlrTNh0A09iHfROpVLIB3kOGDziyyZm85var+zvVerpDky52T32qq
 cgxa6tr9TbSZLwGV7pxkBnIv6l3b684=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-aRgw3R1_NhyCokGEPQbI_A-1; Tue, 14 Mar 2023 05:10:37 -0400
X-MC-Unique: aRgw3R1_NhyCokGEPQbI_A-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so5397343wms.9
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 02:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678785036;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=evy3Kqrdp/XL4Kq5amPL095JHogzGhiiPGE+ZH2riAQ=;
 b=OOwFqQuhrtzGQA8id2Mb3rokagrKRnO/e4sbeJP6QweDI1BjJ/xgIY9kJmV3C35KVu
 Mt3/Hkcnv3lYzo9zpn/LoipIQybhS0bSpHV/HE7rdqXqVLsettvensO1g0ZPIqUtXpQO
 nFS2a7hi0/F+blMawoyWk/mX5vvprVVoGU7xtY2sYVWUaY5QOlGasp6ZLgtk93SncQZe
 i6832PksZx6C7sDd8j4RZZKCe98YPfqtNgXII3GjCtwXNx4bwQ/nbQPEU0I3+TSUvf4Z
 /+CUskpQ2PdrWMeM2Lz19n90lJO0i/7LYnUhl11P3zWs+7i50Ye1RadmReqrVUY249Ts
 Wp7w==
X-Gm-Message-State: AO0yUKV7gSAZXSrY7ATRNoZ7yxNJBUF4/9rnHSmKJdQsq0MKeElJ2bju
 H3TTU0pJaet54605NqsuqJRcf946Lifu4L0nwe+2NXZFFLKEHQI9XPKoox7W5WzPVg631kc0Dj8
 T951g8494inwFqA73mzrYLg4=
X-Received: by 2002:a05:600c:1c1d:b0:3ea:edd7:1f1f with SMTP id
 j29-20020a05600c1c1d00b003eaedd71f1fmr13384592wms.40.1678785036180; 
 Tue, 14 Mar 2023 02:10:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set8sXv6/DmzlzM7FgoAsfdo3fOlJolXgmrYyQT4eAQpp6qqbreMQU3CLjgp5BIiMgAgLGLxXKg==
X-Received: by 2002:a05:600c:1c1d:b0:3ea:edd7:1f1f with SMTP id
 j29-20020a05600c1c1d00b003eaedd71f1fmr13384572wms.40.1678785035860; 
 Tue, 14 Mar 2023 02:10:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:1000:21d5:831d:e107:fbd6?
 (p200300cbc704100021d5831de107fbd6.dip0.t-ipconnect.de.
 [2003:cb:c704:1000:21d5:831d:e107:fbd6])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a1c7318000000b003e8dcc67bdesm2179674wmb.30.2023.03.14.02.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 02:10:35 -0700 (PDT)
Message-ID: <09ef41ae-448d-b29a-6352-d86cd6e67362@redhat.com>
Date: Tue, 14 Mar 2023 10:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/s390x: Fix EXECUTE of relative long
 instructions
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230313233819.122329-1-iii@linux.ibm.com>
 <20230313233819.122329-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230313233819.122329-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 14.03.23 00:38, Ilya Leoshkevich wrote:
> The code uses the wrong base for relative addressing: it should use the
> target instruction address and not the EXECUTE's address.
> 
> Fix by storing the target instruction address in the new CPUS390XState
> member and loading it from the code generated by in2_ri2().
> 
> Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/cpu.h            |  1 +
>   target/s390x/tcg/mem_helper.c |  1 +
>   target/s390x/tcg/translate.c  | 10 +++++++++-
>   3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 7d6d01325b2..8aaf8dd5a3b 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -87,6 +87,7 @@ struct CPUArchState {
>       uint64_t cc_vr;
>   
>       uint64_t ex_value;
> +    uint64_t ex_target;
>   
>       uint64_t __excp_addr;
>       uint64_t psa;
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 6835c26dda4..00afae2b640 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -2530,6 +2530,7 @@ void HELPER(ex)(CPUS390XState *env, uint32_t ilen, uint64_t r1, uint64_t addr)
>          that ex_value is non-zero, which flags that we are in a state
>          that requires such execution.  */
>       env->ex_value = insn | ilen;
> +    env->ex_target = addr;
>   }
>   
>   uint32_t HELPER(mvcos)(CPUS390XState *env, uint64_t dest, uint64_t src,
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 811049ea281..fefff95b91c 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -5888,7 +5888,15 @@ static void in2_a2(DisasContext *s, DisasOps *o)
>   
>   static void in2_ri2(DisasContext *s, DisasOps *o)
>   {
> -    o->in2 = tcg_const_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
> +    int64_t delta = (int64_t)get_field(s, i2) * 2;
> +
> +    if (unlikely(s->ex_value)) {
> +        o->in2 = tcg_temp_new_i64();
> +        tcg_gen_ld_i64(o->in2, cpu_env, offsetof(CPUS390XState, ex_target));
> +        tcg_gen_addi_i64(o->in2, o->in2, delta);
> +    } else {
> +        o->in2 = tcg_const_i64(s->base.pc_next + delta);
> +    }
>   }
>   #define SPEC_in2_ri2 0
>   

LGTM, hopefully Richard can have another look. Thanks!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


