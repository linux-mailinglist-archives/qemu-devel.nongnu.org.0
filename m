Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B234BE7B
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 21:15:07 +0200 (CEST)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQasM-0007jn-D7
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 15:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQapd-0006Xh-Um
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:12:19 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:38799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQapZ-0004KE-FF
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:12:17 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so10256417otk.5
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 12:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m9zmD4YRqST/LCdJMpdI15bmiQOFwLbQhOqHkBRQvWU=;
 b=LBzZ4vOQxDJmN+wQgTjh+CQwHDX2h2PQ5GymnGp2W9w9s8m/nzyaHA955s0CTa610V
 DDflEG03OS6mb1qtDDtUfNWJalKqge9m3uagv5QZ6WY+iB3uRX9hdPz+A6/QT8f8zVY4
 bA/4ujalD5bJg322J8EASciLqKEl1bnftczGpkA+cQ01okucikggcvUdY+UWhmLiV4fn
 ew06y19GeTsiE54LphXl+b8y0Il+bosDgdfJzq7dwGIEjYh0dOTPnWRpdkxrwUUy7oZM
 /IYw570vGZ2I841NAlSwewdvfQS8Ihe2uHIkLrvxQPyzoYvuQgDNnjGb+GxaRI/W0QnA
 yt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m9zmD4YRqST/LCdJMpdI15bmiQOFwLbQhOqHkBRQvWU=;
 b=RJiMUkEDQsKUnLp87ed3OBbEr0iWiX4tRoTRJp17Po3cppG2zQuQVLUUVcFgMK3mCU
 UIEvi8s6/OwSCMyIYG4R6aSu4jFVSIp2zMu2cZpRZtkD4NO+KG0JKRSh42yuwLnqOmHq
 MwCuk6RN/g7FoU6rI80OqC6e6rQ6Eq6eBZbD0Q83PR/zWlVMVWng6Wv1DOnjtPd3UMDO
 UBbTpkbOVDDVZF58yK66pSHuEHw/WmLCXF58eG1M2hkW7pKU7vxHwmHfuNiflO+nBmwW
 p8zPEWA5LmF6XTItXTnX+1Wmg3fcug0yEq0Pxvs7RPhIH7bc/R/2JC5Rjbk+3gg4thbe
 O/oA==
X-Gm-Message-State: AOAM532r8PzhglQiO/eva8bsHggHHNDpoePoAB8Vp6rG87R9ikel3+02
 v1KwSzb8bgtdL12IqYctWe9UZA==
X-Google-Smtp-Source: ABdhPJwsN2qTJH4FsFHDEs78eKqOBJSy5ntD5USvcV+2hAe/g/A0ilnpqRLxT4cmwUaJubPTRp09xw==
X-Received: by 2002:a9d:6296:: with SMTP id x22mr19524888otk.196.1616958731915; 
 Sun, 28 Mar 2021 12:12:11 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id e18sm3871130otf.2.2021.03.28.12.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 12:12:11 -0700 (PDT)
Subject: Re: [RFC v12 62/65] target/arm: refactor arm_cpu_finalize_features
 into cpu64
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-63-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e3b446d-59a6-9cba-94a1-9613cc3644c6@linaro.org>
Date: Sun, 28 Mar 2021 13:12:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-63-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> +++ b/target/arm/monitor.c
> @@ -184,9 +184,11 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>           if (!err) {
>               visit_check_struct(visitor, &err);
>           }
> +#ifdef TARGET_AARCH64
>           if (!err) {
> -            arm_cpu_finalize_features(ARM_CPU(obj), &err);
> +            aarch64_cpu_finalize_features(ARM_CPU(obj), &err);
>           }
> +#endif /* TARGET_AARCH64 */
>           visit_end_struct(visitor, NULL);
>           visit_free(visitor);
>           if (err) {
> @@ -195,7 +197,9 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>               return NULL;
>           }
>       } else {
> -        arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
> +#ifdef TARGET_AARCH64
> +        aarch64_cpu_finalize_features(ARM_CPU(obj), &error_abort);
> +#endif /* TARGET_AARCH64 */

These ifdefs are not an improvement.


r~

