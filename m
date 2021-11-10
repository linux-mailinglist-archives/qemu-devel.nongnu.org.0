Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A156E44C547
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:45:32 +0100 (CET)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqj5-0004F3-QG
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:45:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqhJ-0002cl-N3
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:43:41 -0500
Received: from [2a00:1450:4864:20::32b] (port=40810
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkqhH-000757-Q0
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:43:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so4400803wmb.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PrDtbJgYjwvSZPoOwGmKJkIn0R2QhDqqNKbfwIy3mYY=;
 b=ZKwoxgdgYU5uH74Yio/W83Vmgo7XoZNiTt/+xs6GQmqGFKyvX1baeZ46XK8ank22un
 6ExyB38JF3MEb9ymioyJ/sldf59DMgHA/bzUXGEFLN/dvqdWrFvKH7G67p7J/vM/eF96
 Otpvh2EFZ7En/EqXRzNnxwIYnk7RlDdVzDMxWLQ9g0oX0rfPxBOmu/wF50T3T2Cj7wZ4
 kDLAAzTaUe63uZtwKAMlqIj4CV/4ylrcwORQzr8Sr88DiSrQpjYuRf+HY0FlUM4BLlnk
 JW6nRa5Qav2BOqGM3rfQ1f1CH7/MGHg5QC78d40Hrqs+7eHB82JJMU+iitRANt0t1ICP
 w6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PrDtbJgYjwvSZPoOwGmKJkIn0R2QhDqqNKbfwIy3mYY=;
 b=jhCf6r8fB2ace4ApZZtVDoeV1BxMkvpD/omdFr4qFPP8aVxkkDLVOG4ITz1wqQr8fW
 tLNC+0DJp3t0KO2cBzyI12v7n+BZSYoiZlCm39ZwmyQf6nFS0HOhKnTWgqNhNvySiAEO
 WKioGvV/ZqoFUjGLHjHaIx04s3+uG2MCwBucVk7x93gMT5HExj//5jFanEIOme8CNitR
 JiLJbQ+lMye0wpSvOwq0erd1ASdYdZj/8RaH3XXxJrG82bkdnekRUPREfdovrjWSKHil
 03DpVm6rQr2iITofswM3f18DK+gW5CVV3ox0qTDWPCbuz1M49N2TfTd4uAuXaQmq5sb3
 J2NQ==
X-Gm-Message-State: AOAM5307q5bFw02NfUvkhrk7oN+pP17E4vTkFqrwHeYt0289efuYI6oR
 W41zvB2mXZLy5cgsF46HcNUPMz+t4D6ya055
X-Google-Smtp-Source: ABdhPJz+oEWMLskeZGBRdcCLMY2/Rg1GPffVD08hMFgA3St9HEy8REK3g02dLiPgbjiasucwP1zB3w==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr17775486wmj.149.1636562618173; 
 Wed, 10 Nov 2021 08:43:38 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id h17sm383246wrp.34.2021.11.10.08.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 08:43:37 -0800 (PST)
Subject: Re: [RFC v2 3/6] linux-user/safe-syscall.inc.S: Move to common-user
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211110163133.76357-1-imp@bsdimp.com>
 <20211110163133.76357-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fea838a-342a-1993-6245-cb0d41ebd758@linaro.org>
Date: Wed, 10 Nov 2021 17:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110163133.76357-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 5:31 PM, Warner Losh wrote:
> Move all the safe_syscall.inc.S files to common-user. They are almost
> identical between linux-user and bsd-user to re-use.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   {linux-user => common-user}/host/aarch64/safe-syscall.inc.S | 0
>   {linux-user => common-user}/host/arm/safe-syscall.inc.S     | 0
>   {linux-user => common-user}/host/i386/safe-syscall.inc.S    | 0
>   {linux-user => common-user}/host/ppc64/safe-syscall.inc.S   | 0
>   {linux-user => common-user}/host/riscv/safe-syscall.inc.S   | 0
>   {linux-user => common-user}/host/s390x/safe-syscall.inc.S   | 0
>   {linux-user => common-user}/host/x86_64/safe-syscall.inc.S  | 0
>   meson.build                                                 | 1 +
>   8 files changed, 1 insertion(+)
>   rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (100%)
>   rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (100%)
>   rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (100%)
>   rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (100%)
>   rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (100%)
>   rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (100%)
>   rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

