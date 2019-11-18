Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D213B100380
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 12:04:38 +0100 (CET)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWeph-00040Z-BU
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 06:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iWemq-00022u-Cq
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:01:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iWemo-0001c3-Re
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:01:39 -0500
Received: from 6.mo5.mail-out.ovh.net ([178.32.119.138]:52511)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iWemo-0001bh-Ju
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:01:38 -0500
Received: from player692.ha.ovh.net (unknown [10.108.42.184])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 4826325A70D
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 12:01:36 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id 58C80C1A342C;
 Mon, 18 Nov 2019 11:01:29 +0000 (UTC)
Date: Mon, 18 Nov 2019 12:01:28 +0100
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 for-5.0 0/8] ppc: Consolidate QOM links and pointers
 to the same object
Message-ID: <20191118120128.51701ccb@bahia.lan>
In-Reply-To: <87zhgtwn63.fsf@dusky.pond.sub.org>
References: <157383332103.165747.15204186097237659466.stgit@bahia.lan>
 <87zhgtwn63.fsf@dusky.pond.sub.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8795248598321699214
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeghedgvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.119.138
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Nov 2019 10:26:12 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Greg Kurz <groug@kaod.org> writes:
> 
> > There's a recurring pattern in the code where a const link is added to a
> > newly instanciated object and the link is then used in the object's realize
> > function to keep a pointer to the QOM entity which the link points to.
> >
> > void create_obj_b(Object *obj_a)
> > {
> >     Object *obj_b;
> >
> >     obj_b = object_new(TYPE_B);
> >     object_property_add_const_link(obj_b, "link-to-a", obj_a, &error_abort);
> >     object_property_set_bool(obj_b, true, "realized", &error_abort);
> > }
> >
> > void object_b_realize(DeviceState *dev, Error **errp)
> > {
> >     Object *obj_a;
> >
> >     obj_a = object_property_get_link(OBJECT(dev), "link-to-a", errp);
> >     if (!obj_a) {
> >         return;
> >     }
> >
> >     obj_b->obj_a = A(obj_a); // If obj_b->obj_a is changed, the link property
> >                              // still points to the original obj_a that was
> >                              // passed to object_property_add_const_link()
> > }
> >
> > Confusing bugs could arise if the pointer and the link go out of sync for
> > some reason. This can be avoided if the property is defined to directly use
> > the pointer with the DEFINE_PROP_LINK() macro.
> >
> > This series just does that for all occurences of the fragile pattern in
> > the XIVE and PNV code.
> 
> Have you looked for the pattern elsewhere?
> 

No I was focusing on the XICS/XIVE interrupt controller code for PPC machines
only. I'll have a broader look.

