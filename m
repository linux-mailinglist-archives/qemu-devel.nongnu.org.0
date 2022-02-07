Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC834AB9B7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:24:33 +0100 (CET)
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH28G-000829-Gt
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:24:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH23y-0006Sx-Ni
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:20:06 -0500
Received: from [2a00:1450:4864:20::435] (port=46682
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH23w-0007ex-Mz
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:20:06 -0500
Received: by mail-wr1-x435.google.com with SMTP id r29so6144680wrr.13
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pQw0Xnv3KqNRTOC8fxYn+UtfG9G/pQjpaX2HwPyFdB8=;
 b=V3ZRoKkp2oZXnGw/mP7lZCJW9sNth9PYqaVW0uqyUeDjs4AfS5W6Q/Slv248RD48tH
 rxrcwi6UWElSzaIb0UrU42DJOcNk/iQzl+4bEErgKnZBABEKc/CmsdlPR6Zps3XRsftM
 E6lymTMzBkORF+LI9UTlyWl262EVy9Xki7T/ng5wMwCEZKZoCcoR+AhlMm6DsNawwPuO
 VcM/Xp02q4ZPxeTLzTBkp8SSPJ4k70YarhpB0xv8XIcRzZ1togKcyECXeam04CK63tWp
 lj5mbafo09p3ZLW/sYYkO1eIxsHdOiqnl+RsEcoTwPSr/u+XqKCDrtkm1Gv/OF7wppc9
 9imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pQw0Xnv3KqNRTOC8fxYn+UtfG9G/pQjpaX2HwPyFdB8=;
 b=1mF7Vetsp036fbHUu7/IwM1QEKnVa3djTfWqRKHoDFGFxW8JIJ+xwJlIGl59ZVP41m
 Eqx3z7Nn077H5Xi4nI9YSqTz2jjaSBfar7zSxGWjU2TZHshs+lrBUpyJIl5V8jiD/dOa
 ivMicq9/wUt3N94O/x3tRBMXrEW7lMk4SWgN4MKAinEJSG0rAPIRmOB5Mcn/KHW4R2W0
 M19qNz9lc355Nnw5JJjO9WUjhpuyRn7grxyUbffPVb9TQwgMaslHHVx85XMhuJm+cQHX
 1UDBklxqpVuXC5iVPSD126+B+xNmbRv08a2fyxCaHIuLAJ8MFZe+2Tqetfmd6x/B+ZaB
 Mc9g==
X-Gm-Message-State: AOAM530r0Z+VME3SUIdPxAH83HW46kyckCtR190h/r/V4gecGNKS5A/c
 HI9Co4SHNTQmlVfF7V6viFgUNbGnhDYaGV3+9ag+Qg==
X-Google-Smtp-Source: ABdhPJzYCzitRpsrFQ3J0D6659yeH/i5KNTqeEXCt6huwrBgq4ndOqSCcGssOzEgfKrtP1bkb1EEywvcVPMIcCzX09g=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr9857956wry.319.1644232802677; 
 Mon, 07 Feb 2022 03:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 11:19:51 +0000
Message-ID: <CAFEAcA8vuDHjP8RxV=QqaR2Nhctbv+E1Xw1ETZYuO8Uc1JSB6g@mail.gmail.com>
Subject: Re: [PATCH 00/16] arm: Fix handling of unrecognized functions in PSCI
 emulation
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 15:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This series fixes our handling of PSCI calls where the function ID is
> not recognized. These are supposed to return an error value, but
> currently we instead emulate the SMC or HVC instruction to trap to the
> guest at EL3 or EL2. Particularly of note for code review:
>  * patches 4-9 include some "is this the right behaviour for
>    this hardware" questions for the maintainers of those boards
>  * patch 15 has a DTB API question, as well as being a change in
>    what we edit in a DTB we are passed by the user
>  * testing of the affected machines would be welcome

Thanks to everybody for their review, testing, and confirmation
of the behaviour of particular bits of hardware.

I'm going to apply this to target-arm.next, with patches 5 (allwinner)
and 6 (xilinx) updated to remove the TODO comments, since we've
confirmed that the don't-start-secondaries behaviour is right for
that hardware.

-- PMM

