Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0213BBE03
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:10:44 +0200 (CEST)
Received: from localhost ([::1]:46000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0PJ3-0001sJ-1V
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PGW-0000yf-S0
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:08:04 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PGS-0001VO-3Z
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:08:04 -0400
Received: by mail-ej1-x635.google.com with SMTP id gn32so29265572ejc.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y61USB1/SUcg3py8FtuucxuF8UNof2a3ssdHL3nsCLY=;
 b=fuVl80GNalIudAvJj3krN8L1XaZDtWJXxr2Si8Rq4VZb8HBCjgllGmNu+oUQFdY08w
 PPmQkPVaCcZRvPVwOi06qWWxhhwLxIa7xT1CUoFHN3NoFq8KIfcyRbfHcBcT4JfjZ3Uo
 nAbLIotkFkH8suKp6oTUQw4Y9OIhAV/GTyomAMoGVi+07KQByGA070tRymmTEOLzqyHB
 jCAJxKLzoozFF371VAxOdxvBjlOuIsOp+RkInWSX1/1YG2AKWm+pjH2lF7zDbgI/vrPh
 qBrWKjH1sTP3094lqzeHUtVMnGIagFNKmunkJU0qL6iJHaYmMe3Qz6haA9InsQ6mJzQ0
 NwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y61USB1/SUcg3py8FtuucxuF8UNof2a3ssdHL3nsCLY=;
 b=D3qk7F6nnYYI4TlCZWsolmcMK433mtEeGoVZYnQc3LlEsvVTHrnwu8OIiV0RdC5W6I
 knQqvWleb8zdNb0WjtQGAISCSfePy0tgIXPN/tV8hD27iBPlswgFsEIAMpQ9BoihE1gM
 +yah203zO+h0KPvJIAzSy4e5d/pS8ePj4VCnpVeZ8FbH5w7MicH4RFPj2pcEytq0a6hL
 XDoz8aNHct5i1aWbTMpyRzM6w8VC4/xspNttyT+TxDwx3k/GbwGYgvFQOGXiKHtWpPw8
 R4H7d9OKaj6swGP8fcdnSmT76GGva+VYFkkVqEJ07rAcHlHvRQ/dXWOV4TbmuNiw7SpY
 JnpQ==
X-Gm-Message-State: AOAM533fU7kJJJPyEIR+FaLhz3dnDrucBvk5ilMiTKzT5HzD6dqausPJ
 3AdpvgrZ40qa6CauINvFZ5NKlUH/ivf6SBfRCuXz5Q==
X-Google-Smtp-Source: ABdhPJy9CdknEYRhk/xpZ5GMyKecj45NbcO1t7AqpPzHYGc4K0yqZM+BWzWZU8CczcNth+F0BHvElYQMob14dPdr5v8=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr13438772ejy.407.1625494078628; 
 Mon, 05 Jul 2021 07:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-5-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 15:07:20 +0100
Message-ID: <CAFEAcA-e9-oBgK9wi6DOp5SGGd4vm-3sQY-fFn7HdTM842D1mg@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
> translation which triggers an LPI via INT command as well as write
> to GITS_TRANSLATER register,defined enum to differentiate between ITS
> command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
> Each of these commands make use of other functionalities implemented to
> get device table entry,collection table entry or interrupt translation
> table entry required for their processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c            | 361 ++++++++++++++++++++++++++++-
>  hw/intc/gicv3_internal.h           |  26 +++
>  include/hw/intc/arm_gicv3_common.h |   2 +
>  3 files changed, 388 insertions(+), 1 deletion(-)

> +/*
> + * This function handles the processing of following commands based on
> + * the ItsCmdType parameter passed:-
> + * 1. trigerring of lpi interrupt translation via ITS INT command
> + * 2. trigerring of lpi interrupt translation via gits_translater register
> + * 3. handling of ITS CLEAR command
> + * 4. handling of ITS DISCARD command
> + */

"triggering"

>  #define DEVID_SHIFT                  32
>  #define DEVID_MASK                MAKE_64BIT_MASK(32, 32)

> @@ -347,6 +368,11 @@ FIELD(MAPC, RDBASE, 16, 32)
>   * vPEID = 16 bits
>   */
>  #define ITS_ITT_ENTRY_SIZE            0xC
> +#define ITE_ENTRY_INTTYPE_SHIFT        1
> +#define ITE_ENTRY_INTID_SHIFT          2
> +#define ITE_ENTRY_INTID_MASK         ((1ULL << 24) - 1)
> +#define ITE_ENTRY_INTSP_SHIFT          26
> +#define ITE_ENTRY_ICID_MASK          ((1ULL << 16) - 1)

This is still using a MASK value that's at the bottom of the
integer, not in its shifted location.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

