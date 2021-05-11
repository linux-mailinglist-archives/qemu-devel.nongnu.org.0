Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B937AB8B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:12:33 +0200 (CEST)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUzo-00052Y-BA
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUnB-0004v0-QR
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:59:29 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUn3-0003mL-BD
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:59:29 -0400
Received: by mail-ej1-x632.google.com with SMTP id l4so30520988ejc.10
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+LrCg9st8R+uE5ASEw1kRHGm84WcB+AQ8vmkuUyzjHc=;
 b=b+sL4OfzYaWX/h0b315/NJYOBAqXHBm6y96IV+w9KD8Hr45o8SSQ1VOntkrnfC2U3Q
 +NsadI3MkVHmlwZn/Rm/FjqByY1m/lJU7I8PxNBmFMWLwOgciTIKkA+9kWV89C7XZOrj
 fRJMvyNzHNAgbaQlo44qORT6cDhrZgOuFiE67mRThHrDn4Ozb1a1Wdwo+ulmdyEMfqpc
 fIfI1vQ76K5pKdfHSfrfkDEozCLkAPArNcgWrKyJQoZAmzmLeOv9iVG4AFJblVOak76H
 Bf97Ul8B7yaWMAmETX6UFFWAh7ZR0kAqiRipK2sYans5bnQBbdFOq0/+JRFiNevfHTUu
 vNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LrCg9st8R+uE5ASEw1kRHGm84WcB+AQ8vmkuUyzjHc=;
 b=ri8fh/wbG/p0DHtImrS7bnQHjuTpCkyjK1MFL9XTYnKqcKFPLWyRNllbBUlieETs3o
 /LVPaMrA93A71nG0oGqLauux6vwcl+n3WVaGM0hMHG0l+rOild9ZC2hHJI5z3WTGcQP9
 UW7QQxsukpyjpMNmHQ9YDhLNJygbfNf0/X79lT/SbiYMgtEe4ixvD00r6O4MeIlOI8j+
 ZT8TZ31tZcPvO7WTDFp/YuY7+6qOR7U5NsgO6QJqMEmtAYxLbJovV4gVeA4qmaCfDoh1
 Evzqfm8NRP4ySPz9KkP4C9tBY5M+rQdjC2zSi3pK9vugPTDr/UVaavOUfgRMQpqaybAD
 7BQA==
X-Gm-Message-State: AOAM531PDYK9Sro3z6UkkfXEVVdt2rrOAkaq5+fgKPCFQ2vqci3Ww0yX
 W42SQsse9Q0QIRNkaHBpDIORglrB53WbigByL55eqA==
X-Google-Smtp-Source: ABdhPJxFYu6YqqAU+Yn4Lqoio9L4S2AYtOifbtUBvR0aLcVjVxqBuAxkB74qaERba11y8DLFTYTyrY58AzmbTuT0+FA=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr32169032ejb.382.1620748760024; 
 Tue, 11 May 2021 08:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-23-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:58:07 +0100
Message-ID: <CAFEAcA8apNueH4-554MCkj1SmkBJnrcuToJcPGHXXjcSte6eTQ@mail.gmail.com>
Subject: Re: [PATCH v6 22/82] target/arm: Implement SVE2 bitwise shift and
 insert
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 30 Apr 2021 at 21:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  5 +++++
>  target/arm/translate-sve.c | 10 ++++++++++
>  2 files changed, 15 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

