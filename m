Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4B4C4FAA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:29:19 +0100 (CET)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhDK-00005y-L8
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:29:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhC8-0006eC-4M
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:28:04 -0500
Received: from [2607:f8b0:4864:20::633] (port=45582
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhC6-00031C-0R
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:28:03 -0500
Received: by mail-pl1-x633.google.com with SMTP id s1so5705484plg.12
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GkOwne6EzDiiprEPEKBwgVDfylP/Ozn+J2L4sKIGZEI=;
 b=LCxVT0Y8QIQwcVe8ids1pwZ0zdISEdp7E5u1Ukjmp57IK7U+ZbDcehQC4+MNjFjUBT
 Il/ma2IJO6CSP4hMDFf9tP/Ir3G5WBKrnDlNWwqBfZ+U+kFubU0PaTnz28+SOFvSQ274
 FdKrst4aWftsJIxwH8/Bl7BGOmEhXSgKSZcKdWUGUtOO/JXzp+AveDXR3tFjdrz2lOMa
 Zn+eXADtUWOXBoxgvd1unL+RzErtgAcueu+7rFppPww5H7ymdgL8z9EPTRJVHGCTr59s
 Cw/SoS6w+NocbUL7msl0kv2HNSm8sSnj2eR9gQeNrpvuZda1KQYO8wuqs7u+yJ+C/Qz0
 EZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GkOwne6EzDiiprEPEKBwgVDfylP/Ozn+J2L4sKIGZEI=;
 b=fXCU9vnGsShuqsk8Gw4Qkh6eqPCqZIlKGBXnp0dIMGjhq6KJMstXVcLq6D3reqmBKw
 V4obSpFaPC+i2FSHTEPgcfyIYU5RPi3DDpVqSsZr5Hngaux3h+Jg1LlWBLBqYciGbfoH
 gRkJj6ysSer/Y9tK3qu5M8hzZwooBhZYBIYOBc/48OKGyw/c78RAbwgXB+XTd15ThnvK
 chHCzwR+ROod5iEmsXT++90L1GGIItq1vofeXgtdZNlJF0AhlrX0wnve5Jrxr7qHbc5P
 BQhbj2xxcfm25/umH08wUOLxawh5hPh0zpr5ml7xm/2Jfjf29iR6FOR/MPSa7fdiRmDK
 9shQ==
X-Gm-Message-State: AOAM532J67e0bkIASmHcma7WqUCVc2SGlXWzJ7ku+HrWR0/EYogqRYJ7
 1awOmlbWeWyW88mO7SS5toMk+OwyF8eRPg==
X-Google-Smtp-Source: ABdhPJwOYV94eCZ9jLJjQXRbTgSyNa2wqAlrZ3ZmuTTVULyU1BAvH61yaK1uto/ZP5AvjGkU9M54Cw==
X-Received: by 2002:a17:90a:6704:b0:1bc:6b66:b3db with SMTP id
 n4-20020a17090a670400b001bc6b66b3dbmr4794077pjj.90.1645820880167; 
 Fri, 25 Feb 2022 12:28:00 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q22-20020a17090a2e1600b001b9c387d0f5sm10223697pjd.28.2022.02.25.12.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:27:59 -0800 (PST)
Message-ID: <ba16531c-0274-5022-9cfb-0e4fe94c2b43@linaro.org>
Date: Fri, 25 Feb 2022 10:27:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/18] travis.yml: Update the s390x jobs to Ubuntu Focal
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 2/25/22 07:20, Alex Bennée wrote:
> From: Thomas Huth<thuth@redhat.com>
> 
> QEMU will soon drop the support for Ubuntu 18.04, so let's update
> the Travis jobs that were still using this version to 20.04 instead.
> 
> While we're at it, also remove an obsolete comment about Ubuntu
> Xenial being the default for our Travis jobs.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220221153423.1028465-1-thuth@redhat.com>
> ---
>   .travis.yml | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

