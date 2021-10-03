Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D90420232
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 17:26:54 +0200 (CEST)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX3O9-0001sq-BL
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 11:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3Lw-0000Vw-Bj
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:24:36 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:33725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3Lu-0003V7-B9
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 11:24:35 -0400
Received: by mail-qk1-x72f.google.com with SMTP id d207so3533327qkg.0
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0H6Up4kS6Ftgwm8g6zca7UGXa7VQPLQap0biuMbzs4E=;
 b=nWcgUqOaRavyFt6UFRQNCPJE+FNn2AUP/7zNAwsbGvrCYn7cWjAart3iL+5LgWYOGK
 it9aNW1N5FzwmmZsIM03DhAzHHCO2HsLifVPoahJzavuOf+BgcIGs+5XAxKLiT6BsRwl
 0f+MVsgZJUln1/JCfpNfo6drh9jy4j/3X8LTy3L7Np6gGjxuytkFl9UymOHoZPQfJeIZ
 eCu6XUrXuMTTYAhXcoU7jGJeYs11+GY896QeZ+LhiKuCH0hg7HKHMOArPkpLNhqzJqut
 Y5hAPZZqTPgnnpu4JXqYFErkMJT+b1n1BLdz20F9pqLDG2Aebzf/Vqb4bHKEo7gv6d03
 XVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0H6Up4kS6Ftgwm8g6zca7UGXa7VQPLQap0biuMbzs4E=;
 b=FrX6rx8uLzp7ptBmA0Ug6+ipxTGTDrbhR6pW9aeS6Ly02j75HcWqrCwhL6TXYMAfRh
 YaKsGTnbxqbPh16DDgAYkWQlB76zmP1C6e4NqNg8tyPpRtkdhnZ9h1emxkRtHr3s2iw7
 pHT3EZyDuttnJ4ySTIfHm0cGB0QvdDCCkWMA5PEa3P3Zsd1p2/lRWI2ePinjsNgZnWUZ
 BRqZT0h1ch3W3k1Szsa2nRaSJ7xwSR5gLl2jzMbw8diBUyIPck4up+T7NI/zx30EAVV4
 qrflGYuPRnpNMLwr72EB468Y3aDH7MuqeU4IZz/hyFJj+CiE2kKfzQ8Y2hhrWSRP15vp
 O6SQ==
X-Gm-Message-State: AOAM532p9biEQFyjVYvyrk5uUdKs1dZda7KVXYSeZZiow8AVvZ0uwvXM
 FaIf06JNCEEBw14j7c9IguL5Lg==
X-Google-Smtp-Source: ABdhPJweUk7wwUImp1zem+Y/cfmIgyA6kPZTBpMdrmpK96EwP+j/IC22c3XAdIBMCP/aNA/DFBh9QQ==
X-Received: by 2002:a37:270f:: with SMTP id n15mr6320544qkn.203.1633274673353; 
 Sun, 03 Oct 2021 08:24:33 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id u6sm391385qke.78.2021.10.03.08.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:24:33 -0700 (PDT)
Subject: Re: [PATCH] target/avr: Optimize various functions using extract
 opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003142142.3674844-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f366b3e5-cf3d-d2b7-b7ef-3ec79568a164@linaro.org>
Date: Sun, 3 Oct 2021 11:24:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003142142.3674844-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 10:21 AM, Philippe Mathieu-Daudé wrote:
> When running the scripts/coccinelle/tcg_gen_extract.cocci
> Coccinelle semantic patch on target/avr/, we get:
> 
>    [DBG] candidate at target/avr/translate.c:228
>    [DBG] candidate at target/avr/translate.c:266
>    [DBG] candidate at target/avr/translate.c:885
>    [DBG] candidate at target/avr/translate.c:924
>    [DBG] candidate at target/avr/translate.c:962
> 
> Manually inspect and replace combinations of (shri, andi)
> opcodes by the extract opcode.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/avr/translate.c | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

