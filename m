Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A9615C07
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 06:56:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq6jo-0001FD-DG; Wed, 02 Nov 2022 01:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6jc-0001EB-3u
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:56:21 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6ja-0001dc-Ic
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:56:19 -0400
Received: by mail-pf1-x433.google.com with SMTP id b29so15456311pfp.13
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 22:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2t8MtoFytnLT+UJpKLe4pwScZuXckAQ83v11JTYElA=;
 b=JNqIrYm+K4yMRsR7oOWvXL473DiKRGTzlHS4hsKRNDPWw1iEuI7uEEjCgMqlp8ruAX
 NKifSNknfyfVBgJYadFiVil1ojT9RqXPsjYa4N9jLjznxE5C3goC8GUD1TQ1FeNA+knj
 5tOITV83p6sTQRVF3rF3r/iMSCSYIWYjUmHmorJsH7Ffh2Cl+l4NGaG/4mkAR6Gsdb0R
 d4IczrnNF9173FlaFMg+g8YiRX2kiWF/rVvnlDRL7pgV0zGxZ3jIIqYXThz/s4+cpb4G
 bGjrLUL1QyB/vUBlXvcI9WV6AVfBZ1Q1MeZzQvYSAaV9M086rz5232B7DWOd8znvCR59
 7hkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O2t8MtoFytnLT+UJpKLe4pwScZuXckAQ83v11JTYElA=;
 b=5pBJOu/YNnUjafX0bZdqLm/oZ74UUGcetVQVezUC+t4+m+4UlcJnRqSOJ2CWQrVtq0
 psrY7SMbN+dQX1wP8gam/gTkliOfp3mNugS4wVwnsxNP6nSDpAKSp7vv6Ih9WC2IojU2
 K9Zq5+01iWQZEMK/gaBw44yVb+3IZbRdIO4nKp1Mro7YBI8rOyDDohg2t5N1i4TTg89l
 uuygFYzLCZy/DjWGsEafmCB70I/0mPb5aiFr9PRfPEi7YpVt1EWDzd4gC/GTJIIGUKwT
 FTSGCEgAYKAnL4Qz688gtPMtvCLVwb2/9zPD8ieMeL/KwirTQ+zlKieXU8s+e8UT5FgV
 xlvg==
X-Gm-Message-State: ACrzQf10WBspKIsKsURFA18kLSoRngg8WTeaeo+I4nf830SzHM8QadQU
 sXr/RJFSvnh1OyawtSJ54e29Yg==
X-Google-Smtp-Source: AMsMyM6b2KqHdHin39JozVZlVACv5rP314z1FXVFnsR8PYr1MsEkA3Z44+J5Q5k4n0QodVPFM9lU8w==
X-Received: by 2002:a05:6a00:16c4:b0:535:890:d52 with SMTP id
 l4-20020a056a0016c400b0053508900d52mr23231315pfc.9.1667368576004; 
 Tue, 01 Nov 2022 22:56:16 -0700 (PDT)
Received: from [10.0.0.242] (mur1374950.lnk.telstra.net. [139.130.176.43])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a170903244c00b0017da2798025sm7354588pls.295.2022.11.01.22.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 22:56:15 -0700 (PDT)
Message-ID: <b09344be-8c3f-2d05-3eeb-15448b76bb77@linaro.org>
Date: Wed, 2 Nov 2022 16:56:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/5] disas/nanomips: Format string fixes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Petar Jovanovic <mips32r2@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20221101114458.25756-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221101114458.25756-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/1/22 22:44, Philippe Mathieu-Daudé wrote:
> Fix invalid string formats reported by Stefan:
> https://lore.kernel.org/qemu-devel/78553699-00c1-ad69-1d58-02f75a1f4fe3@weilnetz.de/
> 
> Philippe Mathieu-Daudé (5):
>    disas/nanomips: Fix invalid PRId64 format calling img_format()
>    disas/nanomips: Fix invalid PRIx64 format calling img_format()
>    disas/nanomips: Use G_GNUC_PRINTF to avoid invalid string formats
>    disas/nanomips: Remove headers already included by "qemu/osdep.h"
>    MAINTAINERS: Inherit from nanoMIPS
> 
>   MAINTAINERS      |  8 +-------
>   disas/nanomips.c | 44 +++++++++++++++++++++++---------------------
>   2 files changed, 24 insertions(+), 28 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

