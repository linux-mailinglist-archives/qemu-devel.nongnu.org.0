Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A311E64F92E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 15:14:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Xvf-0006SS-Jp; Sat, 17 Dec 2022 09:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6Xvd-0006SE-1M
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 09:12:41 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6Xvb-0000gy-IZ
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 09:12:40 -0500
Received: by mail-pj1-x102b.google.com with SMTP id gt4so5089519pjb.1
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 06:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+zhp+yi4UUbS54sx5g9V918+zEjB3bg0BuBpz4xHpUo=;
 b=Dcpfnc0BK+mQBb9MOn7orX0Eh6NUfKR5xpzEm59LgffwRKsbQmCVeLmel5yyJTz4mF
 8T44Zgm7oEaX1M8HxsCCkSMfym2C24g2LsE7/Fpr/VQmotbeuouxngeoQCVn3G7f5rCn
 XVdD7IuuVAD2z0ANF3Gi2nmLYHpHIpvwwegF0kG0xQ4faD8Wqujj4bkcPL3UjbwEP52H
 vajmilENLEaRSpLow9NLj4LTSPcJ+t6qO3evNbKat9asNYqv/QUD/398S05vNlsG+TFp
 S9Vt/FDh6BY2Xj8/3GFhdiuoOFPIpWPGeXC58N1Ke7N4VwtUOgSbvPOO+CUMaXv6Q3mP
 deYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+zhp+yi4UUbS54sx5g9V918+zEjB3bg0BuBpz4xHpUo=;
 b=16r6EwHJtSU4mrKFM2B/0CRcYmLQuaDT68tERt4kDvP/+aWItLqhMqLGexoGnB2G3D
 5v+N74ALXjrVX/ME6fkn1ZMSC4nEVoAjrrz7zrqOfn/hhaqF//+7S21D/nxCK6qf68y4
 9KW3HoQC3db979nZS45Rg92dvRWjpDKGyCw9SY0EumPrskACOI3f34RbiBQi5slo7q2j
 PcMgiy6Mo3EF9VTznv5dV2VBf/Ba0q+hNLz5EL2HotoHbfhAV/lp+iP8NDiq5ZYEaluI
 N8bjP1PHfT0AWTxZZ9ERCPKHZY7E1TfZ2T7WNW+dJCmT3wNELbDaGMvwWkUQogQXfY/i
 rliA==
X-Gm-Message-State: AFqh2koU/BFGzqb9X0I/qSQgjrdbeLIo+pF29emia1PwrZMDBImA2/ZA
 w0JystsEz9jzznS1DJos4opyouiLlF66Q+mcxKKtHw==
X-Google-Smtp-Source: AMrXdXtkslLSVzlxR2ybsrgCp+fJEByi8asAHMmM4tFHMhVbagEHSDL6IbnqnX6LBmBTs9OyGdf+jD3NBMMtJ+Lmbvw=
X-Received: by 2002:a17:90b:146:b0:219:94b2:2004 with SMTP id
 em6-20020a17090b014600b0021994b22004mr1275399pjb.215.1671286357947; Sat, 17
 Dec 2022 06:12:37 -0800 (PST)
MIME-Version: 1.0
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Dec 2022 14:12:26 +0000
Message-ID: <CAFEAcA97j3UHv0r8KNqzBepwSmyO2RqwueZFGQk+E12ou9nv0Q@mail.gmail.com>
Subject: Re: [PULL 00/13] accel/tcg: Rewrite user-only vma tracking
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 16 Dec 2022 at 18:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:
>
>   Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221216
>
> for you to fetch changes up to a9d0226381d6d70a9c1901ad1480961c93de8b8d:
>
>   accel/tcg: Restrict page_collection structure to system TB maintainance (2022-12-16 10:09:51 -0800)
>
> ----------------------------------------------------------------
> Use interval trees for user-only vma mappings.
> Assorted cleanups to page locking.
>

This failed to build for bsd-user:
https://gitlab.com/qemu-project/qemu/-/jobs/3489233570

../accel/tcg/translate-all.c:287:24: error: 'L1_MAP_ADDR_SPACE_BITS'
is not defined, evaluates to 0 [-Werror,-Wundef]
#if TARGET_ABI_BITS <= L1_MAP_ADDR_SPACE_BITS
                       ^

thanks
-- PMM

