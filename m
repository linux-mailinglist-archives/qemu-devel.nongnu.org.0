Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB7456541
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 22:59:27 +0100 (CET)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnpRG-0000qP-3V
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 16:59:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnpPy-00008X-DY
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 16:58:06 -0500
Received: from [2a00:1450:4864:20::32c] (port=54110
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnpPo-0001IQ-Va
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 16:58:06 -0500
Received: by mail-wm1-x32c.google.com with SMTP id y196so6661643wmc.3
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 13:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i9iKxiQDdGb89l/S8CrFPLAhVE7kNqDBmNWCsSahJrk=;
 b=x9XeRXu+uvO8/vlc3O0A0EjKf46cVB5TNYtHgkhMfXfZy4NVbOdbwD0HOddIrWsS1Y
 +Q/Z65IrpmtHffSxIEAxOIdUzsDp2sVDoykspZHBKajcnIzL3HsR91GMtrVUgAu/dSmY
 Q6+1csK4FbMWpZr8Rx7DXACTNSWPm0VahrawiuferLl9mu2RUMeN70j5oEgOa/VAd7M7
 gRKsWpFOJK3IGM3a1rpTB0gPoCwltNWv/KUydGnWMMTMNV51AGmDjsvmjG/sxJZ0VQ0t
 YZ6CkqtK45OtsT3vyweQrWAkfsQQEKCvXir8zlU53+T7d/HSTE3cjmoPFlOBgTyW6tli
 j1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i9iKxiQDdGb89l/S8CrFPLAhVE7kNqDBmNWCsSahJrk=;
 b=AKGPmajedjN1wbAQ7pqpOEsE/9KEK7oIIZ2udoghdT5M9V5X+4V1/VODeX4CqWQyke
 I0aVYZH88KK0t9ZdpB7ugSHuADBiBHcGG24VmvPJ+FVqQsKJc401C41CfJgWDsMcr6fh
 8dXLpANwNY3DyBdbc3Cy2jZ0St40fYDTk36N6LiraJDwGPJO8mA9EAaqnNAWqwtWKibf
 6hESsZm7hhohXvPTrMyvRAg8sTIR7qPmSFk1BZy0Cmdj+ER6L12KsLyMNVI4u7L2JKZt
 E6d00/EJQQIBty1zfkOpoF0UfXLTLmWKKjR4zE7apbESghBMPItg3HcQvR+RbIlyQSZN
 YzSg==
X-Gm-Message-State: AOAM531lU9KiMQXL1+us2zALkH8p+dwIsJNLxChm4X9GEZgX62vm0Dh/
 QDMa0Q8E8wYW+m/fnY+WCl6cQkaUJwtYxYYWVPyU92cvTf8TWA==
X-Google-Smtp-Source: ABdhPJwbJ3uzVmVRM/Pc9WjNMDF3yeZVEMgn/3rZwBoYx06Cr6OlLE3dhRxYJuxVxJeQd+IVVmZ5x5vfX9zq8qexSKk=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr528312wmq.32.1637272674954; 
 Thu, 18 Nov 2021 13:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20210930151201.9407-1-peter.maydell@linaro.org>
 <20210930151201.9407-3-peter.maydell@linaro.org>
In-Reply-To: <20210930151201.9407-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Nov 2021 21:57:44 +0000
Message-ID: <CAFEAcA_-V7uJ3hkC88ycXFBEXxV2fiUTBNrh+RDnjDfX2GGNww@mail.gmail.com>
Subject: Re: [PULL 02/22] arm: tcg: Adhere to SMCCC 1.3 section 5.2
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Sept 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Alexander Graf <agraf@csgraf.de>
>
> The SMCCC 1.3 spec section 5.2 says
>
>   The Unknown SMC Function Identifier is a sign-extended value of (-1)
>   that is returned in the R0, W0 or X0 registers. An implementation must
>   return this error code when it receives:
>
>     * An SMC or HVC call with an unknown Function Identifier
>     * An SMC or HVC call for a removed Function Identifier
>     * An SMC64/HVC64 call from AArch32 state
>
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.

TL/DR: I propose to revert this for 6.2.

This change turns out to cause regressions, for instance on the
imx6ul boards as described here:
https://lore.kernel.org/qemu-devel/c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net/

The primary cause of that regression is that the guest code running
at EL3 expects SMCs (not related to PSCI) to do what they would if
our PSCI emulation was not present at all, but after this change
they instead set a value in R0/X0 and continue.

I had a look at fixing this, which involves deferring the "do we
want to enable PSCI emulation?" decision into the hw/arm/boot.c
code (which is the only place we finally figure out whether we're
going to be booting the guest into EL3 or not). I have some
more-or-less working prototype code, but in the course of writing
it I discovered a much harder to fix issue:

The highbank board both:
 (1) wants to enable PSCI emulation
 (2) has a bit of guest code that it wants to run at EL3 and
     to perform SMC calls that trap to the monitor vector table:
     this is the boot stub code that is written to memory by
     arm_write_secure_board_setup_dummy_smc() and which the
     highbank board enables by setting bootinfo->secure_board_setup

We can't satisfy both of those and also have the PSCI emulation
handle all SMC instruction executions regardless of function
identifier value.

There is probably a solution to this, but I'm not sure what it
is right now (it might involve having QEMU manually do the things
that we currently have the arm_write_secure_board_setup_dummy_smc
write guest code to do) and it's going to require digging through
what the highbank board actually is supposed to do here. Given
that we're already in the release cycle for 6.2, I think the
safest and simplest approach is to revert this patch for now,
which just takes us back to the behaviour we've always had
in previous releases. We can then take our time to figure out
how to clean up this mess in 7.0.

thanks
-- PMM

