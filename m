Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA092CA18F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:38:40 +0100 (CET)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3zU-0008FY-0M
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yV-0007A0-D4
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:39 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:41549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kk3yT-0000mc-S0
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:37:39 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-lsR5Twa5OWeNZwkWtbboRQ-1; Tue, 01 Dec 2020 06:37:32 -0500
X-MC-Unique: lsR5Twa5OWeNZwkWtbboRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D355A107B45C;
 Tue,  1 Dec 2020 11:37:30 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7373C60BE5;
 Tue,  1 Dec 2020 11:37:29 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 0/4] spapr: Perform hotplug sanity checks at
 pre-plug
Date: Tue,  1 Dec 2020 12:37:24 +0100
Message-Id: <20201201113728.885700-1-groug@kaod.org>
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor recently suggested that instead of failing in spapr_drc_attach()=0D
at plug time we should rather check that the DRC is attachable at=0D
pre-plug time. This allows to error out before the hot-plugged device=0D
is even realized and to come up with simpler plug callbacks.=0D
=0D
sPAPR currently supports hotplug of PCI devices, PHBs, CPU cores,=0D
PC-DIMM/NVDIMM memory and TPM proxy devices. Some of these already=0D
do sanity checks at pre-plug that are sufficient to ensure the DRC=0D
are attachables. Some others don't even have a pre-plug handler.=0D
=0D
This series adds the missing pieces so that all failing conditions=0D
are caught at pre-plug time instead of plug time for all devices.=0D
=0D
v2: - hopefully less fragile way of setting compat mode for hot-plugged=0D
      CPUs=0D
=0D
Greg Kurz (4):=0D
  spapr: Fix pre-2.10 dummy ICP hack=0D
  spapr: Abort if ppc_set_compat() fails for hot-plugged CPUs=0D
  spapr: Simplify error path of spapr_core_plug()=0D
  spapr: spapr_drc_attach() cannot fail=0D
=0D
 include/hw/ppc/spapr_drc.h |  8 ++++++-=0D
 hw/ppc/spapr.c             | 49 ++++++++++++++++++--------------------=0D
 hw/ppc/spapr_drc.c         |  8 ++-----=0D
 hw/ppc/spapr_nvdimm.c      |  2 +-=0D
 hw/ppc/spapr_pci.c         |  2 +-=0D
 5 files changed, 34 insertions(+), 35 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


