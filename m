Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA65EB43F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 00:10:58 +0200 (CEST)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocwJV-0008SU-MH
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 18:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwFy-0002XG-1a
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:18 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwFw-0001EJ-Be
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:17 -0400
Received: by mail-ej1-x633.google.com with SMTP id lh5so16966938ejb.10
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 15:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=WD+UJ9moQQpzwmdVf9ppzVQJc+Q+ANNWtq/LUj0gpck=;
 b=wf1lT+LYEBhsgWHvBfaKvsnIDK0k0e0D8CEqfF0iOqdW+VTP8KpEjjLPcxVpoYV/eB
 kqIBOdZAxdb1sDhylGm/e6XWKCBbXWq1c2F12DVBN2G6ejeaJbTIQQ14bzgQ10+I7+3U
 DQsP8BFhfMX5Aa/SdMLKQHV5eMbWwna/P4WBnuPyBwMPPF23IUaLfJy0gZaKoIG/mSCO
 f7YIHG3TFQoRpuaAKnyPPHp90IuwrU1GeFqILZK8u4PDy2cUZ0m5K1Is00js3sTanPh8
 BcXCTMRCgsZQjb4HbmmnT99xd/fTxsmUOcE6qpMTAm3pQxEfDKL9Cbx/YxwL7oytFmED
 ShGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WD+UJ9moQQpzwmdVf9ppzVQJc+Q+ANNWtq/LUj0gpck=;
 b=2D2qGKtWDokw4VjJBTexNmTn8cVmWM9WLv/h94FGTC5lbf1YmF00MsbU9cVS+WReGa
 sUCIxxjtWkUS3m94zbWKHmO4x8M0AIyJFJhtOS5gOkHU6F7KZqkX4qoALUFUYU95S3z6
 Q/pwzVgV14wmTqR4OALm0OMzODV0covR/WIcrVQJK8DiYvoYTjhYlOaxOtwevgHtkUWl
 z5vY/N2jVmjpE49BOJPWo9S7mR6MIC28zXOkfanXIMuEpwUKFuFsEcmA3Q9NxBTjOXun
 h2MJ6O/loZcGmOyoruTamMSRMXf4BvWcNov6BQlkIQsHgc5C+DjLVqvdzHzXc5Bpg5+9
 Hecg==
X-Gm-Message-State: ACrzQf0oBdTEvIduPA5k9nJD8KxCPffRyD/Wl3QxPSYjAHA1zaEX55iy
 zrzBLTEh9WtnE2ygbGzh5WO0KgcvbZBTFPXl
X-Google-Smtp-Source: AMsMyM7uE3ifRio6CjZBczLB7hFbcZwadlVFcwG4yqV0IZhBqN0+qBvbcGIOQAUp//jOH6UZTT/09g==
X-Received: by 2002:a17:906:7945:b0:73b:e605:f31 with SMTP id
 l5-20020a170906794500b0073be6050f31mr20179581ejo.129.1664230033683; 
 Mon, 26 Sep 2022 15:07:13 -0700 (PDT)
Received: from [192.168.190.227] ([31.209.146.210])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a170906269700b0076fa6d9d891sm8886623ejc.46.2022.09.26.15.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 15:07:13 -0700 (PDT)
Message-ID: <858d6c47-4df6-f074-a71e-a6883e703771@linaro.org>
Date: Sun, 25 Sep 2022 10:28:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] RISC-V: Add support for Ztso
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, alistair23@gmail.com
Cc: qemu-devel@nongnu.org
References: <mhng-e27f21d8-b12c-48dc-8fec-93943bbd36f7@palmer-ri-x1c9>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <mhng-e27f21d8-b12c-48dc-8fec-93943bbd36f7@palmer-ri-x1c9>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 10:49, Palmer Dabbelt wrote:
>     The Ztso extension was recently frozen, this adds it as a CPU property
>     and adds various fences throughout the port in order to allow TSO
>     targets to function on weaker hosts.  We need no fences for AMOs as
>     they're already SC, the placess we need barriers are described.    These fences are 
> placed in the RISC-V backend rather than TCG as is    planned for x86-on-arm64 because 
> RISC-V allows heterogenous (and    likely soon dynamic) hart memory models.

Heterogenous shouldn't have been a problem (no more than Arm a-profile co-existing with 
m-profile), but dynamic would have been difficult to do generically for sure.

Otherwise this description addition looks good.


r~

