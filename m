Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B96A239E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:18:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfRE-00087U-BH; Fri, 24 Feb 2023 16:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfRB-00085c-KJ
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:17:05 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfR8-0008II-S0
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:17:05 -0500
Received: by mail-pg1-x542.google.com with SMTP id z10so330543pgr.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 13:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hTMhKt/DhwyTBq78EN5AUy6jZKGaHlLqxvuYcuB2Ry0=;
 b=vabLXwAeiaV3a+pHhuluI/9dszwfuql+xiGGpMKyno/fHgIhaMD7n9PT8YzQ4bxN3v
 Yiy2hBvwgLWjjLUGxWpmseYAIgb9bJ6heA3901wOAZfPZcf88W5PJKRcPtMWeiAzC3XC
 OpCmciymt1L3uPfu+pgON5JEoDQs4nfdY+Lt43QjoHsXYAACSEy283GvkrIgqG1J02e1
 cdfw3nysrw9OViV4o9rtYr+FEjltcbXXsGjhl5Z2ZM3+gdyME4INw9HjCKa9BEWgzTcT
 eU6iyDcpt1Ys+uuYdYwZxT+aq13vXQMr7+4MMHIAvXToSX61dGLpGKFPVlVoMQbXs8Gz
 BuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hTMhKt/DhwyTBq78EN5AUy6jZKGaHlLqxvuYcuB2Ry0=;
 b=Sftv3gdtGL3wCXolpdZwAluNEZP+po7hgj8Et4osP5QXDNwnTNbtGMuFv41ElXP5SW
 NDQZwQfFO1LS7qSnF0BEHy54JN7XvqZmoJyfm3nuFvnDfFNzLTNfmL6Lvse8sm0v+lOd
 Oo6a30pzpjztFCgZPTZXffscsKize5T7Ro9sSexn2Ri3qprfm38lFWsAeGtivAecfYCt
 SL12zGDNaeuSYbIFbmEUYkNHUyNmclPF7cv7H0IonMGYKvtM+BAikL4g+u+K76FtadXf
 Dj2cx89sr8RPilIpRieqEKnXAGU4DJ85FQFeCtEF6xr7Mv5v9uS90sYTOBXDsvxHICIT
 qz5Q==
X-Gm-Message-State: AO0yUKVyXSCEnzpnuUS2I/QCCqfQhERCp1YHD/UHDM5699YAxLTGlM4t
 eUfEc9Fhc/RyBSCR896PnuPH/Q==
X-Google-Smtp-Source: AK7set+hGUlJj58nrvQSt1wrk8ESY1ZNj2XudzxfdEmKSWMdnZKsIkk6aX1PKj0zmD4m0Xj38WNRsA==
X-Received: by 2002:a62:1901:0:b0:5b4:beb2:2042 with SMTP id
 1-20020a621901000000b005b4beb22042mr14542544pfz.19.1677273420016; 
 Fri, 24 Feb 2023 13:17:00 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 g2-20020a62e302000000b00593e84f2d08sm18883pfh.52.2023.02.24.13.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:16:59 -0800 (PST)
Message-ID: <ea805ac0-6af2-6648-0918-a3f3eb13c8d3@linaro.org>
Date: Fri, 24 Feb 2023 11:16:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] qapi: Generate enum count as definition in
 gen_enum_lookup()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230224155451.20211-1-philmd@linaro.org>
 <20230224155451.20211-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230224155451.20211-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/24/23 05:54, Philippe Mathieu-Daudé wrote:
> QAPI's gen_enum() generates QAPI enum values and the number
> of this values (as foo__MAX).
> The number of entries in an enum type is not part of the
> enumerated values, but we generate it as such. See for
> example:
> 
>    typedef enum OnOffAuto {
>        ON_OFF_AUTO_AUTO,
>        ON_OFF_AUTO_ON,
>        ON_OFF_AUTO_OFF,
>        ON_OFF_AUTO__MAX,        <---------
>    } OnOffAuto;
> 
> Instead of declaring the enum count as the last enumerated
> value, #define it, so it is not part of the enum. The previous
> example becomes:
> 
>    typedef enum OnOffAuto {
>        ON_OFF_AUTO_AUTO,
>        ON_OFF_AUTO_ON,
>        ON_OFF_AUTO_OFF,
>    #define ON_OFF_AUTO__MAX 3   <---------
>    } OnOffAuto;
> 
> Since Clang enables the -Wswitch warning by default [*], remove all
> pointless foo__MAX cases in switch statement, in order to avoid:
> 
>   audio/audio.c:2231:10: error: case value not in enumerated type 'AudioFormat' (aka 'enum AudioFormat') [-Wswitch]
>      case AUDIO_FORMAT__MAX:
>           ^
>   ui/input.c:233:14: error: case value not in enumerated type 'KeyValueKind' (aka 'enum KeyValueKind') [-Wswitch]
>          case KEY_VALUE_KIND__MAX:
>               ^
>   ...
> 
> [*]https://clang.llvm.org/docs/DiagnosticsReference.html#wswitch
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---

Yay!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

