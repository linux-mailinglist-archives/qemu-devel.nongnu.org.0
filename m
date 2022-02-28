Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F464C7BD6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 22:23:38 +0100 (CET)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOnUX-0004Am-BD
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 16:23:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOnRi-000220-DX
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:20:42 -0500
Received: from [2607:f8b0:4864:20::636] (port=41901
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOnRg-0001fm-Ne
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:20:41 -0500
Received: by mail-pl1-x636.google.com with SMTP id z2so11808707plg.8
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 13:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7PG8JV8kzo1glm3HMl+x9//M3Yxb+DdHJwnM7XhVOYM=;
 b=Hjs3NQq65flEwLaNOWhMtpeWXX9mYWTQ4CmrnLpC5/+Gf8D/412S87AsFqjCRkz3lH
 Ek4wp5ix4aYTnwkuG5DfBmMRRGYotwNzksaZIc6SNWRDpsIoRsuIM3ItEQeGeqfOallS
 OoGxZI12fBmpHZGbdDRokR4Q5ELwFy5rZSfVO+5cvwsBx1jjJ/wL0x88/37cjer7Xne6
 5beZpH+EEtF+CXpeh4hgHUW9l69VPEn/yZkk3i26bYeBvXPXA3y5gOd+s+TfxgxdYwgm
 XP/0fedb2mSwejjHby2D1nVuFWFB+ZzAgNM1YkkHVHxP7FNSmx5NO0NTnzCfHdR8vI7j
 W2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7PG8JV8kzo1glm3HMl+x9//M3Yxb+DdHJwnM7XhVOYM=;
 b=qyY2BiXYLxBkEyRH3cPTnM7/Gy3cEqg7FzCv7jwD05KDZ+jBXBZBgvwPmh7UCq1NTu
 ukp4/DodRrH8L48JvOcBmWbqRXoR8REwSoQ9cwLk6EybFXRyn/AeFK/LTGcrIaeRR2+t
 row7NriT9hSsMEGW8pr81I42WoRKnySKtCnNeZL3VBiRC8frS+1Em4AmNbI0UJx520S9
 +E4vWcSUpsFfZNhWuOrcPhMgIGPsI3B62cagG3f8KZiAAftGJSKl5JGycqrB39uj47H4
 LcVNHAJ8DhooVfxVksqEtSPGHz0fiOQixlPD+lBrAtqY2XOrJSzS1O7t8fdO7k+q363G
 uGcw==
X-Gm-Message-State: AOAM533XsGEqE5ske0WXtNBIzY14Mcq8eqEOiSjIXZ48exm8bp+L3Q4H
 VJOLokY2CGecFA0fVnx4M73hnQ==
X-Google-Smtp-Source: ABdhPJzbtFzTxAgR3YU86OkMimg8lkYTfXcheXlHsZ5htQX6b5FpjKDAuteVnPosEY+PKmogjrww3Q==
X-Received: by 2002:a17:90a:9408:b0:1b5:3908:d3d1 with SMTP id
 r8-20020a17090a940800b001b53908d3d1mr18565113pjo.188.1646083239478; 
 Mon, 28 Feb 2022 13:20:39 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a056a0014d100b004f1063290basm14512598pfu.15.2022.02.28.13.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 13:20:39 -0800 (PST)
Message-ID: <b5c0c9bc-2a93-96cf-5f4a-d50da912aca8@linaro.org>
Date: Mon, 28 Feb 2022 11:20:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] meson: fix CONFIG_ATOMIC128 check
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220228200032.777433-1-marcandre.lureau@redhat.com>
 <20220228200032.777433-2-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228200032.777433-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, philippe.mathieu.daude@gmail.com,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 10:00, marcandre.lureau@redhat.com wrote:
> -# See if 64-bit atomic operations are supported.
> -# Note that without __atomic builtins, we can only
> -# assume atomic loads/stores max at pointer size.
> -config_host_data.set('CONFIG_ATOMIC64', cc.links('''
> +atomic_test = '''
>     #include <stdint.h>
>     int main(void)
>     {
> -    uint64_t x = 0, y = 0;
> +    @0@ x = 0, y = 0;
>       y = __atomic_load_n(&x, __ATOMIC_RELAXED);
>       __atomic_store_n(&x, y, __ATOMIC_RELAXED);
>       __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
>       __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
>       __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
>       return 0;
> -  }'''))
> +  }'''
> +
> +# See if 64-bit atomic operations are supported.
> +# Note that without __atomic builtins, we can only
> +# assume atomic loads/stores max at pointer size.
> +config_host_data.set('CONFIG_ATOMIC64', cc.links(atomic_test.format('uint64_t')))
>   
>   has_int128 = cc.links('''
>     __int128_t a;
> @@ -1837,15 +1839,10 @@ has_int128 = cc.links('''
>   config_host_data.set('CONFIG_INT128', has_int128)
>   
>   if has_int128
> -  has_atomic128 = cc.links('''
> -    int main(void)
> -    {
> -      unsigned __int128 x = 0, y = 0;
> -      y = __atomic_load(&x, 0);
> -      __atomic_store(&x, y, 0);
> -      __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
> -      return 0;
> -    }''')
> +  # "do we have 128-bit atomics which are handled inline and specifically not
> +  # via libatomic". The reason we can't use libatomic is documented in the
> +  # comment starting "GCC is a house divided" in include/qemu/atomic128.h.
> +  has_atomic128 = cc.links(atomic_test.format('unsigned __int128'))

Nice fix.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

