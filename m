Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9982FF54E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:04:29 +0100 (CET)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gBw-0007rz-0U
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2g85-0005ap-V6
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:00:30 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2g83-0003Pq-PN
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:00:29 -0500
Received: by mail-pl1-x62e.google.com with SMTP id r4so1878791pls.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mngfJW99uOFK1jkZIuG+A9sD9ps0TJYMUDyahKg9Klk=;
 b=Kd3l+SOQQEpA6ZXLTnkIHW7nCjva9sZfI/+P3WEG8dv3qlNq5cmrq3aF02NXKvxrAO
 Pi1CQvpHWqTnqzsmSYUMeuLOv7BH0BD6ck1cNBxCwpiRG0p2sxN7iHxT39FT8DYpZb/8
 CbJorQfUGXLAAqeVID8e0Tto91WBL1oAW/I2D+dmB11b6jAjKktcFB40U/759dHpZWL8
 LxxkpuaqeOTPSJ1YlTy3yWWBx2oWvJ7uf85c5Hy5YmlGedYx+RunL2xbp7BL3jB0Yafg
 NdXjPG7XAxVViX9of8FQeEnkHJSiw6ReA517zD4YCuLl/4wlXeeTs/i0OIBQFQXZNkqP
 Q6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mngfJW99uOFK1jkZIuG+A9sD9ps0TJYMUDyahKg9Klk=;
 b=QFJcws0OEbkN5I5a7QlAqAdVB8R30/DY/YDxfsE+LO7xecsW0fJVAGs74taK59W7Ak
 zaeBT7yRKBMECQMoC/+wGh/jemRIxy4zf8kC3uWmCjMMBfpcetaHNeGoMUETHIfITECZ
 wMYhXGePk7kSn81HTwnovSxVmJq3MZjOnBzXIxPr0534mvtFvFJVLmYfGqzvKmW4FTag
 2YxiPaJfAXgmKxIlQoL+XKr65WIEhJ53GA6+j7b63QLPHB7FwPoMlr89ZqlpDFi9xYFG
 gmIm2oAR/GG1LNooPeat8zNnuBVETX3FKC+t9XZWUF2quMYtHRmVfdN5SR9Ma5XDotzF
 1Vng==
X-Gm-Message-State: AOAM532tRLK1A4kjPcyVQMcDpQc19ComAe/FPgnd+FeqhNtP2dDT1bqJ
 u8993BFHXMxa6f212kl6mcrB41vAhN77iw==
X-Google-Smtp-Source: ABdhPJzoFo2Eot3ZHNfzmBFVLlyPTMmsPM581YGOw+2tFR6RuVcqU4711MKUTa7syfAuAlecgtlkjA==
X-Received: by 2002:a17:902:b08f:b029:dc:8ac6:a147 with SMTP id
 p15-20020a170902b08fb02900dc8ac6a147mr1039675plr.84.1611259226258; 
 Thu, 21 Jan 2021 12:00:26 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id k64sm6222146pfd.75.2021.01.21.12.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:00:25 -0800 (PST)
Subject: Re: [PATCH 5/6] target/mips: Convert Loongson [D]MOD[U].G opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <20210112215504.2093955-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf37e639-75ac-cfb2-9572-a2e5b7217f75@linaro.org>
Date: Thu, 21 Jan 2021 10:00:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112215504.2093955-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 11:55 AM, Philippe Mathieu-Daudé wrote:
> Convert the following opcodes to decodetree:
> 
> - MOD.G - mod 32-bit signed integers
> - MODU.G - mod 32-bit unsigned integers
> - DMOD.G - mod 64-bit signed integers
> - DMODU.G - mod 64-bit unsigned integers
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/godson2.decode    |   5 ++
>  target/mips/loong-ext.decode  |   5 ++
>  target/mips/loong_translate.c | 116 ++++++++++++++++++++++++++++++++++
>  target/mips/translate.c       |  86 -------------------------
>  4 files changed, 126 insertions(+), 86 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


