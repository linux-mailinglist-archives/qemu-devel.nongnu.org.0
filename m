Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D156EB471
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:09:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppywX-0003rG-Se; Fri, 21 Apr 2023 18:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppywV-0003im-B2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:09:23 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppywT-00017q-Rt
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:09:23 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f199696149so364365e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114959; x=1684706959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q8/cp0WsowbmWrzGtyGTUjD4DiJ37SSXaj74/jprdxY=;
 b=Bq0hvvP32S1tcHa9ZDNTMdy8Ol1rsVSmgs8M5BcNP4AXjNFjufqyCH8staCY7OoTaK
 Yq/FekdFbIdebbIN/4arLbyRa0MPOaY+01DkywPhVcjSWDpXHiDuOI6HG5TCVC51O+8b
 B/Ho28JGEswdgfxQPJezT4Zy3IRcd5Q9tFbH/fovfjW9YNMHZMSHHyElsCgj6rQTAUSH
 u/92hXVET4lSrYoP5YBToyc8J4c6hmkB4ycNqE7H2xC9JsljWXDGvuuMUh/BYKFO9Uds
 FIBqAhS9S9EDG7w8Q8uVRnl4k7sPpdbVgkJhRRQlU9zYfNZUg/5PkRHhodpDMNgQ0EFe
 N+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114959; x=1684706959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8/cp0WsowbmWrzGtyGTUjD4DiJ37SSXaj74/jprdxY=;
 b=VWobODw8c39lY1EAk92hefpa4URFDGLRJRGAl4eVOHHXMTAJZsxnL1ZYzxPljZ+PNT
 QKujzOvXaQJQRFBRGjxBRx29FzrneLPC0nSSbm8dlFt69tGrOUozE5pHApPSNh2xIstb
 HQbe/XMtOFZ4/nLQgQr95aT4UM9wxBoRKxyhh/SeizPlSgLRcOSp9Tj9l/JRy5UrT/Yh
 2ruwyVjzsh/mycqq1tOSXxrn8nsv3iJhKvfv5Tqn15F4fLET8OvNH1Y/RL+8qE/V1kfl
 ZKdTzPHMHoWgGJ4l7QRyD3lMJL4ZG1MkxjyPQWpVM2R6LIpXbqXSHPRZw4BG6dQFDa1h
 amHg==
X-Gm-Message-State: AAQBX9fk6aIfas7kfz3G560/jX70nSPfPZVmTZe+ABAzlTVbhZNryTp8
 mUqcvpEZIpnvFfNO0h0RSKViZO2+zMXfUTDu9/U=
X-Google-Smtp-Source: AKy350aer5NPzw4R7ZunFkLgm+e6g5BDOVHT6o1q3CKkJsb5HHOL5TBslr4lVMa1uravJIMkKHbcNg==
X-Received: by 2002:a05:600c:2045:b0:3f1:95ea:9342 with SMTP id
 p5-20020a05600c204500b003f195ea9342mr1338776wmg.0.1682114959239; 
 Fri, 21 Apr 2023 15:09:19 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 n12-20020a7bc5cc000000b003f17329f7f2sm5819850wmk.38.2023.04.21.15.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:09:18 -0700 (PDT)
Message-ID: <180d9a6c-f837-cc89-232d-9b57a37c03c7@linaro.org>
Date: Sat, 22 Apr 2023 00:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 05/54] tcg: Split out tcg_out_ext16s
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for performing 16-bit sign-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  7 +++++++
>   tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
>   tcg/arm/tcg-target.c.inc         | 10 ++++------
>   tcg/i386/tcg-target.c.inc        | 16 ++++++++--------
>   tcg/loongarch64/tcg-target.c.inc | 13 +++++--------
>   tcg/mips/tcg-target.c.inc        | 11 ++++++++---
>   tcg/ppc/tcg-target.c.inc         | 12 +++++-------
>   tcg/riscv/tcg-target.c.inc       |  9 +++------
>   tcg/s390x/tcg-target.c.inc       | 12 ++++--------
>   tcg/sparc64/tcg-target.c.inc     |  7 +++++++
>   tcg/tci/tcg-target.c.inc         | 21 ++++++++++++++++++++-
>   11 files changed, 79 insertions(+), 52 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


