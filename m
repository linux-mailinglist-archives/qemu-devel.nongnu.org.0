Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03444CBB0D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 11:09:19 +0100 (CET)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPiOc-0002eZ-MU
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 05:09:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPiNj-0001zD-Jo
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:08:23 -0500
Received: from [2607:f8b0:4864:20::1136] (port=44435
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPiNh-0002vb-S2
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:08:23 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so49254327b3.11
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yq5inGFUHgxRf7kwTrw4htN4Kj3fQlbv6XLymIGVH6E=;
 b=gr2Wgg2Irpfc0rgrphMwWJXlRjjkXKnFk+KGl8+C9TT1W4z5c/MdaWZfJNOp+V1gkC
 d/EHWUetOWK1kQ2DM7Q5kx7CHb72gaP/be9yPt41UMxNuycRhcOWB/Weu9zsHaiX13+N
 Wskg6icabu4h8DS0+Hs8DSdZTd8wIqGCqPmoGWBihOnd6n17JrA8cwznVGPGn2OJs9xk
 d6PxL4KYG4gZ2VrBYPGZOGN7jDaeMtNWBVHH8riOt/BjPSYFdrSYu8AWEj5V4zIBNbfy
 xX9X3TzlxdcbBayCVGUEH8XetPmyzynV3MZmJuz4xPMYbe6bClUf7Llb7bxzYfXZXnpu
 bJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yq5inGFUHgxRf7kwTrw4htN4Kj3fQlbv6XLymIGVH6E=;
 b=0tWQJGk/8mt+Y/wrpMmAn3K1GuPDaY7Sg5Hm3ILpSqhcfuo+CUn6Fxkr7J8O/zYjpv
 tjs/Mn57hj+weQhcxczx98U00m5AD4wZa0WGfxoSCcAuhP4gTkPemWwvA++1Q9uQaN72
 Z6cyAmpsFtrOJldWQte735n6zKrWp+0DFbaszBjL2qFTHgo6ElbrNOirJLH4SGYajL6l
 p+0s8nJvDLg3eF1VwGJMixyiJUg43SvNXwkh5pzo0d7cGK9A2fMpdZgmw/dwCOm0zpYN
 3XGGv/zCJKCCvxGO+0Vr9+u4pKtv8LYuud/VbR6CDq56RYSNMk4eLVVsDM+0CZuXkCuI
 IkOQ==
X-Gm-Message-State: AOAM530LIr3T2tM0+TscAbu5fbb1E9PkLxEXbmWm98z7OPsfGWZ+1gSE
 6hPEztMrv05Sf8yKJ6SS7f2fnfW/VFfw4/GbVmf9Bg==
X-Google-Smtp-Source: ABdhPJyUxje9zEfmm1ecRJI7MqOMIuZEfOm1dWbGgXL7ZO4G3l7nOYTXruEbEwvkOd05mmCs7epFsfQK48TxUCLpIM8=
X-Received: by 2002:a0d:e2c9:0:b0:2dc:1f22:e349 with SMTP id
 l192-20020a0de2c9000000b002dc1f22e349mr5546000ywe.10.1646302100829; Thu, 03
 Mar 2022 02:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-3-amir.gonnen@neuroblade.ai>
 <bc2f558f-ae52-34ef-6901-3192f1d2fc45@linaro.org>
 <PA4PR09MB4880C5A1742F94E4A61124D2EB049@PA4PR09MB4880.eurprd09.prod.outlook.com>
In-Reply-To: <PA4PR09MB4880C5A1742F94E4A61124D2EB049@PA4PR09MB4880.eurprd09.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 10:08:09 +0000
Message-ID: <CAFEAcA-Z6zcoU=w_16Nv025fLrBBxz9n9zKmczFOV0aO6KxanA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] target/nios2: Exteral Interrupt Controller (EIC)
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 09:54, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
>
> > This looks wrong.  Of course, so does nios2_cpu_set_irq, from which you've cribbed this.
>
> > For our purposes, I think simply re-using env->regs[CR_IPENDING] as the external hw
> > request word is the right thing to do.   But we need to update RDCTL to compute the
> > correct value from CR_IPENDING & CR_IENABLE, and update WRCTL to ignore writes.
>
> Since you've already fixed that on " target/nios2: Rewrite interrupt handling" patchset, I guess I'll need to rebase on it once it's merged.
> Until then for my next version I plan to just keep that with a "TODO" comment.

If you like you could rebase on those patches already; then when you
send your next version of the series include in the cover letter
the lines

Based-on: 20220227182125.21809-1-richard.henderson@linaro.org
("target/nios2: Rewrite interrupt handling")

The first of those tells the automated tooling like patchew.org that
it should apply the referenced patchseries first before trying to
apply and test your series; the second is for humans to read.

That might save you having to respin twice.

thanks
-- PMM

