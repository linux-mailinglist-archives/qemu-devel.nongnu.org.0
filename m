Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481CC42EE1F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:48:13 +0200 (CEST)
Received: from localhost ([::1]:53870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJoy-0001G3-DZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mbJXf-0003PW-PS
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:30:20 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:41548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mbJXa-0004nP-Dh
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:30:16 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-FUM94JT3PJ-SbnupE7ElXg-1; Fri, 15 Oct 2021 05:30:03 -0400
X-MC-Unique: FUM94JT3PJ-SbnupE7ElXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 182D110A8E01;
 Fri, 15 Oct 2021 09:30:02 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.195.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C79B10016F4;
 Fri, 15 Oct 2021 09:29:45 +0000 (UTC)
Subject: [PATCH] softmmu/physmem.c: Fix typo in comment
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 15 Oct 2021 11:29:44 +0200
Message-ID: <163429018454.1146856.3429437540871060739.stgit@bahia.huguette>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, HEXHASH_WORD=1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the comment to match what the code is doing, as explained in
the changelog of commit 86cf9e154632cb28d749db0ea47946fba8cf3f09
that introduced the change:

    Commit 9458a9a1df1a4c719e24512394d548c1fc7abd22 added synchronization
    of vCPU and migration operations through calling run_on_cpu operation.
    However, in replay mode this synchronization is unneeded, because
    I/O and vCPU threads are already synchronized.
    This patch disables such synchronization for record/replay mode.


Signed-off-by: Greg Kurz <groug@kaod.org>
---
 softmmu/physmem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index f67ad2998121..555c907f6743 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2633,7 +2633,7 @@ static void tcg_log_global_after_sync(MemoryListener =
*listener)
          * In record/replay mode this causes a deadlock, because
          * run_on_cpu waits for rr mutex. Therefore no races are possible
          * in this case and no need for making run_on_cpu when
-         * record/replay is not enabled.
+         * record/replay is enabled.
          */
         cpuas =3D container_of(listener, CPUAddressSpace, tcg_as_listener)=
;
         run_on_cpu(cpuas->cpu, do_nothing, RUN_ON_CPU_NULL);



