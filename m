Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BEA3102C
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 16:29:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWiWz-0001qP-Jk
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 10:29:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWiVv-0001KM-DK
	for qemu-devel@nongnu.org; Fri, 31 May 2019 10:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWiVs-0001Ce-Lh
	for qemu-devel@nongnu.org; Fri, 31 May 2019 10:28:11 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hWiVr-00015h-Cl
	for qemu-devel@nongnu.org; Fri, 31 May 2019 10:28:08 -0400
Received: by mail-wr1-x442.google.com with SMTP id c2so6671285wrm.8
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=OEgw+uGvaSaLfT5pHjwxlmuKr21AGQn1Zc99hXerRwU=;
	b=eW+SkaW+pcy1O4RCt4YdynMWiJQaPj7us1qN02j23V9d/baWEwUDt3n9CFjTWKHC0M
	aP0iJIc6KxjJW74xvZfLbaQ2x/jZ0KtB2G762K5SnL6VBKkTC9urbBnfcaEsnSp4+MjB
	bbQ6toV5LFvciODfK12hFgV9FUG4DWpLi1We6lNzk4Iph5laYN1ZLPBbCxY0NtpXPeT0
	XLZfMLxIjdkUAQaFHggplglGcV8t0Dzn0nUtd98qB/poIP5gcu90H/mItL02/f8vK5Go
	nTMXILTZf+Gk1b4Svlj27f5Fi9UrUNDKejseILaT6Wf3f1O1hmtZirQDoMvl9lYjWHUu
	l3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=OEgw+uGvaSaLfT5pHjwxlmuKr21AGQn1Zc99hXerRwU=;
	b=P6uxhuMpZWmOHvHAn+uP0J6QlxVoGHBoGm2hp3hHwQplYwoJiXvOacOJOWBoeGw9iI
	2wo6iK54fh1riAh3UI10ncrZU587TOjPlxLxpgKL3zufhYE78wWMCRxIPmczfRQlS0+J
	x1yf7TMtU39MpZymxxVkJDuXmLf1+UPE8W4eMveuR1v9bk50Ctl1c+NXRG5FgSEU431A
	Y/RicCjbHAGBAJwWCqSeULi7fbErDQYqlzIiv14AUdqNJI3yaOCXWfe3idPW/tAeNQvm
	RVBj1c911+/Vj0oqty0BXCRZneYHJZhnKCO73iDLinN2R56lbgHxFW37n/GiQ9t6T/7j
	aWUw==
X-Gm-Message-State: APjAAAX67AXBhodwtn5Fm3kTszseFo+SaonTs6ux1EbsL5gVKjhzAUOP
	71JC3HUq2VcQCHK4BbVuxcifOg==
X-Google-Smtp-Source: APXvYqwWegu0Z1oLLn52eGMA88FmI6nDWOuI0A2rcdh5rJ/fcs+WhPTqm+mayBlj6fqZpi6U6kiNyw==
X-Received: by 2002:adf:afd5:: with SMTP id y21mr6752776wrd.12.1559312884084; 
	Fri, 31 May 2019 07:28:04 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	u204sm7283151wme.28.2019.05.31.07.28.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 07:28:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9A6161FF87;
	Fri, 31 May 2019 15:28:02 +0100 (BST)
References: <20190514155301.16123-1-alex.bennee@linaro.org>
	<20190514155301.16123-7-alex.bennee@linaro.org>
	<20190531091204.tjmq622gw457xbdr@lws.brq.redhat.com>
	<87sgsu51bd.fsf@zen.linaroharston>
	<833530119.25503992.1559302089822.JavaMail.zimbra@redhat.com>
	<874l5aahmx.fsf@zen.linaroharston>
	<627031963.25549126.1559311169316.JavaMail.zimbra@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Miroslav Rezanina <mrezanin@redhat.com>
In-reply-to: <627031963.25549126.1559311169316.JavaMail.zimbra@redhat.com>
Date: Fri, 31 May 2019 15:28:02 +0100
Message-ID: <87o93i8zrh.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
 interface for WRITE0/WRITEC in arm-semi
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Miroslav Rezanina <mrezanin@redhat.com> writes:

