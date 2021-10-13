Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A426B42CA7E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 21:59:06 +0200 (CEST)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1makP3-0007aN-Q7
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 15:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1makNS-0006f9-Ny
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:57:26 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:34725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1makNQ-0005QE-8a
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:57:26 -0400
Received: by mail-pf1-x430.google.com with SMTP id g14so3457837pfm.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 12:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ns6sjJJf0bALfNbaMWbQ4BjkUK1NJuk+pbU25cRfK+Q=;
 b=EcALon4JBUZuaNnG8XImclKAlJhBoYoI8V3oDBxSpCLZu6AMAzTKiEb+f9MK48tUbu
 3se/E09pJPLy+ApGC4fHjJe9Lw5MHSb35FqjTiYljvKaJU8nMhVjI55gGiG20UWhGcDw
 kq04WP+qtvzHUvz6fUSltDeyiwKWZndyeSuY9Foqs2j39VEUvfJZUuRz6RoRMgpexB/f
 ypNpSmg6VskQbAmCiHJao4HxaaNz7i9Q8O2m4oGmQaF3xCaM9IA5ZmF0qz3CzjQq4KrA
 nYtamoAm/kFCNZKmUMWZkskvwC7aVO+VZB3PZ/o5yHi51NLtdo7YHr1eh6r3iytDOlIZ
 zLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ns6sjJJf0bALfNbaMWbQ4BjkUK1NJuk+pbU25cRfK+Q=;
 b=lflKdHY/oPLGGHMyBejn9Ocq4REuD1+AX1bCcLfgAL4Xo70dLGcmcdZ3kfRh1vtPa1
 p62PEoLKO0QNCeDtqf8tewpACN2oXAp1+E0lciFe56VxADxATKo7WKa+c+TUQSYSvGD3
 7I47DU0PiW5sn0WiUBZ81XZm5uLDxAV9nO0zpWGQjmbXCY1fo494XuO3W/M8OlYIJKih
 LT4SK6+uUgMrjz6WLTHuBnRJ6r9ArzGHFByoaOkyrGD8sGPOIq7bem5c3cll7xxseZov
 AfUC+2fPkOgLn3okXGrP1zcVnFL214nGgbLMI2jnYsEkXm4oOVNQPXsCo1TVTQuAUsdU
 hqHw==
X-Gm-Message-State: AOAM530ObEfzINpmQsSpLJpT/3qVfRXvPNrlHkRwu5eVggatt16S7ZvR
 9nvnf2ZE0zM/C7jZb1Ebn7amtg==
X-Google-Smtp-Source: ABdhPJxHuSo6xzoDDKBlUIwxKzUR3UxdgMv0d7TO8Vy4tVLMMV2rH/oP7DB94jCvpa+cgwrzvOA9cA==
X-Received: by 2002:a62:e90d:0:b0:44d:35a1:e5a0 with SMTP id
 j13-20020a62e90d000000b0044d35a1e5a0mr1342098pfh.54.1634155042734; 
 Wed, 13 Oct 2021 12:57:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm6758019pja.52.2021.10.13.12.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:57:22 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Fix orc.b implementation
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20211013184125.2010897-1-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40e5e474-dac9-9b58-655e-53d7cc01231b@linaro.org>
Date: Wed, 13 Oct 2021 12:57:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013184125.2010897-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Vincent Palatin <vpalatin@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 11:41 AM, Philipp Tomsich wrote:
> The earlier implementation fell into a corner case for bytes that were
> 0x01, giving a wrong result (but not affecting our application test
> cases for strings, as an ASCII value 0x01 is rare in those...).
> 
> This changes the algorithm to:
>   1. Mask out the high-bit of each bytes (so that each byte is <= 127).
>   2. Add 127 to each byte (i.e. if the low 7 bits are not 0, this will overflow
>      into the highest bit of each byte).
>   3. Bitwise-or the original value back in (to cover those cases where the
>      source byte was exactly 128) to saturate the high-bit.
>   4. Shift-and-mask (implemented as a mask-and-shift) to extract the MSB of
>      each byte into its LSB.
>   5. Multiply with 0xff to fan out the LSB to all bits of each byte.
> 
> Fixes: d7a4fcb034 ("target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci")
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> Reported-by: Vincent Palatin<vpalatin@rivosinc.com>
> 
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

