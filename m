Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0CE313D20
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:21:15 +0100 (CET)
Received: from localhost ([::1]:34086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B9t-0006up-JW
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96wC-0004eE-O2
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:50:53 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96vw-0008BQ-UH
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:50:41 -0500
Received: by mail-ed1-x52a.google.com with SMTP id y18so18100490edw.13
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dVB5FKMzXu8wuueiiHvVTq8Z6UNz6HqUPfW/cauPrSw=;
 b=mqtLOQ2F9cYoe4HXSmULq6HogOyd/tfxXeMGZYUgIznNheWbbRHYXKggLyZw2/uD34
 a2mniZS+bEW+NHoTeJTuYVwATAK1gLAfhNDpMukJzdLVL/JWJIFioom8WN2EyczrbRvQ
 /t0L4H7HEuZvHMjmAWfq13pXZKZPFLlmyv1eHVhPyhFERQ9HAo/UIulW3KPLzg7CjiLH
 TmAWv57AGw6QaHvh9hVV+cTzs+fURIP96T4xB04BaJTh5jzQIU3xS8BnJiP8HsnCvcVB
 tXNboSjCC28EDVAykPEFaMnczqHwSJVlsYyNlK91jO5E9RTQVXerOFxRQKu/pS0SCkOM
 yDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVB5FKMzXu8wuueiiHvVTq8Z6UNz6HqUPfW/cauPrSw=;
 b=GwXhNTCMUmHI4C0MdMg13Te9XTeL2F53nPFKu4d6ldZDOjSH+oZy4ck9ShFMwBcFJ7
 rjUPaWE+RRITqd7IOSAvkC58hDLL6lt/jqKPrvjl7jnSRTU2UPYKptBtVIqvqktMMB48
 5JHjz1jaxH3EI/SmGZj6M13cmIjvrk37wNYmiBGJfzrNg0TU5Xid6t8xhWDjy1pzeHdC
 6jQthT8dJn8rYNb37t4dn8y3/DJA11k3TXdgyRXBF/ymzPtDXqAylZValyNbFPz3QQzb
 zYe7ABeoVuXTyxSUss2sRwPtw1vQB7GqqiX7lV5Gh6m18HprQW0bwwSuMpYbzWz3KJDN
 fRbg==
X-Gm-Message-State: AOAM533BKjhsE0IuOOb4wJ1hYQteIcPVqHltsLdIulJxaehk4lALFNgr
 uCKH2NYm0Al9LmZOr0EfRmH2XUEaJ2KIjAibjz2EDg==
X-Google-Smtp-Source: ABdhPJw51JTznhN9GSqFiy18+otdKZJCJQcbiJtqzdH02pai2hWeXuoDHIRGIsszhNk/qYRzj1A9864it+w1T6tF0+0=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr16885108edd.100.1612792230577; 
 Mon, 08 Feb 2021 05:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-17-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:50:19 +0000
Message-ID: <CAFEAcA9nvX04L_RBhrnf9f6KrrzumyYzvTRw2z440poM7zJVFg@mail.gmail.com>
Subject: Re: [PATCH v5 16/31] linux-user: Use cpu_untagged_addr in access_ok; 
 split out *_untagged
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Provide both tagged and untagged versions of access_ok.
> In a few places use thread_cpu, as the user is several
> callees removed from do_syscall1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

