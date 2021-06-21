Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530943AE6F0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:22:50 +0200 (CEST)
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvH4r-0004t9-Bu
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGj0-0008H5-B9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGiw-0007Kr-4a
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6CQy/ENjwvM51SS09QvRT/FiVfQj7za8ueXpvOsLhE=;
 b=idsXF0QtqY5Xgo0TRW841jhRjaW9yXl4K+7FSJAHTUw7VoI82Wm6dYvGxo8Lr796mbkkH+
 C058iP1tkV/VdqGJrXIi1OElJSA5mD4gbWSKXW39YbzYT8VzwR7lKREX1cuCd67HbznK5y
 0KNA38s8n3gfAeN6zeLzm4edpmMSJJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-8bQim-uLMCSQKv8owNLjaA-1; Mon, 21 Jun 2021 06:00:05 -0400
X-MC-Unique: 8bQim-uLMCSQKv8owNLjaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D945100CEC3;
 Mon, 21 Jun 2021 10:00:03 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B00575D740;
 Mon, 21 Jun 2021 09:59:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 31/37] target/s390x: Improve s390_cpu_dump_state vs cc_op
Date: Mon, 21 Jun 2021 11:58:36 +0200
Message-Id: <20210621095842.335162-32-cohuck@redhat.com>
In-Reply-To: <20210621095842.335162-1-cohuck@redhat.com>
References: <20210621095842.335162-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: ruixin.bao@ibm.com,
 "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use s390_cpu_get_psw_mask so that we print the correct
architectural value of psw.mask.  Do not print cc_op
unless tcg_enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Tested-by: jonathan.albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Tested-by: <ruixin.bao@ibm.com>
Message-Id: <20210615030744.1252385-4-richard.henderson@linaro.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 559fc3573fe3..1445b74451f4 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -338,12 +338,14 @@ void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPUS390XState *env = &cpu->env;
     int i;
 
-    if (env->cc_op > 3) {
-        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %15s\n",
-                     env->psw.mask, env->psw.addr, cc_name(env->cc_op));
+    qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64,
+                 s390_cpu_get_psw_mask(env), env->psw.addr);
+    if (!tcg_enabled()) {
+        qemu_fprintf(f, "\n");
+    } else if (env->cc_op > 3) {
+        qemu_fprintf(f, " cc %15s\n", cc_name(env->cc_op));
     } else {
-        qemu_fprintf(f, "PSW=mask %016" PRIx64 " addr %016" PRIx64 " cc %02x\n",
-                     env->psw.mask, env->psw.addr, env->cc_op);
+        qemu_fprintf(f, " cc %02x\n", env->cc_op);
     }
 
     for (i = 0; i < 16; i++) {
-- 
2.31.1


