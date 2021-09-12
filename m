Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A6407E87
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:18:33 +0200 (CEST)
Received: from localhost ([::1]:58338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSBb-0000SF-3d
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPS9y-0006oY-Vk
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:16:50 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:47008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPS9x-0007hM-5e
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:16:50 -0400
Received: by mail-pf1-x431.google.com with SMTP id y17so6558820pfl.13
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cpIuaAgcar2AGJqis2W1zmNsAGoah+p3u0UFkJH6iu8=;
 b=SYWoAKZjgz+ge1xJQjB9RZy2TOZD+l0V1fdVaA4Hj+NmNM/8KBeRKVosixWEmHz8/t
 YUH/bwxVqoVnSd84Yj3CBCaOSR/5DYX/y9cf0aqPJZx4nTO+ztwKnH0IaFcPA0AzCWYO
 YTjvnEHg1pX34LqNTva4rQAnQNf+MXnTIArWcx8OuIQAcJHaQVD9jaVJZz29fRUmJNCp
 KvF6TMJt16TdN7jvsHmdrshpIh2X7lmD6So+5RKA2CcZ8WSuIj+qKq9OjMjVCXqPhAKR
 3h4+S269+cr5iot044jl/BZaCgaN7xWzIXgmKgP/Jt8fOIgn29a5T4+wzBgbiiXrATxn
 5KWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cpIuaAgcar2AGJqis2W1zmNsAGoah+p3u0UFkJH6iu8=;
 b=rT8Ji7SGf2R7KHsvBayyJXtf7Arl0cFhr+VcIimQ9Vu1SdGOA+mIhBpdGTeS3QQ1TL
 ff/XOhhuN4akd0KY3LeSx9OW0ZfYm8cDTcny/F5T2So17KIoVJ7FJRnUjxsf/xoW3mYi
 +69xzb5uYdTbH/J9Iqa4OYzX2Qk+MV83leUIzwGYsBIoR4IG6MO31VVQ5w84QvCdGx1X
 mgqWxxzMtNQ+Ou3x2NNgDcDWPkujIYVkLyaRIcilHS9S9gXK6Tum81BG+T3Re+8a51zp
 174t8Vy2oXwJAoqkxdNiYmIsj6FI9azKJOaeaiTTgQqaBbsNzcp3trbAZbSy2bRYvGKu
 FksA==
X-Gm-Message-State: AOAM532R5qpeOVOJ0E0S84Qd5EUFxIHdZi5a5XBp/+/y0fVMrUYCnG/x
 +OU4QFGvUj/yQVhODF009Y112j2d3eXDaQ==
X-Google-Smtp-Source: ABdhPJwxxO+n6cKM4ezIOeBfLDkZq8X3Heff3K0hcIgtP+M6YRYGqsJX5JHm9IVbphDM4xxR9vjOOg==
X-Received: by 2002:a62:cec1:0:b0:3f2:6877:238f with SMTP id
 y184-20020a62cec1000000b003f26877238fmr6957419pfg.1.1631463407754; 
 Sun, 12 Sep 2021 09:16:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x124sm4370803pfb.59.2021.09.12.09.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:16:47 -0700 (PDT)
Subject: Re: [PATCH v2 3/9] linux-user: Split signal-related prototypes into
 signal-common.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1514c00-4070-bc63-ee2f-ce82fd40ce49@linaro.org>
Date: Sun, 12 Sep 2021 09:16:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:43 AM, Peter Maydell wrote:
> Split the signal related prototypes into the existing header file
> signal-common.h, and include it in those places that now require it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v1->v2: use existing signal-common.h instead of new header
> ---
>   linux-user/qemu.h                | 36 --------------------------------
>   linux-user/signal-common.h       | 36 ++++++++++++++++++++++++++++++++
>   linux-user/aarch64/cpu_loop.c    |  1 +
>   linux-user/alpha/cpu_loop.c      |  1 +
>   linux-user/arm/cpu_loop.c        |  1 +
>   linux-user/cris/cpu_loop.c       |  1 +
>   linux-user/fd-trans.c            |  1 +
>   linux-user/hexagon/cpu_loop.c    |  1 +
>   linux-user/hppa/cpu_loop.c       |  1 +
>   linux-user/i386/cpu_loop.c       |  1 +
>   linux-user/m68k/cpu_loop.c       |  1 +
>   linux-user/main.c                |  1 +
>   linux-user/microblaze/cpu_loop.c |  1 +
>   linux-user/mips/cpu_loop.c       |  1 +
>   linux-user/nios2/cpu_loop.c      |  1 +
>   linux-user/openrisc/cpu_loop.c   |  1 +
>   linux-user/ppc/cpu_loop.c        |  1 +
>   linux-user/riscv/cpu_loop.c      |  1 +
>   linux-user/s390x/cpu_loop.c      |  1 +
>   linux-user/sh4/cpu_loop.c        |  1 +
>   linux-user/sparc/cpu_loop.c      |  1 +
>   linux-user/syscall.c             |  1 +
>   linux-user/xtensa/cpu_loop.c     |  1 +
>   23 files changed, 57 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

