Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35003A7A5E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:21:37 +0200 (CEST)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5GK-0002Nj-QJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5ER-0001TT-Qs
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:19:39 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5EP-0000qD-VU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:19:39 -0400
Received: by mail-ed1-x529.google.com with SMTP id u24so50120494edy.11
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xvKwHt8rra6AElWDhlqLXcIcLDgAbXP1fBEbpsLGWQs=;
 b=kGsQb1yk4w7yjmyTSFb0qmszPdt2G9x8FihS2RxY+sA3ueTWp81/iuWnO2iUbAZh1N
 qfC2xcDSLQ1y5PwF8cAdiw37f7aJW+4MMX6PWO7QB7asc61HIoN64992JVYkdJBAr4nw
 fYBQfpgzXVxHENldKg4Ne9XTRvkJ/eQbmO/nPEWsYJGd0yk3MIAZTTYMmY+Xe/BFtgh3
 5rGbYnHXDq+XgxHm1GJWVQt3phgp70tUFS5wNzqKbSwe0EJbs16ckGMp8Cl0nNOoriOq
 CN2k3lhkPInAh74y2sr452a7+4Q+6ZYfa2TQkXvAWyTSoErucfybh1TtpmSNPNGsob2C
 wHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xvKwHt8rra6AElWDhlqLXcIcLDgAbXP1fBEbpsLGWQs=;
 b=Lpn8Xg2/ms6k1ZCE8m3/YkyEa2EqKsr822RMkXLqdipfU3K/B0KVhyGbcgDjusZST1
 sGjO4/gaW+hXwNEvqRKrCcmotJ3osbVftkd3Y1lMYA/zILYMmTzvo9TS1dnvx09YF/7V
 7kNV+rt/LgjANn5Hyfz5u2vNrKpyqu8TPaZOqAk7mgraW8G521pDEG8xKT+Ym7hOiNlV
 FKuyC1Zs8cU8aHrNxsiZkhd+L5bXUlyUnHDu0dNYYDGg5kcpvW9xjZeMybVPmD2uFmS0
 fj13bFyZT8bgyf8XPAurGEzEVN0pGXELaGlB74YJ3m/n11lI4jK1faHqXBWL2OBFi2wx
 sm2A==
X-Gm-Message-State: AOAM531qp7ZwIHwSeKj+N6Dg/B7EywpgAQZlMCVtW6dt0yaS8YJmjYL9
 Jp3R1EimSrs/gqdqZ8EMLv2e+ksCD2r3edAyjPkzfw==
X-Google-Smtp-Source: ABdhPJxl85ui5I/hUS+Cd7u8eqUb9FZRNoQYM50z5Xf2Hkr7Wvo9CeM49ZFBabXwkgowzwvIoCuZeiqMpZJxgQNREXo=
X-Received: by 2002:a05:6402:3554:: with SMTP id
 f20mr3938817edd.204.1623748776287; 
 Tue, 15 Jun 2021 02:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210603171259.27962-1-peter.maydell@linaro.org>
In-Reply-To: <20210603171259.27962-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 10:19:01 +0100
Message-ID: <CAFEAcA98cteF4aH+M9z5==dXUv8CJJnVzyB4YofX+htiBhqDHw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/acpi, arm: Provide and use acpi_ghes_present()
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Jun 2021 at 18:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently the Arm code in target/arm/kvm64.c which decides whether
> it should report memory errors via the ACPI GHES table works
> only with the 'virt' board; in fact it won't even link if the
> virt board is configured out of the QEMU binary.
>
> This patchset replaces those virt-specific checks with a single
> new acpi_ghes_present() function which tells the caller whether
> it's OK to report errors by calling acpi_ghes_record_errors().
> The mechanism we use is a simple flag in the AcpiGhesState
> which gets sent if the board calls acpi_ghes_add_fw_cfg() to
> set up the GHES stuff.
>
> We need also to provide 'stub' versions of both acpi_ghes_present()
> and acpi_ghes_record_errors() so that we can link even if no
> board using ACPI GHES has been configured into the binary.
>
> (You can test that this series is necessary by commenting out the
> 'CONFIG_ARM_VIRT=y' line in default-configs/devices/arm-softmmu.mak
> and building with KVM enabled on an AArch64 host.)
>
> I have tested with 'make' and 'make check' but nothing beyond
> that; testing by somebody who has a guest setup that uses GHES
> would be helpful just to check I haven't accidentally broken it.

Thanks for the review; I've applied this to target-arm.next.

-- PMM

