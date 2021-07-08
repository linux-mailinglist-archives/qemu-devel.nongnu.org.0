Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A583C17F6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:18:09 +0200 (CEST)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xf7-0000JL-02
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1XYY-0003TS-Nk
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:11:23 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1XYV-0000zn-G0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:11:22 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b12so6048269pfv.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XvwNiL1x45I7wErGoDhIGRZcIXHUphrde09ZH5UEjno=;
 b=hh2cCVYZl0cJw1KPBhuEZ+wsLnr4cQflQJvb/cTtvRzSFQXsC8gzY6MtSC89yjOoX5
 uG0SieIvn8Ja/vBifSDOiDlwduuqyS2ADWmA8awQ/cTnZKCfKxOYp6SteEj3UEI/D8a8
 hKVARIPZNgsxSx1C+GK8QjzD6xllzZ6Q8zCFormSE2a2jQ9H11XMLNnswyqbBKUPR4MZ
 N5d30L8DnqaIr8vgJM+mETDXLBpNWaPQWUBVOYMdpsDr7Slr9cErzXQBZqSIFiOEycF2
 1MHtk7GbUeSHe4hcCKsO56Zu6NDD+PZ+s7DbSeBUJI6DhMTYP/ZwtVRvPZaUVaUvdYpB
 uhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XvwNiL1x45I7wErGoDhIGRZcIXHUphrde09ZH5UEjno=;
 b=iX8/Ee8sMLbcpiHnTgfKhKf9QESMCvjPee6JAPNHPW9K8vNLsHn/z/fruer0vw7Iaw
 csgJnuY4hIawzW9nv7KdPgLRKIuuzRqaMxZFvcNlwKTP+o03vrGu/B35wkK+Y9s+Lj8h
 nDLNJgyUiREmCP73Av/0Jz/LtrNK1DygPIyuGj3EQIhPzo9xtYZQ6JHr2CAUIo1YBD0E
 YIwhPzI6at3L/g6RAO44uxqzWaUnRfBdCiHPMjPVZ4r7+HIDkfPMcP83fi70fdjYepTm
 R9F9zH65jU6477yrB54iJjbBl5e5r29Y0N7YM/S+BTCdcLgBJmVuJ9mJ9eyIoY96NKec
 6V0w==
X-Gm-Message-State: AOAM533yuubkq/9bt04X7CC7uI766Pt08S4pyuKxo5NI/SQ5yPy7dfy/
 IPBIj6jnnsbhYoeeUBTdEOakHg==
X-Google-Smtp-Source: ABdhPJxRzWRvAVB/R+2vyN7TexogXn811iVtmwq1ttR2Zlm4qFb52ZMK3zUONqPQua43qUp4JNBDqA==
X-Received: by 2002:a05:6a00:1903:b029:31d:f720:133f with SMTP id
 y3-20020a056a001903b029031df720133fmr24349866pfi.46.1625764277942; 
 Thu, 08 Jul 2021 10:11:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k25sm3268651pfa.213.2021.07.08.10.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:11:17 -0700 (PDT)
Subject: Re: [PATCH v3 7/8] linux-user: Simplify host <-> target errno
 conversion using macros
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708170550.1846343-1-f4bug@amsat.org>
 <20210708170550.1846343-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1ec76ba1-ea53-5c84-5ce5-52cea6882fad@linaro.org>
Date: Thu, 8 Jul 2021 10:11:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708170550.1846343-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 10:05 AM, Philippe Mathieu-Daudé wrote:
> Convert the host_to_target_errno_table[] array to a switch
> case to allow compiler optimizations (such noticing the identity
> function when host and guest errnos match). Extract the errnos
> list as to a new includible unit, using a generic macro. Remove
> the code related to target_to_host_errno_table[] initialization.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/syscall.c    | 159 ++++------------------------------------
>   linux-user/errnos.c.inc | 140 +++++++++++++++++++++++++++++++++++
>   2 files changed, 154 insertions(+), 145 deletions(-)
>   create mode 100644 linux-user/errnos.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

