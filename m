Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7319036F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 15:50:52 +0200 (CEST)
Received: from localhost ([::1]:56494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hycd1-0005EF-VR
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 09:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1hycc7-0004fh-43
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:49:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hycc5-0004ce-HY
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:49:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55686)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hycc5-0004bT-Bx
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:49:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EDCF46908D;
 Fri, 16 Aug 2019 13:49:51 +0000 (UTC)
Received: from localhost (ovpn-116-32.gru2.redhat.com [10.97.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9C778427A;
 Fri, 16 Aug 2019 13:49:48 +0000 (UTC)
Date: Fri, 16 Aug 2019 10:49:46 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Message-ID: <20190816134946.GZ3908@habkost.net>
References: <20190815183803.13346-1-ehabkost@redhat.com>
 <20190815183803.13346-2-ehabkost@redhat.com>
 <107f312a-15cd-da33-f0d6-5777bbb53150@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <107f312a-15cd-da33-f0d6-5777bbb53150@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 16 Aug 2019 13:49:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] pc: Fix error message on die-id
 validation
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
Cc: Peter Krempa <pkrempa@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 16, 2019 at 09:04:16AM +0800, Like Xu wrote:
> Hi,
> 
> On 2019/8/16 2:38, Eduardo Habkost wrote:
> > The error message for die-id range validation is incorrect.  Example:
> > 
> >    $ qemu-system-x86_64 -smp 1,sockets=6,maxcpus=6 \
> >      -device qemu64-x86_64-cpu,socket-id=1,die-id=1,core-id=0,thread-id=0
> >    qemu-system-x86_64: -device qemu64-x86_64-cpu,socket-id=1,die-id=1,core-id=0,thread-id=0: \
> >      Invalid CPU die-id: 1 must be in range 0:5
> > 
> > The actual range for die-id in this example is 0:0.
> 
> There is one die per socket by default.
> 
> The case sockets=6 means there are 6 dies by default
> and the range for die-id is 0:5.
> 

I don't understand why you say that.  die-id supposed to identify
a die inside a socket.  The code below is already checking for
(cpu->die_id > pcms->smp_dies - 1) because of that.


> > 
> > Fix the error message to use smp_dies and print the correct range.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >   hw/i386/pc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 549c437050..24b03bb49c 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -2412,7 +2412,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
> >               return;
> >           } else if (cpu->die_id > pcms->smp_dies - 1) {
> >               error_setg(errp, "Invalid CPU die-id: %u must be in range 0:%u",
> > -                       cpu->die_id, max_socket);
> > +                       cpu->die_id, pcms->smp_dies - 1);
> >               return;
> >           }
> >           if (cpu->core_id < 0) {
> > 
> 

-- 
Eduardo

