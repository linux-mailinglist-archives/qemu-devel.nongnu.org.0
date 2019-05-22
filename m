Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360D2715F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 23:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTYSJ-00055O-0n
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 17:07:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTYQT-0004BU-Gn
	for qemu-devel@nongnu.org; Wed, 22 May 2019 17:05:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTYGu-00061n-KG
	for qemu-devel@nongnu.org; Wed, 22 May 2019 16:55:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59288)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hTYGs-0005ye-Hy
	for qemu-devel@nongnu.org; Wed, 22 May 2019 16:55:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE9F4C049D7C;
	Wed, 22 May 2019 20:55:31 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85AA154389;
	Wed, 22 May 2019 20:55:28 +0000 (UTC)
Date: Wed, 22 May 2019 17:55:27 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Message-ID: <20190522205527.GZ10764@habkost.net>
References: <20190520231910.12184-1-f4bug@amsat.org>
	<20190520231910.12184-5-f4bug@amsat.org>
	<CAL1e-=jfYuh4jLAacFeZcOes5A3PERNLqsE4_hiEci+x0XBTrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL1e-=jfYuh4jLAacFeZcOes5A3PERNLqsE4_hiEci+x0XBTrw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 22 May 2019 20:55:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 4/4] BootLinuxSshTest: Test some userspace
 commands on Malta
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>,
	Caio Carrara <ccarrara@redhat.com>, qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 21, 2019 at 10:18:10AM +0200, Aleksandar Markovic wrote:
> On May 21, 2019 1:19 AM, "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org=
> wrote:
> >
> > This tests boot a full VM and check the serial console until
> > the SSH daemon is running, then start a SSH session and run
> > some commands.
> >
> > This test can be run using:
> >
> >   $ avocado --show=3Dssh run -t arch:mips
> tests/acceptance/linux_ssh_mips_malta.py
> >   ssh: Entering interactive session.
> >   ssh: # uname -a
> >   ssh: Linux debian-mips 3.2.0-4-4kc-malta #1 Debian 3.2.51-1 mips
> GNU/Linux
> >   ssh: # lspci -d 11ab:4620
> >   ssh: 00:00.0 Host bridge: Marvell Technology Group Ltd.
> GT-64120/64120A/64121A System Controller (rev 10)
> >   ssh: # cat /sys/bus/i2c/devices/i2c-0/name
> >   ssh: SMBus PIIX4 adapter at 1100
> >   ssh: # cat /proc/mtd
> >   ssh: dev:    size   erasesize  name
> >   ssh: mtd0: 00100000 00010000 "YAMON"
> >   ssh: mtd1: 002e0000 00010000 "User FS"
> >   ssh: mtd2: 00020000 00010000 "Board Config"
> >   ssh: # md5sum /dev/mtd2ro
> >   ssh: 0dfbe8aa4c20b52e1b8bf3cb6cbdf193  /dev/mtd2ro
> >   ssh: # poweroff
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
>=20
> Excelent! Frankly, this was something that we in MIPS needed and missed
> very much for a long time.
>=20
> I liked the idea that this test does not run as a default, giving us
> opportunity to extend and adjust it in future as we deem appropriate fo=
r
> our MIPS needs, but without affecting people running default test
> execution. In other words, this patch achieves =E2=80=9Cbest of both wo=
rlds=E2=80=9D.
>=20

Actually, the test is being run by default, and is timing out on
travis-ci:

https://travis-ci.org/ehabkost/qemu/jobs/535468057#L3297

--=20
Eduardo

