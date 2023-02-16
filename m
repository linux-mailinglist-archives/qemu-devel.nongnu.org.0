Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF5699D4F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 21:04:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSkTJ-0004R6-7K; Thu, 16 Feb 2023 15:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSkTC-0004LB-Nn
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 15:03:06 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSkTB-0002Dq-1U
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 15:03:06 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so3298726pjp.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 12:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+UN2zMyf9t2T7vmFhQiEJwvKbs8aCLrtnk4t2GcSM84=;
 b=OpsZkNLwVurSwjfM1I1HqJKzpKX2wcxwtkyyWKrJHwe+uDeFsBlJnGeqlbTujJrnwu
 kN2ggs5cKFMBvFoeMl7Qt/h1v12WVHoxFpE/91IVD9W2lh7x+eI/crlASOYclT77M/kG
 sRxi70gN62rqmPKKdSMuVNmgTjQHDeJiR7Mp1FyvmCWZ2cGPyP88rYcLkof/HVySJxq/
 JLFmxhOCP50sPjgjn3kGuVe1rSKS66kDDlPDYjIV+WUX+qNWz8nAYwqSYgiSGCbIG4rk
 DaWKxdDwwKCXY3+w2YozRnwRW5LgLxKB8yJENHQlDOZ7qkqHIHMYkjEnXnsYSzBhOnYQ
 O+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+UN2zMyf9t2T7vmFhQiEJwvKbs8aCLrtnk4t2GcSM84=;
 b=IvJ3AJbwxDrHlfEOyqGUqBmBbKq7KafNVR95HPYNAFPb7tsWOu0SYgj4jOb29GMa7T
 aEO1rAuxLJkVsmnXWJK9FLLyWaxaytvve+MtDHusH7SLB0Ck4GtKhpkVAOkQ0gFcR0Od
 rXOXmOmNeGgF/lzMDy0mkFoSw4NknNhQId3Okx8ST/ItyqxQ7DmcwX1L2l6eA863RpeO
 Bx5K2u1z4qV2hztahDhI381y8xy0zey9n/d64ZGBSLjasX2nXva8u1maUVU+MyeIgwk3
 fxLnxHMHqiIfjR8PywuqN64RfSiHPilkxTt+thYLIZpgRMSNnpgUN11ip/LuFyVcSXL6
 92cQ==
X-Gm-Message-State: AO0yUKVksinYsC1TZgHbK4tHxvh0+p1+nWJOLUpz8tlz1hpHqa9r58FJ
 p56LG41j8EG3EdEkcmMz42NEcg==
X-Google-Smtp-Source: AK7set+ozUJcKAFfZz06GGmsymGvY02HmiybkTIexRDkZdkHc077NEtOue1qoOR5/xveN90u4a6paQ==
X-Received: by 2002:a05:6a20:3953:b0:c6:bf1d:9dc9 with SMTP id
 r19-20020a056a20395300b000c6bf1d9dc9mr7498974pzg.56.1676577783389; 
 Thu, 16 Feb 2023 12:03:03 -0800 (PST)
Received: from ?IPV6:2607:fb90:8f62:8652:bed9:812b:5b9e:e49a?
 ([2607:fb90:8f62:8652:bed9:812b:5b9e:e49a])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a637512000000b004fc2eb3fe45sm128883pgc.54.2023.02.16.12.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 12:03:02 -0800 (PST)
Message-ID: <9effb233-1dd7-0860-96e2-4f07a41adb5a@linaro.org>
Date: Thu, 16 Feb 2023 10:02:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/4] sysemu/os-win32: fix setjmp/longjmp on
 windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-3-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230216134911.6803-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 2/16/23 03:49, Pierrick Bouvier wrote:
> Windows implementation of setjmp/longjmp is done in
> C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
> perform stack unwinding, which crashes from generated code.
> 
> By using alternative implementation built in mingw, we avoid doing stack
> unwinding and this fixes crash when calling longjmp.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/sysemu/os-win32.h | 21 +++++++++++++++++++--
>   meson.build               | 22 ++++++++++++++++++++++
>   2 files changed, 41 insertions(+), 2 deletions(-)

Ugly, but workable.

Acked-by: Richard Henderson <richard.henderson@linaro.org>

Ideally we'd interact properly with system unwinding.  It looks like we'd use 
RtlAddFunctionTable, but the documentation is spread out and I've not found all of the bits.

We already do something similar for gdb -- see tcg/tcg.c, tcg_register_jit_int, and 
tcg/aarch64/tcg-target.c.inc, debug_frame.


r~

