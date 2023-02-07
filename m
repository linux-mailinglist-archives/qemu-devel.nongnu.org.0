Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C475E68DD55
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:51:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQFG-0006DG-RE; Tue, 07 Feb 2023 10:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPQFE-0006Bp-Vb
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:50:56 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPQFD-0007od-AH
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:50:56 -0500
Received: by mail-pg1-x531.google.com with SMTP id 78so10701528pgb.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yNuBD52/uxHuhHPL4p0mKEI+drDBAoFnlvp5XkJ6a7M=;
 b=OCs9gCxWwNvBmO864UYFuejS63ctuuCCLVfKZpJw21UitRPV3pwQ5v+KdIJFN2ozqB
 iHXdJBhRoNmPRwWyenX1Ru0p0EaHpFZ4L0evvyQUYDZBABfkySn0VtSBkZpFkK4GiNC2
 jUWyvvHtCZ7CeYv+o8qUKTFqxFPS23JDbUwox+3PM1BHw1jL9angCDwV1igSdVUDPXmm
 R4UlT35RcUfE/VGOqjQKF7SdSfhI9p/jnUFdh3QnKX0YF4edI9vWJX+EIbd9dJP2LLKx
 xOWA9BGJ+sAGQGTNNtNTggcP6u8GsvDiM9hoqJSch0//SgssiLtKjp8ylAHERc6YBzmg
 zX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yNuBD52/uxHuhHPL4p0mKEI+drDBAoFnlvp5XkJ6a7M=;
 b=RKITqV9U2s6/LxjW8lvdUa9+KPYXrz3Bk+WT8zL+/KDLLf9VKrqSO8PmmD0ANpRfMn
 3psqcO1Y8xKv1c9gOddEiam85QXPNr9GGKJESd8vgN2LsJszWMR/ACM/JJTSNnM0J2/L
 0Uisso2ONzmRAGpHUPty2qyxSpBOQ7FedzOjyjW+RyjD/nFtNQgb3+6KNs2DGFs7wSkH
 WiK84CUGQY6jReWZK/NCeJg6QlTHCCQGvx5Lttc/A6zsfG/UKYS8r2hE30MrkGQ/aCYA
 W/BTCGd49ctWcqgM96KfbURhupuKEkEZzhLldE0BFe3iS9fORjYrehvBLD7UiXBqMuRJ
 NxoA==
X-Gm-Message-State: AO0yUKUMDVjYPrgW3EclyeNx/91GoBeCwaESAHl62O5jSFCuM1t9vprO
 LmnfEjTzHIOPu9EV8PXJgJeM0B9ru45BW1XRE0OdEg==
X-Google-Smtp-Source: AK7set+lwGaf24emu4hGly4xnzqa8ZbBllE1NaIhiuJJUQGC3LSUdQkJq/TzE2BMyErKNBkpXNiWdnoFsXTKj/FvgzI=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr886708pfb.48.1675785053353; Tue, 07
 Feb 2023 07:50:53 -0800 (PST)
MIME-Version: 1.0
References: <87lel9o56z.fsf@pond.sub.org>
In-Reply-To: <87lel9o56z.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 15:50:41 +0000
Message-ID: <CAFEAcA8T1OA_WfbXATJDO+1kiL2_yfOtKg4PWdKfZQsDtcA_rA@mail.gmail.com>
Subject: Re: Can we unpoison CONFIG_FOO macros?
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Mark Burton <mburton@qti.qualcomm.com>, 
 Luc Michel <luc@lmichel.fr>, Bernhard Beschow <shentey@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Feb 2023 at 15:41, Markus Armbruster <armbru@redhat.com> wrote:
> We have a boatload of CONFIG_FOO macros that may only be used in
> target-dependent code.  We use generated config-poison.h to enforce.
>
> This is a bit annoying in the QAPI schema.  Let me demonstrate with an
> example: QMP commands query-rocker, query-rocker-ports, and so forth.
> These commands are useful only with "rocker" devices.  They are
> compile-time optional.  hw/net/Kconfig:
>
>     config ROCKER
>         bool
>         default y if PCI_DEVICES
>         depends on PCI && MSI_NONBROKEN
>
> The rocker device and QMP code is actually target-independent:
> hw/net/meson.build puts it into softmmu_ss.
>
> Disabling the "rocker" device type ideally disables the rocker QMP
> commands, too.  Should be easy enough: 'if': 'CONFIG_FOO' in the QAPI
> schema.
>
> Except that makes the entire code QAPI generates for rocker.json
> device-dependent: it now contains #if defined(CONFIG_ROCKER), and
> CONFIG_ROCKER is poisoned.  The rocker code implementing monitor
> commands also becomes device-dependent, because it includes generated
> headers.  We compile all that per target for no sane reason at all.
> That's why we don't actually disable the commands.
>
> Not disabling them creates another problem: we have the commands always,
> but their implementation depends on CONFIG_ROCKER.  So we provide stubs
> that always fail for use when CONFIG_ROCKER is off.  Drawbacks: we
> generate, compile and link useless code, and QAPI/QMP introspection is
> less useful than it could be.

If you want the introspection to be useful, then you need to
make the appearance of the commands depend on what machine
type and devices are created on the command line. There are
lots of machine types where the rocker commands are irrelevant
because they don't apply to that machine even though it happens
that PCI_DEVICES got built into that QEMU executable.

I think the underlying question is "what does it mean to be
only building in a QMP command when a Kconfig value is set?".
It doesn't mean "this command only appears when it's useful",
so anybody introspecting with QMP has to handle the "command
exists but doesn't do anything helpful" case anyway. My guess
is that the check you're trying to do at compile time ought
to be done at runtime somehow instead (which is a general
theme for 'single system emulation executable' work).

thanks
-- PMM

