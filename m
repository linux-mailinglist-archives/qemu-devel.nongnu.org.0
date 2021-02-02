Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7D30BCA2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:09:39 +0100 (CET)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tYw-0000Ao-RO
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tXE-0007hq-N2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:07:52 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tXC-00050K-2t
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:07:52 -0500
Received: by mail-ed1-x52f.google.com with SMTP id y18so5083186edw.13
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 03:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o8nk1CZIw+R0dDTkXmAHT/zo6Kec0z4UH980yk2OXsg=;
 b=kD8sQqhZSEAsN/QhJdPZtwGkt6QQ4GVgszNCHGLB7X+l85s8cWaQ50u8REbaqV8qPJ
 gpk/lX8bFjrRNZiVfguhvNz9YgjKKMGF48Z2v87LT/4lMWX1W9eGJlRj6FIfN2tqDN2M
 +n9AR4G4dbAWHxNUOo+FPsxrZeY5xBn8zkxc/HgdEmViyOc+Qj8iehFN5uN197G3pICS
 576F7ukBO2dSW55EZ44btjf1geFpLKPRreYsaYCmWJySbdWKyQVvsf82hbxG5UWLEPal
 BFmaCfe+RIgeHN3dnoB+tLg61YolpP0bpk10zDCyb4SGvUa6AOp1M97KfsmnQxs+nyGX
 vATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o8nk1CZIw+R0dDTkXmAHT/zo6Kec0z4UH980yk2OXsg=;
 b=liFaPYG1m0mBEpan/LElfKKwL5azW8OGB+j/p0WVr9MOYG51UuE7y3BBQlwbODyv8H
 Q5Rue3M80FH3o+2Uh0HhKCBGWSrgyXSmY9XhmeiPgYPfHV0oFT4iNrVF8va+nFZ+lt2l
 U7O7r4g2Ndnui6E17AfeZUuEAHUDJv4JQwMh0AMxytX1FXUylcu7zmc1SOS862lrxTKr
 RJwNzTvjz8PEUTQ1c0PWLeU6u280NecB1ZL1A1IW/XyXzRajwuqXbhC+FoEh8d6x7gs9
 uNQltVWWXC5nNTFs25XIYdSteZQluXqsBE8al3j/gyMQW+eB/TrhJM+8Hl8/yg7Mbcs4
 +gQg==
X-Gm-Message-State: AOAM532qD2QHpVlv2fe+Pr8k8Vu7c0iy7uGf8+RvwieXYUVVaOEu74s+
 1gwbNpniY2UkVLgRE7a1JtzvHD0FoTkuj1D1z6b82A==
X-Google-Smtp-Source: ABdhPJxm5KxEL+up12M/oHgmxL1U01a7XpM7pwETEBSCzerF+ypD5hpWcgtRce08hT8P77fTcCLpD9FZFSQ1bySAUlk=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr22900909edd.52.1612264068313; 
 Tue, 02 Feb 2021 03:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20210130184016.1787097-1-iris@modwiz.com>
In-Reply-To: <20210130184016.1787097-1-iris@modwiz.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:07:36 +0000
Message-ID: <CAFEAcA_oouEJ0-=FA0iu2EsuQxwbw2buZXvjuUfYWAdvEVKurw@mail.gmail.com>
Subject: Re: [PATCH] hw/char/exynos4210_uart: Fix missing call to report ready
 for input
To: Iris Johnson <iris@modwiz.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 30 Jan 2021 at 18:42, Iris Johnson <iris@modwiz.com> wrote:
>
> When the frontend device has no space for a read the fd is removed
> from polling to allow time for the guest to read and clear the buffer.
> Without the call to qemu_chr_fe_accept_input(), the poll will not be
> broken out of when the guest has cleared the buffer causing significant
> IO delays that get worse with smaller buffers.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1913341
> Signed-off-by: Iris Johnson <iris@modwiz.com>
> ---
>  hw/char/exynos4210_uart.c | 1 +



Applied to target-arm.next, thanks.

-- PMM

