Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14B36849D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:15:45 +0200 (CEST)
Received: from localhost ([::1]:42776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbzU-00052Z-JB
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZbuu-0002eC-Qd
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:11:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZbus-0002YM-Rh
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:11:00 -0400
Received: by mail-pg1-x536.google.com with SMTP id m12so12450068pgr.9
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jiPtMf3rIfzk76AcYG8rVQ61uCkSIHzCPNac6slFBrU=;
 b=Fx3whZH7v0kIEYvz6VJJkVJOWoen1Egb94AepiV+hsWpXU0AabGV5sslxn7/WqwoRQ
 0GP735zCWPtyqWMI1Ukoisw3POX0Q3qiU70P03wFGmmEQlfo1qn8FJXWS0kuQK1F+EzO
 VesQQOLmQwCDN1uS103sEJJ4G2HQ1yfGJ9k6hDkgHafj/GFE4JEPtGQa/CYw/ulq9gpp
 GIwh0DrKfCugR2YnLkyR3H+5oAA/JFmQ/t9MidtMXA2k7/ZarK9crR/8ZVwxoB2b3m2Q
 NlM+YyMY9DpmtEfwRsMJxxiQSEui/B5qjJNuwn+mBhQQ/qz3+LlHx5RnA+rmAjDwZl9h
 NTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jiPtMf3rIfzk76AcYG8rVQ61uCkSIHzCPNac6slFBrU=;
 b=kEKI47b/haxPs47I4g/5cJjS4z2nVKzH/+vzLFjBhwWETshR2+fQ6/fThQ+RHGoCmk
 OlMOE9DAhzBcdoO0hsFk3kuVPpWjRqkX7CM65WPQ/XvgWOPfaWyhUYK1F+bysRIPIT5o
 hQt+X9cCnM7NKXXxu1X1VhNlDau0yvUVJfKTz4nJk2dL4ULMeJWWKdPladL455VsfPsa
 RyvG/kcP0G/UyZPaHkDOYTVZa8+22YsVisKv17WTxutcYYG+iMz81trALO54s5yT8jdn
 QnpZ7WiC8sFN3h6VxHRZ6DizaLqeIq0AkjS6h+Foky7tfa5dUAADbDZqrOoyQoI4jl//
 3o8A==
X-Gm-Message-State: AOAM531H5ntQpn3zE+MFRf2ECvx3trNVoPHOBXvi8W/LFb27gmxAkSr/
 gKa4iI+//DBpdD10dOtTWXrwlw==
X-Google-Smtp-Source: ABdhPJzyKHxqUf6Tclw939/kcHe8WaA2AXvDAe4bAfagIZOF0l/zkL4n4XWMdBsUNmJRAYKmIWfoog==
X-Received: by 2002:a05:6a00:c8:b029:260:f25a:f2ef with SMTP id
 e8-20020a056a0000c8b0290260f25af2efmr4115618pfj.78.1619107857184; 
 Thu, 22 Apr 2021 09:10:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id n9sm2751065pgt.35.2021.04.22.09.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 09:10:56 -0700 (PDT)
Subject: Re: [PATCH] target/s390x: fix s390_probe_access to check
 PAGE_WRITE_ORG for writeability
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210422154427.13038-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31291766-f4f2-581d-2019-214d95d70158@linaro.org>
Date: Thu, 22 Apr 2021 09:10:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422154427.13038-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 f4bug@amsat.org, Laurent Vivier <laurent@vivier.eu>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 8:44 AM, Alex Bennée wrote:
> We can remove PAGE_WRITE when (internally) marking a page read-only
> because it contains translated code. This can get confused when we are
> executing signal return code on signal stacks.
> 
> Fixes: e56552cf07 ("target/s390x: Implement the MVPG condition-code-option bit")
> Found-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>   target/s390x/mem_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

