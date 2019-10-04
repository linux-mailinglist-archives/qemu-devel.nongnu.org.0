Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B2CB4A5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 08:55:55 +0200 (CEST)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGHVK-0002Nj-7g
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 02:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iGHSr-0001VE-R4
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 02:53:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iGHSq-000659-N8
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 02:53:21 -0400
Received: from 7.mo178.mail-out.ovh.net ([46.105.58.91]:46804)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iGHSq-00064D-H5
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 02:53:20 -0400
Received: from player730.ha.ovh.net (unknown [10.108.54.209])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id D7E727AF89
 for <qemu-devel@nongnu.org>; Fri,  4 Oct 2019 08:53:17 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 6BB00A6EB1E5;
 Fri,  4 Oct 2019 06:53:13 +0000 (UTC)
Date: Fri, 4 Oct 2019 08:52:57 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/7] spapr, xive: Turn "nr-ends" property into
 "nr-servers" property
Message-ID: <20191004085257.53bcfcce@bahia.lan>
In-Reply-To: <6313a1ea-f891-d7a0-c5f1-ecf656b58bc3@kaod.org>
References: <157010404888.246126.9768030542733152637.stgit@bahia.lan>
 <157010406203.246126.13381271918474281392.stgit@bahia.lan>
 <20191004040725.GB27597@umbus.fritz.box>
 <6313a1ea-f891-d7a0-c5f1-ecf656b58bc3@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 17031769365850265995
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedtgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.58.91
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Oct 2019 07:53:13 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> >> @@ -283,11 +292,13 @@ static void spapr_xive_realize(DeviceState *dev,=
 Error **errp)
> >>          return;
> >>      }
> >> =20
> >> -    if (!xive->nr_ends) {
> >> -        error_setg(errp, "Number of interrupt needs to be greater 0");
> >> +    if (!xive->nr_servers) {
> >> +        error_setg(errp, "Number of interrupt servers must be greater=
 than 0");
> >>          return;
> >>      }
> >> =20
> >> +    xive->nr_ends =3D spapr_xive_vcpu_id_to_end_idx(xive->nr_servers);
> >=20
> > I'd prefer not to store both nr_servers and nr_servers * 8 in the
> > structure.  I think you just want xive->nr_servers, then derive it any
> > any places that current look at xive->nr_ends.
>=20
> Yes I agree. This is a small change.
>=20

I'm afraid it isn't that simple (see my other mail).

> C.=20

