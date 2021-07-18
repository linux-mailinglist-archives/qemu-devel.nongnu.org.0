Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171C73CC93F
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 15:03:05 +0200 (CEST)
Received: from localhost ([::1]:59068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56Rk-0000xq-42
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 09:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Pa-0007rO-2e
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 09:00:50 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56PW-0008FW-IE
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 09:00:49 -0400
Received: by mail-ej1-x633.google.com with SMTP id dt7so23328774ejc.12
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g9I3bL6HEcdosfvlwGKpIaMnRrodlZTwZp1CCarULy0=;
 b=Y98PRyCECjRuRDEtxJAOdvYShHMKenAMnQsmSnccmLXGGm5kbbxsRTCYnvsMBSt5n2
 h8/8XwVglc1Ot3M/qisFQSqCGhbC+w/tnGW9YKECfvuicd/Dr4sxO77uVW39nCPbQv25
 eFs5L88UbuuIGHoF0PkCNteUl9GUOcGxOQWo16ZO14ep8L8qJ9dIGuj/47xyGPsGDAhR
 p9K8zn9FMEEhVLN028VDelttHx9TVKvEEnB1Bbhov9dWIuToWGNt5leQU6hzLslOetJ9
 jyakLVOCgVUhrVhqHJdah6lNjC5H56VdgHPhGfILeLg18IE/uAK8GCGB+OioqHqYvZTg
 QGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g9I3bL6HEcdosfvlwGKpIaMnRrodlZTwZp1CCarULy0=;
 b=cuuO77VHSBoeAD07y6IDOL0qwVzDrxXFYpeSmfkSFZv7fw+xOu6BJESrv7iGw+yVov
 4tLNkVFdKmBLUBveObKjBSN3NMdtU9zobmAc+SSo/NioPAuHpvIb8Q7ytPGW/QGwXCRM
 lzrXUfjxaZ5t6W/3Drv9v/DObdMotletDBKNBowmRzPollnfcwnwbSr0Ra+awDJ9esgE
 Ix0K/M1atQc3omCHEk/JYLxcnknUUDaRIDFkd/XyAK6+AZT/3s7n5znaAteOekAfOT+9
 l723m86i482XF8Ow4sRtZDJhjLA5oBU6CK+PFIuvKHZezjKS+vF9x6sV+nu0Wb5aMFag
 hJKw==
X-Gm-Message-State: AOAM531ES30PUdi+OpLgY4qLiV0w8lV/zuEovCoPwWdUjQkxj9k37+7W
 LNhjEOUK9AsCi5K3/X40n0C3wEN6Jr1L0gmq1mYjfQ==
X-Google-Smtp-Source: ABdhPJzDFxLxQgmuK5wBxt0/0+K+UHHu+rEWbeycPvvffeyr7anYv/Bsl3RatxY8yOkAMJgppbGuRAyAqbLmixIelQ8=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr22696603ejb.482.1626613243416; 
 Sun, 18 Jul 2021 06:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
 <20210718074757.22489-1-vr_qemu@t-online.de>
In-Reply-To: <20210718074757.22489-1-vr_qemu@t-online.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 14:00:03 +0100
Message-ID: <CAFEAcA9hzbs71s4aeLgwGsepwU9DgZrxcY16hr4EX9tDeeJv3Q@mail.gmail.com>
Subject: Re: [PATCH for 6.1 1/2] ui/gtk: add a keyboard fifo to the VTE
 consoles
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Zack Marvel <zpmarvel@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021 at 08:50, Volker R=C3=BCmelin <vr_qemu@t-online.de> wro=
te:
>
> Since commit 8eb13bbbac ("ui/gtk: vte: fix sending multiple
> characeters") it's very easy to lock up QEMU with the gtk ui.
> If you configure a guest with a serial device and the guest
> doesn't listen on this device, QEMU will lock up after
> entering two characters in the serial console.
>
> To fix this problem copy the function kbd_send_chars() and
> related code from ui/console.c to ui/gtk.c. kbd_send_chars()
> doesn't lock up because it uses a timer instead of a busy loop
> for the write retries.
>
> Fixes: 8eb13bbbac ("ui/gtk: vte: fix sending multiple characeters")
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> ---
>  include/ui/gtk.h |  5 +++++
>  ui/gtk.c         | 53 ++++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 50 insertions(+), 8 deletions(-)

This feels like maybe it's the kind of thing that should be handled
more generically rather than in one particular UI frontend ?

thanks
-- PMM

