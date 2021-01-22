Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9413010B8
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 00:14:01 +0100 (CET)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l35ct-0004lT-DE
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 18:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35bk-0004Js-FT
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:12:48 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:44329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35be-0000nj-9E
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:12:46 -0500
Received: by mail-ej1-x634.google.com with SMTP id w1so9936176ejf.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 15:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B+jFJUXtjH3O/NOHHdDexUFbAw1gBMm1V9R8g4bRx+M=;
 b=Hx4LHXEgSxIfKH1G4pHBDBqaDUjc2Ipr48iHlTDT3xKN+uhGwbZoLPYOkNTdxPmqnY
 F9XvrxZpRPc5GNcHPq/lp6Z3WxpoWIVt9lwJTj7Z7up2OUMCJnag8atcNdm4G+HwT5aH
 zxB+v8opdtIlof/jkmyTYtfQenixhi5F5tTeH3XI7/JgRmw8kRcU/xlTk8tKSDYiaffP
 nBUHMptBkAvOnXcqUP7+aGH9k/bW4P25JijhstOg4D1/9ca6Voj2fCv686UKpxdRjssA
 A7Qm7ikIJcyyZyM+36vCNeYC5X/ggMq+5/EplzJCyf7Pr9L4PzC0NmjEr/NNXOrl2+p3
 N56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+jFJUXtjH3O/NOHHdDexUFbAw1gBMm1V9R8g4bRx+M=;
 b=B+YjjW3/N8btnGDltUELZPhH1d60cOHgsa0BuEcFRICBxIDCPGuZTXcx3EZBawUlx3
 6UvIuTb9r9rq6+7wQ7E24h+JX/9LsUEiehxUi10sNP2ZnJ2ageamIfPNNbPRxlfUpJap
 TXE/7Xb1GVLHSko5moFlzFT5t4bsCv2fG2D2AZVu+XvR5b/gUx582GqT8Vg3+9guonIh
 PxfyEKdarIGhHKCmflfVkvmETrOTMGrkY+iXMUyoekUrN43dsy9f5l0xOr72xO68Zdjx
 mywTOt4n0etBLF1dpu5pDk0dFLUlDiZ8GuazwczfH8D/qrj9+yZTQcql9NBhXWHLnVpL
 YdRw==
X-Gm-Message-State: AOAM533n8RYsw+B1PNOtG8GsleeCDWdFOfic0hLWfIpnhFHUJ9cicWlS
 9rY2wuTYW4AqoJNAoGOCpAZbspen035tVQdXFIDzrA==
X-Google-Smtp-Source: ABdhPJwiD4tXnxZoa+/8yoxyQ8fxCuAsPRGXihNxJQfBPMw+aKkmy+GF7ve+8HP4wB910jBOq5apX+7/SZi81r6f9Ws=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr431074ejz.407.1611357160308; 
 Fri, 22 Jan 2021 15:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-6-j@getutm.app>
In-Reply-To: <20210122201113.63788-6-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 23:12:29 +0000
Message-ID: <CAFEAcA8V1nv1VV6t8UN25JoA7bw96xSBamaw6VnfBavOQjj44A@mail.gmail.com>
Subject: Re: [PATCH v7 05/11] osdep: build with non-working system() function
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 20:13, Joelle van Dyne <j@getutm.app> wrote:
>
> Build without error on hosts without a working system(). An assertion
> will trigger if system() is called.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>

 configure            | 19 +++++++++++++++++++

Can we do the "does system() exist?" check in meson.build ?
Untested, but looking at the existing check for "does gettid() exist?"
it should be two lines:

has_system = cc.has_function('system')

and then later:

config_host_data.set('HAVE_SYSTEM_FUNCTION', has_system)

> +/**
> + * Platforms which do not support system() gets an assertion failure.
> + */
> +#ifndef HAVE_SYSTEM_FUNCTION
> +#define system platform_does_not_support_system
> +static inline int platform_does_not_support_system(const char *command)
> +{
> +    assert(0);
> +}
> +#endif /* !HAVE_SYSTEM_FUNCTION */

I think we should make this return an error code rather than assert:

    errno = ENOSYS;
    return -1;

In particular, the arm, m68k and nios2 semihosting ABIs presented
to the guest include 'SYSTEM' semihosting calls which we implement
as "call system() with the string the guest hands us". On a
platform without a system() function we want to return an
error to the guest there, not assert.

The other possible approach would be to find all the places
which want to call system() and add suitable ifdeffery to handle
platforms without system:
 * a win32-specific part of the guest-agent (no action needed)
 * net/slirp.c (already handled by the smbd patch in this series)
 * code in tests/ (5 instances)
 * the 3 semihosting uses

But I think providing an always-fails system() is fine.

thanks
-- PMM

