Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307573499F2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:07:29 +0100 (CET)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVKK-000386-6A
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPVIX-0002Fi-Lk
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:05:37 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:42513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPVIW-0004GV-1n
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:05:37 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so2978873ota.9
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Va6NDRBCJiI0iOSnPGv8WV8CDHaYwrn9mS1ia5JRbYs=;
 b=yzfpYQ91Vd4IZR40vF7N3AKfJ2T1l2lFdHVtKZZyTLJ02C6cX/UxRYkBDr/B+7bJrX
 3GB7BcxjKAQdLc3NGlK6Wohiw/SUV8/i49bJOKFCatnR/EZ3xxUFf119gj5mImudjplG
 45JfVrvHZ5GNQh8UURe1NegkB/Q0WTKuwHU+gjw1M2pQ/KUmVNsJCyZxsnoEyMzjX61O
 IIyvrZRpXRrnZ7fklQfYIHUeleL0IrVQQlcWKhebEKq0xikMJjLYKs9+oG2usbV+wsbe
 jgBSpMFTryUyQf/n9+6ZtXWskupQblHPnFXv0RY+5y+GHR+6ktgZogrSYH4c6RqN3jY7
 QFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Va6NDRBCJiI0iOSnPGv8WV8CDHaYwrn9mS1ia5JRbYs=;
 b=Oe95L9s1RppcPS2zygXskajJU3PiA3w2/c3DC6KhQmg03mkeqitBNiEPMKotxGX6Rw
 ZOGzcTl5C1QzdsjVgIHSa8aIm0tXndSZ/jDqFkUFyN1YH5jFtRse02ftpVd3qT+EBcZR
 Yox405fcgO1pe62oqoGydrmvpVwDlBnYS91rTjpZh2Lf9Vetob6tNHbJqc6Z7Oa86Hnc
 hqNYGybUl+FX1quOzyBwYsd/k/q+KuWwxqTefiWQDynfc/2h4bDszXcsc428iNrHgk52
 BXNHUsPHezEgMfmV9ZpRqeso3SO4QdYbXxI3rLY8+gZAeelG5FqugAJKvx+JeBvzbCYQ
 hg1Q==
X-Gm-Message-State: AOAM530lef29HKvpUcyJj4wdIs4Ivoh1gxblA/sAOlRmlAF9wnlIjiXt
 Ptw6lT8VIWAErw4XM/ROi6Kl0g==
X-Google-Smtp-Source: ABdhPJyy4Y+a09efIQXHh/G2+LwCJr8LDdDPCt8WSPird5pp138Z6AqWxARFfkI2e4HIPnU6ifGjhg==
X-Received: by 2002:a05:6830:17d7:: with SMTP id
 p23mr8842606ota.164.1616699134706; 
 Thu, 25 Mar 2021 12:05:34 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id m126sm1272856oig.31.2021.03.25.12.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 12:05:34 -0700 (PDT)
Subject: Re: [RFC v11 48/55] target/arm: arch_dump: restrict ELFCLASS64 to
 AArch64
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-41-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7a357e3-c74e-5491-6140-cce1d44deced@linaro.org>
Date: Thu, 25 Mar 2021 13:05:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-41-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> this will allow us to restrict more code to TARGET_AARCH64
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   target/arm/helper-a64.h |  2 ++
>   target/arm/helper.h     |  1 -
>   target/arm/arch_dump.c  | 12 +++++++-----
>   target/arm/cpu.c        |  1 -
>   target/arm/cpu64.c      |  4 ++++
>   target/arm/tcg/helper.c | 13 +++++++++++--
>   6 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
> index c139fa81f9..342f55d577 100644
> --- a/target/arm/helper-a64.h
> +++ b/target/arm/helper-a64.h
> @@ -119,3 +119,5 @@ DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
>   DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
>   DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
>   DEF_HELPER_FLAGS_3(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64)
> +
> +DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)

I'm certain this has nothing to do with arch_dump.
Split your patches.


r~

