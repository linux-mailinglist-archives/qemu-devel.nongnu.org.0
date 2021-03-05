Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574C332E72A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:24:02 +0100 (CET)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI8Yr-0005Yt-EN
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8Xb-0004yD-Mw
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:22:43 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8XZ-0004qZ-ID
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:22:42 -0500
Received: by mail-ed1-x531.google.com with SMTP id b7so2053132edz.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 03:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8qyOVIxrlhAAZUUomRZiOSz30DPevvY82WCeucYNLzE=;
 b=IS+2VCG1/eQCa7O8BlCgLX5YTRgYN6Lp4CVVSKfmGs7JaDF0UrTiVai4yy/l/IwdiY
 IBBoDci5O4FdKnE1wllTKJfFdEYIm18iaHVIYIcWYoJJ8MJGlBxTmgAzU6CUAP77L/Vr
 NucV2peQOUa1A5sxrC4jaNtCsVmL37EuIIzluuCz7SOw02VJWxsAxeJj772JoMNvuJMN
 xgp8xf/TnmTO/DRaNDJMcOoxbZjze7QtwTQW3hUev3qmnBb3+KK9yxXFuSqoXbR/+JY8
 KosmOF7dSdLcyH9IaR5UeAGlpPbHJaY4OqbNhH9EMd1LBXYp5u5hthhTUX3/J0T/9r0e
 +Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8qyOVIxrlhAAZUUomRZiOSz30DPevvY82WCeucYNLzE=;
 b=ssxmkmggMhVDPLpj2ABQo1RVniQK1YCqhyZjFcYGKsIYxjOKqRp5MjlG02lQNPbf91
 BZ9rs55Fl3y2N/MZ+ssuSgkWFhcNsyUmY0Ils+SbsD7mnDsyZbZXHwzGT5l3Cnu3WRQ6
 PcLImoAeJyyDRjUZ1lm8XVKXwIN0VWd9Y8xe6fX9rxE1ukmSMWAyHAsfkqYXdit4HnjJ
 h5AMo7glHmpVrRvb+zihz/zwkNf+AE6RSjBIvu6aQqGxtySEGz5Ec55P10+BXbVkeVX7
 /WIXUquRPgU8njoMkJYxTdVl/Pbhv2UtAtw3e/41F6+J395YCe4ZmNaRKHTGfvfAMMQI
 R9XQ==
X-Gm-Message-State: AOAM532NK/O60Jlm5xt5tKQjMTeOzE/9FLuzMex/YCyVxRV83GeayShr
 d+FabdT8hR0hPF8p15E5iOXfsYc7gZtZd/MuFSZVyA==
X-Google-Smtp-Source: ABdhPJzNP1/X4pcIAZ0t80kBLd/lHEX9ukCFNs7ijI+46QR6VwAaSwPhLJ1XjJHSFacjLfFDha8rgl10CBD3Sg1iXLE=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr8460140edt.251.1614943360064; 
 Fri, 05 Mar 2021 03:22:40 -0800 (PST)
MIME-Version: 1.0
References: <20210216224543.16142-1-rebecca@nuviainc.com>
In-Reply-To: <20210216224543.16142-1-rebecca@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:22:24 +0000
Message-ID: <CAFEAcA8CfHe6NaaSF5S2cz=SkKOQoSOjsdMVqDUbM0D7R_EXfw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Add support for FEAT_SSBS
To: Rebecca Cran <rebecca@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Tue, 16 Feb 2021 at 22:45, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
>
> Add support for FEAT_SSBS, Speculative Store Bypass Safe. SSBS is an
> optional feature in ARMv8.0 and is mandatory in ARMv8.5.
>
> Changes from v1 to v2:
>
> o Removed changes to cpsr_write_from_spsr_elx and cpsr_read_for_spsr_elx.
> o Moved the SSBS case in translate-a64.c above DIT to keep the numbers in
>   order.
> o Moved the check for SCTLR_DSSBS_32 in take_aarch32_exception.
>


Applied to target-arm.next, thanks.

-- PMM

