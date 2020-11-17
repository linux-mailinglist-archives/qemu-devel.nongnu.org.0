Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974D92B5ED6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:07:39 +0100 (CET)
Received: from localhost ([::1]:49438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezlq-00074i-M8
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kezkc-0006Dy-5L
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:06:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kezkZ-0007Ka-Fp
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605614778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvqsqE951MYt1vWrPImFOglQ9D1PWXmfMW9ZPjWByzE=;
 b=etaJXIPHqSVgyVBtX4QmljC7U+bqCf9yUYyJURax0dy0qQBttwbKZ+NHO5s+EDXEEklAig
 oZbCa1ob2xde2X/A9GM4y7rxmOnFvgT1DJyX3wJbGuvYx/BdWd0oYdTWJP/CJk3J0xsURD
 WBvua0qQPRAtscwNV+RHgQDapaESzoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-zvhKNpJaO5yf_1wNqnD3Bw-1; Tue, 17 Nov 2020 07:06:15 -0500
X-MC-Unique: zvhKNpJaO5yf_1wNqnD3Bw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB98A1891E84;
 Tue, 17 Nov 2020 12:06:14 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FC305D9CC;
 Tue, 17 Nov 2020 12:06:10 +0000 (UTC)
Date: Tue, 17 Nov 2020 13:06:07 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PULL v3 26/32] s390x/pci: use a PCI Group structure
Message-ID: <20201117130607.30466d83.cohuck@redhat.com>
In-Reply-To: <3257afb9-b1ce-9104-6424-a9bcccce1bab@redhat.com>
References: <160426371498.24886.12193840637250368669.stgit@gimli.home>
 <160426456672.24886.4745091679423774723.stgit@gimli.home>
 <20201117124349.2e1e2fe3.cohuck@redhat.com>
 <3257afb9-b1ce-9104-6424-a9bcccce1bab@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 12:55:22 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 11/17/20 12:43 PM, Cornelia Huck wrote:
> > On Sun, 01 Nov 2020 14:02:46 -0700
> > Alex Williamson <alex.williamson@redhat.com> wrote:
> >  =20
> >> From: Pierre Morel <pmorel@linux.ibm.com>
> >>
> >> We use a S390PCIGroup structure to hold the information related to a
> >> zPCI Function group.
> >>
> >> This allows us to be ready to support multiple groups and to retrieve
> >> the group information from the host.
> >>
> >> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> >> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> >> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> >> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> >> ---
> >>  hw/s390x/s390-pci-bus.c         |   42 ++++++++++++++++++++++++++++++=
+++++++++
> >>  hw/s390x/s390-pci-inst.c        |   23 +++++++++++++--------
> >>  include/hw/s390x/s390-pci-bus.h |   10 +++++++++
> >>  3 files changed, 66 insertions(+), 9 deletions(-) =20
> >=20
> > I just bisected a regression down to this commit.
> >=20
> > s390x tcg guest on x86, virtio-pci devices are not detected. The
> > relevant feature bits are visible to the guest. Same breakage with
> > different guest kernels.
> >=20
> > KVM guests and s390x tcg guests on s390x are fine, so I assume an
> > endianness issue somewhere. Nothing jumps out to me, though.

(...)

> >> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> >> index 4eadd9e79416..c25b2a67efe0 100644
> >> --- a/hw/s390x/s390-pci-inst.c
> >> +++ b/hw/s390x/s390-pci-inst.c
> >> @@ -298,21 +298,25 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, u=
intptr_t ra)
> >>          stq_p(&resquery->edma, ZPCI_EDMA_ADDR);
> >>          stl_p(&resquery->fid, pbdev->fid);
> >>          stw_p(&resquery->pchid, 0);
> >> -        stw_p(&resquery->ug, 1);
> >> +        stw_p(&resquery->ug, ZPCI_DEFAULT_FN_GRP);
> >>          stl_p(&resquery->uid, pbdev->uid);
> >>          stw_p(&resquery->hdr.rsp, CLP_RC_OK);
> >>          break;
> >>      }
> >>      case CLP_QUERY_PCI_FNGRP: {
> >>          ClpRspQueryPciGrp *resgrp =3D (ClpRspQueryPciGrp *)resh;
> >> -        resgrp->fr =3D 1;
> >> -        stq_p(&resgrp->dasm, 0);
> >> -        stq_p(&resgrp->msia, ZPCI_MSI_ADDR);
> >> -        stw_p(&resgrp->mui, DEFAULT_MUI);
> >> -        stw_p(&resgrp->i, 128);
> >> -        stw_p(&resgrp->maxstbl, 128);
> >> -        resgrp->version =3D 0;
> >> =20
> >> +        ClpReqQueryPciGrp *reqgrp =3D (ClpReqQueryPciGrp *)reqh;
> >> +        S390PCIGroup *group;
> >> +
> >> +        group =3D s390_group_find(reqgrp->g); =20
>=20
> -        group =3D s390_group_find(reqgrp->g);
> +        group =3D s390_group_find(ldl_p(&reqgrp->g));

Yep, that's it :)

Do you want to send a proper patch, or should I do it?

>=20
> >> +        if (!group) {
> >> +            /* We do not allow access to unknown groups */
> >> +            /* The group must have been obtained with a vfio device *=
/
> >> +            stw_p(&resgrp->hdr.rsp, CLP_RC_QUERYPCIFG_PFGID);
> >> +            goto out;
> >> +        }
> >> +        memcpy(resgrp, &group->zpci_group, sizeof(ClpRspQueryPciGrp))=
;
> >>          stw_p(&resgrp->hdr.rsp, CLP_RC_OK);
> >>          break;
> >>      }


