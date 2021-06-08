Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2039F47E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:02:36 +0200 (CEST)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZVD-0008E3-UR
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZTp-0007KE-16
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:01:09 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZTm-0002dX-M7
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:01:08 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g18so22004164edq.8
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UxHYplQilgAH0I90cgA205y8VSyHLtFGuamK4zfxllU=;
 b=qS1m3OxAijK657xV9CffU8fPFk7otxarmAidjuEKXbNLrtprJRz/rfOxsobE3aqQKz
 MLA2hL4Rrv3Q11UBOPCayut5Nh/HcP9XQI3V2jLVCI5BpFpJtkt5kZ3nbBcJZhMeX/y8
 gvq/rXz3U8wQu3lw9yD5udPzreRryN2VwAxBEoeAxz/OV5UrwbpR/XfeQxYJkkH503fA
 IVc1zHZIII4NqMXqOD6cstwnePDBkz6PBqfELVUwSstIazwDr+Sgnm8ZoRb4azbTVYEx
 Enu3jftpi5FhsGtIT621xG8ArdTPvRsvez/vrBn59b+09Ycq5x8YidfLh3zR4AZfhz6a
 XhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UxHYplQilgAH0I90cgA205y8VSyHLtFGuamK4zfxllU=;
 b=VQ59t2a5qhZaMwORg04IBB0lfHc9n0qdovhzEIv3sG1oKTw9zqRXEQShGDoRxRKb0M
 NZs4tI6eg01vRqKIJ6cSnlfO7ha8QMAqo7FJ8JR6yo1GG9OF1WNXTmIxGR5F0C6QQ/z2
 BUUp7hUtVNEB+3+FaQ6zBD51H47SjWoXWfG3nDjJhPVEctZK9u8zzBSQ3ZN5mjRkKLVW
 MBAk+MV0a/AQ3YAosaXHhGLppT+wjgg6RDUHT6K2oUedl2rVHLQ8pm632F2IBJXJSpDG
 AOealB+iSdd8QeIuYWW8CnYzcXfuxUSG1pUWACjE+f1uVKF6+1KGSP42xWXcMbK7s2Sw
 qRIg==
X-Gm-Message-State: AOAM532lt+/8n8AmLw0hfPaDSQPFIcNuPEb/NeGUXdrGoSWM3Cf219SS
 xmFjo57D2pOqcfiEwNQcoLS90j97iCsT1+ta2k49yw==
X-Google-Smtp-Source: ABdhPJyH44640AlgGdGi0ZKantW3caFYpNnBWLdXmGw3lUR48RXXFuVp6VK4hjY61eVrc/ZUFPmFEq+8qrMQrP9beNQ=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr24626347edu.52.1623150064684; 
 Tue, 08 Jun 2021 04:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-9-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-9-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 12:00:31 +0100
Message-ID: <CAFEAcA8syVjq8+mo5h1QhyaW1-CP7EaAOFCbjqRHDmum+bR7_Q@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] hw/arm/virt: add ITS support in virt GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of virt platform GIC
> initialization.This Emulated ITS model now co-exists with kvm


Still missing space after '.'.

> ITS and is enabled in absence of kvm irq kernel support in a
> platform.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---

I gave you a reviewed-by tag on this patch in v3; please don't
drop reviewed-by tags unless you make changes to a patch,
they help reviewers know which parts of the series they don't
need to look at again.

For the record,

Otherwise,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


thanks
-- PMM

