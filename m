Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0F3AA1E3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:56:22 +0200 (CEST)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYpx-00042p-DA
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYnR-0001Dz-UI
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:53:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYnQ-0005fn-Ed
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:53:45 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so4551242wms.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mi634bVNjIPTAQmTu/ygr8ag30YZcrzVpPbG3YPbEL0=;
 b=t8cvyqTT+JwC3pxyHkhLyeCnXbRamX7j6XXDr8xEzmNgP5WDoHUQBtlmsS6qNDOBNJ
 9QMXFfoywLFYCEGe8pCbSMmwczeNlKiWhIdkYFGhgoracYkdNQ6lfQsSl3md+S1cQP8z
 4CHhPXojHZLH4QOWaTUG5upfZTvV9v7o5OMUSZbOqYaYApc+ibSpShR+hMmOt5IXoelr
 GzLb84qg966z4CPgAAB7QO46qVLSlpNpBz5wk9gaTnlYAD8B5pslfPP0E4wEYwp48T4y
 Q+vLdkec+/AvkoUNln0rKk+2n+AkLaw1TTw8YU3O2qF8rtXOg709RhB0DJ5A7mCHSD6+
 Vdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mi634bVNjIPTAQmTu/ygr8ag30YZcrzVpPbG3YPbEL0=;
 b=ajO9/GpL8/2vpwUwgIzt/Ip4+76b3oKpODxFiF72L8ecOxH/1Ac723uzUagzUai/gI
 Mr/fbDLsso7ZuRM2PFbdERGQXLDOYFfn7Gp5SitdJQlsyWzTWzVnPL6SyQKt94VAArQI
 ghITn3jsJWZTzrJMv7kra2TxsmzHx7ZP3yLIqpSIt/rxqbD5QOHvZHMV3oOD4C62rStY
 0IIS+uTIfPAuIe/Hi1l2nowbZJZt+tNcBWLtnUV2FR45Ewh2oJO/cwsOjV0aYzorGNrr
 xQRFf6O+zuftetJ6HVxa8amnNGjeuO9H9hcPHUE/mT2xdLF6h4quna2iZ00nN0ulcHMy
 kBVw==
X-Gm-Message-State: AOAM532HkJ5F4oDGmcICATp+u1dNqgaWutHJymK0TRLUmQD8YuLSdEay
 J+ZAmclqcv/g26IJSQ/PGKU=
X-Google-Smtp-Source: ABdhPJwirmM9csJjE1z1uJD7wlQbIvCjN4UWI5ua0fl8dhdkf19vVTKLVbXjSiAkT6eeAQZbD/xaUw==
X-Received: by 2002:a05:600c:ada:: with SMTP id
 c26mr12539536wmr.189.1623862423072; 
 Wed, 16 Jun 2021 09:53:43 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n42sm5448284wms.29.2021.06.16.09.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:53:42 -0700 (PDT)
Subject: Re: [PATCH 18/21] linux-user/sh4: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a97be843-c361-2233-ce01-c43362a181b5@amsat.org>
Date: Wed, 16 Jun 2021 18:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:12 AM, Richard Henderson wrote:
> Create and record the two signal trampolines.
> Use them when the guest does not use SA_RESTORER.
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sh4/target_signal.h |  2 ++
>  linux-user/sh4/signal.c        | 40 +++++++++++++++++++---------------
>  2 files changed, 24 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

