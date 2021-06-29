Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC23B701A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:30:25 +0200 (CEST)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyA4W-0002EI-Rn
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyA2Y-0008HN-FH
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:28:22 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyA2W-0003Jr-TK
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:28:22 -0400
Received: by mail-ed1-x533.google.com with SMTP id l24so2235627edr.11
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U/zxU+BGWvN3PKTTOL3K5daR58/k3Sk8efL71qRcHj8=;
 b=sZX7fJzNgHr7svNs6+Lr4HCqXU4K1pibIGQHsDTBOhIjGJioMK4UA71arGtbW1EI2M
 lpC5aPSRXl1jW/uQq6b1I9mH2MmMeNbnLt6fsudi7x179uGHn4/1fl98nsswZar/+aWo
 9uRasUcQoIAyIU4eq0G+N+WdzfSbSvGPinFFO3NWpFMBxaHLI1hrGaQmpWA+UCEx/OJB
 I+WTSgBJ5WxAIQZLyT0drK5N/tsAt5l5WuiszAna1keQK4kdkAHWJucyiPz4Ef/lGDfb
 3eVf4O8FooLWeoheJEGKfb54GZyBfAyF5sXVzYCnIbj+SXhL7leJ57pDr4YhLqYel2YE
 RhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U/zxU+BGWvN3PKTTOL3K5daR58/k3Sk8efL71qRcHj8=;
 b=TCT++zXs9f4wwcG0CDQfm1IrNp0zOidjlvssAoobsYBrx6twVhgcKLaR6o/2R9b1Qp
 upUNFpQgVJTYjacEJIEdkrUmEv6gVxeP0R8cChn7WMRUt0eJI+abx+R9Zr3xPIUcrzAi
 gqJ/jke82ISRhF7nqMe5O6UsHj6EF96b3OC6pVaQfnnGmhBdAtcCEU46K20/fiUBaeBa
 ol0ozJkxDQKv/GuLBu5LYOaGfkAv8+GJDouIX2HuW3hVBFHRaobfz3txiImqkbu/qOEN
 UsulkUBlvuf4OrcHp4lelwWE93MH1CwuF6uqBOXYP5RSMOzh6Gk338mmR97lJgGKs5fZ
 u2OA==
X-Gm-Message-State: AOAM532sD20Q6ZMp20P1oaK/IVNOgb6Gpzf6rhSq5QHJCWb9jUvLrMkZ
 Hv8GyNx74Wa4JWnDVaWNqMgtyp9ag29X5Byvgah1/A==
X-Google-Smtp-Source: ABdhPJytAbmCAuDzYZ4faa7LrGb34XF/xVn6RoTPQdbwxhcz81fz11isDAtP5QERf2PhNfFUjT+r0tjvw8f2bM0xSk0=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr38850736edz.44.1624958899576; 
 Tue, 29 Jun 2021 02:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
 <20210628220810.2919600-10-richard.henderson@linaro.org>
In-Reply-To: <20210628220810.2919600-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:27:42 +0100
Message-ID: <CAFEAcA-eAbREaKLwPwJ7R5AKTrKBfSHN5wbBQeR5qQQpzFtgBg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] target/nios2: Use pc_next for pc + 4
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 23:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have pre-computed the next instruction address into
> dc->base.pc_next, so we might as well use it.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

