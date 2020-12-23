Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4729E2E22A1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 00:07:39 +0100 (CET)
Received: from localhost ([::1]:39828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksDEH-0007kN-Qz
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 18:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ksDCW-0007BT-CT
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 18:05:48 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:38407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ksDCU-0003NI-KX
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 18:05:48 -0500
Received: by mail-ot1-f44.google.com with SMTP id j20so477697otq.5
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 15:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TdgykTfUTrCGXYgWnibqAoxklrgWQYFMV7nT4woFvDI=;
 b=piujLn3l8NX5VySu5YhUpz+b8crIhfTwuZnlE4Wes/SJD8X7/2QIKHRTbS14aknDYv
 xggZP33Ui+Dw8iql2RqZsT/N3nk8YLIufLADU3wsIeeG1+zz/lV04aqw0t8fC7gplnLh
 E/17PVo+3n9r8mfYYIRcYNn6F0DYw1RyJXgGE6Q2kjcIeuuOkgEJX2RhUyfJBdvXMFxA
 /dJIvpOX88inwbaLdlqDyJ4UkYUKwFAHJ8gwZQN9BwQuTPOgLnllyR3tMhznhd+1WINu
 iOYmlC28OkFpZDbPoAupKW22hjvlVnK6UwUDxZffzCyMDGtAQUczDVToj8GY09rNEJQp
 zfqw==
X-Gm-Message-State: AOAM533crEZk4iXiFnm5M6nFJ6Rt/gy0cnEoCvT2BxVd/niQLNsnecfE
 o+T4Ua5JIeVoz9nyGsK4WHys2UrfLlMzoNJjAiE=
X-Google-Smtp-Source: ABdhPJy43P0bI6e/y9h1UB/Bo5At+M/3DFl9mmjksCB5gLOoRmu4W9juqHIEv2E4oNUawnOIaM/pPLYb6jtRTAXpIy8=
X-Received: by 2002:a9d:6f17:: with SMTP id n23mr21172667otq.371.1608764745312; 
 Wed, 23 Dec 2020 15:05:45 -0800 (PST)
MIME-Version: 1.0
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
 <536fedf3-d61a-39cf-b806-c282a124e202@ilande.co.uk>
 <20201223224737.GA184012@roeck-us.net>
In-Reply-To: <20201223224737.GA184012@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 24 Dec 2020 00:05:33 +0100
Message-ID: <CAAdtpL74A0E9UW-VcxJeJOPj0hfESvz7QGTatFUWj1u33z16Yw@mail.gmail.com>
Subject: Re: Problems with irq mapping in qemu v5.2
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.210.44;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 23, 2020 at 11:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Dec 23, 2020 at 10:05:12PM +0000, Mark Cave-Ayland wrote:
> > On 23/12/2020 21:01, Guenter Roeck wrote:
> >
> > > I don't have a real machine, and therefore did not test it on one.
> > >
> > > I tried with Linux mainline (v5.10-12913-g614cb5894306), v3.16.85, v4.4.248,
> > > and v4.14.212. I can't test older version because my cross compiler is too
> > > new. Each of those kernel versions shows exactly the same behavior.
> >
> > Is it possible for you to provide links to your drive image and kernel so
> > that we can reproduce the same environment to investigate?
> >
>
> The root file system is available from
> https://github.com/groeck/linux-build-test/blob/master/rootfs/mipsel64/rootfs.mipsel.ext3.gz
>
> The script used to build the kernel is in available in
> the same directory, though building fuloong2e_defconfig
> should do it, possibly with CONFIG_DEVTMPFS=y added.

I directly used the prebuilt Debian kernel Jiaxun recently shared in:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg768711.html

vmlinux-3.16.0-6-loongson-2e from
http://archive.debian.org/debian/pool/main/l/linux/linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb

