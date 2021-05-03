Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD89F37193C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:27:05 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbPU-000422-RA
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbNr-0002N3-C0
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:25:23 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbNm-0007bE-UP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:25:23 -0400
Received: by mail-pl1-x62a.google.com with SMTP id p17so3090021plf.12
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uZoYStiq/K4JMsULEC8U/mmkOr7/tYQhtPWOftAgDdA=;
 b=lBpTbegyF7hE+H9jcVadwPXSD1OT8c0YfbZUgrrOiOv0+TGUpd6U8z1s4WzCpEy3bY
 hZ7scH/3cVkEyS+P02U+DDQdPA6LvdV6GNevAqbYBLh0a+bcPZG9sW9fyJVjHTuouk4D
 UvFgkZ9J1WL5o1fRqfwvzcne9gqv7n6hh8DRMN7vInkx4RwouwGTOh03rPtz+xltAB6a
 UhTI9lh/vI8ZTfTUkiZA1r/icdiesLXCWXs3IdIS7Pa4NaBJCZDy2O07Dvg0CaB0HtIG
 bII/7pzMglksgZX95Df58wAjt61IUOAsC5Afy+jkwFVm65REDUk0mRunrxVFowyYhhIS
 DRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uZoYStiq/K4JMsULEC8U/mmkOr7/tYQhtPWOftAgDdA=;
 b=sFgpPpoJIaSdm+og5LLfTZMrERkAGOk/WhfpJ6cYLD0QXYdzSOjHvJEbb40bYs+hxp
 ggU/112YGMoT3Fsc+hTR25WbLhvxr+Ovg7AtEcGMTj6f6c4d254jbLzWxToRUI351Ik4
 ybiVEqAy5czhfjXueCnc5dNm3/aD6wUTZf11dgvwXFWN6iru93zu/c/6gaOHuoff1HEQ
 Ayz92CcHjPU000OyA3h4iqjEqW0m6wDUmSZ3QTfPtyVrMhQwUxUdMqy6tYGsN9f5TXRU
 tuGVB7Y5uisaHztqpmcsBNlLwLYgYtOAFxQGvTaYd9krsnsVijqMRw81Ovroxw13s03O
 RYYA==
X-Gm-Message-State: AOAM532kWqeIrYWtXFo5sL+cfUp+Hr4li9ivdEmpkIVLXvFiKJfo5rTm
 wV3FSH1ChhcxIRN6ZjczpZNPxw==
X-Google-Smtp-Source: ABdhPJx1HUjrVGbtrwvTk+l6hJWu3L14EKhKCturA8PdkIz+5ZQpN0gV6IuR/X2tXUM5WwFejhB5wA==
X-Received: by 2002:a17:90a:fd88:: with SMTP id
 cx8mr2101943pjb.190.1620059116306; 
 Mon, 03 May 2021 09:25:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id x10sm9731744pjq.53.2021.05.03.09.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:25:15 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] hw/sparc/sun4m: Factor out
 sun4m_machine_class_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502185441.599980-1-f4bug@amsat.org>
 <20210502185441.599980-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee6ad616-ef25-115d-161e-71aee332e8d5@linaro.org>
Date: Mon, 3 May 2021 09:25:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210502185441.599980-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> Factor out the class_init code common to all machines
> to sun4m_machine_class_init().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc/sun4m.c | 103 ++++-------------------------------------------
>   1 file changed, 8 insertions(+), 95 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

