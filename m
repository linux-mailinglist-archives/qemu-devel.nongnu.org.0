Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083936461F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:30:21 +0200 (CEST)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUuq-0005Ug-JN
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUtT-0004X1-DD
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:28:55 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUtM-0008Ek-G8
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:28:55 -0400
Received: by mail-ej1-x62e.google.com with SMTP id l4so53206030ejc.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vn8ttxvU1uZLhGd3j4uqhbl/CWQ5aFOsoM4eJo5C9+Q=;
 b=LowJQSAzVkeRhtYWECzgOJIv0dr09A2fuEwh0l2ejE566KPWwh7BUXBIoMUR63s0VF
 kAypN6nK/JyIdi/S0M5DormS2euOIJ6wJ5qZ532ZK+bQgviLShzPr8Domrnfv6j+eCK4
 1qXH29dMCBHB9znaI/NqFNJKCdWknFS3cG47fgEy8Q4DO3Refia3wnyIwdQxKmT4be8L
 0IjFlFESVWEufOtgyskREfnwpM4qiStfejbMggVi9AzYglMj2Sj530cCkd74qTUTV7Aj
 r0BuuHuSoxXC0VT2hFKrtVosJDx/2KHw6NuIGqfH7kZpV2j2Qc28MgBcfdBiMoMlO12t
 0kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vn8ttxvU1uZLhGd3j4uqhbl/CWQ5aFOsoM4eJo5C9+Q=;
 b=PIW4hQB1zIU/FuauHocZCRrEFyVAkUCqdQaqN6vvtRKrVcxduA166X8t8T4L9XAb1N
 wIPZPq6kzWgZXw6tIJZBQH6Dk+03qeVtCM2iT9uDai/pUngAlTgx6+Y34i7kboFjMrPE
 AKm7CS7weBSE1AYjGx19+lKSNnQAMNWlNQsOqfOn4u6BMxoR4EWGLVUP1NBd4fCVX5Gh
 Fmrfw8Si3JyVUC5FAfR9/HDU7lPQtjNoHQZJOMO5quywYE6VkozddlNZiuJ93wtGFPq1
 F0ms4/8aLlqP1LtlyEC+1ML0N5+4eCkRx5S9btXM0Gsj2WARv/f7LyJHFjxiFXoWLgwG
 ghsQ==
X-Gm-Message-State: AOAM533MDHOZ9fbhqisEaD5GLk2hkkidRltaa3EA1ZyaNK2PSqI/xPQd
 +cMR4EwoRWiScd0YRFsOocT4BU/f8fnLSmaHJRJLFA==
X-Google-Smtp-Source: ABdhPJzecfrBMqUkB/tohreopPEzypK7hqfjeatl6xjTPWVVapJ3jYLrkWPJ8d2tlij/dZPgcEluUpV9xkB0XhRXOyA=
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr22696665ejd.56.1618842526949; 
 Mon, 19 Apr 2021 07:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210409062401.2350436-10-f4bug@amsat.org>
In-Reply-To: <20210409062401.2350436-10-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 15:27:55 +0100
Message-ID: <CAFEAcA8-Nd7MNU1pWB0JvnaiHN_o2_iQqhL+j8B_5DVBDh9nSw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 9/9] hw/core/machine: Reset machine clocks
 using qemu_register_reset()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Apr 2021 at 07:24, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> While the documentation mentions:
>
>   Note that if you are creating a clock with a fixed period which
>   will never change (for example the main clock source of a board),
>   then you'll have nothing else to do. This value will be propagated
>   to other clocks when connecting the clocks together and devices
>   will fetch the right value during the first reset.
>
> the clocks created in machine_init() aren't propagating their value
> because they are never reset (not part of the reset tree, such
> TYPE_DEVICE).
>
> Register a generic reset handler to have them properly reset.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/machine.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e8bdcd10854..2817fe6a567 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1234,6 +1234,13 @@ void machine_run_board_init(MachineState *machine)
>      phase_advance(PHASE_MACHINE_INITIALIZED);
>  }
>
> +static void constant_clock_reset(void *opaque)
> +{
> +    Clock *clk =3D opaque;
> +
> +    clock_propagate(clk);
> +}
> +
>  Clock *machine_create_constant_clock(MachineState *machine,
>                                       const char *name, unsigned freq_hz)
>  {
> @@ -1241,6 +1248,7 @@ Clock *machine_create_constant_clock(MachineState *=
machine,
>
>      clk =3D clock_new(OBJECT(machine), name);
>      clock_set_hz(clk, freq_hz);
> +    qemu_register_reset(constant_clock_reset, clk);

You mention this in the cover letter, but I agree that this
isn't really very nice. The machine's reset method ought to
reset the clocks (either explicitly or maybe some day implicitly).

thanks
-- PMM

