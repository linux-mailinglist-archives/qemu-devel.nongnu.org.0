Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A94951E8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:00:06 +0100 (CET)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZr3-0000uc-Cd
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:00:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAVpY-0003x1-Pf
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:42:16 -0500
Received: from [2a00:1450:4864:20::32b] (port=54805
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAVpX-0000Hh-7k
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:42:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p18so11446159wmg.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 03:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PoFmUAe2U/9+Q8HlewAE973W1wbfT1HXpWq4wD7Fl4U=;
 b=trAtQTtjGtKTSG8jkqio6A5N2u6l+MX2UEDq2kFLocVm6luoS2zu4WP/4W7SMygDhI
 xpj4NPMshAGXrnet1U+yuHySGx+MOnJeJf2OkrVz5vL4SldsJT0SyW0RQIlu6MKM2DZp
 U8zaRAXp6CREUV+Phaj1pwInYURYpC89F3PCwsJguhyPFkcks7AMGpAFbifOSRSKFj6M
 gWJY8of6Tr3aukufCa7z/VI0srj4/IDcgHv11TRe6dfG15W2IarbetmU5RrzXEz1rG6z
 PwHqO3brbSJTbiK5/F68zhPzIUpY7cS36ir42DHTK+EH2a0PRdECWbu8rQR06SoOVn60
 kXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PoFmUAe2U/9+Q8HlewAE973W1wbfT1HXpWq4wD7Fl4U=;
 b=vH9b3j56081F5xOxt3O2YZBCYhsIxPAEgv39LL6Iv87orb9qfUHgkxuJCYjE8QcE1I
 zyvhzuxCLKyhvnWDN5sTGbyGt3Tp9Ku2U9af2Vh0ni0p+0Hq6i/nO1Wy13OBR5xJ+Yeq
 QSP3ShrW3jWouW9qk3tF70lisGRyPvOiHPyO6wGy+vexbRUxlaRIpY69/qL3i0yjA08D
 f9Hs368v+u5TAfi43vvGPP3I02LjYUeCu42Xrh3TpZ4f8K+AH1Wb7PKbELWTzjZcZ+Xt
 xyvqVPROGlw+1N8oNoMLlXjhcNgXst7i2cmuiYICp9mBXB2ijsSzUaIRr7clKqW80zF4
 v+uA==
X-Gm-Message-State: AOAM5321t64grr2wHjxRoe5INXPSysbD+8A3Z3m8183wwHmYIr6Bt49p
 FAYYw8Azytvn94Pa+ky6SkXF/lZrg1cnbjunTvF7BQ==
X-Google-Smtp-Source: ABdhPJzf0A0FDy9CFCDZu28XQUmz+bM6rd+VuP25PLHPRaD4TRsjWqUNAPKQaoVSsaKTYCnJmzAaV2IhDyPUe4h363w=
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr2826274wmm.37.1642678933707; 
 Thu, 20 Jan 2022 03:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20220114004033.295199-1-idan.horowitz@gmail.com>
In-Reply-To: <20220114004033.295199-1-idan.horowitz@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 11:42:02 +0000
Message-ID: <CAFEAcA96gKH8r_a2aV0bfcOR418WnRkmEsV73Uss0kDEQ2Tx4w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow only specific instructions based on the
 SCTLR_EL1.UCI bit
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jan 2022 at 00:40, Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> The SCTLR_EL1.UCI bit only affects a subset of cache maintenance
> instructions as specified by the specification. Any other cache
> maintenance instructions must still be trapped from EL0.

Hi; thanks for this patch. Do you have a test case which
demonstrates this behaviour? From reading the patch I
can't see any instructions where the patch changes the
behaviour of the emulation.

As far as I can see, the commit effectively changes the
accessfn for the following instructions to one which does
not check the UCI bit:
AArch64
 IC IALLUIS
 IC IALLU
 DC IVAC
 DC IGVAC
 DC IGDVAC
AArch32
 ICIALLUIS
 ICIALLU
 ICIMVAU
 DCCMVAU
 DCIMVAC
 DCCMVAC
 DCCIMVAC

and it is true that the architecture says that UCI
doesn't affect these instructions; they always UNDEF at EL0.

But for all of these instructions the reginfo struct
sets ".access = PL1_W". The .access field is always
checked before the .accessfn, so for any of these instructions
executed from EL0 I think we will always fail the .access
check and UNDEF the insn without calling the .accessfn.
So it doesn't matter that the .accessfn has "if EL0 then
check SCTLR_EL1.UCI", because when running the accessfn
for these insns we can never be in EL0.

Am I missing something?

thanks
-- PMM

