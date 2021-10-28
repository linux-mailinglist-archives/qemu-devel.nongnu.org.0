Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B943E4EA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:19:26 +0200 (CEST)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7Bb-0000HY-5f
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg77o-0003np-90
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:15:28 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg77k-0000Zq-Mc
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:15:27 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 75so6711606pga.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hZynjcNZksCahEJ3jDWoedi8qTmHkUHby2Gd6UMXYRY=;
 b=NgafYgJCly9NV+XxeUnJ7icoT+yxFASDn8Tkld9QqhAJWVy3Jae1ucjmp47yS0z1yf
 FNKvF5e+WGrY0ncfxbt7kJtqiGB4f4TTv4tmk6ZlC3vJp+azswf7LgR+cZdQzOUawptN
 eBr7s3HBRaStsm0aDK7AIMRKAJ8Hl1eNbbKhPPXofJHzjS9OuJ1mIW+DgvP6ip6BdaaG
 d1TjAvZfKRxR9zcAtuamRmlXzW34+lwzd0L+EOu1+/TP0EQMXm0+cZqwUEf8dfy3MuWa
 si5Xh/ayaAH5IzzsL4qFdvXPjUK/AHWP9zikqg7Insu38aqyOd6hZqAp6rLSk7paq/Re
 7rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hZynjcNZksCahEJ3jDWoedi8qTmHkUHby2Gd6UMXYRY=;
 b=JBpwMw6q1BA3iqSR/qOLM/SIBL+9R7fzEuVvv4wOAVuSScb9iBv3Mgya/c7o7MQ85g
 0U7cvQfhdDs59JgjQ3u4NIRQxl3PrJEAkXul4YNcnGcvfhLajh5bxX4zO2ZvGVknsBxT
 F9VYVrfvE+uRwuAhTNoPT17py+2vybigvVUDicKlx2XHwGD2iy6+Ujoa9BgXKuvvyPI8
 zebepki1taYHDWJnssclA5o0dm7KDsJIT8662JeiU1KmogyYm6qdLYZo9PpMEG+3V/l+
 K6bcj8MpgfbMfs/TtWfaDYQk8KHziIreGNf4dCm4auDYBo9Hbj5cyQtNr3maahGqCigB
 o/Fg==
X-Gm-Message-State: AOAM531Fl7ddBj0Bpu28ZtNsp+f4XprQV34wTJCrn6F1fAXyA3Z77+vz
 MX7XqAt6dosLgYZpgwvv5231hQ==
X-Google-Smtp-Source: ABdhPJwTsT2+Wn/Fqg/gIytEgDDPj1krDRsGHevEvZ3D4dG65fEgG2eK+ReUE9dUFxmgSKYxhB0WPA==
X-Received: by 2002:a63:8648:: with SMTP id x69mr751169pgd.438.1635434121602; 
 Thu, 28 Oct 2021 08:15:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k5sm4341465pfc.111.2021.10.28.08.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:15:20 -0700 (PDT)
Subject: Re: [PATCH 05/24] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d21fe60-9001-809d-b7f4-e8cac67da50e@linaro.org>
Date: Thu, 28 Oct 2021 08:15:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> Implement target_cpu_clone_regs to clone the resister state on a fork.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

