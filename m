Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2B63A787D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:51:32 +0200 (CEST)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3r9-0000VE-Rh
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3ob-0006zy-8G
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3oZ-0007he-CT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EyWFW3xnadBgzeuQf5++SGIaPaUS4a16NV7BnPQQGII=;
 b=M5B1IsbLU8Kvm281B56xnsY3xuNWeuCNZbnVQLF6pvdJOF/vXGngKY/ZggU2xXsFzbgVl0
 DbDOvz3kvHr1RWkDkmkgjaXVS6G//8S5Jo7q3D6av36V70/oz4+zwkWidmRK/7b/EoYiLU
 PhzKSY4yhC0oVf3dWIKS8VPGsBRNqgw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-lh45rtoeMnax3q2kAbNXlg-1; Tue, 15 Jun 2021 03:48:48 -0400
X-MC-Unique: lh45rtoeMnax3q2kAbNXlg-1
Received: by mail-wm1-f70.google.com with SMTP id
 z19-20020a7bc1530000b02901ab5fafdcb4so3052087wmi.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EyWFW3xnadBgzeuQf5++SGIaPaUS4a16NV7BnPQQGII=;
 b=gbkF1uDTfdQaEC8+OFWYWBLB6NFozMWeYn9QuXNbcH0l1xEGQgJcT3f1meVTfqIyzR
 F/bp0mn5vu2WEMuaIM/1VhDMAQ5bZhsJqK++GPNYVYpLIuv66ft9l5K1iLMhJ4ngMamL
 j9BeaM/3NBdfxJp5ppSwuFB9KuddgI99MDotr3oeHUcFyQlBl0002UdJdEzI/xw8NAtW
 jpb/7/EfrON8zWGFpSljFamSRm/9MJvftShrw11mejqbVY09R5KKQodvs87tqg2R4xIe
 v5KEv2V/kf1EbJ+Eq6Aq+9bDX+7qU7GmFs1KXZTQ9j7bSDpsNp2oqVZvccBpccB7AijI
 a2uw==
X-Gm-Message-State: AOAM531D3o+X1tnderR94r4pIUQfvXUZ2J3Y3pXt9NLBN9hLPvfMrYvX
 pqcEwBwDXsdYe/hF0gWzjOEr23+sC+xUmPWXw918gRkYolLlZ4OzOEXQo8tiMaMGQPeUBdiBWmG
 2aRmEUKEM1MOPg1A=
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr22645225wrw.276.1623743327783; 
 Tue, 15 Jun 2021 00:48:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxetKN8y2cWTMDR3bpojutydEZFE7S2KrJzNeFkE0gTVKpldcnkQyTGcIpTWKuQoSvA5CejkQ==
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr22645202wrw.276.1623743327505; 
 Tue, 15 Jun 2021 00:48:47 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831d2.dip0.t-ipconnect.de.
 [217.232.49.210])
 by smtp.gmail.com with ESMTPSA id n7sm1385703wmq.37.2021.06.15.00.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:48:47 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] softfloat: Use _Generic instead of QEMU_GENERIC
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-3-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b5abcdde-b5a6-e33d-3450-386999cb43de@redhat.com>
Date: Tue, 15 Jun 2021 09:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210614233143.1221879-3-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/2021 01.31, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 4d0160fe9c..6e769f990c 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -686,11 +686,13 @@ static float128 float128_pack_raw(const FloatParts128 *p)
>   #include "softfloat-specialize.c.inc"
>   
>   #define PARTS_GENERIC_64_128(NAME, P) \
> -    QEMU_GENERIC(P, (FloatParts128 *, parts128_##NAME), parts64_##NAME)
> +    _Generic((P), FloatParts64 *: parts64_##NAME, \
> +                  FloatParts128 *: parts128_##NAME)
>   
>   #define PARTS_GENERIC_64_128_256(NAME, P) \
> -    QEMU_GENERIC(P, (FloatParts256 *, parts256_##NAME), \
> -                 (FloatParts128 *, parts128_##NAME), parts64_##NAME)
> +    _Generic((P), FloatParts64 *: parts64_##NAME, \
> +                  FloatParts128 *: parts128_##NAME, \
> +                  FloatParts256 *: parts256_##NAME)
>   
>   #define parts_default_nan(P, S)    PARTS_GENERIC_64_128(default_nan, P)(P, S)
>   #define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
> @@ -892,11 +894,13 @@ static void parts128_log2(FloatParts128 *a, float_status *s, const FloatFmt *f);
>    */
>   
>   #define FRAC_GENERIC_64_128(NAME, P) \
> -    QEMU_GENERIC(P, (FloatParts128 *, frac128_##NAME), frac64_##NAME)
> +    _Generic((P), FloatParts64 *: frac64_##NAME, \
> +                  FloatParts128 *: frac128_##NAME)
>   
>   #define FRAC_GENERIC_64_128_256(NAME, P) \
> -    QEMU_GENERIC(P, (FloatParts256 *, frac256_##NAME), \
> -                 (FloatParts128 *, frac128_##NAME), frac64_##NAME)
> +    _Generic((P), FloatParts64 *: frac64_##NAME, \
> +                  FloatParts128 *: frac128_##NAME, \
> +                  FloatParts256 *: frac256_##NAME)
>   
>   static bool frac64_add(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
>   {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


