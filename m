Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D53CFA93
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:32:46 +0200 (CEST)
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5prZ-0002tA-Og
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5poy-0001tE-RN
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:30:04 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5pos-0000sc-MN
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:30:04 -0400
Received: by mail-ej1-x636.google.com with SMTP id oz7so30510819ejc.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ndla8cF+AFHKap0UG7MJ7gDjKXPd0zLq1B76uH8On60=;
 b=AmEk1cnNymMVWK257wcHVtcaK0c8jxR5FdEOvetxyUTA0CLC1YgVwU3a1p9dQSOCmo
 MF2gJZNfGjNrD/kvCEa8F9QzUg8m1mm5btL5dH/cQzHSjDW58HxLI68JUo29AXjdZtx+
 2yL2fVhm3AQbNPRKVATAKzjHGVMRQercftr5F83NvFLdYG140PPq5HxTHCnJQJZFe+IA
 yBQwp5LHexi73grYXKl2yo/W+Wp+G61STO5NCjPe/PsYpfBbKJVOMPzsYHrfXpdGvp2P
 Qf2lqQB94CWt1NbV/M7t3Nj5kxIWjKLeBcI8Zf1dofPDTlACRXyGAPdbQZvylkhg6gys
 uQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ndla8cF+AFHKap0UG7MJ7gDjKXPd0zLq1B76uH8On60=;
 b=BpD69XZYorI/ff/E4V/kMbiw95fx0gCpJEOCxFhhxdFqCY6nfIvIDPmK3/rwpys00f
 UDi4hzTiW8hpfyrZJkranKdf77j242OgQ4InUBXTwsI2gRGnjwtz0pu7SmiPuJtngqah
 bwsm5jRs1iHltbrADBB7fzmIsQBzeCDw7Gsb87UF2DGDEEkIKFbA5NlcJsTL0h8F+XqS
 yJC+sUo3qiaOpqg2tX/nwuDnKiJ3PeXMsfWa0yyY0wsZmd697s69zg3NatCkjSkOc+gd
 BLh23gO9CTrM4u/RWvwbUYtaImUm3tP/2mghi417oHYsjpa6tqCqGv0Npqnns/USCVSK
 XyJQ==
X-Gm-Message-State: AOAM532DpbagL14xV1I4ePZmGtJw7dDzw4ik4tsN7GQyGWM62wF/GHW6
 HWneDJ0hwja7QvzedMO0YM8dRjPRio+QvbIDD0Ol0w==
X-Google-Smtp-Source: ABdhPJzsxwJli876g0+YuGEKhWAHacvS6A+RmOCzf9lY8SHC/EEvVWxNURqTLHld/LXx/rd6JFT3plr2TZBYMWi2gjo=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr32376621ejc.4.1626787796852; 
 Tue, 20 Jul 2021 06:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210720120820.48427-1-arkaisp2021@gmail.com>
In-Reply-To: <20210720120820.48427-1-arkaisp2021@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 14:29:16 +0100
Message-ID: <CAFEAcA_VC_gac8zqx7K7Do=fL3uWi-0ZwyPN0AESYHusuoby1A@mail.gmail.com>
Subject: Re: [PATCH] mips/tlb_helper: Add support for 'info tlb' cmd
To: Arkadiy <arkaisp2021@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Pavel Dovgaluk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 13:10, Arkadiy <arkaisp2021@gmail.com> wrote:
>
> From: NDNF <arkaisp2021@gmail.com>
>
> This adds hmp 'info tlb' command support for the mips platform.
> 1k pages are not supported.
>
> Signed-off-by: NDNF <arkaisp2021@gmail.com>

Hi; for QEMU contributions we request that the signed-off-by
line is your real name, not a pseudonym; we follow basically
the Linux kernel policy on this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297

thanks
-- PMM

