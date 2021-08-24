Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65B3F66D9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 19:27:25 +0200 (CEST)
Received: from localhost ([::1]:38380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIaCq-00017i-O2
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 13:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIaBi-00070O-Ct
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:26:15 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIaBg-0003O8-UJ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:26:14 -0400
Received: by mail-ej1-x633.google.com with SMTP id e21so29953975ejz.12
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 10:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QtUtxZ6EcCrdVwqePPxC35xSEMsKvH2/wyroQeD+NKg=;
 b=Rbon8RBJVNxkDDX/VlRIowFKurzbykxKghn5F5icsP4+sq4hgWTZzv3BNXkR0Bp5oZ
 eXsOl+xPyfueKekiD8FM78hIuuiQMgSR3d4HikAnS5L7gsGMR8BH6YL8xJdX+ieyAaxu
 Cl2jCV0R8Z2BRNKrl9/xSw1hQuju77gEbMqTH65G81czLdkjc24UyPQMzamqx8talmzQ
 BY4fpj7WjMDCYeiLpahIdSW42pavBYPR3sQ3a78wuS/9/HFmlQvoqY0hEcBuwULMMkMe
 22sHRyu7iwQClqXrEwe6k8IHyHYQZLtRgeS2vMK1TabMwwiRm5ZZWtOPxJN9LEqOzmy7
 BEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QtUtxZ6EcCrdVwqePPxC35xSEMsKvH2/wyroQeD+NKg=;
 b=RtN3OTA+bRL09abtSUC4Xv+PX12harKbhx5HGyueiY3TCi95mDU04wtEX5dO3O+50d
 itM9s4o+9KDw5+F1YYMWyNgG8687t6kLD7irV9x6C2diTm0s5bSzeynwXMs9vLGClOOj
 SQ6HievkAHRV+FGZLtmH2HdN44P7U7A4SY7hcHZdhrko5Qp7Q4SoFUc77X/0mxY9JiSU
 BB/a5q3Est8jsiXx/vafEx8MtQjlICWiQ8W7msCG2AL2XQ4YdLtw1YQAzPtxc8fRENoy
 +HzKlhFg88OlOyyI48Qe7rBwyWBcYJNqfuWyMvRhR5pc63i4CoTXkQpCxocyeyJqEj59
 WD8g==
X-Gm-Message-State: AOAM5316QJg+va1v0AmRPy8xdafl9LyhdisiGvjOVyh9D4pCK0AujV92
 XNh03Z+S15lHg8TftYAZx6DOEHkCwjQPOcKK57ysQNJ3S1Y=
X-Google-Smtp-Source: ABdhPJzpDFTjrYO6IItoYrp9C4m+DZOJS7N6Rj3WeuaKxbh5LbGD9UyG764Hdjshqvm/m6cXUhkvivsrc8/Blmny0Hc=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr41902423ejf.482.1629825971416; 
 Tue, 24 Aug 2021 10:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-30-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 18:25:24 +0100
Message-ID: <CAFEAcA_XX-=vgJT1wOBTisLtV27k_QNF_8WzujEau+co6QBVSg@mail.gmail.com>
Subject: Re: [PATCH v2 29/30] linux-user/sparc: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

