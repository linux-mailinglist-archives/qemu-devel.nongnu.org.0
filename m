Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42C589C00
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:59:36 +0200 (CEST)
Received: from localhost ([::1]:50062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaRr-00067c-F4
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZjy-0007rY-7J
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:14:14 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:33524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZjr-0007a5-RM
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:14:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E8FCEB8250B
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 12:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB6BC43470
 for <qemu-devel@nongnu.org>; Thu,  4 Aug 2022 12:13:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AWD2qP6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659615234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BacH34X8UsgH5kUn+ieTp1hKYkqX17ykJqsdPBaLzF4=;
 b=AWD2qP6Gh5U4FD8F4jD4Bif1pc0Ly40Egj8BgZ95//3x0+e308v/RlgzhuepQz5WRU3aKb
 CnoRGtSyU5KzUQM1jK0MqzT5+GIR7mczrL7Ba8YZ5umMJy35Z3EsJAQOmzGJpMT7eXIZDS
 9urtIEisjetD6Jujam89jtxMdSBz88U=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 77250ba2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 4 Aug 2022 12:13:54 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-324293f1414so163888147b3.0
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 05:13:53 -0700 (PDT)
X-Gm-Message-State: ACgBeo2GgB5VwkxGgrWuNYJ3nK+Vig3s5BuyhCG06tcFpSlRqbthMF0t
 SvlvArIy56f3jyfw9vZKK4ZSBIGsSHB8s0ru4MA=
X-Google-Smtp-Source: AA6agR4AN9EOes2KMjX2DsOjfzgl7863PBT51e6x/6SLQ0XYTv3VBIDx2ERiSBAPDbur42c+/PiSF5ovvoazJtcM0qI=
X-Received: by 2002:a81:59c4:0:b0:31f:4804:76ad with SMTP id
 n187-20020a8159c4000000b0031f480476admr1360638ywb.143.1659615232906; Thu, 04
 Aug 2022 05:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
 <Yuu1Eod8rwKY3pIS@redhat.com>
In-Reply-To: <Yuu1Eod8rwKY3pIS@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Aug 2022 14:13:41 +0200
X-Gmail-Original-Message-ID: <CAHmME9rNo7omz8s1rgDPjZnd9Pmzj5TjCenvQU30wMTS99_5GQ@mail.gmail.com>
Message-ID: <CAHmME9rNo7omz8s1rgDPjZnd9Pmzj5TjCenvQU30wMTS99_5GQ@mail.gmail.com>
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=83=C2=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On Thu, Aug 4, 2022 at 2:01 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Jul 21, 2022 at 06:36:21PM +0200, Paolo Bonzini wrote:
> > From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> >
> > Tiny machines optimized for fast boot time generally don't use EFI,
> > which means a random seed has to be supplied some other way. For this
> > purpose, Linux (=C3=A2=E2=80=B0=C2=A55.20) supports passing a seed in t=
he setup_data table
> > with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
> > specialized bootloaders. The linked commit shows the upstream kernel
> > implementation.
> >
> > At Paolo's request, we don't pass these to versioned machine types =C3=
=A2=E2=80=B0=C2=A47.0.
>
>
> This change has also broken direct kernel measured boot with AMD SEV
> confidential virtualization.
>
> The vmlinuz that we pass in with -kernel is measured by the BIOS and
> since that gets munged with a random seed, the measurement no longer
> matches the expected measurements the person attesting boot will
> have pre-calculated.
>
> The kernel binary passed to the firmware must be 100% unchanged
> from what the user provided in order for boot measurements to
> succeed.
>
> So at the very least this codes needs to be conditionalized to
> not run when AMD SEV is active.

If you look at the v2 patch, I move all of the setup_data stuff
outside of the kernel image, so the kernel image itself doesn't get
modified. So SEV should still work.

Can you test that patch and see?

Jason

