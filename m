Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D15A32C0
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:45:09 +0200 (CEST)
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRj0e-0000f6-6V
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRifM-0003dc-Ne
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:23:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRifL-0000sm-0i
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:23:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id bg22so2914122pjb.2
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=vHygN0yh3N6xw7owr2nP15HbOPquudbw9xbQUCt1+iI=;
 b=Uj+kAOtkB7fboe9UkHuhJxeVE9xrUXNxaKHoEwFY2B8fTKWf+cRbfzOzDeckLXI8Px
 aQJPXJZG3J4+sPzI3mrnvgUJ8iFOkwLUBs+7r5NfOL9Br+fdiEm3STvWCS1Kihp6QY3h
 qTNfAGsAynu+YiK6rJv95f4+Vx7iV1xRXGjXEE+srjQ0zUDdltwMFrUT6xETGfNmWbBa
 Lsv+noqaMD06keb+b1SPwk0LQvMVHHjBe2CvqC5RoxYHepeg7unPdYzvlKVNSDLe9Ly3
 0vSF6Jo5EohF0Ret9I8oLaB17zGSGe7qpWa2Z6tTwQ+6/bTN9l6TJpzH7hexAeMG+pv4
 OeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=vHygN0yh3N6xw7owr2nP15HbOPquudbw9xbQUCt1+iI=;
 b=H2NSDxDc74/POoAmi/XR51Ir+DOYGXgSetM+q+ozV+0w4rAt5+ObYhSR5E7Tdr8jLj
 NUIAt4zjzyJRaCO4V/NGPF8/8xfIcw/A1GSuOHzzODI464PzrqoKqNTdd8nbfAUkU62W
 BcLPsh98hKK9YJbCAVgQ0tIay4xuarwuLTN3WfPZKifMTAfRnaDFFPHInnxJhmBA8F9f
 Qwy7dDZXs/Bg0DJYb/2INh04JZ3wzjQOgrMY7tbpdTQjMdSpWQosYh5SzAJ5gVG5dBad
 U/vAOzgJDpkLehe35hq9gcuUHR6F8/SSF7Xt9c23JLh8zK53VLBEN1DHel9EGHND5Qk/
 jBuw==
X-Gm-Message-State: ACgBeo2BcIAsIyXMRlHF6waCCT3GzcRlMKGqjjyN+0YbT/bsY1fNawjm
 uHtUmEEFf9xguszHYpyistL6rQ==
X-Google-Smtp-Source: AA6agR749/EejyaHNqsu5SaKOz+GmFfXa8kIHKJL9SDlG1fF4QihHnBBL2clieG7z9Vm7o3cU+ZO0Q==
X-Received: by 2002:a17:90b:3901:b0:1fd:73f8:1922 with SMTP id
 ob1-20020a17090b390100b001fd73f81922mr3343661pjb.211.1661556185578; 
 Fri, 26 Aug 2022 16:23:05 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 a12-20020aa795ac000000b0052dd95e72bcsm2294196pfk.193.2022.08.26.16.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 16:23:04 -0700 (PDT)
Message-ID: <aee03db7-256b-5a7a-0c44-815baf273805@linaro.org>
Date: Fri, 26 Aug 2022 16:23:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/23] i386: check SSE table flags instead of hardcoding
 opcodes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220826231204.201395-1-pbonzini@redhat.com>
 <20220826231204.201395-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220826231204.201395-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/22 16:11, Paolo Bonzini wrote:
> Put more flags to work to avoid hardcoding lists of opcodes.  The op7 case
> for SSE_OPF_CMP is included for homogeneity and because AVX needs it, but
> it is never used by SSE or MMX.
> 
> Extracted from a patch by Paul Brook<paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 75 +++++++++++++++----------------------
>   1 file changed, 31 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

