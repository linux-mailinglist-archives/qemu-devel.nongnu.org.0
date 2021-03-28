Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F150934BD27
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:12:02 +0200 (CEST)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQY1C-0001Cu-2R
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXzi-0000EX-1E
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:10:30 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXzZ-0000IS-Qp
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:10:29 -0400
Received: by mail-oi1-x236.google.com with SMTP id i3so10855296oik.7
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YQqnBvwVvK99OmIougURVCyQ9KEdq+xq8vsNi29vhSg=;
 b=zAwLavzsLyCwBRG2F5UfR3HxB/zNP4ukO6INlyvV+lRUIzn9ccYkN7xvvlQNt0/kau
 riZ1N2tRazSw5I+3AXi42HWMn5zaepiZvj4ry3OB2JDlAT3UxfsV0ug38iX/8jz6QPnA
 dAnVah1Xcx0K8b95aZhA4A4846ClzQ0kcHrx67O0GXMtv6ENH0NIJFPSan4fgkB9c101
 Uavx+k/YNN8OzKEADrbAYIo0at5F64p5unuIlcx2c/IxIr9C8TQD3T6ISWTHuH31BwJh
 Fj99ItNcQT+6Hf64s3HeDeM7SeyKuMIisepmvCuPsgJ+IoOsaqzv2qDwrZTs5RvK6nJ6
 VHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YQqnBvwVvK99OmIougURVCyQ9KEdq+xq8vsNi29vhSg=;
 b=YSj1OpC0CjA8yVmjsEo93MfQGxVaZgWYQxit7nsQlXIIF9uV8T+W7LSrpgTAGKjcQG
 vJLJbKQb08KCMBtjir5r0XAEnZ8vkA/XzlQl6qnFJ1cOnmu2A0wJTqxoj2CK2KxhyTMg
 LI/I/dwASCCSNqaLOWat9NeVgVz6PdVRdQnjsQr+eFJOY5+jFfsHmjykFMiW96qKiHWh
 HJh1hEiP3tPdJ4dr5KM+HacQ/y9Q3y2V2hFucfA80Omr3JY5iw4bWOM69yS/KuGLmDYG
 xcPB6sci7YskndeIH5cuCppxfwojzbCwOuANK7g0gZ/txhpzYTP87GxBD4xeUuRsbl5U
 yVEw==
X-Gm-Message-State: AOAM5326u+OGisieVIPlpMupJTUUQJq2o77K/1b5mnAJkkwptZKcyV6Z
 UJi8J35FXtsBMdo9GY43bTwIEw==
X-Google-Smtp-Source: ABdhPJzfVCxGHIylbOa94ovP6fqZx25pRpGnwYJMCgVBQZBtiwrPNCm8w9mH8lVBIWFt5mtP6MKxBw==
X-Received: by 2002:a54:4010:: with SMTP id x16mr15884648oie.151.1616947817779; 
 Sun, 28 Mar 2021 09:10:17 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id i4sm2827479otj.56.2021.03.28.09.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:10:17 -0700 (PDT)
Subject: Re: [RFC v12 21/65] target/arm: split vfp state setting from tcg
 helpers
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-22-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <319458f5-706c-436e-6c40-cefefd65a5cf@linaro.org>
Date: Sun, 28 Mar 2021 10:10:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-22-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
> cpu-vfp.c: vfp_get_fpsr and vfp_set_fpsr are needed also for KVM,
>             so create a new cpu-vfp.c
> 
> tcg/cpu-vfp.c: vfp_get_fpscr_from_host and vv are TCG-only, so we
>                 move the implementation to tcg/cpu-vfp.c
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-vfp.h        |  29 +++++
>   target/arm/cpu-vfp.c        |  97 +++++++++++++++++
>   target/arm/tcg/cpu-vfp.c    | 146 +++++++++++++++++++++++++
>   target/arm/tcg/vfp_helper.c | 210 +-----------------------------------
>   target/arm/meson.build      |   1 +
>   target/arm/tcg/meson.build  |   1 +
>   6 files changed, 276 insertions(+), 208 deletions(-)
>   create mode 100644 target/arm/cpu-vfp.h
>   create mode 100644 target/arm/cpu-vfp.c
>   create mode 100644 target/arm/tcg/cpu-vfp.c

One day we should s/host/softfp/g...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

