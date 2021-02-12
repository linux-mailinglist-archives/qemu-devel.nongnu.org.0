Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946D031A54A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:24:23 +0100 (CET)
Received: from localhost ([::1]:55188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe3C-0002Fe-M2
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdmb-0000Xe-4d
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:07:13 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdmY-0006gb-Mf
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:07:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id x4so588980wmi.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 11:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1PgOw5mOIuxCJ671zc1yYDY7D7E0YaEirF6UsutLOEo=;
 b=RCVXKRilhLbnz/WoKwPmYCwcXPaUEjWyElGmyFkkp406prwigBuAHYoAjNs5Zvms1y
 RwvsXI3akb2ZDBjBOAql8e9DRATmHnAlc0Ta+GoIs1FS1fAV8J1PYz2a4FBHslSzO9Y+
 CxcwOUEOMxKm3btNU4u+xrzT53Rp4NlLovRHjLSgT9EXis0qOSmKHYqM+BiEmEqUIfss
 LPSeKTVqEUl1syAMG78b/vhK4x4EowBp0aWZwd9aIy/tg1irk2zsV+fHuQr5nXd02oK5
 PJKtm8RtVfi8ODLnwlvcVAg160v1YOL6dEqPvyeLKpSVgF+hyHUGbiOCxj5aVpL/kZIu
 AyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1PgOw5mOIuxCJ671zc1yYDY7D7E0YaEirF6UsutLOEo=;
 b=jvo/GRFPE+SHWy5HWWk+knYXLspBaXPdoiMQbIeHTVIZPQJssV+l8thP5Qpjn57VUS
 I7PCIHdRZ/tn65BpqmLWHQDbNfBTEPSsZlOPGoxmFLEOcv1G6BZdEQqwUsdXdNz3td92
 5OYk0wUheu7oJSxhjAO4yrozl3AOO7sJzy3tzuceBoEiSmWJQZ8zzV+4Am1DCcCbfSQc
 fS9M/olo8LDkHPVj1ic4se5HrNkCE70i9AiBbgXoO4IYdok2N36IMzCUx3LGYtKumt2q
 p0UQvqgbNDJT6AOen9AESJm840YcSgZ6Imav1KT0PzOwN2S5UEobaZwOowEgTU0UdSnw
 ngbA==
X-Gm-Message-State: AOAM531A/DQMT+XC/yUJHzb88ZogwGGsdykAYac3VhqdNXRo/ugM4XCe
 6EFicSoAQy2N9G15+ydUpj4=
X-Google-Smtp-Source: ABdhPJwS4UBTwJcWZfZIcnMH04+Ikkd1QmMsxkA0fFZFqpYKCdo+DB7Y4iLas3zEpPCqjH4Br6LyuQ==
X-Received: by 2002:a1c:b60a:: with SMTP id g10mr3828890wmf.6.1613156829031;
 Fri, 12 Feb 2021 11:07:09 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v6sm11769356wrx.32.2021.02.12.11.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 11:07:08 -0800 (PST)
Subject: Re: [PATCH v7 25/31] target/arm: Split out syndrome.h from internals.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
 <20210212184902.1251044-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cb97c109-b8e1-f998-738e-767aaf4f01f3@amsat.org>
Date: Fri, 12 Feb 2021 20:07:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212184902.1251044-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 7:48 PM, Richard Henderson wrote:
> Move everything related to syndromes to a new file,
> which can be shared with linux-user.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 245 +-----------------------------------
>  target/arm/syndrome.h  | 273 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 274 insertions(+), 244 deletions(-)
>  create mode 100644 target/arm/syndrome.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


