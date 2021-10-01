Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF741EB0F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 12:39:30 +0200 (CEST)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWFwv-0005WA-99
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 06:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mWFvk-0004ei-FQ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:38:16 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:25914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mWFvj-0002TL-5W
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:38:16 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-kHWm5EjnPpamAajYFaKdZg-1; Fri, 01 Oct 2021 06:38:11 -0400
X-MC-Unique: kHWm5EjnPpamAajYFaKdZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FE811966320;
 Fri,  1 Oct 2021 10:38:10 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A14760FB8;
 Fri,  1 Oct 2021 10:38:08 +0000 (UTC)
Date: Fri, 1 Oct 2021 12:38:07 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [RFC PATCH] spapr/xive: Allocate vCPU IPIs from local context
Message-ID: <20211001123807.296ea878@bahia.huguette>
In-Reply-To: <3e375254-1f6f-f630-77f0-a73d50d3b7df@kaod.org>
References: <20210922144120.1277504-1-clg@kaod.org>
 <20210923111249.33c41068@bahia.huguette>
 <71b9a1a8-7d76-ff7c-db47-7c8e9b4d87b5@kaod.org>
 <20210924154906.59da27f7@bahia.huguette>
 <6936294c-f236-2179-cd90-d45af74e7179@kaod.org>
 <20210924191313.36c9c8e9@bahia.huguette>
 <90e2ef32-8151-e65c-d64b-de58bb5337f1@kaod.org>
 <20210928091924.2b57bec4@bahia.huguette>
 <3e375254-1f6f-f630-77f0-a73d50d3b7df@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021 11:59:45 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> >>> Maybe it would be simpler to call xive_source_is_initialized() instea=
d of
> >>> xive_eas_is_valid() in cases like this, e.g. hcall code since it is s=
hared
> >>> between emulation and KVM ?
> >>
> >> Yes but we need a better check than :
> >>
> >>       if (lisn < SPAPR_XIRQ_BASE) {
> >>           return !!xive_get_field64(EAS_END_INDEX, xive->eat[lisn].w);
> >>       }
> >>
> >> This is more an heuristic than a precise test on the "validity" of
> >> a source at the KVM level.
> >>
> >=20
> > I guess we should be able to get kvmppc_xive_irq_state::valid from
> > KVM by making the KVM_DEV_XIVE_GRP_SOURCE attribute readable. Would
> > that be enough ?
>=20
> A bit slow may be. Or an extra bit in the XiveSource 'status' field
> to reflect KVM initialization.
>=20
> C.
>=20

Something like this ?

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 42f72b68fc00..6eba58b0ff10 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -232,6 +232,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int =
srcno, Error **errp)
 {
     SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
     uint64_t state =3D 0;
+    int ret;
=20
     assert(xive->fd !=3D -1);
=20
@@ -242,8 +243,15 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int=
 srcno, Error **errp)
         }
     }
=20
-    return kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_SOURCE, srcno, &st=
ate,
-                             true, errp);
+    ret =3D kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_SOURCE, srcno, &s=
tate,
+                            true, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    xsrc->status[srcno] |=3D XIVE_STATUS_KVM;
+
+    return 0;
 }
=20
 static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 445eccfe6b73..d85520beb64a 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -252,6 +252,7 @@ static inline hwaddr xive_source_esb_mgmt(XiveSource *x=
src, int srcno)
  * When doing an EOI, the Q bit will indicate if the interrupt
  * needs to be re-triggered.
  */
+#define XIVE_STATUS_KVM       0x8  /* Set when initialized in KVM */
 #define XIVE_STATUS_ASSERTED  0x4  /* Extra bit for LSI */
 #define XIVE_ESB_VAL_P        0x2
 #define XIVE_ESB_VAL_Q        0x1


