Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7B2191F76
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 03:51:44 +0100 (CET)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGw8t-000845-8J
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 22:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jGw88-0007dB-OB
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 22:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jGw86-0008Rk-Mw
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 22:50:55 -0400
Received: from [192.146.154.243] (port=56318 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jGw86-0008QS-Hf
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 22:50:54 -0400
Received: from localhost.localdomain (unknown [10.40.36.165])
 by mcp01.nutanix.com (Postfix) with ESMTP id 182131006FEA;
 Wed, 25 Mar 2020 02:50:51 +0000 (UTC)
Date: Tue, 24 Mar 2020 22:50:46 -0400
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: Qemu master crashing on boot when using file backend for memory
Message-ID: <20200325024924.GA1518@localhost.localdomain>
References: <20200312053648.GA17365@localhost.localdomain>
 <20200312115450.38c88206@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200312115450.38c88206@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.243
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 12, 2020 at 11:54:50AM +0100, Igor Mammedov wrote:
>=20
> On Thu, 12 Mar 2020 01:36:48 -0400
> Raphael Norwitz <raphael.norwitz@nutanix.com> wrote:
>=20
> > When I try run master qemu I am hitting a divide by zero error. It se=
ems
> > to be coming from util/oslib-posix.c in touch_all_pages(). see line 4=
77:
> >=20
> > numpages_per_thread =3D numpages / memset_num_threads;
> >=20
> > Poking around the crash dumps, I can see that the smp_cpus parameter
> > passed in to touch_all_pages() is 0. Going up the stack to
> > host_memory_backend_memory_complete() I see backend->prealloc_threads=
 is
> > also 0.
> >=20
> > Here=E2=80=99s how I am running qemu
> >=20
> > ./x86_64-softmmu/qemu-system-x86_64 \
> > 	-kernel /boot/vmlinuz-3.10.0-1062.el7.x86_64  \
> >  	-netdev user,id=3Dnet0,hostfwd=3Dtcp::2250-:22 \
> > 	-device e1000e,netdev=3Dnet0 \
> > 	-m 1G \
> > 	-initrd /boot/initramfs-3.10.0-1062.el7.x86_64.img  \
> > 	-object memory-backend-file,id=3Dram-node0,prealloc=3Dyes,mem-path=3D=
mem,share=3Dyes,size=3D1G \
> > 	-numa node,nodeid=3D0,cpus=3D0,memdev=3Dram-node0=20
> >=20
> > I don't see this error on a slightly older qemu, as of commit 105b07f=
1
> > (January 27th).
> >=20
> > Interestingly when I remove the memory-backend-file parameter I don=E2=
=80=99t
> > see the error, i.e. this works:
> >=20
> > ./x86_64-softmmu/qemu-system-x86_64 \
> > 	-kernel /boot/vmlinuz-3.10.0-1062.el7.x86_64  \
> >  	-netdev user,id=3Dnet0,hostfwd=3Dtcp::2250-:22 \
> > 	-device e1000e,netdev=3Dnet0 \
> > 	-m 1G \
> > 	-initrd /boot/initramfs-3.10.0-1062.el7.x86_64.img
> >=20
> > Looking at the blame data for backends/hostmem.c I see commit ffac16f=
a
> > introduced some churn in this part of the code. Has anyone else seen
> > this issue? Could I be doing something wrong here?
>=20
> It's know issue, see
>  "[PATCH] oslib-posix: initialize mutex and condition variable
> for a fix
> >=20
>

I'm testing on qemu master now. Looks like this patch has been merged
and I'm still seeing the same crash.

