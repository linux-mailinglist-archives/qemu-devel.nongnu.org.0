Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9B3276D4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 06:11:36 +0100 (CET)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGaqD-0003Vw-V8
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 00:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaom-0002xo-Kv
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 00:10:04 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaol-0006jm-0r
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 00:10:04 -0500
Received: by mail-pl1-x62d.google.com with SMTP id b8so6311590plh.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 21:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oNMgX9PlOgeIdu5IyVoME7R4MOUwSVIYCcN9AJno7Dg=;
 b=VYTNe0Byx/WJkZ65OhikMSFkg5reSfU0IHaRRIuk0oBcdo3UuxSCxrg0I0/tSK54eQ
 OTmo98Sh8ClCpDt1LanjxJHSYiciRNC5NWdX8FeuoOLYSSW9k69OiVlD1WaW7i6IRWPn
 6h6ZFg3+/g1ktqpybP9Z6F7dGT1qPQPVcbiP4rtrbshFOKtjLtBly5LFZtMZqeZ6kcLF
 TqMtNF+FEu4liwhmuq/2mp/qiAaO7T/Pxqoh6trd8IK+REj0u/2GgItd3pJDtU0F/gVz
 zWEIO54KIy30n2O3t+yqKsePHM6q+f82fUhawmXYK4lIGeiEXuhacCqut8jS9iDhndKm
 O0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oNMgX9PlOgeIdu5IyVoME7R4MOUwSVIYCcN9AJno7Dg=;
 b=NohCRT4rM/MTO7PZqik9MlFEMfGlcYtTqy8pNX21xO2BdB4fuO8xnI2JPpw7I1/X8g
 U2ssQo79sa9W6KpBjqS3fkBQ7VgzjIr1zSSjSPqcXpgAp4FOmIxvQ/VphxfgBcFY2fKM
 PfyzicTJr5uMx4162gVxI5OKn7NJnHFYdG58xu4DAUOtdjC3aL6swkdOW3NmICfebmcY
 oUceIXczGL5HcZCdU/U51A8HAmavwBFt/M7gTUerI7pgvgjmDovS7S60D8t71ddLX0Un
 35UF5QjS5tp1P4BfjUdkfbH9G4xjyJbLl4XmVUpzsngFMI+XqJHFSPpZLCjrSHqCkMca
 3Bfg==
X-Gm-Message-State: AOAM5318qjo0EPMhIitzGUzEaOUuXGkoigZl5Q8nu2vofs6TcTWi1J7P
 j58wQoLsZwM2l1xtolZoryPL1g==
X-Google-Smtp-Source: ABdhPJzydtdhvVuccZdbbNLXedaFqb+8riH12Dp/q3inxvu9nDg/uM5Wnp5lplYwll96Sus+mccGKw==
X-Received: by 2002:a17:902:34a:b029:e4:8b7f:14b8 with SMTP id
 68-20020a170902034ab02900e48b7f14b8mr8420282pld.29.1614575401471; 
 Sun, 28 Feb 2021 21:10:01 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h6sm15159684pfv.84.2021.02.28.21.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 21:10:01 -0800 (PST)
Subject: Re: [PATCH v2 19/24] hw/arm/mps2-tz: Get armv7m_load_kernel() size
 argument from RAMInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3301e83d-cfcc-e690-a501-c1bf6de7d5c5@linaro.org>
Date: Sun, 28 Feb 2021 21:09:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The armv7m_load_kernel() function takes a mem_size argument which it
> expects to be the size of the memory region at guest address 0.  (It
> uses this argument only as a limit on how large a raw image file it
> can load at address zero).
> 
> Instead of hardcoding this value, find the RAMInfo corresponding to
> the 0 address and extract its size.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


