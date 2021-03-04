Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7415332DB3F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:37:40 +0100 (CET)
Received: from localhost ([::1]:54346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuj5-00028B-H0
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuWo-0000HB-SW; Thu, 04 Mar 2021 15:24:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuWn-0000PS-0T; Thu, 04 Mar 2021 15:24:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so5082141wma.0; 
 Thu, 04 Mar 2021 12:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wOtazANtxgWl5aF2GAZvfXu8BHP+qkhG0atLP3DB5RY=;
 b=On7v3OvG32L9rYnmrKmD+YERFELl+fpGYueb08W7uXzDtqbviQ0gIrX8sYtATE3cbV
 Mku8TPYGIN+U0N+7qhb0LMCscborcOoNeM+jTwdBwXWGY3ugNG22eH8Mj7WLi41vztOd
 LNGcq4qViLxT7yLSnHfCZNlYySlD52uQcrf7C7VIMiKAanIlkj1qvA8q9jN4AWsY7XSY
 svlD+QvUPnjboCikQwqswJuOK5E6Gv6xcbOgU2XwVhe1wkDc6GPvcDBWgmAGYkyzT7iX
 kU2PkXHaClWkqD34gpPA/sXA8a50fxYgEcfKOU2gUmLYUYvaQEK9WAecNAQNLNvd1PL2
 t+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wOtazANtxgWl5aF2GAZvfXu8BHP+qkhG0atLP3DB5RY=;
 b=Hwqo8h4N/FmbI46uWn91Pxg/Thpw3lEInaA28tNGeUAn3pQXBKjagXOjpsbN99oV2M
 pJ4Oss4bGrWiaShOdNU7A/jMLGXPFv4IsNKizOoizCGMuLD5G0k5XDmKpiyK73wzULSa
 aEF87eUs4YvRi8dyRAYc6eKSUm2oox8giDowih0ij+BCd/uC/f4a/aTjI4JH/S3zhZ/y
 V2YknoyUk/8Yle1Cy6bHwpWuBxhlbAJu6C1Vyy2QlPD/bUfhhamFpxX9e1nOdtre10ij
 WDvcxw60BALgOaw+QP4Xo6GD+1CCJR3vV0DOJFeoXkxhc4upjojI9M2HWCG1LauyI2gu
 2yNQ==
X-Gm-Message-State: AOAM533IjFRSKocKoD7TVuKHCO5UQaR0BelptqCBFubXR0J2+zO2PkCs
 sioP+i0VGTY0jNU+upTYUXahhTPcn2E=
X-Google-Smtp-Source: ABdhPJxiuTEDHM4VQ1nMetCvgm1E7q5SfB9giM0INE+RbW63UE6KBmyGRWFlV+mF6ZA4yC5g5yycfQ==
X-Received: by 2002:a1c:1fc6:: with SMTP id f189mr5658538wmf.68.1614889495252; 
 Thu, 04 Mar 2021 12:24:55 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p10sm624245wrw.33.2021.03.04.12.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:24:54 -0800 (PST)
Subject: Re: [PATCH 38/44] hw/misc/mps2-fpgaio: Support AN547 DBGCTRL register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-39-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <14d2bf05-0635-5d47-a95d-f86ed8311388@amsat.org>
Date: Thu, 4 Mar 2021 21:24:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-39-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 3:46 PM, Peter Maydell wrote:
> For the AN547 image, the FPGAIO block has an extra DBGCTRL register,
> which is used to control the SPNIDEN, SPIDEN, NPIDEN and DBGEN inputs
> to the CPU.  These signals control when the CPU permits use of the
> external debug interface.  Our CPU models don't implement the
> external debug interface, so we model the register as
> reads-as-written.
> 
> Implement the register, with a property defining whether it is
> present, and allow mps2-tz boards to specify that it is present.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/mps2-fpgaio.h |  2 ++
>  hw/arm/mps2-tz.c              |  5 +++++
>  hw/misc/mps2-fpgaio.c         | 22 ++++++++++++++++++++--
>  3 files changed, 27 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

