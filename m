Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710542BC1ED
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:09:30 +0100 (CET)
Received: from localhost ([::1]:49168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZCL-00034m-Fn
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ9x-0000pE-VU
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:07:02 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ9u-00045A-O0
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:07:01 -0500
Received: by mail-pg1-x541.google.com with SMTP id t21so10493343pgl.3
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qJrCrLyDiHYRv62L8UREcTwtWgnbjupDl1ldKBHyHNA=;
 b=D9PZhcbOWmr0VxX/Wgu634HhqtwCretwFAXzCflJqTPT2PjZRccTOyL3LzM17Jq+1H
 Wq3nRgz7I1M88tuoHnnJiMlr003qOlUpdJ7n3qGLoaXSfIkOrf3MY63AiFocFFrrHFye
 0cOSW5izB4YTtZuwJpYCfBWKPjyPG/rBoiqcFKXeMQohba+rZwPCciRXnXy2QcvKjT7J
 U4OmeHspX4AD3FE1dEdlxBa+pev8CUDEtI6NWVZ21IA2l4J/aNoBzD9ZLafEpSwhe8qc
 R/iNQG/R6olWHFhxXEsMHPDmMDiHGfDIu/9V+M7UVPN4bxIAcXJdr82Df24Bjm6V9DFd
 Ywmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qJrCrLyDiHYRv62L8UREcTwtWgnbjupDl1ldKBHyHNA=;
 b=n+/EqTV/KF0tp6RppH+DY+/dUnpD/vMuIvZaa0UExKJ3C/bAsC4Z1RJKEdp6DTSGUy
 n6gPMOQPQQ2x3N36rnulLs/ARvxEI+JrF1kryhzJePvuyt2/gKxNR+jD0EAfl3wKQQtH
 eB0ermLtPr3xmWY7xg9mPaweWGfXFb1sYDOm3pzpBgZDLiBIyP9Y3mY0EXkmnYnS94NG
 CG31rrgi/d0gpNilRu61F32shPzcaCkpKizajlgRTEAK5GApJraIYZS/+HYvU741PNWC
 E1Gz7uMCFX7EPFoUZOqWAO9kTBy+e1OXE0OFpQ0QUO/8L7XwXCic2n/n2a6PnXJX0rcF
 O/7Q==
X-Gm-Message-State: AOAM53262JrHik0mp+FXFliCLvzuK2QKfFR+uVFN7+52+eCl4KwH1QXF
 xVxpk5aUdEQ8Rns+5Y9IGis9+w==
X-Google-Smtp-Source: ABdhPJyq1wqfG8WIbouo2PWpB21KmDu+7OO6A5aMcu6BLDG1PEGmOrWYappDgxqCNr2ezELXHy5cDA==
X-Received: by 2002:a17:90a:f0f:: with SMTP id
 15mr17004618pjy.127.1605989217481; 
 Sat, 21 Nov 2020 12:06:57 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 131sm8063917pfw.117.2020.11.21.12.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:06:56 -0800 (PST)
Subject: Re: [PATCH 15/26] target/mips: Extract NEC Vr54xx translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b6671ff-4f0f-920c-2cea-71fe5d7fc98c@linaro.org>
Date: Sat, 21 Nov 2020 12:06:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract the NEC Vr54xx translation routines to
> 'vendor-vr54xx_translate.c.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                   | 86 +--------------------
>  target/mips/vendor-vr54xx_translate.c.inc | 93 +++++++++++++++++++++++
>  2 files changed, 95 insertions(+), 84 deletions(-)
>  create mode 100644 target/mips/vendor-vr54xx_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


