Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D2B63EE15
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:41:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gzd-0007Mr-9D; Thu, 01 Dec 2022 05:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0gzQ-0007Lc-KT
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:40:26 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0gzO-0000Bh-Tz
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:40:24 -0500
Received: by mail-pf1-x433.google.com with SMTP id k79so1473172pfd.7
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I2jo7y83izFT8U/cMcRzlh9hVnWmYlha3q23d81pN4Y=;
 b=nbc/sXBWRrAgCAF8x0vQ1K+VVuQ8NjFcBDcoa/RdVJ/vzbyeyYe+3UK/D9J4+J5GrS
 RFOxFuJUmspkzAuGnj9XqEVPz1yr+XVCe76AqWrljcgq78ZQhghlFbkGm8b51y1VPOgR
 OuHeDZZMitaEWqsT9aw7dYAAHKh0WI8un6d8ZI78b0BjAQ7A4wQOlMI0RN5/B966V1T/
 fqL6byOEbHlptUAfPlQc3T8dsghUDANhozQQ+l6aCfnMaA+WTK4mg21iWkL3Hdk8MVG9
 uTsYzOHz4wil3BmzRlUXQFZ6kMgNe62ugQNgizKYT1wpzoOeiuEGT3yxqcmxG1neYtTt
 Zcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I2jo7y83izFT8U/cMcRzlh9hVnWmYlha3q23d81pN4Y=;
 b=Ec2SQeWxd3RVdhi709mDOkz3SRc9khf2d4aneAx/kgwW8MawWUwJ7aFlJacsfuQdEH
 fjH2EvItM6Q+7QTLw5cRWGgYWcV9jl5lHMMdN+y3wVaabha1DLjNYStiZCQtzaVToxHm
 kTvDenjqK0svymnXWRuzUrcmjTlZo/MSCIv7KUUJfu5QYRbfPXREDLgOcq2kxBLw9Ntb
 +Vgew8NVzoUtzZ6kghECCxDEciH/im9etB7kqSU9EOsZz/U2ybGQ2KYPeTXsGXMM65pH
 h3Ep40ZsO7Y6mXWvXuJ/BMNYmiKg2SdJ7K3+3iGtfox8Shela6gY9cH+Jc7LQi3e35st
 KBHw==
X-Gm-Message-State: ANoB5pmep8UiwtXdHUgm9GjC84np+4DUalZUF0iCAUocIBkpJsTHdAih
 6GXrW4v5DhXEwp3YWzlcvsHorLDUaYjw4Xzg80UNXg==
X-Google-Smtp-Source: AA0mqf6Mlnrb0uE2cPDRH6dLcIJ8i9Oxrrxl9T7qAbj3LxIyyYl0KuOh3Vxquo5HXz96iOpePo4w2YlOVRCMHqkoNGs=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr47210272pfe.51.1669891221061; Thu, 01
 Dec 2022 02:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20221201102728.69751-1-akihiko.odaki@daynix.com>
In-Reply-To: <20221201102728.69751-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 10:40:09 +0000
Message-ID: <CAFEAcA_ORM9CpDCvPMs1XcZVhh_4fKE2wnaS_tp1s4DzZCHsXQ@mail.gmail.com>
Subject: Re: [PATCH] accel/kvm/kvm-all: Handle register access errors
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
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

On Thu, 1 Dec 2022 at 10:27, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> A register access error typically means something seriously wrong
> happened so that anything bad can happen after that and recovery is
> impossible.
> Even failing one register access is catastorophic as
> architecture-specific code are not written so that it torelates such
> failures.
>
> Make sure the VM stop and nothing worse happens if such an error occurs.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

In a similar vein there was also
https://lore.kernel.org/all/20220617144857.34189-1-peterx@redhat.com/
back in June, which on the one hand was less comprehensive but on
the other does the plumbing to pass the error upwards rather than
reporting it immediately at point of failure.

I'm in principle in favour but suspect we'll run into some corner
cases where we were happily ignoring not-very-important failures
(eg if you're running Linux as the host OS on a Mac M1 and your
host kernel doesn't have this fix:
https://lore.kernel.org/all/YnHz6Cw5ONR2e+KA@google.com/T/
then QEMU will go from "works by sheer luck" to "consistently
hits this error check"). So we should aim to land this extra
error checking early in the release cycle so we have plenty of
time to deal with any bug reports we get about it.

thanks
-- PMM

