Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D073210A4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:02:33 +0100 (CET)
Received: from localhost ([::1]:45936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4Ii-0001Ua-T4
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lE4GM-0007z7-5q; Mon, 22 Feb 2021 01:00:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55039 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lE4GJ-0005r0-AK; Mon, 22 Feb 2021 01:00:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DkWjj0VxQz9sVR; Mon, 22 Feb 2021 16:59:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613973593;
 bh=OPq10RPObb7iaaRAMuLiu6mEuFGTs6vhVm4olP25IpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bhlaanmleg84VQo0KwngwlmY6ucT56UNdiWp8VCTRkF2ag/vzvc13I+efdz5WE/TH
 kt+0tTf7DJSZMFPgMNWhrzQMNUJFdTH7acr3xsZkXec4/ATOKAotmW6aSalL1jv2Gx
 KgSFBY+0AhJzWBY+QMO0E7GCqmjVmsWDaaP5Nf80=
Date: Mon, 22 Feb 2021 16:53:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 7/7] spapr_drc.c: use DRC reconfiguration to cleanup
 DIMM unplug state
Message-ID: <YDNG3L0YlUhmfeFc@yekko.fritz.box>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-8-danielhb413@gmail.com>
 <YCyAAe4dJzpsgQ0x@yekko.fritz.box>
 <4c6d20f5-4a49-dd0e-8a3a-449e2d61f542@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b11hPNoknxOM0JvN"
Content-Disposition: inline
In-Reply-To: <4c6d20f5-4a49-dd0e-8a3a-449e2d61f542@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--b11hPNoknxOM0JvN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 05:04:23PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 2/16/21 11:31 PM, David Gibson wrote:
> > On Thu, Feb 11, 2021 at 07:52:46PM -0300, Daniel Henrique Barboza wrote:
> > > Handling errors in memory hotunplug in the pSeries machine is more co=
mplex
> > > than any other device type, because there are all the complications t=
hat other
> > > devices has, and more.
> > >=20
> > > For instance, determining a timeout for a DIMM hotunplug must conside=
r if it's a
> > > Hash-MMU or a Radix-MMU guest, because Hash guests takes longer to ho=
tunplug DIMMs.
> > > The size of the DIMM is also a factor, given that longer DIMMs natura=
lly takes
> > > longer to be hotunplugged from the kernel. And there's also the guest=
 memory usage to
> > > be considered: if there's a process that is consuming memory that wou=
ld be lost by
> > > the DIMM unplug, the kernel will postpone the unplug process until th=
e process
> > > finishes, and then initiate the regular hotunplug process. The first =
two
> > > considerations are manageable, but the last one is a deal breaker.
> > >=20
> > > There is no sane way for the pSeries machine to determine the memory =
load in the guest
> > > when attempting a DIMM hotunplug - and even if there was a way, the g=
uest can start
> > > using all the RAM in the middle of the unplug process and invalidate =
our previous
> > > assumptions - and in result we can't even begin to calculate a timeou=
t for the
> > > operation. This means that we can't implement a viable timeout mechan=
ism for memory
> > > unplug in pSeries.
> > >=20
> > > Going back to why we would consider an unplug timeout, the reason is =
that we can't
> > > know if the kernel is giving up the unplug. Turns out that, sometimes=
, we can.
> > > Consider a failed memory hotunplug attempt where the kernel will erro=
r out with
> > > the following message:
> > >=20
> > > 'pseries-hotplug-mem: Memory indexed-count-remove failed, adding any =
removed LMBs'
> > >=20
> > > This happens when there is a LMB that the kernel gave up in removing,=
 and the LMBs
> > > marked for removal of the same DIMM are now being added back. This pr=
ocess happens
> >=20
> > We need to be a little careful about terminology here.  From the
> > guest's point of view, there's no such thing as a DIMM, only LMBs.
> > What the guest is doing here is essentially rejecting a single "index
> > + number" DRC unplug request, which corresponds to one DIMM on the
> > qemu side.
>=20
> I'll reword this paragraph to avoid using "DIMM" in the context of the gu=
est
> kernel.
>=20
> >=20
> > > in the pseries kernel in [1], dlpar_memory_remove_by_ic() into dlpar_=
add_lmb(), and
> > > after that update_lmb_associativity_index(). In this function, the ke=
rnel is configuring
> > > the LMB DRC connector again. Note that this is a valid usage in LOPAR=
, as stated in
> > > section "ibm,configure-connector RTAS Call":
> > >=20
> > > 'A subsequent sequence of calls to ibm,configure-connector with the s=
ame entry from
> > > the =E2=80=9Cibm,drc-indexes=E2=80=9D or =E2=80=9Cibm,drc-info=E2=80=
=9D property will restart the configuration of
> > > devices which were not completely configured.'
> > >=20
> > > We can use this kernel behavior in our favor. If a DRC connector reco=
nfiguration
> > > for a LMB that we marked as unplug pending happens, this indicates th=
at the kernel
> > > changed its mind about the unplug and is reasserting that it will kee=
p using the
> > > DIMM. In this case, it's safe to assume that the whole DIMM unplug wa=
s cancelled.
> > >=20
> > > This patch hops into rtas_ibm_configure_connector() and, in the scena=
rio described
> > > above, clear the unplug state for the DIMM device. This will not solv=
e all the
> > > problems we still have with memory unplug, but it will cover this cas=
e where the
> > > kernel reconfigures LMBs after a failed unplug. We are a bit more res=
ilient,
> > > without using an unreliable timeout, and we didn't make the remaining=
 error cases
