Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FAF697003
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS37h-0001Kf-Um; Tue, 14 Feb 2023 16:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS37c-0001Js-P1
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:45:56 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS37b-0003u0-18
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:45:56 -0500
Received: by mail-pg1-x535.google.com with SMTP id b22so5946276pgw.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z9lfQ+C9ufJSyZpqxYz3x+JRkRR6c/rzx2VFtKQj2u4=;
 b=bsmM37F4AliLH2TdgoKbS5xk7SAC2xzrbp4Y3XxaSI4xhReu/oecuzGNP36RwUMq6M
 DA2fAAqyCFgDRfm/+2yWt53Y/UWv4xxADXIEsWD3z08I7OXqVX1APoM54i0elBSSShYm
 k6mVIgj0SW/uSkYBNkBFXlSipK3C8TYI7Ty60xDgfs3Np1J/OA8/zNbHuJiPC16iKjAa
 eqSTWGuU8vM3z6FWj+Btyd+MfkhJdPTqsiLCA5PO5VH3R0ku8dcuvErXdyR6h1EyCCxo
 ajPeRhcPOUAGOhD94imIKHUhwGEyxuVQZRBzKZ2/GJFwXqTpwucEHKdSzb0Uc37EaliJ
 Tcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z9lfQ+C9ufJSyZpqxYz3x+JRkRR6c/rzx2VFtKQj2u4=;
 b=zH2VsmAR5wMYIDU/h1yrirG2IclcLtGX1S6HCBOKbzX2IBO3SDWiwoYCHqlYg5c07c
 0Rtm8NN/q9ZrYpDZSUOGjXIPOkpraH5WlUWMAOqAHyGzn5+yfGHBqDYpN5FsztAM+pYr
 WrhLt1mbMXZDXr8Iv90pfdjgtivIQEJCd5sucfaMYIbkNg9UFpJreSTebgfyCmsWxViY
 9hLYNC7gliblUwF/RqUw38l/CXpC+u9BLbwUOmLfqEIN0ShTXaTn6B6jwsBZPR5lEbS1
 2QA/bOJ3vivAeqB9sCrP2TVVeRJXzrUuGHSV9w3oxVt0wFYbOPDsGHsZNcpaJcUIKwF2
 Feog==
X-Gm-Message-State: AO0yUKXrZjQbDbFapChNst7B8OPCQiG8mEnGIRTIb175Rro/3qR7uyDM
 UuZ8FPk1ZSottd8272CaWWO06A==
X-Google-Smtp-Source: AK7set+ZMsitWe1SNvh6cdEOiKTmh2abeLYNSpQ6zGieyZZ1EuiWAZ/U7EwN7EKgW8tveZJNCCz7qg==
X-Received: by 2002:aa7:9886:0:b0:5a8:46b0:8269 with SMTP id
 r6-20020aa79886000000b005a846b08269mr3386009pfl.31.1676411153305; 
 Tue, 14 Feb 2023 13:45:53 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 23-20020aa79117000000b005a7bd10bb2asm10210379pfh.79.2023.02.14.13.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:45:52 -0800 (PST)
Message-ID: <f6af6263-86d6-4c0e-412c-e7a75f057393@linaro.org>
Date: Tue, 14 Feb 2023 11:45:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 10/12] bsd-user: do_freebsd_sysctl helper for sysctl(2)
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@FreeBSD.org>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214002757.99240-11-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 2/13/23 14:27, Warner Losh wrote:
> +    int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;

g_new(int32_t, namelen)

> +    unlock_user(holdp, oldp, holdlen);
> +    unlock_user(holdp, oldp, ret == 0 ? holdlen : 0);

double-unlock.  clearly the first line is extra.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

