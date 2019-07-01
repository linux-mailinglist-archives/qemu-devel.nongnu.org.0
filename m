Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F34A171
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 15:03:19 +0200 (CEST)
Received: from localhost ([::1]:57656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdDle-0005yH-Pb
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 09:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hdDir-0004mT-25
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 09:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hdDio-0000gM-Vy
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 09:00:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60372)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1hdDih-0000Pd-Fh; Tue, 18 Jun 2019 09:00:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C2A8C308623A;
 Tue, 18 Jun 2019 13:00:09 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEED717B61;
 Tue, 18 Jun 2019 13:00:08 +0000 (UTC)
Date: Tue, 18 Jun 2019 15:00:06 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190618130006.xhdezjtxbvzr63v2@kamzik.brq.redhat.com>
References: <20190618083442.10407-1-drjones@redhat.com>
 <CAFEAcA9bwbev3efZ=LJPGgObBCbW-WX19fySMusLyMNC5ZExvA@mail.gmail.com>
 <20190618115558.uhygiqryxo4lbb5u@kamzik.brq.redhat.com>
 <CAFEAcA-66=jnVrdKAkY8EtY7BjoB5EscG1S15ABUd6yQij4YFw@mail.gmail.com>
 <20190618125015.ury6wbirdrqrrwdl@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618125015.ury6wbirdrqrrwdl@kamzik.brq.redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 18 Jun 2019 13:00:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/boot: fix direct kernel boot setup
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 18, 2019 at 02:50:15PM +0200, Andrew Jones wrote:
> On Tue, Jun 18, 2019 at 12:58:30PM +0100, Peter Maydell wrote:
> > On Tue, 18 Jun 2019 at 12:56, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Tue, Jun 18, 2019 at 12:02:37PM +0100, Peter Maydell wrote:
> > > > On Tue, 18 Jun 2019 at 09:34, Andrew Jones <drjones@redhat.com> wrote:
> > > > >
> > > > > We need to check ram_end, not ram_size.
> > > > >
> > > > > Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
> > > > > DTB off the end of RAM")
> > > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > > ---
> > > > >  hw/arm/boot.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > > > > index b2f93f6beff6..8a280ab3ed49 100644
> > > > > --- a/hw/arm/boot.c
> > > > > +++ b/hw/arm/boot.c
> > > > > @@ -1109,7 +1109,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
> > > > >                               info->initrd_filename);
> > > > >                  exit(1);
> > > > >              }
> > > > > -            if (info->initrd_start + initrd_size > info->ram_size) {
> > > > > +            if (info->initrd_start + initrd_size > ram_end) {
> > > > >                  error_report("could not load initrd '%s': "
> > > > >                               "too big to fit into RAM after the kernel",
> > > > >                               info->initrd_filename);
> > > > > --
> > > > > 2.20.1
> > > >
> > > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > >
> > > > I think I missed this because my test case doesn't have an
> > > > initrd -- direct kernel boot works fine if all you're
> > > > passing to QEMU is the kernel... I think we could clarify
> > > > the commit message a little:
> > >
> > > I found it using kvm-unit-tests which uses a small initrd to
> > > pass environment variables to the guest. All the tests started
> > > to report FAIL.
> > >
> > > >
> > > > hw/arm/boot: fix direct kernel boot with initrd
> > > >
> > > > Fix the condition used to check whether the initrd fits
> > > > into RAM; this meant we were spuriously refusing to do
> > > > a direct boot of a kernel in some cases if an initrd
> > > > was also passed on the command line.
> > >
> > > Actually I think we need another fix for this error too. We
> > > weren't actually refusing do direct boot the kernel, but we
> > > should have been. We're missing the 'exit(1)' after the error
> > > message.
> > 
> > Hmm, so we are. Do you want to send a v2 then, which fixes
> > that too and fixes up the commit message?
> 
> On it's way.
>

Argh, just fired it off by forgot the '-v2' on my format-patch so
the subject tag won't be right. Sorry about that.

drew

