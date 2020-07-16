Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D46F2228C0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 19:12:26 +0200 (CEST)
Received: from localhost ([::1]:59172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw7Qn-0004eV-2u
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 13:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jw7Pe-0003il-SM
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 13:11:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35583
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jw7Pc-0007FV-L6
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 13:11:14 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-oMPj4XUaPfi3PXnvucQ9vA-1; Thu, 16 Jul 2020 13:11:07 -0400
X-MC-Unique: oMPj4XUaPfi3PXnvucQ9vA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 993781B18BD1;
 Thu, 16 Jul 2020 17:11:06 +0000 (UTC)
Received: from bahia.lan (ovpn-113-187.ams2.redhat.com [10.36.113.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FB3A7B414;
 Thu, 16 Jul 2020 17:10:59 +0000 (UTC)
Subject: [PATCH v4 for-5.2 0/2] spapr: Improve error reporting in spapr_caps.c
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 16 Jul 2020 19:10:59 +0200
Message-ID: <159491945918.188975.4358645698778061430.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.110.120; envelope-from=groug@kaod.org;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 19:36:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nested KVM HV only works if the kernel is using the radix MMU mode, ie.
the CPU is POWER9 and it is not running in some pre-power9 compat mode.
Otherwise, the KVM HV module fails to load in the guest with -ENODEV.
It might be painful for a user to discover this late that nested cannot
work with their setup. It seems a better fit for QEMU to do a sanity
check when applying the nested-hv sPAPR capability and print out an
informative error message.

sPAPR capabilities are checked at machine init. If a capability cannot
be used, an error message is printed and QEMU exits. In most places,
the error message also contains an hint for the user. But we should
use error_append_hint() for that, as explained in the "qapi/error.h"
header.

So this series first converts spapr_caps.c to using error_append_hint().
This requires to add some ERRP_GUARD() because spapr_caps_apply() passes
&error_fatal. Then it adds a sanity check for the nested-hv case with
an error message and hint.

v4: - Same as v3 but rebased on ppc-for-5.2, updated changelogs
      and cover
v3: - Add preliminary patch to use warn_report() instead of
      a convoluted error_setg()+warn_report_err() sequence
v2: - Fix indentation and add some missing \n in patch 2
    - Add ERRP_AUTO_PROPAGATE() to cap_nested_kvm_hv_apply() in
      patch 2 instead of patch 3

---

Greg Kurz (2):
      spapr: Use error_append_hint() in spapr_caps.c
      spapr: Forbid nested KVM-HV in pre-power9 compat mode


 hw/ppc/spapr_caps.c |   99 +++++++++++++++++++++++++++++++----------------=
----
 1 file changed, 60 insertions(+), 39 deletions(-)

--
Greg


