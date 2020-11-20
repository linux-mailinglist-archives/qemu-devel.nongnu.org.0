Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2B82BB1C9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:53:23 +0100 (CET)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAb4-0006qj-Bn
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV5-0008UT-Sa
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:14 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:60686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV2-00057u-Ii
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:11 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-DMiUE2lSO1mAhJKNP9UXVg-1; Fri, 20 Nov 2020 12:46:49 -0500
X-MC-Unique: DMiUE2lSO1mAhJKNP9UXVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C221DDE5;
 Fri, 20 Nov 2020 17:46:48 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F33825C1D5;
 Fri, 20 Nov 2020 17:46:46 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 0/8] spapr: Address the confusion between IPI numbers
 and vCPU ids
Date: Fri, 20 Nov 2020 18:46:38 +0100
Message-Id: <20201120174646.619395-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A regression was recently fixed in the sPAPR XIVE code for QEMU 5.2=0D
RC3 [1]. It boiled down to a confusion between IPI numbers and vCPU=0D
ids, which happen to be numerically equal in general, but are really=0D
different entities that can diverge in some setups. When this happens,=0D
we end up misconfiguring XIVE in a way that is almost fatal for the=0D
guest.=0D
=0D
The confusion comes from XICS which has historically assumed equality=0D
between interrupt server numbers and vCPU ids, as mentionned in a=0D
comment back from 2011 in the linux kernel icp_native_init_one_node()=0D
function:=0D
=0D
    /* This code does the theorically broken assumption that the interrupt=
=0D
     * server numbers are the same as the hard CPU numbers.=0D
     * This happens to be the case so far but we are playing with fire...=
=0D
     * should be fixed one of these days. -BenH.=0D
     */=0D
=0D
This assumption crept into QEMU through the "ibm,interrupt-server-ranges"=
=0D
property of the "interrupt-controller" node in the DT. This property=0D
contains ranges of consecutive vCPU ids defined as (first id, # of ids).=0D
In the case of QEMU, we define a single range starting from 0 up to the=0D
highest vCPU id, as returned by spapr_max_server_number(). This has=0D
always been associated to the "nr_servers" wording when naming variables=0D
or function arguments. When XIVE got added, we introduced an sPAPR IRQ=0D
abstraction to be able to control several interrupt controller backends.=0D
The sPAPR IRQ base class provides a dt() handler used to populate the=0D
"interrupt-controller" node in the DT. This handler takes an "nr_server"=0D
argument inherited from XICS and we ended up using it to populate the=0D
"ibm,xive-lisn-ranges" property used with XIVE, which has completely=0D
different semantics. It contain ranges of interrupt numbers that the=0D
guest can use for any purpose. Since one obvious purpose is IPI, its=0D
first range should just be able to accomodate all possible vCPUs.=0D
In the case of QEMU, we define a single range starting from 0 up=0D
to "nr_server" but we should rather size it to the number of vCPUs=0D
actually (ie. smp.max_cpus).=0D
=0D
This series aims at getting rid of the "nr_server" argument in the=0D
sPAPR IC handlers. Since both the highest possible vCPU id and the=0D
maximum number of vCPUs are invariants for XICS and XIVE respectively,=0D
let's make them device properties to be configured by the machine when=0D
it creates the interrupt controllers and use them where needed.=0D
=0D
This doesn't cause any visible change to setups using the default=0D
VSMT machine settings. This changes "ibm,xive-lisn-ranges" for=0D
setups that mess with VSMT, but this is acceptable since linux=0D
only allocates one interrupt per vCPU and the higher part of the=0D
range was never used.=0D
=0D
[1] https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D6d24795ee7e3199d199d3=
c415312c93382ad1807=0D
=0D
Greg Kurz (8):=0D
  spapr/xive: Turn some sanity checks into assertions=0D
  spapr/xive: Introduce spapr_xive_nr_ends()=0D
  spapr/xive: Add "nr-servers" property=0D
  spapr/xive: Add "nr-ipis" property=0D
  spapr/xics: Drop unused argument to xics_kvm_has_broken_disconnect()=0D
  spapr/xics: Add "nr-servers" property=0D
  spapr: Drop "nr_servers" argument of the sPAPR IC activate() operation=0D
  spapr: Drop "nr_servers" argument of the sPAPR IC dt() operation=0D
=0D
 include/hw/ppc/spapr.h      |  4 +--=0D
 include/hw/ppc/spapr_irq.h  |  9 ++---=0D
 include/hw/ppc/spapr_xive.h | 25 ++++++++++++-=0D
 include/hw/ppc/xics_spapr.h | 23 +++++++++---=0D
 hw/intc/spapr_xive.c        | 72 ++++++++++++++++++++++---------------=0D
 hw/intc/spapr_xive_kvm.c    |  4 +--=0D
 hw/intc/xics_kvm.c          |  4 +--=0D
 hw/intc/xics_spapr.c        | 45 ++++++++++++++---------=0D
 hw/ppc/spapr.c              |  7 ++--=0D
 hw/ppc/spapr_irq.c          | 27 +++++++-------=0D
 10 files changed, 141 insertions(+), 79 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


