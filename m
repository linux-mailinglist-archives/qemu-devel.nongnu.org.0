Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C974663C9F0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 21:56:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p07eJ-0005WN-2f; Tue, 29 Nov 2022 15:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>)
 id 1p07eE-0005VG-NK; Tue, 29 Nov 2022 15:56:12 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>)
 id 1p07eB-0002an-IY; Tue, 29 Nov 2022 15:56:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC8716191A;
 Tue, 29 Nov 2022 20:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57567C433D6;
 Tue, 29 Nov 2022 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669755361;
 bh=Lu7otVn4rMgdUyyyH3qSDPL79PLyqR/oLrZyhqXCRzU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VpPRIqd+blKihrexj+UqZwkfXAvVzJUccCuWBcUydHEJcIPvNkozNDHzPsS1+QRhB
 UXpTVHihuzJjk5eD8HyxhgeMPFZ00eIlvKpsOPXGKef64qlnI7EU+hZitFz2qP46EU
 D1tXOecTc4UuHOMYL3acNAYlrxDVlLiZzump0kB2VeXHSKJyQjBC+kv8ZbZr5Jnvil
 Ycl9+CdJ+Sv9OT6sfWwvGbW2yvCE4V4m2D9TF85THrXgV4ODvLolMo2JVW7omMggBI
 qELXqtvMiSJJGbuDrqwLQvsiEwVTROtCQq1RcVqOtxLkmXglaPjJeztAm2vvT1S+i5
 IM3lb5tcZH1ZQ==
Received: by mail-vk1-f178.google.com with SMTP id j14so4034099vkp.3;
 Tue, 29 Nov 2022 12:56:01 -0800 (PST)
X-Gm-Message-State: ANoB5pkt50SVvLfLql1oG/prOpyJ9UmAEH7woVX94H1509HrX96epWHM
 rD921FwK/y6CnXLDV/WW4bMXz52XOBJHD56yTg==
X-Google-Smtp-Source: AA0mqf5SCmCuDT5+kqMV2N3UVth28EM8LOGCFlHVwzSsaef2bVfKFWGaSoBi6qVoN86w9JYOwhHI03oVa9fEHuPTCv4=
X-Received: by 2002:a1f:9110:0:b0:3bc:fc56:597 with SMTP id
 t16-20020a1f9110000000b003bcfc560597mr2619739vkd.14.1669755360314; Tue, 29
 Nov 2022 12:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-6-jean-philippe@linaro.org>
 <CAFEAcA9EqYi0LdXtz84_-8r1L3DUNWdnNL4LTHrm0n4cub4ejQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9EqYi0LdXtz84_-8r1L3DUNWdnNL4LTHrm0n4cub4ejQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Nov 2022 14:55:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK+NngZMheR7zR2oTVmgNFKKUhZtOAys=NmPQK_FdSq_A@mail.gmail.com>
Message-ID: <CAL_JsqK+NngZMheR7zR2oTVmgNFKKUhZtOAys=NmPQK_FdSq_A@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] hw/arm/virt: Fix devicetree warnings about the
 GPIO node
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=robh@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Tue, Sep 27, 2022 at 6:25 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > Since the pl061 device can be used as interrupt controller, its node
> > should contain "interrupt-controller" and "#interrupt-cells" properties.
>
> It *can* be, but this PL061 is *not* an interrupt controller.
> I don't see any reason why we should claim so in the DT.

Taking another look, it is an interrupt controller. The GPIOs are
connected to the 'gpio-keys' node which is interrupt based (there's a
polled version too). That binding happens to be pretty lax and allows
the GPIO to be specified either with 'gpios' or 'interrupts' property.
The Linux PL061 driver happens to work only because it always
registers an interrupt controller regardless of having
"interrupt-controller" and "#interrupt-cells" properties or not.

Rob

