Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5093AA211
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:04:03 +0200 (CEST)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYxO-0007fz-HM
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYuL-00044z-7J; Wed, 16 Jun 2021 13:00:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYuJ-0002E4-MC; Wed, 16 Jun 2021 13:00:53 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so4564915wms.5; 
 Wed, 16 Jun 2021 10:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PGlqkgunv5kX7fJckX/oaCuTrH9ziQO8Lap4YrFMhA8=;
 b=QpjGpf6pwUCv2RCUAcVQlcGx2+MKWVVISC6PnNj+jERJj9IdHwS5aRPTOKbnkE1fmb
 356JElPvI1m3b+qTlf4Oyea/tINGt6pY/mCEczX9s5G+9wYdSScj/8eeG0MfSS0M7fCH
 oSR/0mXBEh3OkJ7ybFNR+veyfAt7KFwTaGi3y2rGixX0e8oovEpt39G6WupAZHJ2qJcM
 1IeEHGpNY6GMILa6C2w0njJ3SRyhuFKdWBgxFdyD2CYLcEXBojhqMPIkoMfRraIovKqh
 EM/P45ppR6Bi60zpmty0m6xcIcB6ojX+jdZ69CdaIfbzj8dO14vy7M/ljwdHl3R47ktP
 RVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PGlqkgunv5kX7fJckX/oaCuTrH9ziQO8Lap4YrFMhA8=;
 b=nETJBkD3p0UZSwqo6vL9sc9D7qpEAR5J1HUU6TNu3MvG1+KUPmIqoiUGx9NOn8etpD
 /DZOa4D4PNlUdAjsK22IvU55CShvQgsat2UBJ8BShr9eJMr0sA5djyekuinA6GciYKed
 Dllhm/DpgumP8XQpkwfM285amJS55OPksIur8G27uI5j049m/NWo0QJuwcvg9jFCe4Ya
 rNzHODvLoAD5XMJpH/z5xD/8enT5WGfzmKm2fkw1dzkz+bxmQtMhCvMfi9nvwSDFpzMz
 FpDC3PWVV9uDAvk35ABBe+0rAcGNcn3q0oJczBxTDnRZVMQj8UkOyGgBzWBWkgTJePws
 dLwg==
X-Gm-Message-State: AOAM533ray2yTSlIa68JUeO5F1aizcEjBXUmUyJnOrLYz6yzbmI8aJpg
 3Ia8HikUxd0nPnTjXbdqB4I=
X-Google-Smtp-Source: ABdhPJzcjLEiBGPCwJvgzUy1Uq49rlcSFxh2VMS2MHFjBAt4nog1g8b/xvs7Wpgp6Xeaal813ZIJeA==
X-Received: by 2002:a05:600c:3555:: with SMTP id i21mr2119wmq.51.1623862848465; 
 Wed, 16 Jun 2021 10:00:48 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o7sm2756446wro.76.2021.06.16.10.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 10:00:47 -0700 (PDT)
Subject: Re: [PATCH 02/21] linux-user/aarch64: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d9646f5e-4aa6-c875-6632-fd699aaa5d30@amsat.org>
Date: Wed, 16 Jun 2021 19:00:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:11 AM, Richard Henderson wrote:
> Create and record the rt signal trampoline.
> Use it when the guest does not use SA_RESTORER.
> 
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_signal.h |  2 ++
>  linux-user/aarch64/signal.c        | 28 ++++++++++++++++++----------
>  2 files changed, 20 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

