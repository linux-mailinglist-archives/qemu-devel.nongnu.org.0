Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D4A3F662F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 19:21:34 +0200 (CEST)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIa7B-00033c-Hg
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 13:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIa67-0002E4-M6
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:20:27 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIa66-0007nu-7R
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:20:27 -0400
Received: by mail-ed1-x535.google.com with SMTP id g21so32801487edw.4
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jpdh+1thNGCE2pzvbiBqmx5fZ00pXfIAFEjV+Lcdnwg=;
 b=EDiIwRhTKlGV2SCSYykw7tQoJZ2q6P9X460rwRu9U3nTzrC8bYLH7WiTRx8XQ2kjpZ
 cBAVZKURMq62pGBQjf+IK+rLczXzGLOsB3u2+t/DX9gCUGOttb4iJA+7RTClciCV+feN
 7Gn1ziOi3Mv9fuJFvtKLy86Y99dytFihhj4z0pZlRvMc2qN+yFAyvBvcw6p2WiJGsxLY
 0IEooQ1zr4NnrHpT4+zxjdvpk+esy7WuxEbW8R5xqW+WF6jr0f9/u27MT6nTGFXMAcWj
 qgAzuqfDxVtfReAjfLNGZYjW3307+5jRf4swvufBjcWikuaLumy71pheKuigA4p4GssJ
 Pafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jpdh+1thNGCE2pzvbiBqmx5fZ00pXfIAFEjV+Lcdnwg=;
 b=W2GOTRE3id+OblIYcrx8fRKE/oGsjA+gXo6+HBpRm/TZsFxRXmgnfJ+mb+L3MchZzN
 dSg7DdLTbUsz8lE2J5L2D166CaTws3vYCxkkEoJXwEdCdlSh8G7ptLdg6A1QydNOLab6
 /OKbW80vLIF0OirrVhvsspcO8ToKwv7do0UdwZmFMu/d1MJ5zw+M2jYV3uAxb5fJl1fo
 89i0llvWUtABJFTSo+kcrCuJT3NndVVmIquSXCuZzpVTFjn35o6BzFJBz8zYYqhkGsMa
 JOR5U3PsFzY+uP7a42BS5kqWrdPN/DWbJKtm31YVm9HvlENwjl4uu76Xf2o5RMccBupa
 zukA==
X-Gm-Message-State: AOAM530q0beBRYCFThPqdPek50qTKNxOLkdQVnau4qMAAw6ULrUnbS01
 23ZuniIrxA3JJlAtlKO1qFa2rWPDlbDdDHuIC+S+Dw==
X-Google-Smtp-Source: ABdhPJzwO64EFqHLQYh1xkoDKBrg7ZwmJrYx8nh3gAXjfwn4GfyrSY3E8GruQjlCQTSYuNca6NYcjGWvq7q77LY8CsE=
X-Received: by 2002:aa7:cc0b:: with SMTP id q11mr22916487edt.251.1629825624701; 
 Tue, 24 Aug 2021 10:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-26-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 18:19:37 +0100
Message-ID: <CAFEAcA-1MYZLSXJDV96LRYzKLH_6=NJWp9gr0obNvxShxxm6gg@mail.gmail.com>
Subject: Re: [PATCH v2 25/30] linux-user/ppc: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
> The user-only version of ppc_cpu_tlb_fill does not distinguish
> between the various hw codes.  Drop all of that and just use
> the new force_sigsegv_for_addr function.  The fault address for
> POWERPC_EXCP_ISI is nip exactly, not nip - 4.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

