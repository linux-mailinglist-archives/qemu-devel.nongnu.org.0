Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E92338357
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 02:59:05 +0100 (CET)
Received: from localhost ([::1]:48778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKX4y-0006bq-8F
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 20:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@redhat.com>)
 id 1lKX1o-0004VY-Hq
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:55:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgibson@redhat.com>)
 id 1lKX1l-0007Dw-3L
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615514138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W75qg3A+18IW0Ab9lXSDws7sc4b8UPx0TijdkPTOKuc=;
 b=YQwP50AFcaoTCrs5v6J+PvstahfVU2lzV27oS4JkAcyX2NEebmeubBBpYGlivdxfzNfZxx
 r+3KYyj0AHXs5AMoEaRuuQ6HZYsYEduiSlXPTA3Jpr+ZrJKFzOzAlj1y/4Vwx3TmgnehTz
 12dtiSBzAK49tgRjIikg6APAfRMeFVk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-zr2ZNnbMPQ2BRftyE2bLIw-1; Thu, 11 Mar 2021 20:55:34 -0500
X-MC-Unique: zr2ZNnbMPQ2BRftyE2bLIw-1
Received: by mail-pf1-f199.google.com with SMTP id j7so13564919pfa.14
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 17:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Z5CTa2IF35bcRbs4RXMAF8l3VVl+04Ig/+0m6wggE1Q=;
 b=cuUrYequwOLHWirtqDMDGirmai5fE6zwGGrXOJmmOX+2mja9J6MSwteFFGhpS3rXFa
 VcJIfItKEhD4FBxRvpsd6ACZIxK1TXCjQkA6RHqGFfQhMf4VlA6dftn15wAZDM32+ho4
 dokD6AP6lHnaCl+YWW2EVzwTa8gP4zgIWOzFKvXaQmJ+Kjw/yhd+x87hoIy9mJcXGW+K
 yCkM8Z0W32jGta/fkCK68xB+m9PTcrfS7BOmrlKuZPimJBGXz8IHgJT/4auoCn65Pbsp
 Edhq812DW9KdFgCgbGHgsPFkKZP3BfXF3232/zXPb8qluu94ewwOrcbIXEzgrWTJJ8X2
 1/WA==
X-Gm-Message-State: AOAM531JfmYaLonsqEmKm+1mT27SzyRqk0N3sIbCNaNxVVYuAF7YJ5Nm
 GDHVFfPIgDq6RUMHlcgUwbEUTm/g/qi2H0JML7rPpqNAEyKWJkKx+tHwabzq35OkYkuHH4WOizh
 XHXZJnVZRwRi88yo=
X-Received: by 2002:a17:902:e74e:b029:e5:bde4:2b80 with SMTP id
 p14-20020a170902e74eb02900e5bde42b80mr11275440plf.44.1615514133856; 
 Thu, 11 Mar 2021 17:55:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJympsk+LidDvK5EeYm6Stjm37exit/hbmSiiiIDl+mA4zFHfnIDUv+reofvNjPwOgOnFGkTOQ==
X-Received: by 2002:a17:902:e74e:b029:e5:bde4:2b80 with SMTP id
 p14-20020a170902e74eb02900e5bde42b80mr11275419plf.44.1615514133506; 
 Thu, 11 Mar 2021 17:55:33 -0800 (PST)
Received: from yekko.fritz.box ([2001:4479:e200:1100:3c24:4d96:ea81:be55])
 by smtp.gmail.com with ESMTPSA id b9sm3377547pgn.42.2021.03.11.17.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 17:55:33 -0800 (PST)
Date: Fri, 12 Mar 2021 12:55:27 +1100
From: David Gibson <dgibson@redhat.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 1/8] powerpc/xive: Use cpu_to_node() instead of
 ibm,chip-id property
Message-ID: <20210312125527.61bc269c@yekko.fritz.box>
In-Reply-To: <92edbc26-4cb5-6e2f-00ff-43a3dca43759@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-2-clg@kaod.org>
 <20210308181359.789c143b@bahia.lan>
 <8dd98e22-1f10-e87b-3fe3-e786bc9a8d71@kaod.org>
 <3180b5c6-e61f-9c5f-3c80-f10e69dc5785@linux.ibm.com>
 <92edbc26-4cb5-6e2f-00ff-43a3dca43759@kaod.org>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgibson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgibson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Henrique Barboza <danielhb@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 18:26:35 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 3/9/21 6:08 PM, Daniel Henrique Barboza wrote:
> >=20
> >=20
> > On 3/9/21 12:33 PM, C=C3=A9dric Le Goater wrote: =20
> >> On 3/8/21 6:13 PM, Greg Kurz wrote: =20
> >>> On Wed, 3 Mar 2021 18:48:50 +0100
> >>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >>> =20
> >>>> The 'chip_id' field of the XIVE CPU structure is used to choose a
> >>>> target for a source located on the same chip when possible. This fie=
ld
> >>>> is assigned on the PowerNV platform using the "ibm,chip-id" property
> >>>> on pSeries under KVM when NUMA nodes are defined but it is undefined=
 =20
