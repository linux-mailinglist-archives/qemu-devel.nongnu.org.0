Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526212DE131
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:40:56 +0100 (CET)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDBv-0000y3-Ds
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD7I-0003IJ-BC
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:36:08 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD7F-0002ha-QY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:36:07 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-z77r1BlcO0iKhkAj7QNiYQ-1; Fri, 18 Dec 2020 05:34:04 -0500
X-MC-Unique: z77r1BlcO0iKhkAj7QNiYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9F60107ACE8;
 Fri, 18 Dec 2020 10:34:02 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24E5160BE5;
 Fri, 18 Dec 2020 10:34:00 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] spapr: Fix visibility and traversal of DR connectors
Date: Fri, 18 Dec 2020 11:33:54 +0100
Message-Id: <20201218103400.689660-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting a high maxmem value seriously degrades the guest's boot=0D
time, from 3 seconds for 1T up to more than 3 minutes for 8T.=0D
All this time is spent during initial machine setup and CAS,=0D
preventing use of the QEMU monitor in the meantime.=0D
=0D
Profiling reveals:=0D
=0D
  %   cumulative   self              self     total=0D
 time   seconds   seconds    calls   s/call   s/call  name=0D
 85.48     24.08    24.08   566117     0.00     0.00  object_get_canonical_=
path_component=0D
 13.67     27.93     3.85 57623944     0.00     0.00  strstart=0D
=0D
-----------------------------------------------=0D
                0.00    0.00       1/566117      host_memory_backend_get_na=
me [270]=0D
                1.41    0.22   33054/566117      drc_realize <cycle 1> [23]=
=0D
               22.67    3.51  533062/566117      object_get_canonical_path =
<cycle 1> [3]=0D
[2]     98.7   24.08    3.73  566117         object_get_canonical_path_comp=
onent [2]=0D
                3.73    0.00 55802324/57623944     strstart [19]=0D
-----------------------------------------------=0D
                                  12             object_property_set_link <=
cycle 1> [1267]=0D
                               33074             device_set_realized <cycle=
 1> [138]=0D
                              231378             object_get_child_property =
<cycle 1> [652]=0D
[3]     93.0    0.01   26.18  264464         object_get_canonical_path <cyc=
le 1> [3]=0D
               22.67    3.51  533062/566117      object_get_canonical_path_=
component [2]=0D
                              264464             object_get_root <cycle 1> =
[629]=0D
-----------------------------------------------=0D
=0D
This is because an 8T maxmem means QEMU can create up to 32768=0D
LMB DRC objects, each tracking the hot-plug/unplug state of 256M=0D
of contiguous RAM. These objects are all created during machine=0D
init for the machine lifetime. Their realize path involves=0D
several calls to object_get_canonical_path_component(), which=0D
itself traverses all properties of the parent node. This results=0D
in a quadratic operation. Worse, the full list of DRCs is traversed=0D
7 times during the boot process, eg. to populate the device tree,=0D
calling object_get_canonical_path_component() on each DRC again.=0D
Yet even more costly quadratic traversals.=0D
=0D
Modeling DR connectors as individual devices raises some=0D
concerns, as already discussed a year ago in this thread:=0D
=0D
https://patchew.org/QEMU/20191017205953.13122-1-cheloha@linux.vnet.ibm.com/=
=0D
=0D
First, having so many devices to track the DRC states is excessive=0D
and can cause scalability issues in various ways. This bites again=0D
with this quadratic traversal issue. Second, DR connectors are really=0D
PAPR internals that shouldn't be exposed at all in the composition=0D
tree.=0D
=0D
This series converts DR connectors to be simple unparented=0D
objects tracked in a separate hash table, rather than=0D
actual devices exposed in the QOM tree. This doesn't address=0D
the overall concern on scalability, but this brings linear=0D
traversal of the DR connectors. The time penalty with a=0D
8T maxmem is reduced to less than 1 second, and we get=0D
a much shorter 'info qom-tree' output.=0D
=0D
This is transparent to migration.=0D
=0D
Greg Kurz (6):=0D
  spapr: Call spapr_drc_reset() for all DRCs at CAS=0D
  spapr: Fix reset of transient DR connectors=0D
  spapr: Introduce spapr_drc_reset_all()=0D
  spapr: Use spapr_drc_reset_all() at machine reset=0D
  spapr: Add drc_ prefix to the DRC realize and unrealize functions=0D
  spapr: Model DR connectors as simple objects=0D
=0D
 include/hw/ppc/spapr_drc.h |  18 +++-=0D
 hw/ppc/spapr.c             |  15 +--=0D
 hw/ppc/spapr_drc.c         | 181 +++++++++++++++++--------------------=0D
 hw/ppc/spapr_hcall.c       |  33 ++-----=0D
 hw/ppc/spapr_pci.c         |   2 +-=0D
 5 files changed, 106 insertions(+), 143 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


