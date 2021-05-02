Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99205370F14
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:41:38 +0200 (CEST)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldIuH-0007Mz-Ns
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldIsq-0006Xf-MI
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:40:08 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldIso-0004d2-Jy
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:40:08 -0400
Received: by mail-ej1-x634.google.com with SMTP id a4so4938917ejk.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 13:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wG9xlrA9F8eC54N94UgpXONbV4nPEG5jl49T3e34djg=;
 b=sIz7+GRPgXpDDXm28PBCTEZJVs5X/kekA7FcpIOX2r5hECjJrHq/ymdB1nf2cy01Gu
 Kuzf1U1kvAHIPz6TEi2vNBTdfZ/6Sl4PwBA3UDhzk4PjplTYI8V7VuM2ef/AC1bMnXpH
 XsEcaQxThJxGTPK+/YHpt8iGBc1IbQni0wesydcrYPkNhJQQjfxXaH5ee6lt5k7f1AVV
 D9rZzCbUO7OysVip/HopTVp47dclBqt53iXZpBppcB7LNJGmBYlrZ9A3KlVJZFWRLqg5
 l0+zQ2uDLUOfSioKbhL9ZM5mfhpdhVhuIbBFViT+6ka6YTBAtzls/f8AMVzzNGr0DzHa
 vErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wG9xlrA9F8eC54N94UgpXONbV4nPEG5jl49T3e34djg=;
 b=kh0mczm4mNLx5m7ALGa5WTMgIeU38aeFMgr1pI6T5gFxsCx2COGZoAsbNwXJW+tdz1
 xaht60+xl/LgEBLtprWyUfS6yk3XnLHT/PSKvbOh8MkWyxGRKe9Cb29J8p5FJPPB5lBL
 Q8132I/bhZQ2Z2VrvmmVd58OOuFwaHcMsFKN/yhUuQhUZ4QJRKnYFyuuW1yoS9N7WiP4
 TCPxbjqdUHfank0A6H64h2T3e1V8h2krNYrFJ2sN8EHtaprIYfINyhghVzsy5uxzyqw1
 zZmjKWGGNuZLLS1QNMLWSMULo5XImK3VFviOgkq/GqeIt3o+WmNa8BRa974G8xALXu+w
 gmgw==
X-Gm-Message-State: AOAM532qUE96WgBkc+73N0dJqj+IXuG6cC/l6gVq8tMZh10lJDVd2qv+
 GL1qIXPpTQbO0la6phPG/yF/3QGo1qOpTccgINRwEw==
X-Google-Smtp-Source: ABdhPJz/6XqHM9Cyt4p9TnIVqB1SN/LydsCX8tLXJwiPtmY10xER89izCq8mL+4IQDBFvu4h4y/kUCPPvcnagXvU8bI=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr13494082ejh.4.1619988004193; 
 Sun, 02 May 2021 13:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210502203121.630944-1-f4bug@amsat.org>
 <20210502203121.630944-2-f4bug@amsat.org>
In-Reply-To: <20210502203121.630944-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 May 2021 21:38:59 +0100
Message-ID: <CAFEAcA_pCcM70-OMaPhaAiW=-V5OK6KbBWSEK8y6AVNxpAtyMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/block/nand: Register machine reset handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2 May 2021 at 21:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The TYPE_NAND device is bus-less, thus isn't reset automatically.
> Register a reset handler to get reset with the machine.
>
> Fixed: 7426aa72c36 ("nand: Don't inherit from Sysbus")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Personally I would just revert 7426aa72c36 rather than introduce
a new use of qemu_register_reset()...

thanks
-- PMM

