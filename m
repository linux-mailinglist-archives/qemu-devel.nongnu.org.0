Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7892C89F2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:54:57 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmS0-0007ih-86
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kjmQK-0005r6-U3
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:53:12 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kjmQI-0004qJ-VU
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:53:12 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-R5WXuscpPGKOVNGyvklt7Q-1; Mon, 30 Nov 2020 11:53:02 -0500
X-MC-Unique: R5WXuscpPGKOVNGyvklt7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6700010151FC;
 Mon, 30 Nov 2020 16:53:01 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 537CC60C64;
 Mon, 30 Nov 2020 16:52:59 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH for-6.0 v2 0/3] spapr: Address the confusion between IPI
 numbers and vCPU ids
Date: Mon, 30 Nov 2020 17:52:55 +0100
Message-Id: <20201130165258.744611-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A regression was recently fixed in the sPAPR XIVE code for QEMU 5.2=0D
RC3 [1]. It boiled down to a confusion between IPI numbers and vCPU=0D
ids, which happen to be numerically equal in general, but are really=0D
different entities that can diverge in some setups. This was causing=0D
QEMU to misconfigure XIVE and to crash the guest.=0D
=0D
The confusion comes from XICS actually. Interrupt presenters in XICS=0D
are identified by a "server number" which is a 1:1 mapping to vCPU=0D
ids. The range of these "server numbers" is exposed to the guest in=0D
the "ibm,interrupt-server-ranges" property. A xics_max_server_number()=0D
helper was introduced at some point to compute the upper limit of the=0D
range. When XIVE was added, commit 1a518e7693c9 renamed the helper to=0D
spapr_max_server_number(). It ended up being used to size a bunch of=0D
things in XIVE that are per-vCPU, such as internal END tables or=0D
IPI ranges presented to the guest. The problem is that the maximum=0D
"server number" can be much higher (up to 8 times) than the actual=0D
number of vCPUs when the VSMT mode doesn't match the number of threads=0D
per core in the guest:=0D
=0D
    DIV_ROUND_UP(ms->smp.max_cpus * spapr->vsmt, ms->smp.threads);=0D
=0D
Since QEMU 4.2, the default behavior is to set spapr->vsmt to=0D
ms->smp.threads. Setups with custom VSMT settings will configure XIVE=0D
to use more HW resources than needed. This is a bit unfortunate but=0D
not extremely harmful, unless maybe if a lot of guests are running=0D
on the host. The sizing of the IPI range is more problematic though=0D
as it eventually led to [1].=0D
=0D
This series first does some renaming to make it clear when we're=0D
dealing with vCPU ids. It then fixes the machine code to pass=0D
smp.max_cpus to XIVE where appropriate. Since these changes are=0D
guest/migration visible, a machine property is added to keep the=0D
existing behavior for older machine types. The series is thus based=0D
on Connie's recent patch that introduces compat machines for=0D
QEMU 6.0.=0D
=0D
Based-on: 20201109173928.1001764-1-cohuck@redhat.com=0D
=0D
Note that we still use spapr_max_vcpu_ids() when activating the=0D
in-kernel irqchip because this is what both XICS-on-XIVE and XIVE=0D
KVM devices expect.=0D
=0D
[1] https://bugs.launchpad.net/qemu/+bug/1900241=0D
=0D
v2: - comments on v1 highlighted that problems mostly come from=0D
      spapr_max_server_number() which got misused over the years.=0D
      Updated the cover letter accordingly.=0D
    - completely new approach. Instead of messing with device properties,=
=0D
      pass the appropriate values to the IC backend handlers.=0D
    - rename a few things using the "max_vcpu_ids" wording instead of=0D
      "nr_servers" and "max_server_number"=0D
=0D
Greg Kurz (3):=0D
  spapr: Improve naming of some vCPU id related items=0D
  spapr/xive: Fix size of END table and number of claimed IPIs=0D
  spapr/xive: Fix the "ibm,xive-lisn-ranges" property=0D
=0D
 include/hw/ppc/spapr.h      |  3 ++-=0D
 include/hw/ppc/spapr_irq.h  | 12 ++++++------=0D
 include/hw/ppc/spapr_xive.h |  2 +-=0D
 include/hw/ppc/xics_spapr.h |  2 +-=0D
 hw/intc/spapr_xive.c        |  9 +++++----=0D
 hw/intc/spapr_xive_kvm.c    |  4 ++--=0D
 hw/intc/xics_kvm.c          |  4 ++--=0D
 hw/intc/xics_spapr.c        | 11 ++++++-----=0D
 hw/ppc/spapr.c              | 12 ++++++++----=0D
 hw/ppc/spapr_irq.c          | 34 ++++++++++++++++++++++++----------=0D
 10 files changed, 57 insertions(+), 36 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


