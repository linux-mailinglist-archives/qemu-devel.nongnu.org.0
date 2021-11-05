Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC5A446711
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:32:59 +0100 (CET)
Received: from localhost ([::1]:38396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj29C-0001Cx-Pp
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1zs-0004II-Qq
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:23:20 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:43586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1zr-0000s9-1V
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:23:20 -0400
Received: by mail-qt1-x82a.google.com with SMTP id 8so7603528qty.10
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gWPBTb1BZTQ52BZapaNPKiLNZjhjBUhTkOKFEKL9u3M=;
 b=NHnmNEEr79n30FnX3c59a1TfnRf7By89wb+HFIhhY5WftNo3gTz8JjQeZyIbYh0oAw
 2N6s+dXdqP4WHvwINu9gKwRnWecCz3+VDKi4vAGxj/NtSQG2Ba37O1AnyA2aobCsweCs
 mkS2moxTOhM5ToZ+9lJFwnJ4MjDqTqqYwvHSIBOLz7zG0pEqNf4ahETXMDN7pOJLK0/A
 f26SQJr1ukvbhbIKR5bOHS+QyIUvdJrOGk3awiuw6Q4Kymcp7z4O68ggoTlB9BKQUpEP
 Hj/70sI6PD9rJaw6DcOgjLN1aIUuqQEPq4HkeA7Afp2kCdM0hYw5dGc4JCMROYHA9x8Q
 lRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gWPBTb1BZTQ52BZapaNPKiLNZjhjBUhTkOKFEKL9u3M=;
 b=6M+d7yP+ikVXedlKb3b1raYFHeH8oXDNfjgMHfKvmapO7FANk9irdcQKCO1slM17zG
 OcakJUmANdhZx68zHdjF2Y3WCW1fbs3OVo7YWGJFv5vaLc7WedfEzMjgXILNn3+sOSNE
 DCJomT38i3PVNQxKCdY/3YJkrOa7Venoo0j6/SyAqcJMmvkQ1tVePlsVORF7YH7ALctH
 kwXjEMWPBKXGD6WtcyYBGq9TsK94Bx3+215AWwrMWv5HhE0C4MfmMdLG1sLf2nMJUhVF
 lDaq5p99eLS9HCmnU5zYHzVMtAnOI/V8aFrn2j+m0RoZapqtCHzphYpfaFEOh/WckWmf
 n6ag==
X-Gm-Message-State: AOAM532y/PHPAoV1dSU8gF2/6OJ4yCkfTTNH+9Q/nCbUlkNLRrSeoOc2
 27cSzsHGBj3BNQY4WxXZ3YqJOw==
X-Google-Smtp-Source: ABdhPJxi9orajPfeR1ydVz2fxtKA33twhI/jfYMSO/ir95cg2lDSlwzOB+FjEEhSPG1qP6VWQ7A4dA==
X-Received: by 2002:a05:622a:551:: with SMTP id
 m17mr24636681qtx.80.1636129397936; 
 Fri, 05 Nov 2021 09:23:17 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id ay12sm5926648qkb.35.2021.11.05.09.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:23:17 -0700 (PDT)
Subject: Re: [PATCH v4 10/36] bsd-user/x86_64/target_arch_signal.h: Fill in
 mcontext_t
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <066d6ab9-8a30-4ba4-efb8-022090db00f6@linaro.org>
Date: Fri, 5 Nov 2021 12:23:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:18 PM, Warner Losh wrote:
> Fill in target_mcontext match the FreeBSD mcontext_t structure. Also
> define the size correctly.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/x86_64/target_arch_signal.h | 54 ++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

