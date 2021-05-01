Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DCB37046B
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 02:29:41 +0200 (CEST)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcdVs-0008FZ-Ij
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 20:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcdTb-0007Wg-Or
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 20:27:19 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcdTZ-0001o9-L1
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 20:27:19 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 10so272686pfl.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=Xd6E3NddYZsGxuKCScWAY3kRpJaiDjeURdJptDarh8Q=;
 b=o9UBZfd9fC0JOFBHcvaEGIN9QEN76Rq6DQHZWDe65Yp8+Z6HuKx8xAvOMZ7DNtrZy+
 4rK6YKZrmbMGd1lYmHn5JTDuH1n8qMaCAIkRKZFc+25l6Ek4Z6LnWiD9HDI8+1JwjP6+
 8x2Cghdz1GD0XF6odEB42D/XScQpK69B3o3bqS5Q7nV48UzhwFP4BoTEw5BoR4+d9v8A
 SJayjZhbV8dKoVn74dzXeCTpriZSbRt18ueLp6sHSAkZu3DMfA7mNt8+erU2XP0Tgdhi
 as4r//q/Nab09kl0GldY1epNKRiFku0hMpqfn+C8RWADBitGAnBJJpxYE1iqps0SLNx8
 8RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=Xd6E3NddYZsGxuKCScWAY3kRpJaiDjeURdJptDarh8Q=;
 b=hSZmRYSY6hhuRCEkOYGAGbJ4xZzuAIn5D32pS1jy7yWJuKS8zQhUayQZYtyT+mDmMD
 6FV4H4Or71Z5sfmi0JxCH3xnuwXpaJeEVi3hH2PDgSBqCtFkstNxRLYdqwcS8x3mpOZO
 2F6Up1bmhrh4pSVhHLv92pgTSvG6YNNCxo8CVyuUau8EjkbvTu3UY44fgHVyhjRpQtAU
 /i6gA4xV4LZ9xSx5fufcHkN6DbYGyqehWD+J39JFOvGGZ/nJfSZSGEDYXpvpEO4VKa5k
 dHZVOFr8fA0M+E1SNMDkvqgjr1b2GQBHV4I941FWAy/4I8sbdfAUjQSxn2FxDy95k9Dy
 N4FQ==
X-Gm-Message-State: AOAM5330NSaaS1Fmh2yKChOeMpa/fYVnYOk6zIFXvniWkCsNtHGeYgxV
 +PXR3C6ah+IO+PoW+PnuER4n8w==
X-Google-Smtp-Source: ABdhPJx4UV27MylE8KaMSV3aFxjOEfOYwx5do9Doyq38fxwWD2/ZT8ExpWApWj7IgYYtp+6f0046IA==
X-Received: by 2002:a63:e044:: with SMTP id n4mr7085282pgj.47.1619828835695;
 Fri, 30 Apr 2021 17:27:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id y195sm3570844pfb.11.2021.04.30.17.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 17:27:15 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] target/ppc: Created !TCG SPR registration macro
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-2-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb40e011-cf22-1044-43b0-75401d074796@linaro.org>
Date: Fri, 30 Apr 2021 17:27:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430193533.82136-2-bruno.larsen@eldorado.org.br>
Content-Type: multipart/mixed; boundary="------------BB377740B9BFFBA0F9C052DF"
Content-Language: en-US
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------BB377740B9BFFBA0F9C052DF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
> moved RW callback parameters of _spr_register into an ifdef, to support
> building without TCG in the future, and added definitions for
> spr_register and spr_register_kvm, to keep the same call regardless of
> build options
> 
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/translate_init.c.inc | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index 6235eb7536..22b23793fd 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -720,6 +720,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>       helper_mtvscr(env, val);
>   }
>   
> +#ifdef CONFIG_TCG
>   #ifdef CONFIG_USER_ONLY
>   #define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
>                            oea_read, oea_write, one_reg_id, initial_value)       \
> @@ -728,7 +729,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>                               oea_read, oea_write, hea_read, hea_write,          \
>                               one_reg_id, initial_value)                         \
>       _spr_register(env, num, name, uea_read, uea_write, initial_value)
> -#else
> +#else /* CONFIG_USER_ONLY */
>   #if !defined(CONFIG_KVM)
>   #define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
>                            oea_read, oea_write, one_reg_id, initial_value)       \
> @@ -739,7 +740,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>                               one_reg_id, initial_value)                         \
>       _spr_register(env, num, name, uea_read, uea_write,                         \
>                     oea_read, oea_write, hea_read, hea_write, initial_value)
> -#else
> +#else /* CONFIG_KVM */
>   #define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
>                            oea_read, oea_write, one_reg_id, initial_value)       \
>       _spr_register(env, num, name, uea_read, uea_write,                         \
> @@ -751,8 +752,21 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>       _spr_register(env, num, name, uea_read, uea_write,                         \
>                     oea_read, oea_write, hea_read, hea_write,                    \
>                     one_reg_id, initial_value)
> -#endif
> -#endif
> +#endif /* CONFIG_KVM */
> +#endif /* CONFIG_USER_ONLY */
> +#else /* CONFIG_TCG */
> +#ifdef CONFIG_KVM /* sanity check. should always enter this */
> +#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
> +                         oea_read, oea_write, one_reg_id, initial_value)       \
> +    _spr_register(env, num, name, one_reg_id, initial_value)
> +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
> +                            oea_read, oea_write, hea_read, hea_write,          \
> +                            one_reg_id, initial_value)                         \
> +    _spr_register(env, num, name, one_reg_id, initial_value)
> +#else /* CONFIG_KVM */
> +#error "Either TCG or KVM should be configured"
> +#endif /* CONFIG_KVM */
> +#endif /* CONFIG_TCG */

