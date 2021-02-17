Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EAE31D3C4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 02:27:21 +0100 (CET)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCBce-0005xk-Bg
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 20:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZN-0003q3-S5; Tue, 16 Feb 2021 20:23:57 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52913 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lCBZK-00061S-Hf; Tue, 16 Feb 2021 20:23:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgKqL4hWHz9sSC; Wed, 17 Feb 2021 12:23:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613525022;
 bh=pjTyc4FHrtiV13iUjcbEOE/WSGkQmD0rc1KRiJm5/OA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N7SvxeH/gflgAOpEuIM0hVXk4gjSbfobwus6bD2Kp4mDrhEjfPqxAq3eXW8LoRA/F
 lRnaY1+64xzwypKJLb2mrD+r7+1/S4kBxxezejVAlHQ/bByZdxHLCdyfIx8YmYg8Wn
 9Mb2ERQNPwHxSEqGOt1IhZqYIQXJsEu11eSjSTWM=
Date: Wed, 17 Feb 2021 11:54:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 2/7] spapr_pci.c: simplify spapr_pci_unplug_request()
 function handling
Message-ID: <YCxpWr7Vdvohr3Wg@yekko.fritz.box>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-3-danielhb413@gmail.com>
 <20210216165059.284d2a21@bahia.lan>
 <5bdd86f2-0a00-bccf-65dc-236b064e8029@gmail.com>
 <20210216181654.7eaf0ff1@bahia.lan>
 <93b76a2a-5489-2e96-dd0f-ef39a13bb8d7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="emMEs6A6lNFL4b7N"
Content-Disposition: inline
In-Reply-To: <93b76a2a-5489-2e96-dd0f-ef39a13bb8d7@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--emMEs6A6lNFL4b7N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 02:44:44PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 2/16/21 2:16 PM, Greg Kurz wrote:
> > On Tue, 16 Feb 2021 13:09:43 -0300
> > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> >=20
> > >=20
> > >=20
> > > On 2/16/21 12:50 PM, Greg Kurz wrote:
> > > > On Thu, 11 Feb 2021 19:52:41 -0300
> > > > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> > > >=20
> > > > > When hotunplugging a PCI function we'll branch out the logic in t=
wo cases,
> > > > > function zero and non-zero. If non-zero, we'll call spapr_drc_det=
ach() and
> > > > > nothing else. If it's function zero, we'll loop it once between a=
ll the
> > > > > functions in the slot to call spapr_drc_detach() on them, and aft=
erwards
> > > > > we'll do another backwards loop where we'll signal the event to t=
he guest.
> > > > >=20
> > > > > We can simplify this logic. We can ignore all the DRC handling fo=
r non-zero
> > > > > functions, since we'll end up doing that regardless when unpluggi=
ng function
> > > > > zero. And for function zero, everything can be done in a single l=
oop, since
> > > > > tt doesn't matter if we end up marking the function DRCs as unplu=
g pending in
> > > > > backwards order or not, as long as we call spapr_drc_detach() bef=
ore issuing
> > > > > the hotunplug event to the guest.
> > > > >=20
> > > > > This will also avoid a possible scenario where the user starts to=
 hotunplug
> > > > > the slot, starting with a non-zero function, and then delays/forg=
ets to
> > > > > hotunplug function zero afterwards. This would keep the function =
DRC marked
> > > > > as unplug requested indefinitely.
> > > > >=20
> > > >=20
> > > > ... or until the guest is reset, which will no longer happen with t=
his
> > > > patch applied, i.e. breaks the long standing policy that machine re=
set
> > > > causes pending hot-unplug requests to succeed. I don't see an obvio=
us
> > > > reason to special case non-zero PCI functions.
> > >=20
> > > It's not possible to hotunplug the non-zero functions during machine =
reset for
> > > multifunction PCI devices. We need to unplug the entire slot, and tha=
t will only
> > > happen when function zero is unplugged. In fact, I think bad things w=
ill happen
> > > in this case you mentioned if we are forcing the removal of non-zero =
functions
> > > without function zero (spoiler: didn't test it).
> > >=20
> >=20
> > I've tested with the aggregation of two e1000e emulated devices:
> >=20
> > device_add e1000e,addr=3D10.1,id=3Dnetfn1
> > device_add e1000e,multifunction=3Don,addr=3D10.0,id=3Dnetfn0
> >=20
> > And I don't quite see what "bad things" could happen. We're resetting t=
he
> > machine to a stable state and the new OS instance will just not see the
> > removed function (just like only function netfn0 got added).
>=20
>=20
> Interesting. Thanks for looking this up.
>=20
> Given that the intention of this patch was a simplification of the existi=
ng
> design, without changing what we currently do regarding PCI functions and=
 unplug,
> and apparently it just did that, let's drop it.

I think that's best.  As Greg says, I think maintaining the behaviour
that reset completes pending hotplugs should be retained, and the
usual constraints on non-zero function hot-unplug don't apply at reset
time.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--emMEs6A6lNFL4b7N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsaVoACgkQbDjKyiDZ
s5IkeRAArywaYAOlstCXtPJcxz0ji+Mvmk3h3G6Ew+dyBWEy8tVGIW5rjtd7NrQQ
RSnbYsaVM/hCqe/GPcEhroMIBOsR7kAbinwxoNU1Q8HRkjaNcg6FO3PK799SbnWL
xhJCfqyrZTGi2/9Qna7kDes1KeT9P/BPBboEVTYidXPp5Kie0zrDlXPOZbXIwyOz
L5jHonBrU7IcaA1OpnmYXcsPykx3SIySS6RTQRXl+Kgh0ulS+aV4pmmHDq5G3CDg
lIV65oYMS1izN4b2H7zgCiIm/0/ZgFtMZgMyGs1mc6MdL0viuxucelMNvgJDhkN3
8dhuIQyYnOI3EOK3Vrb1GQHso+h8lD4XANV3UNcAFoCUd4oYyB8w3Z51E/OWI7CR
MZWaUTXMQttes9UQz5yzxZd+027MScq3WXtZC8WJbBhUE6FA5bvYUhk0fsXWvWzn
/ao7FdCRwJRKdeJGD/VfIeqKiIctwKgXvbgi69JjyfYLT2f2V5DgrMVtkEw5gfXh
g9+ezRv6O2vLipjdsO+00Tg0lAJHG39W3iq64iCsa016y9A5My3OGswQt450uh1L
iC3VbBYfS3Xy8dlgT16WLIIVbEm+kfeskfsCDI7mWAFlDMBpwjHYo+k2CSI5NviU
mzt2gB/1pXVjz7+P3QBdXxKUVFNBhb4hFUfXV3ISoXWOkYBAObc=
=SpRa
-----END PGP SIGNATURE-----

--emMEs6A6lNFL4b7N--

