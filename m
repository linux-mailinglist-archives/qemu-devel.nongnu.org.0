Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60283CF9ED
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:56:31 +0200 (CEST)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pIU-0007d7-LP
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGN-0004h7-8y
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGK-0008GX-0v
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ypcqcc5J//ZIGihgb1dDHeWeRJy0Ogt44IIsDEFb0Kw=;
 b=HCfS5gyXnmwl6V7vWOlwoKiG92RUjFWdIUOKmvlJUhAQMQ1rmf2za9USYvIviACf/y6/od
 csFwxECjkG+mHlgGsfyYK5ebV42o/4BE/EmbHKTFb4SnI9g2r2V9Mue88LZ/kgTVj9i+gd
 Gfes87pO8U/raMltywJPUEip2WLWWGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-7HVTMmvNPUyMh5NRNDLPRA-1; Tue, 20 Jul 2021 08:54:13 -0400
X-MC-Unique: 7HVTMmvNPUyMh5NRNDLPRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 773FC804308
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4926F60843;
 Tue, 20 Jul 2021 12:54:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 05737112D849; Tue, 20 Jul 2021 14:54:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/16] i386: Never free migration blocker objects instead of
 sometimes
Date: Tue, 20 Jul 2021 14:53:58 +0200
Message-Id: <20210720125408.387910-7-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
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
---
 target/i386/kvm/kvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 59ed8327ac..8e1bb905ca 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1423,7 +1423,6 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         ret = migrate_add_blocker(hv_passthrough_mig_blocker, &local_err);
         if (local_err) {
             error_report_err(local_err);
-            error_free(hv_passthrough_mig_blocker);
             return ret;
         }
     }
@@ -1438,7 +1437,6 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         ret = migrate_add_blocker(hv_no_nonarch_cs_mig_blocker, &local_err);
         if (local_err) {
             error_report_err(local_err);
-            error_free(hv_no_nonarch_cs_mig_blocker);
             return ret;
         }
     }
@@ -1878,7 +1876,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
             r = migrate_add_blocker(invtsc_mig_blocker, &local_err);
             if (local_err) {
                 error_report_err(local_err);
-                error_free(invtsc_mig_blocker);
                 return r;
             }
         }
-- 
2.31.1


