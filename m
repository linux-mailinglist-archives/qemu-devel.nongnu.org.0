Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323542C3AB5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 09:14:47 +0100 (CET)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khpws-0004ao-9r
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 03:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khpvk-0003s2-3C; Wed, 25 Nov 2020 03:13:36 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khpvi-0001s6-Lj; Wed, 25 Nov 2020 03:13:35 -0500
Received: by mail-wm1-x341.google.com with SMTP id 10so1171802wml.2;
 Wed, 25 Nov 2020 00:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yza3QuMv9Til8gM8mBpOwRdYCHxSnYnR29n1qkHbTqE=;
 b=uZsfh6+Hs28PO04QCPBz4ykhYdRz5+7T8RUeDFINpgIpW3aAtNp8Kpvg75l93xH8LL
 nTAm8y+4awFPqhiuhf4o5IZsmVex6A/RT5BUiOssoyE0SFxsUv4rTvkybqO3Gl+wgywp
 Xbtwpj3D7a2mo6tds5XNTsN3IJZhA/jc00JBI+xlUzfdN/UKV5LfuoJ+08fiyd8VXDzT
 IU9Ttg5S5XGh+czRIxM1PssnJw9juo/n3s84aysYZPpd1Dm6jZtbfn5BqHUwsDtufgMY
 jo9lc9HNVwFMSUNgDHlivf73KHirAixeRT6tXVB2Z0/3PK5ephK5snPNkb6Kh8IJkFI3
 blPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yza3QuMv9Til8gM8mBpOwRdYCHxSnYnR29n1qkHbTqE=;
 b=jdU+a18Q1gn2TRjWYqr5YPqINeR94+EQSLxSb6u2Sdi4NS1tq/Cjs5N/GFVGnap6ai
 QWaB7JJ35BkjtmRChcKyKpxRPbDN6J/5dp3tvhHakh8QhP2VGPHj6cY985dh0X9LOiQG
 in/yIEqiDKTP2wKSg8vD78wTGLIT/bUhlOmivFjViqOwNXewjRJpF4aj+IKXoHBkAG11
 8rScntnXRyC6N5J0WGdNIrasjNATRjsgrGLq4OqJMBGIAehux5goilwI/mxaQKZ1/GXr
 bVqfO7l62DDRwHfBKlq0M1fjceIfhnAM2FkCsVO8j4C1EE1unc5VwTylYkD6QRLdllx0
 trfQ==
X-Gm-Message-State: AOAM533Q93iT7jBM2tCAQqR4b12k1gkBWBETfSVuRBCm0JKrYvvkU7gs
 Hnb0RDWHLcK5UinDpEBHWhCiLYo3KzQ=
X-Google-Smtp-Source: ABdhPJx4+9e9PcJOOXLi6Ni8MZIyoLsNsdFM/xlqieZjxQr3S9PWv3J5mCcp1n+829HCDdpC6uh9Cw==
X-Received: by 2002:a05:600c:2908:: with SMTP id
 i8mr2534490wmd.182.1606292012264; 
 Wed, 25 Nov 2020 00:13:32 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id k16sm3440160wrl.65.2020.11.25.00.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 00:13:31 -0800 (PST)
Subject: Re: [PATCH 02/11] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <20201125040642.2339476-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2f73b182-b854-2a7f-5aea-8ad62765241a@amsat.org>
Date: Wed, 25 Nov 2020 09:13:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125040642.2339476-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/20 5:06 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

