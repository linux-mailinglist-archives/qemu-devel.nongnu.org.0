Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0971B578507
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:13:19 +0200 (CEST)
Received: from localhost ([::1]:33046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRUs-0007Nj-2w
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDREH-0003pc-AO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:56:09 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:46685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDREF-0002sE-J0
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:56:08 -0400
Received: by mail-yb1-xb30.google.com with SMTP id l11so20830392ybu.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+911ATC89rQ/QlAN9mElME68H6W2Sk/f3cAj4EJ8yM=;
 b=FSWzXS9gjrKESMmVPaz72XNRv3oGSNharNwmlYLIJ/uxklrWFHpA1Tnp9eiirDNVCM
 yXhj9MMEZPYga08Q9+RTmoSES59Npho5ZKMjPVdw8dH9SpzpbVHoUdsqTC6aMZ6vEsSR
 qfzKhycoJSRvNVLpGoqwgxlb6gEmLKh+ZR++1XitA/4Y7ibx0dIAyXxtGm8LZDFAKloJ
 sG062SlQSW6sKGPtsYcrkLTsKiBTx5CXfKO1tlmks81t/RHpKLHv7khlZc7TSLcBa6/4
 wk+ptsPAk5qmQcSXc0lYzUNizVUDHxQBb/PDMQmV7ckS6X9CIE424bSK7cZ+vEHoHEcd
 U/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+911ATC89rQ/QlAN9mElME68H6W2Sk/f3cAj4EJ8yM=;
 b=bMehzKnFCCQZHRDfr2OywNmbsWiwAt611xRjL91+IE79v6R/9qpqvNHX3VwUv4jDbI
 opxucGqChZ5XDxT+UhkjDV+ldVbuCZ9Nqw/VUnym3KGRK/9MyuRLHc9JZjDEANmDnl/L
 12X4b5bUzB018gEndlcncwBATtLEFN39lTbtJtb0uMuZmKrsM3tpKrSnQZ0VU3l/h0ul
 RN5Hx5jep9TwP6diNtTLg10/meteSHvYzwE+RA6i+W1bCJLDJH/LNjnL8syQoVDq8bJ3
 dr4I3xhS5joihUvW8nx7kb+KuCqKFrf2MI+aYhHKoJXm1n+TSge6VukL4eancUbmxe5I
 zRvw==
X-Gm-Message-State: AJIora/mVOLSUCPqiff2LY7wCloHOPQzHYvMJoeeJKOUTWpSb2zZNe9o
 +HfcpWPaYEJmuk3jRmILDLswlNZ8js4I3Jq2MogPvA==
X-Google-Smtp-Source: AGRyM1uXY8Lweq3+JveRC7QgVkw4wylhXe6wdoRva0jYrXzlWIPJ7pmDFAI0GT397wpxSERKO6XYdK8XX3CcMlmPckU=
X-Received: by 2002:a25:cb0e:0:b0:66f:7b31:3563 with SMTP id
 b14-20020a25cb0e000000b0066f7b313563mr27760479ybg.85.1658152564475; Mon, 18
 Jul 2022 06:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113210.349153-1-andrey.makarov@auriga.com>
In-Reply-To: <20220716113210.349153-1-andrey.makarov@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 14:55:53 +0100
Message-ID: <CAFEAcA8w3MZ6ow7+4ARA-giO44LnP0hCgoWg_z32NzJUD=8ewg@mail.gmail.com>
Subject: Re: [PATCH v4] Align Raspberry Pi DMA interrupts with Linux DTS
To: Andrey Makarov <ph.makarov@gmail.com>
Cc: qemu-devel@nongnu.org, Andrey Makarov <andrey.makarov@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 16 Jul 2022 at 12:34, Andrey Makarov <ph.makarov@gmail.com> wrote:
>
> There is nothing in the specs on DMA engine interrupt lines: it should have
> been in the "BCM2835 ARM Peripherals" datasheet but the appropriate
> "ARM peripherals interrupt table" (p.113) is nearly empty.
>
> All Raspberry Pi models 1-3 (based on bcm2835) have
> Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi +25):
>
>     /* dma channel 11-14 share one irq */
>
> This information is repeated in the driver code
> (drivers/dma/bcm2835-dma.c +1344):
>
>     /*
>      * in case of channel >= 11
>      * use the 11th interrupt and that is shared
>      */
>
> In this patch channels 0--10 and 11--14 are handled separately.
>
> Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>

Thanks; I fixed a couple of scripts/checkpatch.pl nits
(block comments should have /* on line of their own;
open brace of function definitions goes on its own line;
if, for, etc always need {} even for one-line bodies)
and applied it to target-arm.next.

-- PMM

