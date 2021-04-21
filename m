Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7DC3673FA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 22:04:40 +0200 (CEST)
Received: from localhost ([::1]:46400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZJ5T-0003pl-IO
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 16:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZJ4B-0003PH-Dc
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 16:03:19 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:37731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZJ48-0003qN-Nk
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 16:03:19 -0400
Received: by mail-io1-xd2a.google.com with SMTP id b10so43255623iot.4
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 13:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ETHsiuyLBSfyflHR/5l1MQeYH9T2i7IzqENQOwQXqBY=;
 b=a9cirQP1rd695uh4dQ/F9s0UVVvbHAFl2GD2LstKaUf5Hycshj/0izikduRWDvCUPX
 fjB8ktX5C+CGT7Vzn4Hg37rFN6rpg6k4oewCZp5bgU60E13X6L6uLMXr26kjp4lZZCRX
 D/MiI4OX6dg3azpQw9sVXNhFWXYtMz1FyLm/CVJHbTN58B+Z7PP1QijE7erCyLyzeXvh
 astbzfyMIt+qnAurDM+11H3XELxDvCt0tsziXpqeSr2wlpvPX/6lExUnQbZjiT6Zb3Ey
 s5VkTjw+zRipMkSi0suIkhrsjBW+N9EffiXV6z3/vA8Ww9na+PCmIAM6XFi6f8zZU13u
 zIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ETHsiuyLBSfyflHR/5l1MQeYH9T2i7IzqENQOwQXqBY=;
 b=A6d2GJTjDyIX7Amyrvemd2td1GmD2rsCGfeKUd8bDzV1uaoiYmeEnr/aQxaN0YL8Zo
 xRO6WaPY/FyHvMFu1EWs6CyPy6U3hK/MSLcMXobENCcYpJUdTZlH7ugvCyU/6hrq4GPP
 CEHuj4NNWCHAaojaN1NNL+wR9+jFz8y9vvhLk8AgGQJfqJDxTf2bm5X0vpRPBrab3WeH
 4KxBoM32Vz2Izs6X6WjZyoHzlCKAbLgkDb3akp7Ksrp3seU9aCPovF/2rHrfOXiEv5hV
 IR3PUxGsu4aZAWBxl8I/Hf5Q8aFqWDFeOGGZ25y6v9v+oyV/FpzgIEiB1M3yk9UifhNG
 f+tw==
X-Gm-Message-State: AOAM531OUsvNwMKcnwKjWY7dp3CjFfxZhk242Ff8rKRrOIyGgJVpWo+g
 zundZ0U30IDaqXw+Mlgoo3JnSQ==
X-Google-Smtp-Source: ABdhPJx/KEPgc5EZjmtKUIClQ8KMhBqX9+hwBI/1BoQWFpY/xXU7s+jyH7RkVX5qHh/jzuq/1qnqBA==
X-Received: by 2002:a02:c017:: with SMTP id y23mr15610852jai.48.1619035395364; 
 Wed, 21 Apr 2021 13:03:15 -0700 (PDT)
Received: from ?IPv6:2607:fb90:8067:a11c:3594:91a:8889:c77a?
 ([2607:fb90:8067:a11c:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id r15sm200320ioa.52.2021.04.21.13.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 13:03:15 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Add missing CP0 check to nanoMIPS RDPGPR /
 WRPGPR opcodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210421185007.2231855-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <874deee9-92e8-d1d4-9a36-16e0f35dd10e@linaro.org>
Date: Wed, 21 Apr 2021 13:03:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210421185007.2231855-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 11:50 AM, Philippe Mathieu-Daudé wrote:
> Per the nanoMIPS32 Instruction Set Technical Reference Manual,
> Revision 01.01, Chapter 3. "Instruction Definitions":
> 
> The Read/Write Previous GPR opcodes "require CP0 privilege".
> 
> Add the missing CP0 checks.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/translate.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

