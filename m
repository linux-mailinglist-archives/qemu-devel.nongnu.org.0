Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48EB4B167E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 20:43:33 +0100 (CET)
Received: from localhost ([::1]:39316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIFLo-0004PZ-Dx
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 14:43:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nIFHl-00022d-Jy
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 14:39:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nIFHh-0008PG-MF
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 14:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644521956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bs6X4ILcH6pFidGkEk2mt6g0x7G/pa4mljcf2tlW79c=;
 b=Kym4/pNdggWo36aPPDr2pNsZcYh9FBn/TBg1LFTREpTMyMW/ZgQ1GcXK4N3giOF8hr1CiJ
 w/s7lmt2vPkupseMq2J1Ry6zMpN5RuvBmuIme1445gotsdsHi3sXT6AHUbJ51/Lg/ObWAA
 Ku9FCyQlTpLSmuYssSAUrbYcuuGx3HQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-i3slqJ2hOS21QsKC_N0w1Q-1; Thu, 10 Feb 2022 14:39:05 -0500
X-MC-Unique: i3slqJ2hOS21QsKC_N0w1Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 j39-20020a05600c1c2700b0037becd18addso1889576wms.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 11:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ht9f6YXxna8mCfiHViGc8YGF+LN9DMGLoVkq91FLP34=;
 b=5lLtoeB0F+Z4t00jGMlnZ1PmI5iuOX9hsZZRTL+177jzbSKSTHbpKBZ3GJrH9e/mOf
 leFLUbCc8lLjSf401WRkqk59aMk8rKdX8vnxEmB6Tp1T9Y0qclesjxDbGt0oMFM1tVzF
 LukXTsKFI5pco9IRItMjv3kcz2zAJltxF33ZDOZNvhsYdm7PTj/LON4ZGLOCVjumdt+F
 CT9ZmApPG0er8td5EX8YRwrFwhllmseGC6UTpp5N3HjOdKg+mZuF5RUw0drGGjlReZIB
 7G4SACmjTixisOQHHtsYrni/cyaEnmiQ29wlG+fM3N1tIDb6iYcUe9UlTX3guVGwgXeD
 b9jA==
X-Gm-Message-State: AOAM530iJ+X7ijDEJp4CbZhbMR3ScbF4ROE19vtllMnpadNlTc9UJY2J
 POgkQTy3JXNZUMsv2+YHXNRXaweklXJ6w7t9/SEdd6OX0E0+cvJRaFWlMr+bGlOVVjn0/0iYtA8
 dwLvVtLbtXpxiPm4=
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr913874wrr.403.1644521944464; 
 Thu, 10 Feb 2022 11:39:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdoKwS7ewKQ7oHiUwoIMV0gdiZpLiq5aoQWHL7orzjaLS2WapCYTVuMiRQ2UL3bp9HBaI9/A==
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr913850wrr.403.1644521944123; 
 Thu, 10 Feb 2022 11:39:04 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t18sm20683961wri.34.2022.02.10.11.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 11:39:03 -0800 (PST)
Date: Thu, 10 Feb 2022 19:39:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] qapi, i386/sev: Add debug-launch-digest to
 launch-measure response
Message-ID: <YgVp1UN8t/nKq2+x@work-vm>
References: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
 <YffLgx48+mM2SiIX@redhat.com>
 <5f08d6d3-0279-50ed-5223-a9f3217e555d@linux.ibm.com>
 <YffxpK99EibxdXG4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YffxpK99EibxdXG4@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> On Mon, Jan 31, 2022 at 03:38:47PM +0200, Dov Murik wrote:
> >=20
> >=20
> > On 31/01/2022 13:44, Daniel P. Berrang=E9 wrote:
> > > On Mon, Jan 31, 2022 at 11:15:39AM +0000, Dov Murik wrote:
> > >> Currently the responses of QMP commands query-sev-launch-measure and
> > >> query-sev-attestation-report return just the signed measurement. In
> > >> order to validate it, the Guest Owner must know the exact guest laun=
ch
> > >> digest, besides other host and guest properties which are included i=
n
> > >> the measurement.
> > >>
> > >> The other host and guest details (SEV API major, SEV API minor, SEV
> > >> build, and guest policy) are all available via query-sev QMP command=
.
> > >> However, the launch digest is not available.  This makes checking th=
e
> > >> measurement harder for the Guest Owner, as it has to iterate through=
 all
