Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562622F1A0E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:50:45 +0100 (CET)
Received: from localhost ([::1]:49532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzSu-0000Rq-FN
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyzQS-0007C5-TL
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:48:12 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyzQR-0007uO-9H
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:48:12 -0500
Received: by mail-ed1-x532.google.com with SMTP id g24so179253edw.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EJXN1faHkj23CAb1CVqtbGNo+3FCjxF/SSEAseBUJhQ=;
 b=BmaXiPACFXRwWO7X81r2DX4qdhGMSVMQUU6K5WZGPmeX9FAKC5fijhGvEu3z9QP2zv
 JZqa1qPujqNjPivwLYrGZ9faBAMr0i2ymBrAkedYF49huOluQNAobxIo0bD5CiDVo5j0
 FnOd7DUCzQrSAWrrDBAxRs/0mPx22EGIUBtC0Y1Xui3hzLBjBpqGjY6usQTNdgbe0lsP
 bb5OTAxVQZAwXFnNMtyXhueSPFmVfbEiCQgeGTouQF/NnMG0S/utRfxh6HvkMjJB3xl0
 OusQZIng4ya1XIatWYUfBlsxwyD2vS5dr17UFRffrxKj5sSfb+dPIQy4DnuSW6YQz21j
 G8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EJXN1faHkj23CAb1CVqtbGNo+3FCjxF/SSEAseBUJhQ=;
 b=ONPGdnEOXnnv4dJAgbfYlVq3aRbC/yLs6s6UhhgdxmXlj7a7BsjcSlUxqs1HeFeV7d
 Vz8nH5c2xBrSn8ReArVUn3ke8Dv6qaTalRyC01yGidx5W7gPq6KAX7tgHN9kgQ1+jWYT
 sKj4vypdKjqzxPbAlzUqXQRo2O6y3uGNJOAoBXszQhX5go7sU0x8rmyL+S3mzyP8mjEW
 uN5F1SYubjPhq7iQhxJ0nuEr+hdIpSkqmD3G1VJXmgtgaYh4bPqHryAn/225cEBp9+VX
 5AOr1e+tVd4lhkisgHkmAc33k6jMsP7d82RwsBuc4TkOrnfjtN+xfsWbpyZvwAIeUFV6
 ZTDw==
X-Gm-Message-State: AOAM531GKMJav1OfEVVTYSiBGZhKfp9RfB+lEoj6pO0uRfWruHVg5O6n
 Z62uqA80WxU84PP5w+4DMW4=
X-Google-Smtp-Source: ABdhPJzOenbyBp6+u2pXVdxswogd/BFdwbqZpXJ5dJifaEenwa4+VoudjyyQ2wZuYGz3N/OaDyEaMA==
X-Received: by 2002:a05:6402:1045:: with SMTP id e5mr41780edu.40.1610380089645; 
 Mon, 11 Jan 2021 07:48:09 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id l14sm116420edq.35.2021.01.11.07.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 07:48:08 -0800 (PST)
Subject: Re: [PATCH v1 17/20] riscv: Add semihosting support for user mode
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-18-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7929107a-d0ba-3ce6-6acd-433997a4ed9b@amsat.org>
Date: Mon, 11 Jan 2021 16:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108224256.2321-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kito Cheng <kito.cheng@sifive.com>, Keith Packard <keithp@keithp.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 11:42 PM, Alex Bennée wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> This could made testing more easier and ARM/AArch64 has supported on
> their linux user mode too, so I think it should be reasonable.
> 
> Verified GCC testsuite with newlib/semihosting.
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Reviewed-by: Keith Packard <keithp@keithp.com>
> Message-Id: <20210107170717.2098982-7-keithp@keithp.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/riscv/cpu_loop.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

