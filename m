Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A98320A11
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 12:46:18 +0100 (CET)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDnBo-0008AU-Ue
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 06:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDnA4-0007if-HE
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 06:44:28 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDnA2-0007DY-Vx
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 06:44:28 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v15so16000411wrx.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 03:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b/QNMbQrTdJ1et5k0sIRuLj4YoSQcUAQ2obzJ8vexwg=;
 b=ngTpeGm27Tl0RI/1UISNdUyO7WjwmxQRLbnVq7kBTxca+MogNWm4PoZ+gYZk2Jb7F4
 0RvkBZKid869h1dciM1DVqAqNHTToGF258G+cz8zrayYUaXubbQ8ixiAzT5F4PeuFbdG
 aD5V2B9OzDt+7AqoKjcCTCC1o1RpRgh08hTdALGKC8DMRiUyjzdYNbLXvtEz+DOE96PR
 cEJpBQ9+2mqFz6uiHw+qxOYbvCTIVcx89nGifjCv1pqShXYTFlCm1UKq6FOw4HOa6DVO
 /OiXnnOPgvl4noFZSLEteNrarAfzKwf+5NKf4St8XB0i9j9cajGcs/of5Bw9nza+g+kz
 ZssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b/QNMbQrTdJ1et5k0sIRuLj4YoSQcUAQ2obzJ8vexwg=;
 b=YkzOFJnTSAuswH0iAh6msJ4BujQDEjMXMRGxjDqZdPg6FDZnO1gGpS5gahP+cCQr57
 bVo+0R5lwYF1dS9BOgQc/eIl49PbbmQROBfMCuySVpLSWi7mOsbjXk6/eh5p9LfBKgTW
 TicjthZMFO82edQytLd21CSvnkrbr5COWuXQZ+qE40VjnwzoeY8lVgBWAOI0XQwRL1xp
 yiTpO+qmj+u1IUPDJVZLFi30jmfqS98wBQBymOvZcmzkVo9xNUtmPIj30lSfIxsFcuqC
 7t57TsBRUe0tzDwGbt4FZaJ26QSLATKQi8Lb9Ps6jB1udGcVbOD9aen0rpeuf7BWyE/d
 sOxQ==
X-Gm-Message-State: AOAM531eTz9ksBGqlhTsnvCwhrFnj97StZp6gBzgK40IKxdHQ1tMNlXy
 +u5RGbWiKubDIZVauxMwPuk=
X-Google-Smtp-Source: ABdhPJye1f7qMfsPtfp+r1P5mLlG9SapbGJHeMqvCfyLHgczQ/hzsKN6xOtytJRc5C76NJDcCVTyjw==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr17073585wrr.365.1613907865513; 
 Sun, 21 Feb 2021 03:44:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c3sm2542634wrw.80.2021.02.21.03.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 03:44:24 -0800 (PST)
Subject: Re: [PATCH v3 1/4] hw/mips: Add a bootloader helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
 <20210127065424.114125-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <829abd98-cc23-555e-78e7-07f10a5d12cd@amsat.org>
Date: Sun, 21 Feb 2021 12:44:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210127065424.114125-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 7:54 AM, Jiaxun Yang wrote:
> Add a bootloader helper to generate simple bootloaders for kernel.
> It can help us reduce inline hex hack and also keep MIPS release 6
> compatibility easier.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  include/hw/mips/bootloader.h |  49 +++++++++++
>  hw/mips/bootloader.c         | 164 +++++++++++++++++++++++++++++++++++
>  hw/mips/meson.build          |   2 +-
>  3 files changed, 214 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/mips/bootloader.h
>  create mode 100644 hw/mips/bootloader.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

