Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860AD2CA784
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:56:52 +0100 (CET)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk81L-0002Rm-Js
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk80F-0001rj-BM
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:55:43 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk80D-0007AS-O8
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:55:43 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b2so3899126edy.13
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HneIVzRro4Qu9ShoRAcYnZlFxbEwFy4eWutfE9LxWJs=;
 b=NGlk0M5N2JLWkKhrSB3m+JFAYhluE0WDAwXlpYTknd9NazRGbPElwP/4q23/FvO2N6
 ZyBAnaeP9nkqWHsaaL69A4dLQdGM/SPhdTRtza1m9dx3EQVrM520zvgIbAOaY2facel5
 1vXYRmJBFELn1Y/60Wx9ZBGfAlRKg+HfTq0F62xsQ2LQPmhEIOzpFyZQ/FB9G4xmvBPm
 sYT2OdCOOPqiA2otiYYS9uTjvFTUAj2bdskiLHU1KbpfUa15WdvXIxTIIGTJ8h1ln6Hz
 7Uqvt18RbswN1iRdGul/pHdhIWrFnI2O+CJfA0QHw0ud8JLs2GZ7rC49iboUV43SwXab
 XJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HneIVzRro4Qu9ShoRAcYnZlFxbEwFy4eWutfE9LxWJs=;
 b=m18zmlmvB/kRuNpLKYl4LndjWngPGwh4EdxmywYhP/NgmsZS35b3tPAw/No/HrS6dw
 i05v0uQffT6F7KxAalxHdCUX1W3vYTGWdYHBx4WZwT7KJePGt/RX+nJJ0LuAc6KQ9QLa
 pwGj3HhR/KrCjelZUw8G4tp79gh0OqUW+frzTWA+r61GY8uAgE3t7FeQNur8GdPI3O0X
 cQMVXNbJvNyRvNfqtFEOOj8y6NOWvzoOgTbIQrP+aJALUISXHSdmNLbgrl0TqUYeWy9h
 ldbCbX3y0Mx4ZX4yRiSM7OYI43R7EeCnzVocGFjiz4aRIh9R6N/oSz5yg48LIuD/3atp
 +vJQ==
X-Gm-Message-State: AOAM533Tm/HyED9sS9HPW/K2aQ43dVZ/mkyRaO+tzDxNU7Xcn5mp6NGx
 /5zFv87lIsteW56536vTpg7FkQK+ZxvPfn+2QFIGYg==
X-Google-Smtp-Source: ABdhPJzxurIMdE2NoPLLnSS1bPcY7A07OPdsksAeUcuNfNkgnS2KAjrAGlPnPQ/J8yYDQ4GZfH0Ifhl26TR2J2imEAA=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr3702358edb.100.1606838140246; 
 Tue, 01 Dec 2020 07:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 15:55:28 +0000
Message-ID: <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Wed, 25 Nov 2020 at 04:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> As reported in https://bugs.launchpad.net/bugs/1905356
>
> Not implementing SCTLR.A, but all of the other required
> alignment for SCTLR.A=0 in Table A3-1.

Something in this series breaks the 'make check-acceptance'
record-and-replay test:

 (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt:
PASS (9.14 s)
 (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt',
'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/result...
(90.19 s)

The log shows the "recording execution" apparently hanging,
with the last output from the guest
[    3.183662] Registering SWP/SWPB emulation handler

thanks
-- PMM

