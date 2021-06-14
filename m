Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551863A68EA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:24:40 +0200 (CEST)
Received: from localhost ([::1]:42574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnW3-0002Tn-DZ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnOO-0004ks-Qs
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnON-000812-7d
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623680202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpcXuHQEC0d40yWHtoqur6ujpCUwQ79ARNwSQygQSqU=;
 b=C0giHTG4KKtnN6HxGpggwy8raNM8jHn2u4LXVA9sz1Wojqtx5c21wZjdFfYgiHcrDNxYYQ
 AN0U4wcBY+kLYPKsVrS/Bupo5cm6I8KZ5PliOr9cednTTbX1b1qvedrOGvWjuSzWodfIYL
 Jj3lSMsPNqqvjvaBSFkaV10pX19ueQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-BqnLMTcAOLOZYSG2l7FjCQ-1; Mon, 14 Jun 2021 10:16:39 -0400
X-MC-Unique: BqnLMTcAOLOZYSG2l7FjCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DEFB100C660;
 Mon, 14 Jun 2021 14:16:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-55.ams2.redhat.com
 [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E02519C46;
 Mon, 14 Jun 2021 14:16:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] softmmu: add trace point when bdrv_flush_all fails
Date: Mon, 14 Jun 2021 15:15:43 +0100
Message-Id: <20210614141549.100410-8-berrange@redhat.com>
In-Reply-To: <20210614141549.100410-1-berrange@redhat.com>
References: <20210614141549.100410-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VM stop process has to flush outstanding I/O and this is a critical
failure scenario that is hard to diagnose. Add a probe point that
records the flush return code.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 softmmu/cpus.c       | 7 ++++++-
 softmmu/trace-events | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index a7ee431187..c3caaeb26e 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -44,6 +44,7 @@
 #include "sysemu/whpx.h"
 #include "hw/boards.h"
 #include "hw/hw.h"
+#include "trace.h"
 
 #ifdef CONFIG_LINUX
 
@@ -266,6 +267,7 @@ static int do_vm_stop(RunState state, bool send_stop)
 
     bdrv_drain_all();
     ret = bdrv_flush_all();
+    trace_vm_stop_flush_all(ret);
 
     return ret;
 }
@@ -704,12 +706,15 @@ int vm_stop_force_state(RunState state)
     if (runstate_is_running()) {
         return vm_stop(state);
     } else {
+        int ret;
         runstate_set(state);
 
         bdrv_drain_all();
         /* Make sure to return an error if the flush in a previous vm_stop()
          * failed. */
-        return bdrv_flush_all();
+        ret = bdrv_flush_all();
+        trace_vm_stop_flush_all(ret);
+        return ret;
     }
 }
 
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 5262828b8d..d18ac41e4e 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -19,6 +19,9 @@ flatview_new(void *view, void *root) "%p (root %p)"
 flatview_destroy(void *view, void *root) "%p (root %p)"
 flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
 
+# softmmu.c
+vm_stop_flush_all(int ret) "ret %d"
+
 # vl.c
 vm_state_notify(int running, int reason, const char *reason_str) "running %d reason %d (%s)"
 load_file(const char *name, const char *path) "name %s location %s"
-- 
2.31.1


