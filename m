Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B83AE722
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:29:12 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHB1-000882-9c
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGjD-0000Ns-10
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lvGj8-0007Rx-Ah
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3i3ON5J8kU05xiwpF/ssX4srEwWeN9IbchIN02CCx0c=;
 b=f8wFuGkcAtPqXH3zgDXutnw01jlHWSx4AnESMx9htdeQ5PiCih2nUULotiT0cHeylkMhFh
 7F/qAyYrOfUfz+pJyKj2+TKlnNM5Zlk8NAu5MQn/uasryyMvX4+bteklR6hv65xXwL8FEt
 dyBYH7CnJw8tZt/47IPuaLLynODxhKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-xjJAIGrrP8KOs8vDAy-AMQ-1; Mon, 21 Jun 2021 06:00:20 -0400
X-MC-Unique: xjJAIGrrP8KOs8vDAy-AMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 908E364A91;
 Mon, 21 Jun 2021 10:00:18 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-141.ams2.redhat.com
 [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C6AD5D740;
 Mon, 21 Jun 2021 10:00:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 33/37] linux-user/s390x: Save and restore psw.mask properly
Date: Mon, 21 Jun 2021 11:58:38 +0200
Message-Id: <20210621095842.335162-34-cohuck@redhat.com>
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

At present, we're referencing env->psw.mask directly, which
fails to ensure that env->cc_op is incorporated or updated.
Use s390_cpu_{set_psw,get_psw_mask} to fix this.

Mirror the kernel's cleaning of the psw.mask in save_sigregs
and restore_sigregs.  Ignore PSW_MASK_RI for now, as qemu does
not support that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Tested-by: jonathan.albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Tested-by: <ruixin.bao@ibm.com>
Message-Id: <20210615030744.1252385-6-richard.henderson@linaro.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 linux-user/s390x/signal.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index ef136dae3348..bf8a8fbfe9fc 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -112,15 +112,23 @@ get_sigframe(struct target_sigaction *ka, CPUS390XState *env, size_t frame_size)
     return (sp - frame_size) & -8ul;
 }
 
+#define PSW_USER_BITS   (PSW_MASK_DAT | PSW_MASK_IO | PSW_MASK_EXT | \
+                         PSW_MASK_MCHECK | PSW_MASK_PSTATE | PSW_ASC_PRIMARY)
+#define PSW_MASK_USER   (PSW_MASK_ASC | PSW_MASK_CC | PSW_MASK_PM | \
+                         PSW_MASK_64 | PSW_MASK_32)
+
 static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
 {
+    uint64_t psw_mask = s390_cpu_get_psw_mask(env);
     int i;
 
     /*
      * Copy a 'clean' PSW mask to the user to avoid leaking
      * information about whether PER is currently on.
+     * TODO: qemu does not support PSW_MASK_RI; it will never be set.
      */
-    __put_user(env->psw.mask, &sregs->regs.psw.mask);
+    psw_mask = PSW_USER_BITS | (psw_mask & PSW_MASK_USER);
+    __put_user(psw_mask, &sregs->regs.psw.mask);
     __put_user(env->psw.addr, &sregs->regs.psw.addr);
 
     for (i = 0; i < 16; i++) {
@@ -289,7 +297,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
 {
-    target_ulong prev_addr;
+    uint64_t prev_addr, prev_mask, mask, addr;
     int i;
 
     for (i = 0; i < 16; i++) {
@@ -297,9 +305,28 @@ static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     }
 
     prev_addr = env->psw.addr;
-    __get_user(env->psw.mask, &sc->regs.psw.mask);
-    __get_user(env->psw.addr, &sc->regs.psw.addr);
-    trace_user_s390x_restore_sigregs(env, env->psw.addr, prev_addr);
+    __get_user(mask, &sc->regs.psw.mask);
+    __get_user(addr, &sc->regs.psw.addr);
+    trace_user_s390x_restore_sigregs(env, addr, prev_addr);
+
+    /*
+     * Use current psw.mask to preserve PER bit.
+     * TODO:
+     *  if (!is_ri_task(current) && (user_sregs.regs.psw.mask & PSW_MASK_RI))
+     *          return -EINVAL;
+     * Simply do not allow it to be set in mask.
+     */
+    prev_mask = s390_cpu_get_psw_mask(env);
+    mask = (prev_mask & ~PSW_MASK_USER) | (mask & PSW_MASK_USER);
+    /* Check for invalid user address space control. */
+    if ((mask & PSW_MASK_ASC) == PSW_ASC_HOME) {
+        mask = (mask & ~PSW_MASK_ASC) | PSW_ASC_PRIMARY;
+    }
+    /* Check for invalid amode. */
+    if (mask & PSW_MASK_64) {
+        mask |= PSW_MASK_32;
+    }
+    s390_cpu_set_psw(env, mask, addr);
 
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
-- 
2.31.1


