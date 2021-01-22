Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274A3300264
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:05:11 +0100 (CET)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2vBe-0007CS-4L
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2vAE-0006XO-JS
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 07:03:42 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2vAD-0008Af-03
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 07:03:42 -0500
Received: by mail-ej1-x632.google.com with SMTP id by1so7338107ejc.0
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+Ij7T8O3IU04/0swRAjJER9rbY3TfzLGvMT8dFj48k=;
 b=d60zEqCz3DxxqydfJ8rAIbSi13w1bNJYLIPfBCJKAO7ma3gtRpmSWSC7HI1R7/vH/R
 RwQ7GnbZEzQTcAMAAAXxw+my8OxgKdyXQ4Ok0/9bSndumiQN3EwF4rQ7O2epHK3UJ6b5
 q32hH+xngeJMoftda6M0h05kXD4UWGfJJ7WZanaraX/0CwrU85qSQdhZyscEI+DoN7nB
 MRiCfWgpaFRiyBlhn9WshMQsfkO1E6IrF+7FEQ1HqSCLrEFsMsun6H6XoCblksosVcfQ
 8rCCf6wreNt+XPA2T1f0ao4IOAU8xrWSLvy6L9ie6u3VM5TAE5Eh+eUsSsJPf7K07kgS
 IgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+Ij7T8O3IU04/0swRAjJER9rbY3TfzLGvMT8dFj48k=;
 b=EodUKb6KNXATfr9G/DDclQ6reTxmhOFQ6kgnLvhzkExDZ0Hrsfjo1xg9Bo0ntRyK+C
 4vayqgARykRLvlVNBa3mECb6WMGyphFJc1YyEyqCI+ARC1f0UCZSvkjSubmM6Norpszb
 sQ7dOpCAj1vdGKXKxQcJaOJtvuYZgRlY+7SN5U+U+Y32Icl9arH1RE+FQIAouAipPVDC
 3xzqWyNVvmTMMF8pE8njqCGBt3OrsPOKFQCzztkbVLnHxM76/QIM5w9dznhRvAlys/JD
 /m4sJOsQnn6IHMsQN8nwrIhRnqX0SavHCVCsD3nptNu9Ai3NL46USSuV0dUXeiIMEgIY
 82/Q==
X-Gm-Message-State: AOAM53091Fz1DjjxlQ7HDudGE9BgDI6ePiRia15CwCvq+TwrjvZLCdX5
 kXay1KHzLO2csGNF0ygUDktAI2sTrm6aZyUaaQ185w==
X-Google-Smtp-Source: ABdhPJyXJsIAWRxLCrvBW3HRuvN2zGhfKTxXv0XhwogfSFtMbtd8KIC/gy4ZpQKywLeqjZe8zcsFdpUAWNu0GYpAQ1s=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr2763961ejf.85.1611317019529; 
 Fri, 22 Jan 2021 04:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-18-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 12:03:28 +0000
Message-ID: <CAFEAcA_7xAJOy+PPm35t7dNNHvJiwWbRZkVqxziEe9i23sKzrg@mail.gmail.com>
Subject: Re: [PATCH v3 17/21] linux-user/aarch64: Signal SEGV_MTESERR for sync
 tag check fault
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_signal.h | 2 ++
>  linux-user/aarch64/cpu_loop.c      | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
> index ddd73169f0..777fb667fe 100644
> --- a/linux-user/aarch64/target_signal.h
> +++ b/linux-user/aarch64/target_signal.h
> @@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
>
>  #include "../generic/signal.h"
>
> +#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
> +
>  #define TARGET_ARCH_HAS_SETUP_FRAME
>  #endif /* AARCH64_TARGET_SIGNAL_H */
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 7811440c68..6867f0db2b 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -133,6 +133,9 @@ void cpu_loop(CPUARMState *env)
>              case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
>                  info.si_code = TARGET_SEGV_ACCERR;
>                  break;
> +            case 0x11: /* Synchronous Tag Check Fault */
> +                info.si_code = TARGET_SEGV_MTESERR;
> +                break;
>              default:
>                  g_assert_not_reached();
>              }
> --
> 2.25.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