> ----- Original Message -----
>> From: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
>> To: "Miroslav Rezanina" <mrezanin@redhat.com>
>> Cc: qemu-devel@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>, "=
Riku Voipio" <riku.voipio@iki.fi>,
>> qemu-arm@nongnu.org, "Laurent Vivier" <laurent@vivier.eu>
>> Sent: Friday, May 31, 2019 3:16:38 PM
>> Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common i=
nterface for WRITE0/WRITEC in arm-semi
>>
>>
>> Miroslav Rezanina <mrezanin@redhat.com> writes:
>>
>> > ----- Original Message -----
>> >> From: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
>> >> To: "Miroslav Rezanina" <mrezanin@redhat.com>
>> >> Cc: qemu-devel@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>,
>> >> "Riku Voipio" <riku.voipio@iki.fi>,
>> >> qemu-arm@nongnu.org, "Laurent Vivier" <laurent@vivier.eu>
>> >> Sent: Friday, May 31, 2019 1:08:06 PM
>> >> Subject: Re: [Qemu-devel] [RFC PATCH 06/11] target/arm: use the common
>> >> interface for WRITE0/WRITEC in arm-semi
>> >>
>> >>
>> >> Miroslav Rezanina <mrezanin@redhat.com> writes:
>> >>
>> >> > On Tue, May 14, 2019 at 04:52:56PM +0100, Alex Benn=C3=A9e wrote:
>> >> >> Now we have a common semihosting console interface use that for our
>> >> >> string output. However ARM is currently unique in also supporting
>> >> >> semihosting for linux-user so we need to replicate the API in
>> >> >> linux-user. If other architectures gain this support we can move t=
he
>> >> >> file later.
>> >> >>
>> >> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> >> ---
>> >> >>  linux-user/Makefile.objs  |  2 ++
>> >> >>  linux-user/arm/semihost.c | 24 ++++++++++++++++++++++++
>> >> >>  target/arm/arm-semi.c     | 31 ++++++-------------------------
>> >> >>  3 files changed, 32 insertions(+), 25 deletions(-)
>> >> >>  create mode 100644 linux-user/arm/semihost.c
>> >> >>
>> >> >> diff --git a/linux-user/Makefile.objs b/linux-user/Makefile.objs
>> >> >> index 769b8d83362..285c5dfa17a 100644
>> >> >> --- a/linux-user/Makefile.objs
>> >> >> +++ b/linux-user/Makefile.objs
>> >> >> @@ -6,4 +6,6 @@ obj-y =3D main.o syscall.o strace.o mmap.o signal.=
o \
>> >> >>  obj-$(TARGET_HAS_BFLT) +=3D flatload.o
>> >> >>  obj-$(TARGET_I386) +=3D vm86.o
>> >> >>  obj-$(TARGET_ARM) +=3D arm/nwfpe/
>> >> >> +obj-$(TARGET_ARM) +=3D arm/semihost.o
>> >> >> +obj-$(TARGET_AARCH64) +=3D arm/semihost.o
>> >> >>  obj-$(TARGET_M68K) +=3D m68k-sim.o
>> >> >> diff --git a/linux-user/arm/semihost.c b/linux-user/arm/semihost.c
>> >> >> new file mode 100644
>> >> >> index 00000000000..9554102a855
>> >> >> --- /dev/null
>> >> >> +++ b/linux-user/arm/semihost.c
>> >> >> @@ -0,0 +1,24 @@
>> >> >> +/*
>> >> >> + * ARM Semihosting Console Support
>> >> >> + *
>> >> >> + * Copyright (c) 2019 Linaro Ltd
>> >> >> + *
>> >> >> + * Currently ARM is unique in having support for semihosting supp=
ort
>> >> >> + * in linux-user. So for now we implement the common console API =
but
>> >> >> + * just for arm linux-user.
>> >> >> + *
>> >> >> + * SPDX-License-Identifier: GPL-2.0-or-later
>> >> >> + */
>> >> >> +
>> >> >> +#include "qemu/osdep.h"
>> >> >> +#include "cpu.h"
>> >> >> +#include "hw/semihosting/console.h"
>> >> >> +#include "qemu.h"
>> >> >> +
>> >> >> +int qemu_semihosting_console_out(CPUArchState *env, target_ulong =
addr,
>> >> >> int len)
>> >> >> +{
>> >> >> +    void *s =3D lock_user_string(addr);
>> >> >> +    len =3D write(STDERR_FILENO, s, len ? len : strlen(s));
>> >> >> +    unlock_user(s, addr, 0);
>> >> >> +    return len;
>> >> >> +}
>> >> >> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
>> >> >> index 9e5a414dd89..253c66b172a 100644
>> >> >> --- a/target/arm/arm-semi.c
>> >> >> +++ b/target/arm/arm-semi.c
>> >> >> @@ -27,6 +27,7 @@
>> >> >>
>> >> >>  #include "cpu.h"
>> >> >>  #include "hw/semihosting/semihost.h"
>> >> >> +#include "hw/semihosting/console.h"
>> >> >>  #ifdef CONFIG_USER_ONLY
>> >> >>  #include "qemu.h"
>> >> >>
>> >> >> @@ -314,32 +315,12 @@ target_ulong do_arm_semihosting(CPUARMState =
*env)
>> >> >>              return set_swi_errno(ts, close(arg0));
>> >> >>          }
>> >> >>      case TARGET_SYS_WRITEC:
>> >> >> -        {
>> >> >> -          char c;
>> >> >> -
>> >> >> -          if (get_user_u8(c, args))
>> >> >> -              /* FIXME - should this error code be -TARGET_EFAULT=
 ? */
>> >> >> -              return (uint32_t)-1;
>> >> >> -          /* Write to debug console.  stderr is near enough.  */
>> >> >> -          if (use_gdb_syscalls()) {
>> >> >> -                return arm_gdb_syscall(cpu, arm_semi_cb,
>> >> >> "write,2,%x,1",
>> >> >> args);
>> >> >> -          } else {
>> >> >> -                return write(STDERR_FILENO, &c, 1);
>> >> >> -          }
>> >> >> -        }
>> >> >> +    {
>> >> >> +        qemu_semihosting_console_out(env, args, 1);
>> >> >> +        return 0xdeadbeef;
>> >> >> +    }
>> >> >>      case TARGET_SYS_WRITE0:
>> >> >> -        if (!(s =3D lock_user_string(args)))
>> >> >> -            /* FIXME - should this error code be -TARGET_EFAULT ?=
 */
