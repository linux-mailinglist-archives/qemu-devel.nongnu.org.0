Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCD249F0B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 13:20:10 +0200 (CEST)
Received: from localhost ([::1]:55656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdC9p-00082C-Lc
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 07:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42991)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vrozenfe@redhat.com>) id 1hdC83-0007Ea-4r
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vrozenfe@redhat.com>) id 1hdC81-00034t-Ta
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:18:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38128)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vrozenfe@redhat.com>) id 1hdC81-00033j-Jv
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 07:18:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 352428552A;
 Tue, 18 Jun 2019 11:18:05 +0000 (UTC)
Received: from ovpn-116-47.sin2.redhat.com (ovpn-116-47.sin2.redhat.com
 [10.67.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 630174141;
 Tue, 18 Jun 2019 11:17:59 +0000 (UTC)
Message-ID: <1560856677.5084.197.camel@redhat.com>
From: Vadim Rozenfeld <vrozenfe@redhat.com>
To: Roman Kagan <rkagan@virtuozzo.com>
Date: Tue, 18 Jun 2019 21:17:57 +1000
In-Reply-To: <20190618103501.GH32624@rkaganb.sw.ru>
References: <20190615200505.31348-1-ehabkost@redhat.com>
 <20190617134856.GF32624@rkaganb.sw.ru> <20190617142301.GA19178@habkost.net>
 <20190617173210.GG32624@rkaganb.sw.ru> <20190617174917.GE19178@habkost.net>
 <1560821097.5084.179.camel@redhat.com>
 <20190618103501.GH32624@rkaganb.sw.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 18 Jun 2019 11:18:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] i386: Fix signedness of
 hyperv_spinlock_attempts
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2019-06-18 at 10:35 +0000, Roman Kagan wrote:
> On Tue, Jun 18, 2019 at 11:24:57AM +1000, Vadim Rozenfeld wrote:
> > On Mon, 2019-06-17 at 14:49 -0300, Eduardo Habkost wrote:
> > > On Mon, Jun 17, 2019 at 05:32:13PM +0000, Roman Kagan wrote:
> > > > On Mon, Jun 17, 2019 at 11:23:01AM -0300, Eduardo Habkost
> > > > wrote:
> > > > > On Mon, Jun 17, 2019 at 01:48:59PM +0000, Roman Kagan wrote:
> > > > > > On Sat, Jun 15, 2019 at 05:05:05PM -0300, Eduardo Habkost
> > > > > > wrote:
> > > > > > > The current default value for hv-spinlocks is 0xFFFFFFFF
> > > > > > > (meaning
> > > > > > > "never retry").  However, the value is stored as a signed
> > > > > > > integer, making the getter of the hv-spinlocks QOM
> > > > > > > property
> > > > > > > return -1 instead of 0xFFFFFFFF.
> > > > > > > 
> > > > > > > Fix this by changing the type of
> > > > > > > X86CPU::hyperv_spinlock_attempts
> > > > > > > to uint32_t.  This has no visible effect to guest
> > > > > > > operating
> > > > > > > systems, affecting just the behavior of the QOM getter.
> > > > > > > 
> > > > > > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > > > > > ---
> > > > > > >  target/i386/cpu.h | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > Reviewed-by: Roman Kagan <rkagan@virtuozzo.com>
> > > > > > 
> > > > > > That said, it's tempting to just nuke qdev_prop_spinlocks
> > > > > > and
> > > > > > make
> > > > > > hv-spinlocks a regular DEFINE_PROP_UINT32...
> > > > > 
> > > > > Agreed.  The only difference is that we would validate the
> > > > > property at realize time instead of object_property_set().
> > > > 
> > > > Right.  But currently it's validated to be no less than 0xfff
> > > > and
> > > > no
> > > > bigger than 0xffffffff.  The latter check would become
> > > > unnecessary,
> > > > and
> > > > I'm unable to find any reason to do the former (neither spec
> > > > references
> > > > nor the log messages of the commits that introduced it).
> > > 
> > > The 0xFFF lower limit was originally introduced by commit
> > > 28f52cc04d34 ("hyper-v: introduce Hyper-V support
> > > infrastructure").
> > > 
> > > Vadim, do you know where the 0xFFF limit comes from?
> > 
> > I simply took this value from Windows Server 2008 R2 that 
> > I used as a reference while working on Hyper-V support for KVM.
> > I also remember some paper (probably published by AMD ???)
> > mentioned
> > that 0x2fff seemed to have the best balance for PLE logic.
> 
> The question is whether the user should be disallowed to set it below
> 0xfff?
> I don't see this mandated by the spec, so I'd rather remove the lower
> limit and convert the property to a regular DEFINE_PROP_UINT32.
> 

Honestly, I don't have any strong opinions on this matter. Having some
lower boundary limit seemed quite logical to me. However, if a user
wants to experiment and see how the smaller number of spinlock acquire
attempts before calling HvNotifyLongSpinWait will affect the overall
system performance, then why not?

Vadim.

> Roman.

