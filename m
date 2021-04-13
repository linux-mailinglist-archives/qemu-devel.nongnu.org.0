Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDEC35E4BE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:12:33 +0200 (CEST)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMaW-0007P6-QL
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMRy-00015X-5k; Tue, 13 Apr 2021 13:03:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMRw-0007ND-NG; Tue, 13 Apr 2021 13:03:41 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so11116602wmy.5; 
 Tue, 13 Apr 2021 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5srUk3qIIvcebuytWZ9xypNA7snM56pd7PVsHy2DEsE=;
 b=OAUtGvH254YjGIxouCqpu0mRWyHtl4gobdRHICz7CJzzR4IzgFxdGGvq/c+cDZg/Xc
 mC2CIdg83yw6qnmFSTa9EMhr624/Up5rfCQJ/i7pS9ibni4rlZi/Rz4fjZ1FsUJF0GWX
 ilOzja/Ejn7Miz73Z4AFR+cVJsnwAZRjB30XOpRkd1qpHoPfVIHMiVVCvv31F1MP8mll
 QFjN3NC/K5y7+lYoOqo0y5sHjRqS8D7clTqAo+A5yCP2ddR8vSQ+0mzLJmh2/EMd/KW5
 gLBBj3qVrbycFYyULJJ0Zi8xJnE4AN5Kh0hkkyyQqcj5pMIIjntNh9HBmPzR8M+4aVxb
 PHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5srUk3qIIvcebuytWZ9xypNA7snM56pd7PVsHy2DEsE=;
 b=YCEifxVEuzXSnZN41WYxjUZcfapHAOZIIMgONPFieBjERZdnbuQNuJmKBlVRMvi1ox
 KKlq3xoANZrJ0GAhLKpkw8akc8MMItbg37twjB+5hhhBVtblPEuA6JdpvN8K9K56o12I
 0BI0ZbgCRiuAvopbIREqgxvshFLVs1Re8dOSY59W6v1aB4Q4/p32uJk5DcCEkyw3lK41
 iBfGYBeeqAOKVz9aWPS0h84gA0SrCgQgRWdzW4wTA5DEW2C7Fsqq7UAnXfdvvXkXCKyz
 HMFF10gq5PrB3ao8pjoyXFS9M8CmOAa+/AeNphIMVOR4fYtLxSIEWdBkq4XExUqcM+6Q
 5bxQ==
X-Gm-Message-State: AOAM532AL2D8d6EtUDJsm/fFGlwh6e91B3vuS9fGUstNEUfZUf+Dz2Df
 TE3iK2r3A59bgfu4pVJ0A2jUu1fB28E=
X-Google-Smtp-Source: ABdhPJx9Zo22cxc49S6B0CQm4o58iY4H+hQQUYi1E+PCxByF6VFHL9ELQGom3+PF4muxedW2Cxbuuw==
X-Received: by 2002:a7b:c454:: with SMTP id l20mr948114wmi.65.1618333378551;
 Tue, 13 Apr 2021 10:02:58 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y15sm3990183wrh.8.2021.04.13.10.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:02:58 -0700 (PDT)
Subject: Re: [PATCH 09/13] target/arm: Move vfp_reg_ptr() to
 translate-neon.c.inc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d2bea7a6-019b-1115-094f-d5c63c562191@amsat.org>
Date: Tue, 13 Apr 2021 19:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 4/13/21 6:07 PM, Peter Maydell wrote:
> The function vfp_reg_ptr() is used only in translate-neon.c.inc;
> move it there.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c          | 7 -------
>  target/arm/translate-neon.c.inc | 7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

