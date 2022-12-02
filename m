Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFBF64038C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 10:43:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12ZA-00063J-1i; Fri, 02 Dec 2022 04:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p12Z7-000605-2k
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 04:42:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p12Z5-0004N8-79
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 04:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669974158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfaDqWv8YwDbpEhD4yURO1xPPWL91xoekS/AvO1tnkQ=;
 b=MZ46mLMYSb+fOFMgiTHki4V383KJO5J00AhWF/babMxcGZzB/8jYS1hzoAzwevMhIqD3H9
 nEuBVWGTqmuXZ/J5iSdK9N91nvprnCg/OwNr3e4Q/BJn0hyQFKKPA8Fm/IL/R2Jfct5co+
 4GivhTTafWjtctQBVLphgEgVcbSmVIA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208--n4ZxFBgMLOgUfHLG7eAkw-1; Fri, 02 Dec 2022 04:42:36 -0500
X-MC-Unique: -n4ZxFBgMLOgUfHLG7eAkw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m24-20020adfa3d8000000b00242168ce9d1so935491wrb.15
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 01:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mfaDqWv8YwDbpEhD4yURO1xPPWL91xoekS/AvO1tnkQ=;
 b=cOsfjIxAbUvbzV/iT9SVetng0piMLPMMJQTOZCkN14Lm8pzNoVyiommRZWZHoAW+oV
 Lq/QC7lPRccOiZreozhqezO1HAFEuJsL1h5Se/MchIMdhRDNMUOueKTO4ueh7Bd4WrLS
 EEt/OUlnboVG9kvSjpzG7+kEYb3/X1B97gEiNKtnr6aGGBLOtbuPhiOdMIbiTUmOFtdb
 LI3qUlcTHWYAM1jRrwerLIWmEXghpSWTkhZJNnv/0Jen1adho3lG2Rj/fnRlLGHkqYJ+
 j+bSEKAquZHArbUbQ3F0i8chvLJhK1HK3lO2qxrKibVoyyTwh4Jj+xIOdk8eXdRpkfYu
 ANCA==
X-Gm-Message-State: ANoB5pmDdTNZf9+rVKBrakrKFhOmQDrmsDvGgc8prkP+iSLlsIN/O8vK
 iGY5jbfLLrr2d+JRqtdO9aHsrrNVLTbJWkCQx27dpxoEFmHEZ3wYyA1Jpn7hkWWv1YTpyGuLeG2
 rJCxnBCr6MsDsuw0=
X-Received: by 2002:a05:600c:a52:b0:3d0:73ab:461d with SMTP id
 c18-20020a05600c0a5200b003d073ab461dmr8344771wmq.73.1669974155227; 
 Fri, 02 Dec 2022 01:42:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Cf+7ogKmDWq+hgdjp1o8mz7FKaGDlbb395ORjrrivVWaO280Nr75OllHMl0v0J96hssG5uw==
X-Received: by 2002:a05:600c:a52:b0:3d0:73ab:461d with SMTP id
 c18-20020a05600c0a5200b003d073ab461dmr8344764wmq.73.1669974154979; 
 Fri, 02 Dec 2022 01:42:34 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 f18-20020a05600c4e9200b003c6c182bef9sm16207276wmq.36.2022.12.02.01.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 01:42:34 -0800 (PST)
Message-ID: <5deff299-b55c-be5d-3ff2-719357a3be5b@redhat.com>
Date: Fri, 2 Dec 2022 10:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/34] meson: Move CONFIG_TCG_INTERPRETER to config_host
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
 <20221202053958.223890-3-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221202053958.223890-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/2/22 06:39, Richard Henderson wrote:
> Like CONFIG_TCG, the enabled method of execution is a host property
> not a guest property.  This exposes the define to compile-once files.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 5c6b5a1c75..23a3625abc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -469,6 +469,7 @@ if get_option('tcg').allowed()
>     endif
>     if get_option('tcg_interpreter')
>       tcg_arch = 'tci'
> +    config_host += { 'CONFIG_TCG_INTERPRETER': 'y' }
>     elif host_arch == 'x86_64'
>       tcg_arch = 'i386'
>     elif host_arch == 'ppc64'
> @@ -2545,9 +2546,6 @@ foreach target : target_dirs
>       if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
>         config_target += { sym: 'y' }
>         config_all += { sym: 'y' }
> -      if sym == 'CONFIG_TCG' and tcg_arch == 'tci'
> -        config_target += { 'CONFIG_TCG_INTERPRETER': 'y' }
> -      endif
>         if target in modular_tcg
>           config_target += { 'CONFIG_TCG_MODULAR': 'y' }
>         else