> > > any worse.
> >=20
> > I wonder if we could use this as a beginning of a hotplug failure
> > reporting mechanism.  As noted, this is explicitly allowed by PAPR and
> > I think in general it makes sense that a configure-connector would
> > re-assert that the guest is using the resource and we can't unplug it.
> >=20
>=20
> I think it's worth looking into it. The kernel already does that in case =
of hotunplug
> failure of LMBs (at least in this particular case), so it's a matter of e=
valuating
> how hard it is to do the same for e.g. CPUs.
>=20
>=20
> > Could we extend guests to do an indicative configure-connector on any
> > unplug it knows it can't complete?  Or if configure-connector is too
> > disruptive could we use an (extra) H_SET_INDICATOR to "UNISOLATE"
> > state? If I'm reading right, that should be both permitted and a no-op
> > for existing PAPR implementations, so it should be a pretty safe way
> > to add that indication.
>=20
> A quick look in LOPAR shows that set_indicator can be used to report
> hotplug failures (which is a surprise to me, I wasn't aware of it):
>=20
> -----
> (Table 13.7, R1-13.5.3.4-4.)
>=20
> For all DR options: If this is a DR operation that involves the user inse=
rt-
> ing a DR entity, then if the firmware can determine that the inserted ent=
ity
> would cause a system disturbance, then the set-indicator RTAS call must
> not unisolate the entity and must return an error status which is unique =
to the
> particular error.
> -----
>=20
> The wording 'would cause a system disturbance' seems generic on purpose, =
giving
> the firmware/platform the prerrogative to refuse a hotplug for any given
> reason.

Right.  This is about firmware/platform detected errors, which is of
less interest to us at the moment than OS detected errors.

> I also read that there is no rule against using set_indicator with "uniso=
late" to
> an already unisolated resource. It would be a no-op.
>=20
> I don't think we would find fierce opposition if we propose an addendum s=
uch as:
>=20
> "For all DR options: If this is a DR operation that involves the user rem=
oving
> ing a DR entity, then if the partition operational system can determine t=
hat
> removing the entity would cause a system disturbance, then the set-indica=
tor RTAS
> call can be used with the 'unisolate' value to inform the platform that t=
he entity
> can not be removed at that time."
>=20
> This would be enough to accomplish what we're aiming for using set_indica=
tor and
> unisolate. Then we have 2 options to signal a failed unplug - configure-c=
onnector
> and unisolating the device. The guest can use whichever is easier or make=
s more
> sense.

Sounds good, let's do it.  Because it's a no-op currently, I also
think we can go ahead with an implementation even without waiting for
a PAPR change to be approved.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--b11hPNoknxOM0JvN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAzRtwACgkQbDjKyiDZ
s5JxzQ/+NEM/B5sRn4qubMdH73W5hKBOWTbtub1xtv4TwGYnae/RbYBqGXcNYuop
gjI/bHl6+jwPEfos1iKVTMJ6K49S4ubOa6KCakeSeq5825y5uFq9TchLkfBYMSxN
9/GFn2zRuMHDtOdFC9J+PJAJnvIddl+O2q52bJxhwpIuUV1jj6jYw8eCWkDuzpto
9q3qdOoAhkgumVNWzvMfj8rTk1i/ZkID0DCs+1aobLaIgU7zJhPRmH4Lwimn2p1/
+sDkyEWW7S6wP6k0MpwbzX/CvWS6MMC6QSpZTkcqynXVQMMbbS3DIaNseXpb+YSM
gr9inLnA232RC2R7StQwaj4+PgLAQTZWyM128WFdBXYRvfg4X9t+5HVBWghmhSu3
5GKRjPJkDzC8Sf25EANLEs1QYCl6enJFKN3cQccVn6kZ4kL97GKNvOHxLhEwTZVk
Gom5TL050iysNEFJXyfH2pz6DcAq/R3ai05xzIffci6KVWf/rP62hULaDdhclZlM
Zi5aehR+B4nvtQE4+Oec3fLUkt8PgnEYRug5c3zLj+eQV/o0bK3F6yBU3CVibtcW
oL3/ekevpwY7V65HWGdVcqoUJVPtwtmcevPgSZonOJdMoIkRZFFhU8QWoqtXLhhJ
SoUU80zR2sgW27TXk+miw4Fw21bCy9TH2kYx1vOniU3anzVn8gs=
=glss
-----END PGP SIGNATURE-----

--b11hPNoknxOM0JvN--