I think this ifdef tree, and the repetition, is unnecessarily confusing.  How 
about something like this?

r~

--------------BB377740B9BFFBA0F9C052DF
Content-Type: text/plain; charset=UTF-8;
 name="patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patch.txt"

ZGlmZiAtLWdpdCBhL3RhcmdldC9wcGMvdHJhbnNsYXRlX2luaXQuYy5pbmMgYi90YXJnZXQv
cHBjL3RyYW5zbGF0ZV9pbml0LmMuaW5jCmluZGV4IDIyYjIzNzkzZmQuLjFlMTUzOWY5Mjkg
MTAwNjQ0Ci0tLSBhL3RhcmdldC9wcGMvdHJhbnNsYXRlX2luaXQuYy5pbmMKKysrIGIvdGFy
Z2V0L3BwYy90cmFuc2xhdGVfaW5pdC5jLmluYwpAQCAtNzIxLDUyICs3MjEsMzQgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHZzY3JfaW5pdChDUFVQUENTdGF0ZSAqZW52LCB1aW50MzJfdCB2
YWwpCiB9CiAKICNpZmRlZiBDT05GSUdfVENHCi0jaWZkZWYgQ09ORklHX1VTRVJfT05MWQor
IyBkZWZpbmUgVShYKSAgIFgsCisjIGlmbmRlZiBDT05GSUdfVVNFUl9PTkxZCisjICBkZWZp
bmUgUyhYKSAgWCwKKyMgZWxzZQorIyAgZGVmaW5lIFMoWCkKKyMgZW5kaWYKKyNlbHNlCisj
IGRlZmluZSBVKFgpCisjIGRlZmluZSBTKFgpCisjZW5kaWYKKyNpZmRlZiBDT05GSUdfS1ZN
CisjIGRlZmluZSBLKFgpICAgWCwKKyNlbHNlCisjIGRlZmluZSBLKFgpCisjZW5kaWYKKwog
I2RlZmluZSBzcHJfcmVnaXN0ZXJfa3ZtKGVudiwgbnVtLCBuYW1lLCB1ZWFfcmVhZCwgdWVh
X3dyaXRlLCAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgICAgICBv
ZWFfcmVhZCwgb2VhX3dyaXRlLCBvbmVfcmVnX2lkLCBpbml0aWFsX3ZhbHVlKSAgICAgICBc
Ci0gICAgX3Nwcl9yZWdpc3RlcihlbnYsIG51bSwgbmFtZSwgdWVhX3JlYWQsIHVlYV93cml0
ZSwgaW5pdGlhbF92YWx1ZSkKKyAgICBfc3ByX3JlZ2lzdGVyKGVudiwgbnVtLCBuYW1lLCBV
KHVlYV9yZWFkKSBVKHVlYV93cml0ZSkgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAg
ICAgICAgICAgICBTKG9lYV9yZWFkKSBTKG9lYV93cml0ZSkgUyhvZWFfcmVhZCkgUyhvZWFf
d3JpdGUpICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAgSyhvbmVfcmVnX2lkKSBp
bml0aWFsX3ZhbHVlKQorCiAjZGVmaW5lIHNwcl9yZWdpc3Rlcl9rdm1faHYoZW52LCBudW0s
IG5hbWUsIHVlYV9yZWFkLCB1ZWFfd3JpdGUsICAgICAgICAgICAgICAgXAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG9lYV9yZWFkLCBvZWFfd3JpdGUsIGhlYV9yZWFkLCBoZWFf
d3JpdGUsICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbmVfcmVn
X2lkLCBpbml0aWFsX3ZhbHVlKSAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgX3Nw
cl9yZWdpc3RlcihlbnYsIG51bSwgbmFtZSwgdWVhX3JlYWQsIHVlYV93cml0ZSwgaW5pdGlh
bF92YWx1ZSkKLSNlbHNlIC8qIENPTkZJR19VU0VSX09OTFkgKi8KLSNpZiAhZGVmaW5lZChD
T05GSUdfS1ZNKQotI2RlZmluZSBzcHJfcmVnaXN0ZXJfa3ZtKGVudiwgbnVtLCBuYW1lLCB1
ZWFfcmVhZCwgdWVhX3dyaXRlLCAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgICAgICAg
ICAgICAgICAgICBvZWFfcmVhZCwgb2VhX3dyaXRlLCBvbmVfcmVnX2lkLCBpbml0aWFsX3Zh
bHVlKSAgICAgICBcCi0gICAgX3Nwcl9yZWdpc3RlcihlbnYsIG51bSwgbmFtZSwgdWVhX3Jl
YWQsIHVlYV93cml0ZSwgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgICAgICAg
ICAgICAgb2VhX3JlYWQsIG9lYV93cml0ZSwgb2VhX3JlYWQsIG9lYV93cml0ZSwgaW5pdGlh
bF92YWx1ZSkKLSNkZWZpbmUgc3ByX3JlZ2lzdGVyX2t2bV9odihlbnYsIG51bSwgbmFtZSwg
dWVhX3JlYWQsIHVlYV93cml0ZSwgICAgICAgICAgICAgICBcCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgb2VhX3JlYWQsIG9lYV93cml0ZSwgaGVhX3JlYWQsIGhlYV93cml0ZSwg
ICAgICAgICAgXAotICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9uZV9yZWdfaWQsIGlu
aXRpYWxfdmFsdWUpICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICBfc3ByX3JlZ2lz
dGVyKGVudiwgbnVtLCBuYW1lLCB1ZWFfcmVhZCwgdWVhX3dyaXRlLCAgICAgICAgICAgICAg
ICAgICAgICAgICBcCi0gICAgICAgICAgICAgICAgICBvZWFfcmVhZCwgb2VhX3dyaXRlLCBo
ZWFfcmVhZCwgaGVhX3dyaXRlLCBpbml0aWFsX3ZhbHVlKQotI2Vsc2UgLyogQ09ORklHX0tW
TSAqLwotI2RlZmluZSBzcHJfcmVnaXN0ZXJfa3ZtKGVudiwgbnVtLCBuYW1lLCB1ZWFfcmVh
ZCwgdWVhX3dyaXRlLCAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICBvZWFfcmVhZCwgb2VhX3dyaXRlLCBvbmVfcmVnX2lkLCBpbml0aWFsX3ZhbHVlKSAg
ICAgICBcCi0gICAgX3Nwcl9yZWdpc3RlcihlbnYsIG51bSwgbmFtZSwgdWVhX3JlYWQsIHVl
YV93cml0ZSwgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgICAgICAgICAgICAg
b2VhX3JlYWQsIG9lYV93cml0ZSwgb2VhX3JlYWQsIG9lYV93cml0ZSwgICAgICAgICAgICAg
ICAgICAgIFwKLSAgICAgICAgICAgICAgICAgIG9uZV9yZWdfaWQsIGluaXRpYWxfdmFsdWUp
Ci0jZGVmaW5lIHNwcl9yZWdpc3Rlcl9rdm1faHYoZW52LCBudW0sIG5hbWUsIHVlYV9yZWFk
LCB1ZWFfd3JpdGUsICAgICAgICAgICAgICAgXAotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG9lYV9yZWFkLCBvZWFfd3JpdGUsIGhlYV9yZWFkLCBoZWFfd3JpdGUsICAgICAgICAg
IFwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbmVfcmVnX2lkLCBpbml0aWFsX3Zh
bHVlKSAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgX3Nwcl9yZWdpc3RlcihlbnYs
IG51bSwgbmFtZSwgdWVhX3JlYWQsIHVlYV93cml0ZSwgICAgICAgICAgICAgICAgICAgICAg
ICAgXAotICAgICAgICAgICAgICAgICAgb2VhX3JlYWQsIG9lYV93cml0ZSwgaGVhX3JlYWQs
IGhlYV93cml0ZSwgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgICAgICAgICAgIG9u
ZV9yZWdfaWQsIGluaXRpYWxfdmFsdWUpCi0jZW5kaWYgLyogQ09ORklHX0tWTSAqLwotI2Vu
ZGlmIC8qIENPTkZJR19VU0VSX09OTFkgKi8KLSNlbHNlIC8qIENPTkZJR19UQ0cgKi8KLSNp
ZmRlZiBDT05GSUdfS1ZNIC8qIHNhbml0eSBjaGVjay4gc2hvdWxkIGFsd2F5cyBlbnRlciB0
aGlzICovCi0jZGVmaW5lIHNwcl9yZWdpc3Rlcl9rdm0oZW52LCBudW0sIG5hbWUsIHVlYV9y
ZWFkLCB1ZWFfd3JpdGUsICAgICAgICAgICAgICAgICAgXAotICAgICAgICAgICAgICAgICAg
ICAgICAgIG9lYV9yZWFkLCBvZWFfd3JpdGUsIG9uZV9yZWdfaWQsIGluaXRpYWxfdmFsdWUp
ICAgICAgIFwKLSAgICBfc3ByX3JlZ2lzdGVyKGVudiwgbnVtLCBuYW1lLCBvbmVfcmVnX2lk
LCBpbml0aWFsX3ZhbHVlKQotI2RlZmluZSBzcHJfcmVnaXN0ZXJfa3ZtX2h2KGVudiwgbnVt
LCBuYW1lLCB1ZWFfcmVhZCwgdWVhX3dyaXRlLCAgICAgICAgICAgICAgIFwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBvZWFfcmVhZCwgb2VhX3dyaXRlLCBoZWFfcmVhZCwgaGVh
X3dyaXRlLCAgICAgICAgICBcCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgb25lX3Jl
Z19pZCwgaW5pdGlhbF92YWx1ZSkgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgIF9z
cHJfcmVnaXN0ZXIoZW52LCBudW0sIG5hbWUsIG9uZV9yZWdfaWQsIGluaXRpYWxfdmFsdWUp
Ci0jZWxzZSAvKiBDT05GSUdfS1ZNICovCi0jZXJyb3IgIkVpdGhlciBUQ0cgb3IgS1ZNIHNo
b3VsZCBiZSBjb25maWd1cmVkIgotI2VuZGlmIC8qIENPTkZJR19LVk0gKi8KLSNlbmRpZiAv
KiBDT05GSUdfVENHICovCisgICAgX3Nwcl9yZWdpc3RlcihlbnYsIG51bSwgbmFtZSwgVSh1
ZWFfcmVhZCkgVSh1ZWFfd3JpdGUpICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAg
ICAgICAgICAgUyhvZWFfcmVhZCkgUyhvZWFfd3JpdGUpIFMoaGVhX3JlYWQpIFMoaGVhX3dy
aXRlKSAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgICAgIEsob25lX3JlZ19pZCkgaW5p
dGlhbF92YWx1ZSkKIAogI2RlZmluZSBzcHJfcmVnaXN0ZXIoZW52LCBudW0sIG5hbWUsIHVl
YV9yZWFkLCB1ZWFfd3JpdGUsICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAg
ICAgICAgICAgIG9lYV9yZWFkLCBvZWFfd3JpdGUsIGluaXRpYWxfdmFsdWUpICAgICAgICAg
ICAgICAgICAgICAgICBcCg==
--------------BB377740B9BFFBA0F9C052DF--

