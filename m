Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C40400F02
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:14:37 +0200 (CEST)
Received: from localhost ([::1]:44470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMpAa-0004kf-Br
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp80-0002RA-T2
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:11:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp7z-0002iV-EM
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:11:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id m2so2416310wmm.0
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BNNac2hbHxefjDHJ7jB2ZfcMlzqi4HKCjj71ddZTHrU=;
 b=WfWc9LEPwNa5QkIYa2bMG0XxRUPZPdzXg3rgLZpTTinvHQ3pj9iq2+MqdeoFTeFZOe
 0Ko7VChuT5jJ9pr6XLLo49PmndAu1+LwTB7OId3yez8RxC7yaefASRAZjUiWsYJpJyh6
 2zRuQSjgcZkRLVzAe56tEyc8VrhN4yCws+uFJQBKS6h1INEzO3Oc9ASQVrA0RfQCx51s
 a0WzX29NZY577oeYhcSg+ffP1kbJG3c0UOLgLbE3/N0r1HsptUzsrADL16AChbiYDaEC
 MRPwT3UaKTMweBtviSJncirs+Cr7j6AYPP7XajMoOZQYhT28DkPhtDIwMzr08DgJiAAl
 d+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BNNac2hbHxefjDHJ7jB2ZfcMlzqi4HKCjj71ddZTHrU=;
 b=j/DZ5M6UhLQGegCCs3sYTgVudkYQq4xvQqJtrXc+A78BrpwRvC5CDtPmM+V90rwlgl
 mBH7QZQQr9wWhXB1BlOUYMBGpZxuJv3ic6dGBLr9ooXBqjGzY9gFhS0+0DX1uimXWIZ4
 RK9+Fln0/TFI7D2bMfILu4KL3PXmPpznStcecIf07UGDJbEzsiW/yc0XYWm8GHOfRpGn
 85vqLzFTM2nQHtxfLYtWDu6BX8NbN9ufS3otqAa+VLo1QzG7uyytgLZorbYrJ6KH2xh2
 7QlOtgb+gzU58XOIFU2P4/uxKy52tkJF/KvdjQ/m2dBjwi6pu7KLURDPvZNSl7SbA3BH
 8TbQ==
X-Gm-Message-State: AOAM530WQjVfz9uBz9bgqGs7OUwObfPo8UHxdACcw57JI4MA1Jk/fPf+
 BaC3qW5OsBTKq1KXmcHRZ1AT/g==
X-Google-Smtp-Source: ABdhPJx7wVGvgv2Fsb/lmUg8gOwrVcXCZK51kFw/RJWs0/DzcuShidL8hRTCJM+3u1OWNcmStDwP6Q==
X-Received: by 2002:a1c:3bd5:: with SMTP id i204mr6662851wma.53.1630836712503; 
 Sun, 05 Sep 2021 03:11:52 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id f5sm4086803wmb.47.2021.09.05.03.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:11:52 -0700 (PDT)
Subject: Re: [PATCH v3 10/43] bsd-user: implement path searching
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b49f47e-a9c4-cb44-1da6-856e6b9b7a77@linaro.org>
Date: Sun, 5 Sep 2021 12:11:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902234729.76141-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: kevans@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 1:46 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Use the PATH to find the executable given a bare argument. We need to do
> this so we can implement mixing native and emulated binaries (e.g.,
> execing a x86 native binary from an emulated arm binary to optimize
> parts of the build). By finding the binary, we will know how to exec it.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsdload.c | 36 +++++++++++++++++++++++++++++++++++-
>   bsd-user/qemu.h    |  3 ++-
>   2 files changed, 37 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

