Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D03F93D4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:56:05 +0200 (CEST)
Received: from localhost ([::1]:38394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTuJ-0008HA-UX
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpQ-0008Mc-IZ
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpO-0000vK-1v
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWlUrWAGyBnvnnB4p11+hOY4OzxYFBDt36eqGbHNQlY=;
 b=RcIb0q9Xt9GJkcbrywsjsSqEDXMfJktJ93dHdQlsRHxpx7Df2LjKNs6bMXiyaREx2k6ZXS
 I19wCSq9/0IY8GsXeIPLaBymP1P3DWvQFB+nj8bSGOfbfsR6DOiAUaxHp9ySX/bEfajfdE
 BM2m+R8wZi8QpDIUuDu6+6zddjm404k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-Wqb9MmIrM9WzZgH8lvWj_Q-1; Fri, 27 Aug 2021 00:50:51 -0400
X-MC-Unique: Wqb9MmIrM9WzZgH8lvWj_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7E9B107ACF5;
 Fri, 27 Aug 2021 04:50:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96992100EB3D;
 Fri, 27 Aug 2021 04:50:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9062C11380B9; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] i386: Never free migration blocker objects instead of
 sometimes
Date: Fri, 27 Aug 2021 06:50:35 +0200
Message-Id: <20210827045044.388748-7-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

invtsc_mig_blocker has static storage duration.  When a CPU with
certain features is initialized, and invtsc_mig_blocker is still null,
we add a migration blocker and store it in invtsc_mig_blocker.

The object is freed when migrate_add_blocker() fails, leaving
invtsc_mig_blocker dangling.  It is not freed on later failures.

Same for hv_passthrough_mig_blocker and hv_no_nonarch_cs_mig_blocker.

All failures are actually fatal, so whether we free or not doesn't
really matter, except as bad examples to be copied / imitated.

Clean this up in a minimal way: never free these blocker objects.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210720125408.387910-7-armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 target/i386/kvm/kvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e69abe48e3..57aed525b5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1437,7 +1437,6 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         ret = migrate_add_blocker(hv_passthrough_mig_blocker, &local_err);
         if (local_err) {
             error_report_err(local_err);
-            error_free(hv_passthrough_mig_blocker);
             return ret;
         }
     }
@@ -1452,7 +1451,6 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         ret = migrate_add_blocker(hv_no_nonarch_cs_mig_blocker, &local_err);
         if (local_err) {
             error_report_err(local_err);
-            error_free(hv_no_nonarch_cs_mig_blocker);
             return ret;
         }
     }
@@ -1892,7 +1890,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
             r = migrate_add_blocker(invtsc_mig_blocker, &local_err);
             if (local_err) {
                 error_report_err(local_err);
-                error_free(invtsc_mig_blocker);
                 return r;
             }
         }
-- 
2.31.1


