Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFB93BF7CB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:52:21 +0200 (CEST)
Received: from localhost ([::1]:55164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Qhe-0007aj-0o
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Qgr-0006kt-Nn
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:51:29 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Qgn-0004Wm-7d
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:51:29 -0400
Received: by mail-ej1-x635.google.com with SMTP id gn32so8580301ejc.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 02:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0BjJJvPpQr6BiqmxhiY/cBLZTaUp6wG4zpInNYnFLhw=;
 b=lnqFkLQxeXwRm/MeOP1Hvhwe3Oe0VhGdRY36RzNM4UqnRuF5gzON/vICTDy097CGxS
 Nh2Qs+tFO/C+aAuOl37ajXUVzuNBN3lGjK/1Dk/zUNyQRVlyu8BYdR+cdmo0LDREmNZW
 8t8l8MzmVjsdFsPRSEusfG1i/bLumd+JTE0oweCO81BuWmXWuW9xL9kYeDMKiWivBTRd
 +MDf0ZEG7oPcISyMhbU8JlWMr5vkRZpSEYGTuBtWAhQuEd6mEqAvjKRoxInLYjNJ8Vy8
 mLuA4ovbCV77fuTtNP84MVc2wamjAujW6kFvKV19BQ1vkb5eR9W2CkkFkCInbVYb+urh
 Gcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0BjJJvPpQr6BiqmxhiY/cBLZTaUp6wG4zpInNYnFLhw=;
 b=hQSvuB0MOshJOM0Nsu2xcVQDlLtpE9Q4IUhtzju8+amMiuMWJ1ngqBErTSkxuYhaX0
 sUxVRoEuDI4hCM2Unv6eaq1/QOAShQgnanFjxABi18VzQvdQM9pH6s+nM2pSzQLWvwCi
 oa4oBIjj4788CAoMaEejAfvB6CasrO1aruG9VvpLRlVFNRrYLZ+03yjqXBu53ipiNPZo
 M2T5aA4ZDUYav+LOG5gLDfA7eL+wPkZX2ELQIHD0szI3uv52ujHz7fzNimMfyEUqZTKr
 /z5FPjLwpzNQDucndq2LKNV6mJEinZl15OT45NGWgn0j2R6U13wXwcx75MemFbGOyzIC
 R4pA==
X-Gm-Message-State: AOAM530V/JBniwijFY22LwhOd9L/TJY8ckUgPnLLS2YJheaOgVvsETTK
 GdJitDjicA9vuN7UMJlMlHsJW6xBl8GZGhyQubkXPzpITRN2Gw==
X-Google-Smtp-Source: ABdhPJz41bdl5kCjhyfUGd70BKoKRfCI7N8NfXCGtHWXJ4WD8WLP99li/a3154I+TH8PbGHdPrJY97tyGHG57M2GNeo=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr8608303ejb.482.1625737883689; 
 Thu, 08 Jul 2021 02:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210706134457.81059-1-hnick@vmware.com>
In-Reply-To: <20210706134457.81059-1-hnick@vmware.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 10:50:45 +0100
Message-ID: <CAFEAcA9Cqzh716p6bhed5MHGcQXpki0SrQZQS3NSLOGwoF3fkg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Correct the encoding of MDCCSR_EL0 and
 DBGDSCRint
To: Nick Hudson <hnick@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Jul 2021 at 14:45, <hnick@vmware.com> wrote:
>
> Signed-off-by: Nick Hudson <hnick@vmware.com>
> ---
>  target/arm/helper.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a66c1f0b9e..910ace4274 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6326,11 +6326,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>        .access = PL1_RW, .accessfn = access_tda,
>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
>        .resetvalue = 0 },
> -    /* MDCCSR_EL0, aka DBGDSCRint. This is a read-only mirror of MDSCR_EL1.
> +    /*
> +     * MDCCSR_EL0[30:29] map to EDSCR[30:29].  Simply RAZ as the external
> +     * Debug Communication Channel is not implemented.
> +     */
> +    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
> +      .access = PL0_R, .accessfn = access_tda,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    /*
> +     * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
> +     * it is unlikely a guest will care.
>       * We don't implement the configurable EL0 access.
>       */
> -    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> +    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
> +      .cp = 14, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
>        .type = ARM_CP_ALIAS,
>        .access = PL1_R, .accessfn = access_tda,
>        .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },



Applied to target-arm.next, thanks.

-- PMM

