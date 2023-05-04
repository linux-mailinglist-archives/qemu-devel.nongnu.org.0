Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3A76F65A5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:23:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTHu-0007d4-KK; Thu, 04 May 2023 03:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puTHd-0007al-TE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puTHc-0002Mo-8W
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683184900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEIJAhPmVBaFq2zXLz4mDps4gZ9jRqa3EL5mhn/V6Mk=;
 b=XNkHB3XYDr8Sw24pkGUGm5eIfaaTwktHy2FpJZXV/CB9Zihvx+D3L+2EjHkwfrYatViz5R
 2/k23lrD9eCrxzyAtSVwbU4+LfL9RRhQPd3NbdnUqAhO6FmenZhvJ3lAjydEbP48GlnVZ5
 1R+zd71vwhwmBgB2n3t96w5ClB2UG4Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-30-tA_THMZGfJTC5FyYCog-1; Thu, 04 May 2023 03:21:39 -0400
X-MC-Unique: 30-tA_THMZGfJTC5FyYCog-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a341efd9aso17138966b.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184898; x=1685776898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uEIJAhPmVBaFq2zXLz4mDps4gZ9jRqa3EL5mhn/V6Mk=;
 b=X9d0qrjrctoqrWXJb3ksCRvbktvystEG+/k+kksMDvhc5gRdd35QjZ4/KXTF55L+Er
 55TRDtagD/ZSuTxCsiN9FGmLeDnVXFcpDfVkLf/kvpjf51+B3idlqdKPT5tzUl3B5xjp
 PPpt5/19fXrmoKN8/v8vPTJ54ftY9Xc1iGhtifCA/7dsEjkOKTjuuf25lhb1Ku6JyQDs
 DTEXBACmJTtygrZXSO3ooeVvbn8Xf2SETvBethnyOFCfLP1ra1X7ZxRUySnfqtXFNpZh
 g1yDzaHgXa8345fUA0KRYhteMGq46eaz5Q8QnA+k2S1MplrHqJ+1b2XwSBbEB1bpFp4W
 4nVw==
X-Gm-Message-State: AC+VfDzqugwE980CSUS7ZDg5RmTkWVJxvY+xrvv03xe/FzixTeAUiq2N
 Xm5ljSUf0sephroa4+PpIdSKylV6sBzXVO/kBpArkEu9hkJXlc6DMgVNuj+hTjX8HqAm2RFtntu
 ydJZ8338D/cnhy9s=
X-Received: by 2002:a17:907:948a:b0:8b1:3467:d71b with SMTP id
 dm10-20020a170907948a00b008b13467d71bmr5675401ejc.48.1683184898118; 
 Thu, 04 May 2023 00:21:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6aOIrIucB0PWPf64mTWu5sAC2F1BR5fl4vORke6w+PIQKizLUqWecTK3wpjMsffz0Nh0c7yA==
X-Received: by 2002:a17:907:948a:b0:8b1:3467:d71b with SMTP id
 dm10-20020a170907948a00b008b13467d71bmr5675390ejc.48.1683184897844; 
 Thu, 04 May 2023 00:21:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 s25-20020a170906779900b0094a52b041dasm18495451ejm.112.2023.05.04.00.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 00:21:37 -0700 (PDT)
Message-ID: <98c2213b-ea26-c994-c8c8-825f2387081d@redhat.com>
Date: Thu, 4 May 2023 09:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] target/arm: Add CONFIG_ARM_V7M back to default.mak
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-3-farosas@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503193833.29047-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 21:38, Fabiano Rosas wrote:
> We cannot allow this config to be disabled at the moment as not all of
> the relevant code is protected by it.
> 
> Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
> KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
> is now possible that nothing selects ARM_V7M (e.g. when doing a
> --without-default-devices build).
> 
> Return the CONFIG_ARM_V7M entry to default.mak while we don't enable
> the compilation without it. Note that this goes against the intention
> of commit cd43648a44 ("hw/arm: move CONFIG_V7M out of
> default-devices"), but at this point this is the smallest change we
> can do.

If this is a dependency of target/arm/tcg/translate.c on ARM_V7M, it 
should be written as

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3f3394a22b23..498bdba1e139 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,5 +1,6 @@
  config ARM
      bool
+    select ARM_V7M if TCG

  config AARCH64
      bool


Paolo

> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configs/devices/arm-softmmu/default.mak | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
> index 647fbce88d..0c2b24d6bb 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -4,3 +4,4 @@
>   # CONFIG_TEST_DEVICES=n
>   
>   CONFIG_ARM_VIRT=y
> +CONFIG_ARM_V7M=y


