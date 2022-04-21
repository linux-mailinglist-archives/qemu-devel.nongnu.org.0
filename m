Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ED450A782
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:56:02 +0200 (CEST)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhb29-0003pi-Fa
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZsx-0001Wc-LV
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:42:27 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:34333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZsv-0003Kd-W9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:42:27 -0400
Received: by mail-yb1-xb31.google.com with SMTP id b95so9784048ybi.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V9+KP37AU6BS5k2Huv4vBXpz9/t4ZU20cM5NiIP8TA4=;
 b=zHT+P+tUs1lduXnSN5k7BE23qJ1U2hIpAgD/eg6sLYIC4n7hqu6Mipy0uOI8pJDn3w
 YQkZ/kWS6/06VdrNXB1GiG4MLZJxw40wSFqkqDyJfrYtoFPnLo1tZt6jbfd2WpSR4uWh
 qreivUHr2cEwTUdElDq6opTwL9V5GFAyKBkopqnMEX7MWEkcH1sf9dVqg+PZG1VL45t7
 u9tuSPkDF21eD1uypai80it/7ZPb1rir/01lIFXPgcaurxQsFHwv/d0MgRh3NyvKLodD
 3jp4t9swfcqJ5d/T4kaecDfnH32X3VkVBBVW5EjKqqRc9OHe1v0gp47SIZ/Alrv8IIo5
 VJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V9+KP37AU6BS5k2Huv4vBXpz9/t4ZU20cM5NiIP8TA4=;
 b=3mJwtO89Kt9qXr8CaiRfY4OFdu6Io1x9KRwky7ynW0JhJE0aHkhtTf4UTY1AlinABB
 cGiW2fbqU+jtLq7jbM+uZle4AOTEslDDbiPIEqkvoUxcFNxB2AljZ/9RZWQfMVryv0s1
 RjPss7VYkRVL/SKnoz8hLvXfqKKCmETKV1oM1gb4IxJFYPM7RSyQbAsEqvrzzBo/1mU5
 M9J0ClmHfGLEJ3/s1TCNAAJR7AycXEBHJa9FVhzx4B4nPseo3/wdyOWI+IR05P2EwzBr
 mPTiXY8AMXOG+BM951qiWjCRbOIsId9YE/RL26C3ynVpKOLn1aHC41TX9cNVN9ypoU4l
 qczw==
X-Gm-Message-State: AOAM530XYpEsaTYB4EEOvoS/Xopay2ZpxBMvVgeOIDeCFAxueRF1fbR2
 o4IUX2hztRb9GFczSsMmv15XV512UCOtSIf5z3CNHg==
X-Google-Smtp-Source: ABdhPJzuMtOjb7af7bdS759IEurml0wk2zdVriRpUO3wl+mwpLl1PHQQaHK0+edjV4ENoUb0Z9L5FCIU4abPmiF0pAo=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr550477ybs.39.1650559345027; Thu, 21 Apr
 2022 09:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <CAFEAcA9PCoVH_1EWTPWP_rqsOEhQZSvDZcEgw01=5W-cuyeJoA@mail.gmail.com>
 <CAGcCb12ouKaqwT5JAdysiVVmOQfz_MAYH+uukPfrz_3FqC7QdQ@mail.gmail.com>
In-Reply-To: <CAGcCb12ouKaqwT5JAdysiVVmOQfz_MAYH+uukPfrz_3FqC7QdQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:42:13 +0100
Message-ID: <CAFEAcA9P9aYrOgo08h1qS4mWt3+GmxgDYbxC-BTrG8_e67w18w@mail.gmail.com>
Subject: Re: [PATCH for-7.1 00/11] hw/arm: Add NPCM8XX support
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: IV00 Uri Trichter <Uri.Trichter@nuvoton.com>,
 Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 17:29, Hao Wu <wuhaotsh@google.com> wrote:
>
> Thanks for all the comments you gave! I'll go over and address them recently.
>
> For this question, The actual CPU should be cortex A35. However, I don't see
> them supported in QEMU. If I inserted CPU with "cortex-a35" QEMU will complain:
> qemu-system-aarch64: missing object type 'cortex-a35-arm-cpu'
>
> What should I do here?

You need to implement the new CPU type first... This means adding
something to target/arm/cpu64.c which will look similar to the
existing CPU handling. You need to watch out for:
 * getting all the ID register values right (check the TRM for the CPU)
 * implementing whatever the right impdef system registers are
 * checking whether QEMU is still missing support for any of the
   architectural features that the A35 implements (what QEMU
   supports is listed in docs/system/arm/emulation.rst)

It's typically not much code but quite a lot of cross-checking
against the TRM for the CPU that we're not missing pieces...
Since you can add the A35 as a supported CPU type for the 'virt'
board you can do A35 support as a separate patchset that doesn't
depend on the npmc8xx work.

https://patchew.org/QEMU/20220417174426.711829-1-richard.henderson@linaro.org/20220417174426.711829-60-richard.henderson@linaro.org/
is an example of how to add a new CPU (in that case the A76), at
the end of a large patchset from RTH that's still going through
code review.

-- PMM

