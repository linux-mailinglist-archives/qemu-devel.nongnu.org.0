Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB92DD8BB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:52:10 +0100 (CET)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyNl-0003Ij-NP
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIX-0006QQ-Ge
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIV-0001zM-OG
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2ebPP2oobb46hwaM16m3MH8M4rANfTQExxOd72ESRY=;
 b=Dckh891rudigtFHOji+qYFAllyjx1pSeHDBLKDVEba1V3Ycu/8kX3x09HNkS5Vx7Tj+Htz
 G9Li70RFaMeiltcdB4f+bmNnCcnxqDJBen4u4AEK5YRkoC+KTGkA4u+q/Yo+xac+U9tUT9
 97/sI2xR+vI7j5XGfutYdlInKEt32JE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-0wLqGskqOx2tXNLJq-8big-1; Thu, 17 Dec 2020 13:46:40 -0500
X-MC-Unique: 0wLqGskqOx2tXNLJq-8big-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0215F1005504;
 Thu, 17 Dec 2020 18:46:39 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB8405D9CD;
 Thu, 17 Dec 2020 18:46:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/17] i386: tcg: remove inline from cpu_load_eflags
Date: Thu, 17 Dec 2020 13:46:16 -0500
Message-Id: <20201217184620.3945917-14-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

make it a regular function.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201212155530.23098-9-cfontana@suse.de>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/tcg/helper-tcg.h  | 15 ++-------------
 target/i386/tcg/misc_helper.c | 13 +++++++++++++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 148edf49a3..c133c63555 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -78,19 +78,8 @@ void QEMU_NORETURN raise_interrupt(CPUX86State *nenv, int intno, int is_int,
 /* cc_helper.c */
 extern const uint8_t parity_table[256];
 
-/*
- * NOTE: the translator must set DisasContext.cc_op to CC_OP_EFLAGS
- * after generating a call to a helper that uses this.
- */
-static inline void cpu_load_eflags(CPUX86State *env, int eflags,
-                                   int update_mask)
-{
-    CC_SRC = eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
-    CC_OP = CC_OP_EFLAGS;
-    env->df = 1 - (2 * ((eflags >> 10) & 1));
-    env->eflags = (env->eflags & ~update_mask) |
-        (eflags & update_mask) | 0x2;
-}
+/* misc_helper.c */
+void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
 
 /* svm_helper.c */
 void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index c99370e5e3..0bd6c95749 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -26,6 +26,19 @@
 #include "exec/address-spaces.h"
 #include "helper-tcg.h"
 
+/*
+ * NOTE: the translator must set DisasContext.cc_op to CC_OP_EFLAGS
+ * after generating a call to a helper that uses this.
+ */
+void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask)
+{
+    CC_SRC = eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
+    CC_OP = CC_OP_EFLAGS;
+    env->df = 1 - (2 * ((eflags >> 10) & 1));
+    env->eflags = (env->eflags & ~update_mask) |
+        (eflags & update_mask) | 0x2;
+}
+
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
 {
 #ifdef CONFIG_USER_ONLY
-- 
2.28.0


