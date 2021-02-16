Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF431C48F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 01:22:42 +0100 (CET)
Received: from localhost ([::1]:60602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBo8X-0001JX-Ox
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 19:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo6k-0008V8-T9
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:20:50 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo6h-0000YW-Md
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:20:50 -0500
Received: by mail-pl1-x631.google.com with SMTP id d15so4576510plh.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 16:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5pcAr97YiLV/9IyrI9j1/5CtMoVN2KluZ+rMrwDq4J4=;
 b=unwm0rIwBrW5m6ecgs1sMda6mGnGR9xMO8RWDScYd5PZ32nuu1mtEXhLLQ2cTjNevd
 gAbBBz8PAWcByeLqHKgAqwYqbXX1u8fsit9rJvMb1IzpYQ2qi1iYd3XT2XPLULx7saBO
 0O+YwYODBsoKeJYa2cas9qfkvJ/DBj/VoZD6LDWZJj7reLtyv9dRPMqDBps55cMamvtW
 YMIpXUmSfQS4cLqlqMfkZCdma1ZCMvs5Keaw33ISbGkdC/lVxzC91zsr2Igzg6EXvavS
 uy0GYgJvm16rp7ON2b7epcfr3ZKgxujHhNsafQA+e9wtXhX3ea9zRTkTJRX6k1i7ikP8
 vnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5pcAr97YiLV/9IyrI9j1/5CtMoVN2KluZ+rMrwDq4J4=;
 b=qE/WMl/Csall65pW6HoU9TT89LMkgnZNcZfmlDFppG5gaHiH8d7rdz8+1DYDcz0DD3
 YoJNNIEIDNXoPl84C3wNedW42YavQvPpj/NAkpxsyW4IS57xJPZNuJPlBP2n6buOcbrr
 RD7UBaVnr7miJmj4tgwo25q03vkcKnjwcLE7zIbw57UpuFjzEFUWrrlCsKRkXOp0UWYN
 iot9tDyXqmPYLTFJ6Q49mkAsU0mpztw5jRHc9W/qDwtqzbIE5uQWYVU1H4yn9ljPsaoS
 f8aoTYb9B26dTObwmF6/fYo7C5T2F4692KNIeAN0HClfYCFyQmnqQeZjnq0LIu2TcWBQ
 zBIA==
X-Gm-Message-State: AOAM531rwXVhxKtdXrXR2b6NTbpW4YZ9DrqkAOH9jm0jP+43PH/KcN+8
 bRR4NjdaIHNKENoX10XapVdMVXn/hx2PlQ==
X-Google-Smtp-Source: ABdhPJxCJLwOrC1VEhGxrIvtB530Su1ZcXWHeX4M0xcg4hqzi4oqVkWOz9S2Mv28n97So+QOWm4hhQ==
X-Received: by 2002:a17:90a:4287:: with SMTP id
 p7mr1360032pjg.226.1613434846250; 
 Mon, 15 Feb 2021 16:20:46 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id u17sm20784716pgh.72.2021.02.15.16.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 16:20:45 -0800 (PST)
Subject: Re: [PATCH 3/3] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
 <20210215215819.1142-4-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba93d58d-c835-7301-057f-89789a2fc682@linaro.org>
Date: Mon, 15 Feb 2021 16:20:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215215819.1142-4-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 1:58 PM, Rebecca Cran wrote:
> Enable FEAT_SSBS for the "max" 32-bit CPU.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


