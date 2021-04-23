Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F48369D43
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:25:01 +0200 (CEST)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la5AS-0007zz-8v
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la58q-0007Eq-4c
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:23:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la58n-0007Xq-Om
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:23:19 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso2108261pjn.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UVXrprrwSUxTJyS0iMmvnMAQega7uLmHTLl7J4AilI8=;
 b=HTjazzaVNhXs0tT8UuZqsYReRsKrTtJVJTLq8ZtPpu58gUaXVxnQHpNSUelRl+7SP3
 Yp/cSPrBXqHMDKI3FnTd0X1p7cN97RPfmCsx0F7sugWWxtphkufE5JTncirAbWAmL6OF
 3wuhQ7y5ZMzh3repkR8FS+NWuGbumba/gQ1kz1zgAUjU4hLTW1+SnUS9NoQvnTGOH4L1
 IMeXdOAdeoMarSQ6d7Oo0AjniRMdLwkYnuMLM+7/yyc/Sg8DQdaNFtEnm/QaS6+e+Ov/
 d7yeRGFHMjVhh7weSIZihoD5p3NrxtBE0oYty3UL87WUo4kXDZz670CxlywqhiGjSW8s
 AwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UVXrprrwSUxTJyS0iMmvnMAQega7uLmHTLl7J4AilI8=;
 b=m6ik4om535+GkVNtcjrgfQJGNEtfJQyGoB7+kUJA9nxl4n+zpCTyiEhJyhh194Pxud
 uU0vJWbwbY1zbb3oWWsa9r2UQIxLBqUeUvF8vTar08KCjtLQouAjCOfuIVIWLd8C9acZ
 E+XZ7NHRhk52+eg4ttCf9/TRTbU3iwMbwVteabOzBROUkBQhBzcizNKfne67p4BSyqp+
 R+iuTdKJaGkAl0CoGPKSdfWH7ah3QAY97eitzkhTwrO9MyvEb7ILjFJ1vmEHTJkOf60t
 ZcPFcCo+SUth+ZCcZUGAPqv8p1vf7QqyRY1RD6GTDeoBXiQ9x63FJZievITtJc9gSxwp
 h4xA==
X-Gm-Message-State: AOAM531C/LEIrczj3m6gU+7/0KbdlKyXvGaWjWbDRF+aRHT87cRwWBWw
 KWw10H63L6cB2M9+7z2ZbUViqw==
X-Google-Smtp-Source: ABdhPJyvFyU1QdCvQN+rW+7C/6aORoerXB8cbf9H2lgGHEJ2ttAU6WVBoB+EN9RFUJUsXMWCSdy/tA==
X-Received: by 2002:a17:903:3106:b029:e9:15e8:250e with SMTP id
 w6-20020a1709033106b02900e915e8250emr6447466plc.33.1619220196268; 
 Fri, 23 Apr 2021 16:23:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id c13sm6022468pgw.42.2021.04.23.16.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:23:16 -0700 (PDT)
Subject: Re: [PULL 23/24] bsd-user: move x86 (i386 and x86_64) cpu_loop to
 target_arch_cpu.h
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-14-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00aa5e92-c192-5100-c1b2-46f4d287715d@linaro.org>
Date: Fri, 23 Apr 2021 16:23:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-14-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Move the x86 version of the cpu_loop to target_arch_cpu.h as
> target_cpu_loop. Create a cpu_loop that calls the target_cpu_loop function, but
> only for x86 for now. This is code-movement only commit.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_cpu.h | 283 +++++++++++++++++++++++++++++++
>   bsd-user/main.c                 | 284 +-------------------------------
>   2 files changed, 286 insertions(+), 281 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

