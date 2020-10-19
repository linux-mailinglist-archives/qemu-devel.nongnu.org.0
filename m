Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBAB2923E8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 10:50:40 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQsJ-0005Db-CQ
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 04:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUQpx-0003fI-Hh
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:48:13 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:50658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUQpv-0002bl-Lz
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:48:13 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-1R-oSifmOn6wTmgkCbQMhQ-1; Mon, 19 Oct 2020 04:48:00 -0400
X-MC-Unique: 1R-oSifmOn6wTmgkCbQMhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D29680B712;
 Mon, 19 Oct 2020 08:47:59 +0000 (UTC)
Received: from bahia.lan (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59E0510013D0;
 Mon, 19 Oct 2020 08:47:53 +0000 (UTC)
Subject: [PATCH 0/5] spapr: Error handling fixes and cleanups (round 3)
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 19 Oct 2020 10:47:52 +0200
Message-ID: <160309727218.2739814.14722724927730985344.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 04:48:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a followup to a previous cleanup for the sPAPR code:

https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg04860.html

The last two patches had to be dropped because they were wrongly assuming
that object_property_get_uint() returning zero meant failure. This led to
a discussion in which arose a consensus that most of the time (not to say
always) object property getters should never fail actually, ie. failure
is very likely the result of a programming error and QEMU should abort.

This series aims at demonstrating a revelant case I've found while auditing
object property getters (this is patch 4 that I've isolated from a huge
50-patch series I haven't dared to post yet). The sPAPR memory hotplug code
is tailored to support either regular PC DIMMs or NVDIMMs, which inherit
from PC DIMMs. They expect to get some properties from the DIMM object,
which happens to be set by default at the PC DIMM class level. It thus
doesn't make sense to pass an error object and propagate it when getting
them since this would lure the user into thinking they did something wrong.

Some preliminary cleanup is done on the way, especially dropping an unused
@errp argument of pc_dimm_plug(). This affects several platforms other than
sPAPR but I guess the patch is trivial enough to go through David's tree
if it gets acks from the relevant maintainers.

---

Greg Kurz (5):
      pc-dimm: Drop @errp argument of pc_dimm_plug()
      spapr: Use appropriate getter for PC_DIMM_ADDR_PROP
      spapr: Use appropriate getter for PC_DIMM_SLOT_PROP
      spapr: Pass &error_abort when getting some PC DIMM properties
      spapr: Simplify error handling in spapr_memory_plug()


 hw/arm/virt.c                 |    9 +-------
 hw/i386/pc.c                  |    8 +------
 hw/mem/pc-dimm.c              |    2 +-
 hw/ppc/spapr.c                |   48 +++++++++++++++----------------------=
----
 hw/ppc/spapr_nvdimm.c         |    5 +++-
 include/hw/mem/pc-dimm.h      |    2 +-
 include/hw/ppc/spapr_nvdimm.h |    2 +-
 7 files changed, 25 insertions(+), 51 deletions(-)

--
Greg