> >>>
> >>> This sentence seems to have a syntax problem... like it is missing an
> >>> 'and' before 'on pSeries'. =20
> >>
> >> ah yes, or simply a comma.
> >> =20
> >>>> under PowerVM. The XIVE source structure has a similar field
> >>>> 'src_chip' which is only assigned on the PowerNV platform.
> >>>>
> >>>> cpu_to_node() returns a compatible value on all platforms, 0 being t=
he
> >>>> default node. It will also give us the opportunity to set the affini=
ty
> >>>> of a source on pSeries when we can localize them.
> >>>> =20
> >>>
> >>> IIUC this relies on the fact that the NUMA node id is =3D=3D to chip =
id
> >>> on PowerNV, i.e. xc->chip_id which is passed to OPAL remain stable
> >>> with this change. =20
> >>
> >> Linux sets the NUMA node in numa_setup_cpu(). On pseries, the hcall
> >> H_HOME_NODE_ASSOCIATIVITY returns the node id if I am correct (Daniel
> >> in Cc:) =20
>  [...] =20
> >>
> >> On PowerNV, Linux uses "ibm,associativity" property of the CPU to find
> >> the node id. This value is built from the chip id in OPAL, so the
> >> value returned by cpu_to_node(cpu) and the value of the "ibm,chip-id"
> >> property are unlikely to be different.
> >>
> >> cpu_to_node(cpu) is used in many places to allocate the structures
> >> locally to the owning node. XIVE is not an exception (see below in the
> >> same patch), it is better to be consistent and get the same informatio=
n
> >> (node id) using the same routine.
> >>
> >>
> >> In Linux, "ibm,chip-id" is only used in low level PowerNV drivers :
> >> LPC, XSCOM, RNG, VAS, NX. XIVE should be in that list also but skiboot
> >> unifies the controllers of the system to only expose one the OS. This
> >> is problematic and should be changed but it's another topic.
> >>
> >> =20
> >>> On the other hand, you have the pSeries case under PowerVM that
> >>> doesn't xc->chip_id, which isn't passed to any hcall AFAICT. =20
> >>
> >> yes "ibm,chip-id" is an OPAL concept unfortunately and it has no meani=
ng
> >> under PAPR. xc->chip_id on pseries (PowerVM) will contains an invalid
> >> chip id.
> >>
> >> QEMU/KVM exposes "ibm,chip-id" but it's not used. (its value is not
> >> always correct btw) =20
> >=20
> >=20
> > If you have a way to reliably reproduce this, let me know and I'll fix =
it
> > up in QEMU. =20
>=20
> with :
>=20
>    -smp 4,cores=3D1,maxcpus=3D8 -object memory-backend-ram,id=3Dram-node0=
,size=3D2G -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memdev=3Dram-node0 -=
object memory-backend-ram,id=3Dram-node1,size=3D2G -numa node,nodeid=3D1,cp=
us=3D2-3,cpus=3D6-7,memdev=3Dram-node1
>=20
> # dmesg | grep numa
> [    0.013106] numa: Node 0 CPUs: 0-1
> [    0.013136] numa: Node 1 CPUs: 2-3
>=20
> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
> =09=09ibm,chip-id =3D <0x01>;
> =09=09ibm,chip-id =3D <0x02>;
> =09=09ibm,chip-id =3D <0x00>;
> =09=09ibm,chip-id =3D <0x03>;
>=20
> with :
>=20
>   -smp 4,cores=3D4,maxcpus=3D8,threads=3D1 -object memory-backend-ram,id=
=3Dram-node0,size=3D2G -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memdev=
=3Dram-node0 -object memory-backend-ram,id=3Dram-node1,size=3D2G -numa node=
,nodeid=3D1,cpus=3D2-3,cpus=3D6-7,memdev=3Dram-node1
>=20
> # dmesg | grep numa
> [    0.013106] numa: Node 0 CPUs: 0-1
> [    0.013136] numa: Node 1 CPUs: 2-3
>=20
> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
> =09=09ibm,chip-id =3D <0x00>;
> =09=09ibm,chip-id =3D <0x00>;
> =09=09ibm,chip-id =3D <0x00>;
> =09=09ibm,chip-id =3D <0x00>;
>=20
> I think we should simply remove "ibm,chip-id" since it's not used and
> not in the PAPR spec.

As I mentioned to Daniel on our call this morning, oddly it *does*
appear to be used in the RHEL kernel, even though that's 4.18 based.
This patch seems to have caused a minor regression; not in the
identification of NUMA nodes, but in the number of sockets shown be
lscpu, etc.  See https://bugzilla.redhat.com/show_bug.cgi?id=3D1934421
for more information.

Since the value was used by some PAPR kernels - even if they shouldn't
have - I think we should only remove this for newer machine types.  We
also need to check what we're not supplying that the guest kernel is
showing a different number of sockets than specified on the qemu
command line.

>=20
> Thanks,
>=20
> C.
>=20
> =20
>=20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>  [...] =20
>=20


--=20
David Gibson <dgibson@redhat.com>
Principal Software Engineer, Virtualization, Red Hat


