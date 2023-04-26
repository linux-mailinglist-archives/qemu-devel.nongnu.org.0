Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748CB6EF310
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:06:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcxM-0004x7-09; Wed, 26 Apr 2023 07:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prcxJ-0004u9-9V
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:05:01 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prcxH-00085c-Cs
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:05:00 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so36048105e9.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 04:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682507097; x=1685099097;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o5FgA/nqKiM3bIk4Z6oCwmP/fYv1VeuGEadN/P5+nkk=;
 b=Fgs2QXn+88qOSxmyzuhM+EW1zXSHPropl/B/dBpcIu8KfWZ7B6p8ekvsa7+jqb0KXd
 wh/IUjW48uZ+31nuYzfIn4/qUFfM9uGysvIchtdOgkLIX8f6kgVJbv8KSglzfsHgLx6A
 6div38l1vQtGg5i21VsE9rgl2PLE+o9lRCeWETAaH0IBrEkR2SY43eqIuk9mczBT0Vgs
 ppNFeCpognup5f5UOyvUx2sT4s4Y/tLFJWFCvwqKlz0QPaedm2sN8JlbsZQviO9xi+uV
 f3REVa104S8QZbFuk9rqD24Rrhim1sEDf1qDA1JSjU5N7eqbVKJgSGSKjXPC/ap3r/j9
 y/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682507097; x=1685099097;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o5FgA/nqKiM3bIk4Z6oCwmP/fYv1VeuGEadN/P5+nkk=;
 b=j0lKunQoO0palaH4xBgECk89Y1BxZ/bAe/leVTxk9Qwt7Dd74gc5VHFhjzFg/1mDnI
 wSxEDPMld5EPnlW7Pc3PgqMPf0q8PTybbSSUkfHORQHZIdHXmC7tVX0kJheP+rlJTt+o
 /+dBzEEe5fnKOO4RIJ1YeGa6ICmW+oQlKwpUSNXOLEJJ43CdN/SaR4jJjejm/TzWABvS
 FyzXZ0kKQrTXkDDYCQY6cnxxHr6sM5hICOAYPrO3VjoaUJKCwHPXX0KUq77rs4Dp8DFF
 TCFrRDLHNFUiA/MuF3GhNlWCnwzaRKXv10JQYajEUvPtwhVBjU//hWtC4JTUJY3PvWGh
 gvZQ==
X-Gm-Message-State: AAQBX9fs0aDLs4Aw7MFuYB1mXPr8g0Gy511ODlnPyCxZ1bers0u5lT/p
 d6HnAEScVX5CmszCuGV6dakG1TU3gOXiW3yYn9EG7w==
X-Google-Smtp-Source: AKy350Ym0V9/uN04UiKQ4FUIJ1lezYSDcvFERNhEhOvlnEBGXbd2sRe/XLasyjgf2SPLkJa0C1MG0w==
X-Received: by 2002:a05:600c:259:b0:3f1:662a:93d0 with SMTP id
 25-20020a05600c025900b003f1662a93d0mr13610389wmj.15.1682507097462; 
 Wed, 26 Apr 2023 04:04:57 -0700 (PDT)
Received: from [172.23.2.237] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b003ef4cd057f5sm21498679wmp.4.2023.04.26.04.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 04:04:57 -0700 (PDT)
Message-ID: <acbcec45-0689-21c7-2a3c-36ad0be45ea8@linaro.org>
Date: Wed, 26 Apr 2023 12:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] linux-user: report ENOTTY for unknown ioctls
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20230426070659.80649-1-thomas@t-8ch.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426070659.80649-1-thomas@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/4/23 09:06, Thomas Weißschuh wrote:
> The correct error number for unknown ioctls is ENOTTY.
> 
> ENOSYS would mean that the ioctl() syscall itself is not implemented,
> which is very improbable and unexpected for userspace.
> 
> ENOTTY means "Inappropriate ioctl for device". This is what the kernel
> returns on unknown ioctls, what qemu is trying to express and what
> userspace is prepared to handle.
> 
> Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
> ---
>   linux-user/syscall.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


