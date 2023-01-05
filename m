Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B786C65E4E8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 05:56:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIHp-0001Tk-Fv; Wed, 04 Jan 2023 23:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIHl-0001Sx-IO
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:55:25 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIHj-0002Wl-Pj
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 23:55:25 -0500
Received: by mail-pl1-x631.google.com with SMTP id p24so15761939plw.11
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 20:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ftMB/pycQaFCJV3z/lh6F09+awhuDC0s1ox9c3g804=;
 b=wqurgHx2tyNFh5ggBS9kC6/9lBJ+fOaHbc+ZEXeIWqFI4U+M0dfxbbQG5CX9j+Nexr
 aa9pGzTARatZXyt3Ep8h+OUqhr3/lD5xa4BqjGjqOwh6nHew8FFVda6afRwQQw+xW0/g
 noznQhflyEy5DwC9iYPksc8COK+wOAiMZt041aUQjhPgJnRTgZ1/caAe9F0HSFebBldW
 HHpDD7an7Ir6AkS5VF8hVl+huBfxt1mqswmAFt9RE4Ud53KgMd3eY/dEiRq0+VKhn5P8
 6gLLOu3S10p0ll4r8KZAmdY7hRQmegjtZkYIf9Mhl8UkdYmClPZ8zP6Nb1GKNXQfKk6R
 T5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ftMB/pycQaFCJV3z/lh6F09+awhuDC0s1ox9c3g804=;
 b=FxDfU2XQnyKbvn4d/7ONlKUYN6kb5F21hMoj/vpCQromPsv7R5FFFOlsSs9z8sP5is
 MtjdhmU7eFzXYWKSVVkjz/spDFM0n1e/EbAYB9/J6bQGLHGXxHpFbmEWoW1MTvIv/h/9
 rO+2bcaYXVAD4cgFjz8xUk5bCHj9Z+GCCC4GWlCLSxYRYq0qeiQbR/8m71NqywlyfpEs
 qAtV+o0aXZGjdxZ86omCL1AjDAqNLTKApvw7wMMNSJFkUayGidU3ifw7TKWgMY/+GWds
 6t5lfGjC9+NOairdjzWXdFxNj6xFpeMLTagCekLLiqkm9Y+FW5EzZEhO4xkkmx/k4+q1
 KTrg==
X-Gm-Message-State: AFqh2koyPXEyn5IH9p8jRGY4j5y1fJVd9a8i3IWjunNONtLRfaPtLadn
 5WIJ9ZJASDvfQP5FAhCEKpFofg==
X-Google-Smtp-Source: AMrXdXt7Ask2WhIN3wcMdtBaJmzw/cF7MnvwAMZIfjgVlN/OExp7xLFC92UebpwRtxgXhBQOVO3Yig==
X-Received: by 2002:a17:903:230e:b0:192:8212:af39 with SMTP id
 d14-20020a170903230e00b001928212af39mr46793424plh.5.1672894521830; 
 Wed, 04 Jan 2023 20:55:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170903244600b001869f2120absm24903744pls.294.2023.01.04.20.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 20:55:21 -0800 (PST)
Message-ID: <908792d3-47b2-afb3-8b81-aa74950f7164@linaro.org>
Date: Wed, 4 Jan 2023 20:55:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 17/27] target/arm: Extract cpustate list manipulation
 to a file
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-18-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-18-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 13:58, Fabiano Rosas wrote:
> This code doesn't need to be buried in helper.c. Let's move it to its
> own file to keep things cleaner.
> 
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Extracted from:
> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
> ---
>   target/arm/cpregs.h        |   5 ++
>   target/arm/cpustate-list.c | 148 +++++++++++++++++++++++++++++++++++++
>   target/arm/helper.c        | 136 ----------------------------------
>   target/arm/meson.build     |   1 +
>   4 files changed, 154 insertions(+), 136 deletions(-)
>   create mode 100644 target/arm/cpustate-list.c

I'd rather the new file be called cpregs.c, to match the header.
I've been thinking about moving all of that code out of helper.c...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

