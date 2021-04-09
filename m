Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66335A3F2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:48:52 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuJP-0000VU-9z
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUtz9-00084a-7K
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:27:55 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUtz7-0008JZ-Ab
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:27:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so3442224pjg.5
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gHgdpxnfpYd8uv6d/cdr3KA5CafW4IOtjBd1ElMC/80=;
 b=LVAXV0hkAT45RhGBw0OLXdLe9kr9l10Yx8RkQ/MMfl4tDQlXafzLzC7bz/WjAUquRk
 ntV07dFN3Ng/odX5G3Fw7suOOnR/7GdG3NTX/0cV88M9rx0BoaMVoV8MTpp3RGpp553M
 SrhFUcY/izcKVSX/t9tV8pUFZ2w6UjePgXrg9dwVZBixlEWlgIdqcMDzmQa8Qqz4vZrR
 WyB0CXRkwIVQ7wAfZdb1CMGr8q+RSL5itkMbnkBOddgbHDj7l5qZCrFXoqAHTcAkWGDn
 7T/VaXahTnHt7h3tpygQOhXTXZN8reDD0LqctWQSLt+cinDQxQx7UecrAi1YVqXWOA1G
 xLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gHgdpxnfpYd8uv6d/cdr3KA5CafW4IOtjBd1ElMC/80=;
 b=oaMhxPwaYBbx5FrjjrSXYrh8C9ADmOqHmyeWi6kgCVu8pC5U+LcYgH6f47qfRc4lZr
 R0xc7T8x5LkXxtef2WR9kKg5hi32eUOGZITbEzZptTz3K1qqMdQ9FfKqcMUjxErPbdW/
 ZdTxiSu5AfHSA3ZXSQRjcfiOV3iBMHRUajeErPUjF2ve3CxTxniqghN4kmivqhikGHnH
 acX4d4HZ1ya64otw1s0PNmtFq6/S87W1pv0glqiK7iCZHjr7JFvmIL7RzkRFw/PfnCLL
 raypw5lswSZaUi3ClFVfXAOoRRJQqpifPcWxnfTAAJtizBy4pBTkJhiM+uFwcvUFux2A
 ormA==
X-Gm-Message-State: AOAM532qkc6MXodhdAnqFD7tLQBrqTeicm/bP4Opp+Jpg5ZZwLBg4uJA
 pMKrGf5psnW+LiwnftKMMhqKUw==
X-Google-Smtp-Source: ABdhPJyUihNYp2QKo+8BqKWyufJDHQZrSc19g/aw2EmX2Y9zvir6OvY9IMzCAU3gO4B/5HDVTUbxGA==
X-Received: by 2002:a17:90a:8914:: with SMTP id
 u20mr14251003pjn.90.1617985671924; 
 Fri, 09 Apr 2021 09:27:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x33sm2750109pfu.71.2021.04.09.09.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:27:51 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 v2 4/6] target/mips/cp0_timer: Add
 ns_substract_to_count() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210409093623.2402750-1-f4bug@amsat.org>
 <20210409093623.2402750-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2737fe30-1987-86c2-88bb-bf266904e9f3@linaro.org>
Date: Fri, 9 Apr 2021 09:27:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409093623.2402750-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>, Hao Wu <wuhaotsh@google.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 2:36 AM, Philippe Mathieu-Daudé wrote:
> Factor ns_substract_to_count() out to simplify a bit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/cp0_timer.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

s/substract/subtract/g
Also, one usually subtracts "from".

That said, I'm not sure I see this as clearer...


r~

