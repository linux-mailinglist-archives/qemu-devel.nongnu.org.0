Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EAD2D47B4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:19:23 +0100 (CET)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn37a-0005wu-8N
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2q6-0006bp-8X
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:18 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:43244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2q0-0000qu-Uv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:17 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-6mmILqnOMAiJptRDhaRkHQ-1; Wed, 09 Dec 2020 12:00:55 -0500
X-MC-Unique: 6mmILqnOMAiJptRDhaRkHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B968107ACE4;
 Wed,  9 Dec 2020 17:00:54 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBB7C5D6BA;
 Wed,  9 Dec 2020 17:00:52 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] spapr: Drop some users of qdev_get_machine()
Date: Wed,  9 Dec 2020 18:00:46 +0100
Message-Id: <20201209170052.1431440-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Accessing the machine state using the global qdev_get_machine() function=0D
isn't generally recommended. In a bunch of places in the sPAPR code, the=0D
machine state can be obtained from the caller actually.=0D
=0D
Greg Kurz (6):=0D
  spapr: Add an "spapr" property to sPAPR CPU core=0D
  spapr: Add an "spapr" property to sPAPR PHB=0D
  spapr: Pass sPAPR machine state down to spapr_pci_switch_vga()=0D
  spapr: Don't use qdev_get_machine() in spapr_msi_write()=0D
  spapr: Pass sPAPR machine state to some RTAS events handling functions=0D
  target/ppc: Add mce_req_event() handler to PPCVirtualHypervisorClass=0D
=0D
 include/hw/pci-host/spapr.h     |  1 +=0D
 include/hw/ppc/spapr.h          |  5 +++--=0D
 include/hw/ppc/spapr_cpu_core.h |  2 ++=0D
 target/ppc/cpu.h                |  2 ++=0D
 hw/ppc/spapr.c                  |  9 +++++++++=0D
 hw/ppc/spapr_cpu_core.c         | 17 +++++++----------=0D
 hw/ppc/spapr_events.c           | 26 +++++++++++++-------------=0D
 hw/ppc/spapr_hcall.c            |  7 ++++---=0D
 hw/ppc/spapr_pci.c              | 22 +++++++++-------------=0D
 hw/ppc/spapr_pci_nvlink2.c      |  2 +-=0D
 target/ppc/kvm.c                |  9 +++++++--=0D
 11 files changed, 58 insertions(+), 44 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


