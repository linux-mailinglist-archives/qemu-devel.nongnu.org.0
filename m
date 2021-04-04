Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24B3538D3
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Apr 2021 18:22:46 +0200 (CEST)
Received: from localhost ([::1]:39752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lT5WO-0008KT-Q0
	for lists+qemu-devel@lfdr.de; Sun, 04 Apr 2021 12:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lT5UX-0007bR-B8
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 12:20:49 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lT5UV-0003FA-0g
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 12:20:49 -0400
Received: by mail-ej1-x62c.google.com with SMTP id r12so13862704ejr.5
 for <qemu-devel@nongnu.org>; Sun, 04 Apr 2021 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=709qAv2G7+bex/RdaZ6WPP9w6UhWfO1zSd5aYZM/1Zo=;
 b=OWlWYRDlexXmCNcAQt+sxteWumLzml8N1Vxx4ukk90KS/o2RncEW8DfN119Lr94qQB
 0VHCEuClDIdDiRlrdZ4SeR1n+e/iCQC8C4AAxrSFp/GuBtqAakjONQk6KmZvbO2LrOTK
 ShOkY/NhSD0ymumSnKH3EWcq/A93nHAkGcVarbaSA5pMqbnV1NvGMw3iSjkE8AWdq1/P
 n95gsRR/s2oB4B9luDp/rAz+peVwbJXWBYrzMWHRSvUPTZ3xTNEuCZVWF+c7cYeryACR
 ICWHkgKpq12MTAFqICcB+o+FwZRT1mGRwaB4D+IGpJuPeI1pt/tQTsKY3Qwkq8PN/gBh
 sMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=709qAv2G7+bex/RdaZ6WPP9w6UhWfO1zSd5aYZM/1Zo=;
 b=G0ks8ziAxKgeYTUZLbshFTDuj/gUlEFxZlnXCsbjpj0xXcB4hrM5LITQqNARDJH/Mn
 a24yR4FEUm5IckTP+wrgVEHQiKKNsVS8khvEP7IFlgobjbxbG/teeLJx/ZbhaTXg7n23
 xKDrhwwDsDqPqL5xj3JiAGmth7/rID1KF3GbQpV3P2thBapPqngiw1jzFgCYlBL2d3YQ
 T05TNjwbpXlnxssbzOFQoM2ylta/Z5LBqcQjq5Sgq9Emcj6DJDGzMWIvznBSz6PhCThY
 wB5jRT69erEDxIMumfyEdrcWOBYS8QsVVqGh8AVVYSwE5CHnuuHtgzvi4D5Ii8oQYOcM
 aPCw==
X-Gm-Message-State: AOAM531ptUGyoUh19ZxEMkpdHwHk6q3+u5E/zB/Pxt3ORPI9Xgt/YX8J
 7OFhVqCXbEi6Bflzj2hf07LPqAgzJkgsC9/PTzXLYQ==
X-Google-Smtp-Source: ABdhPJxjXoHHfhBCSLwWd7bE3L3o7tYBsrM86HC/AxKOygaHlG7F368yKgcbriTHTugZvTPXT9fJWdKDWn8BHDXamDo=
X-Received: by 2002:a17:906:ce32:: with SMTP id
 sd18mr1061197ejb.85.1617553244342; 
 Sun, 04 Apr 2021 09:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210325153310.9131-1-peter.maydell@linaro.org>
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Apr 2021 16:20:07 +0000
Message-ID: <CAFEAcA-4vwYyw=oDBMOOKgGaL-t1=4JTeJsBdwBv2Xipb1BBbQ@mail.gmail.com>
Subject: Re: [PATCH for-6.0 0/4] Don't treat all sysbus devices as hotpluggable
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 at 15:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On the two machines which have the "platform bus" (ppc e500 and arm
> virt) we currently treat all TYPE_SYS_BUS_DEVICE devices as being
> hotpluggable in the device callbacks, and try to plug those devices
> into the platform bus.  This is far too broad, because only a handful
> of devices are actually valid to plug into the platform bus.
> Moreover, if a device which is pluggable for some other reason (like
> a PCI device) happens to use a sysbus device internally as part of
> its implementation, the hotplug callback will incorrectly grab that
> sysbus device, probably resulting in an assertion failure.

I'm taking this into target-arm.next for 6.0 (with minor commit message
and comment text tweaks to use 'allowlist' as suggested by rth).

thanks
-- PMM

