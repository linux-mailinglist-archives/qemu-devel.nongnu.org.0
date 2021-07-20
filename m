Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7F93D0453
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:12:23 +0200 (CEST)
Received: from localhost ([::1]:37912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xyQ-0004fV-WC
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5xxT-0003Rg-65
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:11:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5xxR-0005VB-Oa
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:11:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso403609wmm.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wqCRZf24JzgDKwBzq1XG3ARCH/nl2SZu630aXeAJ1zk=;
 b=jD87XUrZuE2gs1J85jySh8wM+mvJwks/Q2VAAUjM1ROWsRYwXIUgwnmXFfY0+bu1UC
 ewDhWSNHmpOlFRAYG2sI+OoNdHj+AROKM07WRsflhVFH5qjcubxQUAggRdKzphvHFO7P
 oCRzvq5V9cJ+aHHLQogygmQeH1q9aynIm0nFoCjrFNNbXIShfkElENiWFmTD4Jw+tK7A
 DILfamHAntmYHLxEUymU0gJfPw9Yhl4xjtwSsPNazWUGsHsagtD2ZfnBE0eZZ+/a411L
 fx/2vquMc2f+nPN1a0wNnaHj3TNgBLcMqP71RbpBXpplz/gPhR1xgJowqjYjJUaZXBkA
 ZkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wqCRZf24JzgDKwBzq1XG3ARCH/nl2SZu630aXeAJ1zk=;
 b=BIj+0OmTJn0jKhQ5O4dytywzqL664u0v8Kn14IBqyxKmUYRX81g3TQoEcxuDm5o1IX
 05AeQ5Y8zQ7Q1B5Te9CVXw1smjEke89+elUoOGxFR/svlgBnk5lx8RR1QFA3F1Uo18Sf
 SxCdcR7+1+DPf13NP3/87sX7uXHedew4jqo/PE8aMSvhMCeGZ+WnQQuSKg0O/MmmWIuC
 MA/bCwe3Bt3FjuYx8uIwkMJLScGhlyLjIN0+cE6xesxVYdOdOseFfYgT6FjkqrY8oqDK
 tvG86Spayx1XjcHDPH2sPBYj7bf5ftHEVu+kVVUQbUzVchIc56o3Gox9KCYg3PGEaAKg
 7Y+g==
X-Gm-Message-State: AOAM5324WwXsAwvE6eHEZk2vvd0zKSYX5LdFqXC/42J/e9fB5BZMt40T
 jO0F+rXgnx+L/j7A3Q6vd+c=
X-Google-Smtp-Source: ABdhPJzNiF0VQ3GmTHUbdWIX5VDXEFa7Trkw6Cwep9H8C1dJyCU01OV58CVq4G5/5WYMiKuVz2KpRA==
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr689153wmf.110.1626819080271;
 Tue, 20 Jul 2021 15:11:20 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id h9sm20529212wmb.35.2021.07.20.15.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 15:11:19 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v6 15/17] accel/tcg: Remove
 TranslatorOps.breakpoint_check
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5cd70e12-77b1-77e3-b54f-bc4d50b642e4@amsat.org>
Date: Wed, 21 Jul 2021 00:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720195439.626594-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 9:54 PM, Richard Henderson wrote:
> The hook is now unused, with breakpoints checked outside translation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/translator.h     | 11 -----------
>  target/arm/helper.h           |  2 --
>  target/alpha/translate.c      | 16 ----------------
>  target/arm/debug_helper.c     |  7 -------
>  target/arm/translate-a64.c    | 25 -------------------------
>  target/arm/translate.c        | 29 -----------------------------
>  target/avr/translate.c        | 18 ------------------
>  target/cris/translate.c       | 20 --------------------
>  target/hexagon/translate.c    | 17 -----------------
>  target/hppa/translate.c       | 11 -----------
>  target/i386/tcg/translate.c   | 28 ----------------------------
>  target/m68k/translate.c       | 18 ------------------
>  target/microblaze/translate.c | 18 ------------------
>  target/mips/tcg/translate.c   | 19 -------------------
>  target/nios2/translate.c      | 27 ---------------------------
>  target/openrisc/translate.c   | 17 -----------------
>  target/ppc/translate.c        | 18 ------------------
>  target/riscv/translate.c      | 17 -----------------
>  target/rx/translate.c         | 14 --------------
>  target/s390x/tcg/translate.c  | 24 ------------------------
>  target/sh4/translate.c        | 18 ------------------
>  target/sparc/translate.c      | 17 -----------------
>  target/tricore/translate.c    | 16 ----------------
>  target/xtensa/translate.c     | 17 -----------------
>  24 files changed, 424 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

