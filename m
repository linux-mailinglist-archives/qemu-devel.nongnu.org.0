Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92E3F0E45
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:37:19 +0200 (CEST)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGUBS-0000uV-5f
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGU9e-0007vX-CS
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:35:26 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGU9d-0002Jy-3q
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:35:26 -0400
Received: by mail-pg1-x533.google.com with SMTP id r2so3883667pgl.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cdxjO4S0vmJJHh4AldSlutUC1XhJHkuhmO1I2vQdA84=;
 b=FXatXkACLicxPffMgmVmLUYScK0B3qIB82lKtKzc+2JUCQVZl5yGY9lBZtDvelJ0di
 O5pyvxg7AzJnTLazaGO9/Ed9anMTnmCXuWKc8GjrA7ybf+9jk3PwqVITvTmNU5HKtQyA
 orGyge46DnQitkiYSZxSrTlBnmnu9/H0YMNpjwx5/mitgTUv77gZGM5P2B1h+7+dZjZd
 kNAAOihQVysiTBEhDBYYZ237aeXGy/ElRzz+m9+cYNR/av+xJxbqPlpkyZBTK3p/rRlw
 26X1VjmnOqytTiqi5tcDrVuETux87ftizNey3m6mlksC5T2r7KQuPoZoJgFYjp3olyGI
 6+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cdxjO4S0vmJJHh4AldSlutUC1XhJHkuhmO1I2vQdA84=;
 b=BuAeHBdoe+WVGQMAPjxdhLXz8WqEmPNLtSj/44Gp9wmuQBAeYuE70CnClHHAqJmjGx
 cTWipXlmXR8yHO5KZa4YAwM+M4qNPYBVS3AIOJSMyBGOYIsqUFFOohe+BPJXjMs3lHhQ
 FzTtXd3fXZXrh0L21TLiDKAtj6VBOP2IEV2akcpL80GTnP7tXtomtxjjxIMeID1zAmAr
 sWoq7WrjJfv+rOs0u6nJs1zWJSd5VlnA2E1+Yy978QQZwoIGwSjxU9/ZzUXd1c5MDOfm
 A+S1jPDos7NDdo4o7sGNE7FBvcxMk/65N3DQ6sT7YW10Qrya6aj1cAIX9qx1f0rtsrrl
 JP7g==
X-Gm-Message-State: AOAM533e2pq9RxsO2Zs/59Q50G6w3g6OI8mSTmgxr4bQC/JXjtrTkVAI
 8e40e/c5a9cgNhC2WKFvnupRYQ==
X-Google-Smtp-Source: ABdhPJyBP2+xZgOdjudb0uz5H2B4iae2WSNOo/BcvASwyRA8TXL6GgigcaUmN21O4aQcS16nDYip8g==
X-Received: by 2002:a65:5b86:: with SMTP id i6mr11156686pgr.180.1629326123906; 
 Wed, 18 Aug 2021 15:35:23 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a21sm879553pgl.51.2021.08.18.15.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:35:23 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] target/mips: Replace GET_LMASK64() macro by
 get_lmask(64) function
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210818215517.2560994-1-f4bug@amsat.org>
 <20210818215517.2560994-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41bbad8e-3746-8fb4-3c3a-1d6ec1fb9c00@linaro.org>
Date: Wed, 18 Aug 2021 12:35:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818215517.2560994-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 11:55 AM, Philippe Mathieu-Daudé wrote:
> The target endianess information is stored in the BigEndian
> bit of the Config0 register in CP0.
> 
> Replace the GET_LMASK() macro by an inlined get_lmask() function,
> passing CPUMIPSState and the word size as argument.
> 
> We can remove another use of the TARGET_WORDS_BIGENDIAN definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/ldst_helper.c | 35 ++++++++++++++++-------------------
>   1 file changed, 16 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