> > >> allowed launch digests and compute the expected measurement.
> > >=20
> > > So more specifically to validate the measurement, the guest owner is
> > > currently calculating:
> > >=20
> > >    expected_measurement =3D HMAC(0x04 || API_MAJOR || API_MINOR || BU=
ILD ||
> > >                                GCTX.POLICY || GCTX.LD || MNONCE; GCTX=
.TIK)
> > >=20
> > > where GCTX.LD is
> > >=20
> > >     SHA256(FIRMWARE-CODE || KERNEL-HASHES-TABLE || VMSA-FOREACH-VCPU)
> > >=20
> > > and comparing expected_measurement to the actual measurement from
> > > query-sev-launch-measure.
> > >=20
> > >> Add a new field debug-launch-digest to the response of
> > >> query-sev-launch-measure and query-sev-attestation-report which incl=
udes
> > >> the guest launch digest, which is the SHA256 of all initial memory a=
dded
> > >> to the guest via sev_launch_update_data().
> > >=20
> > > So this new 'debug-launch-digest' field is returning GCTX.LD value
> > > above.
> > >=20
> >=20
> > Yes. Maybe rename it to gctx-ld ?
> >=20
> > hmmm, except at the moment it doesn't include the VMSAs, because I don'=
t
> > know an easy way to do it within QEMU :-( .  So the content of
> > debug-launch-digest is currently incorrect for SEV-ES guests.
>=20
> Yes, that comes back to the problem we've discussed previously about
> how to determine the correct expected VMSA content which has no easy
> answer.=20
>=20
>=20
> > The scenario we are encountering is that there's not one allowed
> > assignment to the parameters, but rather a more relaxed policy along th=
e
> > lines of:
> >=20
> > API_MAJOR.API_MINOR should be >=3D 12.34
> > BUILD should be >=3D 66
> > GCTX.POLICY should be 0x0 or 0x2
> > GCTX.LD can be one of these allowed OVMFs: {hash-a, hash-b, hash-c}
> >=20
> >=20
> > Having the values of API*, BUILD, POLICY from query-sev is very
> > comfortable for verifying they are in the allowed ranges.  But since th=
e
> > Guest Owner doesn't have GCTX.LD, they have to compute the measurement
> > for each of the allowed OVMF images.  Once the values are known and
> > "allowed", then the HMAC must be computed to see that the signed
> > measurement does indeed match.
>=20
> Ok, so the usage scenario is that the platform owner is deciding=20
> which OVMF build in use, not the guest owner. That guest owner just
> knows that it is an OVMF build from a set of builds published by the
> platform owner. Good enough if you trust the cloud owner in general,
> but want confidence that their compute host isn't compromised. Would
> need  an independantly reproducible build, if you don't trust the
> cloud owner at all.
>=20
>=20
> Assuming we've got 5 possible OVMF builds, currently we would need
> to calculate 5 HMACs over the inpuot data.
>=20
> With this extra piece of info, we only need to calculate 1 HMAC.
>=20
> So this is enabling a performance optimization, that could indeed
> be used in a production deployment.  The HMAC ops are not exactly
> performance intensive though until we get to the point of choosing
> between a huge number of possible OVMFs.
>=20
> If we can't get the VMSA info included, then the guest owner still
> needs a local copy of every possible OVMF binary that is valid. IOW
> this digest is essentially no more than a filename to identify which
> OVMF binary to calc the HMAC over.
>=20
> > Note: I guess that adding the hashes of kernel/initrd/cmdline here migh=
t
> > help too (for direct boot with kernel-hashes=3Don), and maybe the hash =
of
> > OVMF itself (on its own).
>=20
> IOW, I think there's only two scenarios that make sense
>=20
> 1. The combined launch digest over firmware, kernel hashes
>    and VMSA state.
>=20
> 2. Individual hashes for each of firmware, kernel hashes table and
>    VMSA state
>=20
> I think we should assume that anyone who has access to SEV-ES hardware
> is likely to run in SEV-ES policy, not SEV policy. So without VMSA
> state I think that (1) is of quite limited usefulness. (2) would
> be nicer to allow optimization of picking which OVMF blob to use,
> as you wouldn't need to figure out the cross-product of very valid
> OVMF and every valid kernel hashes table - the latter probably isn't
> even a finite bounded set.

I agree (2) is what we want - it's effectively a manifest of everything
that's been hashed.

I'm half sure we can get the VMSA; we probably need to add a new KVM ioctl =
to
get it.

> > More generally: within space/network constraints, give the Guest Owner
> > all the information it needs to compute the launch measurement.  There'=
s
> > a problem with OVMF there (we don't want to send the whole 4 MB over th=
e
> > QMP response, but given its hash we can't "extend" it to include the
> > kernel-hashes struct).
>=20
> Yeah its a shame we aren't just measuring the digest of each piece
> of information in  GCTX.LD, instead of measuring the raw information
> directly.
>=20
>=20
> I wonder if we're thinking of this at the wrong level though. Does
> it actually need to be QEMU providing this info to the guest owner ?
>=20
> Guest owners aren't going to be interacting with QEMU / QMP directly,
> nor are they likely to be interacting with libvirt directly. Their
> way into the public cloud will be via some high level API. eg the
> OpenStack Nova REST API, or the IBM Cloud API (whatever that may
> be). This high level mgmt infra is likely what is deciding which
> of the 'N' possible OVMF builds to pick for a given VM launch. It
> could easily just expose the full OVMF data to the user via its
> own API regardless of what query-sev does.
>=20
> Similarly if the cloud is choosing which kernel, out of N possible
> kernels to boot with, they could expose the raw kernel data somewhere
> in their API - we don't neccessarily need to expose that from QEMU.

It gets more interesting where it's the guest which picks the
kernel/initrd; imagine the setup where the cloud reads the kernel/initrd
from the guest disk and passes that to qemu; one of the update ideas
would be just to let the guest update from a repo at it's own pace;
so the attestor doesn't know whether to expect a new or old kernel
from the guest; but it does know it should be one of the approved
set of kernels.

Dave

> If we don't find a way to extract the VMSA data blob on the fly,
> then the cloud owner will need to public VMSA data somewhere out
> of band regardless.
>=20
>=20
>=20
> > > Is that really compelling enough to justify adding this extra
> > > info to the QAPI commands ? IME of writing code to verify the SEV
> > > measurement, there were many little ways I screwed up at first
> > > and having this field would not have made a significant difference
> > > to my debugging efforts.
> >=20
> > I think that adding the extra field is not that bad, even if it's usefu=
l
> > just for some cases.
> >=20
> > I'll be glad to get rid of the launch_memory buffer in my implementatio=
n
> > and replace it with a SHA256-context variable (but found none in QEMU).
> >  Other than that I don't think the suggested addition is too bad (in
> > fact, I would add some more info like kernel hashes.).
>=20
> Given we can't actually emit a valid GCTX.LD for SEV, my preference
> would be to just report the hashes of each piece of data that is a
> input to the GCTX.LD. eg report 'firmware-digest', 'kernel-digest',
> 'initrd-digest', 'cmdline-digest'.
>=20
> They can use firmware-digest as a identifier to locate the raw
> firmware data blob.
>=20
> They can use kernel-digest, initrd-digest, and cmdline-digest to
> compare against their list of expected kernel/initrd binaries, if
> the cloud owner controls them, and also to then build the kernl
> hashes table.
>=20
> They still have to figure out the VMSAs separately somehow, or
> the cloud mgmt layer can use all of this info to expose the
> raw data in their own higher level API.
>=20
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


