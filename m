Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D8FA3D36
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 19:49:29 +0200 (CEST)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3l1c-0000UQ-3f
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 13:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1i3kyW-0008AU-Er
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 13:46:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1i3kyC-0003bM-0h
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 13:46:15 -0400
Received: from 8.mo68.mail-out.ovh.net ([46.105.74.219]:42943)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1i3kyA-0003Vb-DV
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 13:45:54 -0400
Received: from player157.ha.ovh.net (unknown [10.109.160.232])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id BAD3C140BB7
 for <qemu-devel@nongnu.org>; Fri, 30 Aug 2019 19:45:50 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 718B5938C274;
 Fri, 30 Aug 2019 17:45:45 +0000 (UTC)
Date: Fri, 30 Aug 2019 19:45:43 +0200
From: Greg Kurz <groug@kaod.org>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Message-ID: <20190830194543.6c1f5776@bahia.lan>
In-Reply-To: <20190830163413.GH4674@redhat.com>
References: <20190830161345.22436-1-lvivier@redhat.com>
 <20190830163413.GH4674@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 6975512876504226155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.74.219
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH] pseries: do not allow
 memory-less/cpu-less NUMA node
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Aug 2019 17:34:13 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Aug 30, 2019 at 06:13:45PM +0200, Laurent Vivier wrote:
> > When we hotplug a CPU on memory-less/cpu-less node, the linux kernel
> > crashes.
> >=20
> > This happens because linux kernel needs to know the NUMA topology at
> > start to be able to initialize the distance lookup table.
> >=20
> > On pseries, the topology is provided by the firmware via the existing
> > CPUs and memory information. Thus a node without memory and CPU cannot =
be
> > discovered by the kernel.
> >=20
> > To avoid the kernel crash, do not allow to start pseries with empty
> > nodes.
>=20
> This describes one possible guest OS. Is there any reasonable chance
> that a non-Linux guest might be able to handle this situation correctly,
> or do you expect any guest to have the same restriction ?
>=20

I can try to grab an AIX image and give a try, but anyway this looks like
a very big hammer to me... :-\

> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > ---
> >  hw/ppc/spapr.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
>=20
> Regards,
> Daniel