>> >> >> -            return (uint32_t)-1;
>> >> >> -        len =3D strlen(s);
>> >> >> -        if (use_gdb_syscalls()) {
>> >> >> -            return arm_gdb_syscall(cpu, arm_semi_cb, "write,2,%x,=
%x",
>> >> >> -                                   args, len);
>> >> >> -        } else {
>> >> >> -            ret =3D write(STDERR_FILENO, s, len);
>> >> >> -        }
>> >> >> -        unlock_user(s, args, 0);
>> >> >> -        return ret;
>> >> >> +        return qemu_semihosting_console_out(env, args, 0);
>> >> >>      case TARGET_SYS_WRITE:
>> >> >>          GET_ARG(0);
>> >> >>          GET_ARG(1);
>> >> >> --
>> >> >> 2.20.1
>> >> >>
>> >> >>
>> >> >
>> >> > Hi Alex,
>> >> >
>> >> > this patch breaks build for softmmu target when CONFIG_SEMIHOSTING =
is
>> >> > not
>> >> > enabled as qemu_semihosting_console_out
>> >> > is not defined in such case - neither linux-user/arm/semihost.c nor
>> >> > hw/semihosting/console.c compiled and function
>> >> > is not in stubs/semihost.c
>> >>
>> >> How do you do that? I tried ../../configure --without-default-devices
>> >> and that still builds for me.
>> >
>> > It's usual RHEL way - use --without-default-devices and use specific
>> > list of enabled devices (this mean disable CONFIG_SEMIHOSTING in
>> > default_config/* file).
>>
>> OK - so from the upstream source tree CONFIG_SEMIHOSTING is still =3Dy
>> (but I can see most of them are now =3Dn). Isn't the simplest solution to
>> fix-up your version of the default_config file to include SEMIHOSTING?
>>
>
> It's fix but it goes against our policy of handling CONFIG options so we
> would prefer to have this fixed - otherwise there's no meaning in having
> config option if you can't disable it.

Is that what it means? For my part it means we don't build in
CONFIG_SEMIHOSTING for the arches that don't need it (which we were
before). Granted it only really simplified the vl.c parsing and dropped
support for semihosting for the linux-user targets (except ARM).

>
>> Is this an out-of-tree RHEL addition?
>>
>
> No, it's RHEL device config handling.

I mean how do I replicate this failure on the upstream source tree?

>
> Mirek
>
>> >>
>> >> But I suspect what's needed is to change:
>> >>
>> >> #ifndef CONFIG_USER_ONLY
>> >>
>> >> to
>> >>
>> >> #ifdef CONFIG_SEMIHOSTING
>> >>
>> >> to the relevant headers and helper bits.
>> >
>> > Yeah, have to find out what are relevant pieces.
>> >
>> > Mirek
>> >
>> >>
>> >> >
>> >> > Mirek
>> >>
>> >>
>> >> --
>> >> Alex Benn=C3=A9e
>> >>
>>
>>
>> --
>> Alex Benn=C3=A9e
>>


--
Alex Benn=C3=A9e

