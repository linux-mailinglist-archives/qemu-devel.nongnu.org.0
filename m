Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9771D28FA9F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 23:26:07 +0200 (CEST)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTAlC-0001un-Jr
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 17:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kTAgP-0006bE-Mh
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 17:21:09 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:45501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kTAgN-0001VJ-Pk
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 17:21:09 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-doDiVfhIPqilASV9v3dJqQ-1; Thu, 15 Oct 2020 17:18:21 -0400
X-MC-Unique: doDiVfhIPqilASV9v3dJqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D329CC0E;
 Thu, 15 Oct 2020 21:18:20 +0000 (UTC)
Received: from bahia.lan (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B75A73663;
 Thu, 15 Oct 2020 21:18:19 +0000 (UTC)
Subject: [PATCH v2 0/5] spapr: Fix and cleanups for sPAPR CPU core
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 15 Oct 2020 23:18:18 +0200
Message-ID: <160279669833.1808373.9524145092720289601.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 17:18:44
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While reading the code _again_ I spotted a memory leak and I realized
that the realize/unrealize paths are uselessly complex and not really
symmetrical.

This series fixes the leak and re-shuffles the code to make it cleaner.

Tested with 'make check', travis-ci and manual hotplug/unplug of CPU
cores. Also tested error paths by simulating failures when creating
interrupt presenters or when setting the vCPU id.

v2: - enforce symmetry between realize and unrealize
    - unrealize vCPUs with qdev_unrealize()
    - one loop to create/realize and to unrealize/delete vCPUs

---

Greg Kurz (5):
      spapr: Fix leak of CPU machine specific data
      spapr: Unrealize vCPUs with qdev_unrealize()
      spapr: Drop spapr_delete_vcpu() unused argument
      spapr: Make spapr_cpu_core_unrealize() idempotent
      spapr: Simplify spapr_cpu_core_realize() and spapr_cpu_core_unrealize=
()


 accel/tcg/user-exec-stub.c      |    4 ++
 hw/ppc/spapr_cpu_core.c         |   69 ++++++++++++++++++-----------------=
----
 target/ppc/translate_init.c.inc |    2 +
 3 files changed, 37 insertions(+), 38 deletions(-)

--
Greg


