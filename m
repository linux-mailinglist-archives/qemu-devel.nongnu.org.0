Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F72ECF4F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:04:15 +0100 (CET)
Received: from localhost ([::1]:35714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxU1V-00054u-Qh
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxU00-0004SN-Cx
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:02:40 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxTzx-0003sb-NW
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:02:40 -0500
Received: by mail-ej1-x635.google.com with SMTP id qw4so9243423ejb.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 04:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B/JxDxDkvmOFXNJNBLofXY5rmgmrH3nOwnc03kHQz7I=;
 b=icUfLfvA1tgW3CEvXdy6hOZssccXsrya/F4RnQvFk82MvQlseOleQzmIugP65taCaF
 J8mk6wuWCGljfqECbQ8OAYvbUrW4Gi7kqRhhAH6rBRMnslEG2PHPssWiQLINZriZczPy
 4BGeQVWn8J+e0BIXCz51c6OMIMTnUqV1+lBOZhqd3glsVxx1VwY6+uTinByk2IbqfJHi
 NLC2x2WsIWfhrIy7zw1dg+6peHlEgmCBIHONN+1OFHh1CcAMdj1Hge25i5T16yQivoLg
 SPVkbmWNh4eg/WxCKGJyHUFg9C8h6d8/mMdU+VeVm3zxrtgx9Has4jIp8mCw92OyxunM
 SHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/JxDxDkvmOFXNJNBLofXY5rmgmrH3nOwnc03kHQz7I=;
 b=Ad04at8CdmRUgkBMHPJkNehcnjMCWpC4fnv30dhPoyqo5q1MBb5wrKHXvxtpQrvxDq
 xvSIxd52vakJyb615vGqVReGAp06M2JXXSbSwCy+1Otsjzwf3mbR5dvltkGwLVWkIbon
 cb/whvjqbICI19tJDIgtSEvfBNaJGGOuvflKVMeC8m1qi9EKWHtge5tQPJXLDnyToI4r
 Ls5VE1tlgB6XQvF+dztoFTrD3nJHCHdptbgZrpMpQLjy2As+cfRPlk3qCswE0kkPSzor
 LACa0RhwpES80nHolgOy7FFW0DPKqzcFj2aaI77CTZJyvIRTqbdN24SIftADpiVIEfR5
 vaiA==
X-Gm-Message-State: AOAM533Rhh8DbwCLbeJc/hwHjoArCfM1D4K7Bx8CMypBqniA8MTAoG57
 DCmwwsjaqKT61hKlGJsLlEGHmiwZarZcjB9vNYh4Cg==
X-Google-Smtp-Source: ABdhPJwUPbUAckckt54jVv8ArIqzVD2yTXUfcnAFZ9dT0Kq0zAtNqcHlYW/+pBYkaM5PysD+6B3OtbkLDlHGeV0DzOA=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr6120369ejr.482.1610020955980; 
 Thu, 07 Jan 2021 04:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20201214222154.3480243-1-edgar.iglesias@gmail.com>
In-Reply-To: <20201214222154.3480243-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 12:02:24 +0000
Message-ID: <CAFEAcA8HDAWqQtGuc6XQNP5o1SbXpp4D+98pyHr3Td2a03ZVpQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] intc/arm_gic: Fix gic_irq_signaling_enabled() for
 vCPUs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 22:21, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> Found this while debugging an issue with lockups during boot of
> Linux on Xen.
>
> In the particular setup, I'm running without EL3 firmware so group0
> interrupts are disabled on the physical interface and enabled on the
> virtual interface.
>
> Looks like we're checking the wrong CPU_CTLR reg for vCPUs. This fixes
> the problem on my side.




Applied to target-arm.next, thanks.

-- PMM

