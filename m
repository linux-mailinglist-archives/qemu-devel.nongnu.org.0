Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20DD4936D0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:08:01 +0100 (CET)
Received: from localhost ([::1]:53430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6wj-0002T6-05
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:08:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6Qj-000812-KQ
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:34:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6Qi-00079P-2M
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642581295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xy18YLpmzj0O4ArsnVfqMOMHNAj3Xk0C0yXAuzsUOv4=;
 b=TapN07092pg5LwK4Pvr7Y9uwTaWB1VLG5R1e4iFRKB52Uqb14MNn8zXqhwRkK7ZyiwKZJs
 qv9O8yuKeUhDweU00F5LWL0lJdqiG7ZNugaLQx/EE/u5oODxYMbhYvO5VNtvZ+j7ILYtkC
 uJfwJjVdVftF8Usj9vXKw2suuBK/AKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-9R6m81HaNbSLa9_OumR_dQ-1; Wed, 19 Jan 2022 03:34:14 -0500
X-MC-Unique: 9R6m81HaNbSLa9_OumR_dQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 491511083F65;
 Wed, 19 Jan 2022 08:34:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A2CE4F873;
 Wed, 19 Jan 2022 08:33:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] s390x: sigp: Reorder the SIGP STOP code
Date: Wed, 19 Jan 2022 09:32:15 +0100
Message-Id: <20220119083215.120911-11-thuth@redhat.com>
In-Reply-To: <20220119083215.120911-1-thuth@redhat.com>
References: <20220119083215.120911-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

Let's wait to mark the VCPU STOPPED until the possible
STORE STATUS operation is completed, so that we know the
CPU is fully stopped and done doing anything. (When we
also clear the possible sigp_order field for STOP orders.)

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20211213210919.856693-2-farman@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/sigp.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 51c727834c..9dd977349a 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -139,7 +139,7 @@ static void sigp_stop_and_store_status(CPUState *cs, run_on_cpu_data arg)
     case S390_CPU_STATE_OPERATING:
         cpu->env.sigp_order = SIGP_STOP_STORE_STATUS;
         cpu_inject_stop(cpu);
-        /* store will be performed in do_stop_interrup() */
+        /* store will be performed in do_stop_interrupt() */
         break;
     case S390_CPU_STATE_STOPPED:
         /* already stopped, just store the status */
@@ -479,13 +479,17 @@ void do_stop_interrupt(CPUS390XState *env)
 {
     S390CPU *cpu = env_archcpu(env);
 
-    if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
-        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
-    }
+    /*
+     * Complete the STOP operation before exposing the CPU as
+     * STOPPED to the system.
+     */
     if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
         s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
     }
     env->sigp_order = 0;
+    if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
     env->pending_int &= ~INTERRUPT_STOP;
 }
 
-- 
2.27.0


