Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C336C12A3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFBN-0001LR-3s; Mon, 20 Mar 2023 09:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBE-0001IY-NS
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBD-0006Kz-8s
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1VHQkrxeP/g776iWJsEbqjwCZxWlm7gYyRqf5Qdst8=;
 b=eJ4/ZDZQcAl6UQvdHZbf0XM1XjR3RJSTgqoVBvkyJbcGjnJ9Sb+q7sTY08SOS7qFtYvjwZ
 gXItqDlOKcV2PcPgS9rapasZ2OPDEor1ATbJSoxCAufEP/CoAUoHiwMFbQAGsUO0QAXWkx
 SY1TNNGdoUjFpphrmi1RuOb0GAs2kHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-jSeJQsfzNbeyvJyiWSqu9g-1; Mon, 20 Mar 2023 09:03:59 -0400
X-MC-Unique: jSeJQsfzNbeyvJyiWSqu9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74C5581B493;
 Mon, 20 Mar 2023 13:03:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 685ABC15BA0;
 Mon, 20 Mar 2023 13:03:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 02/24] target/s390x: Fix LPSW
Date: Mon, 20 Mar 2023 14:03:08 +0100
Message-Id: <20230320130330.406378-3-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently LPSW does not invert the mask bit 12 and incorrectly copies
the BA bit into the address.

Fix by generating code similar to what s390_cpu_load_normal() does.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Co-developed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230315020408.384766-2-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 14c3896d52..2e1e7e046a 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2910,19 +2910,21 @@ static DisasJumpType op_lpp(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_lpsw(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 t1, t2;
+    TCGv_i64 mask, addr;
 
     per_breaking_event(s);
 
-    t1 = tcg_temp_new_i64();
-    t2 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s),
-                        MO_TEUL | MO_ALIGN_8);
-    tcg_gen_addi_i64(o->in2, o->in2, 4);
-    tcg_gen_qemu_ld32u(t2, o->in2, get_mem_index(s));
-    /* Convert the 32-bit PSW_MASK into the 64-bit PSW_MASK.  */
-    tcg_gen_shli_i64(t1, t1, 32);
-    gen_helper_load_psw(cpu_env, t1, t2);
+    /*
+     * Convert the short PSW into the normal PSW, similar to what
+     * s390_cpu_load_normal() does.
+     */
+    mask = tcg_temp_new_i64();
+    addr = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(mask, o->in2, get_mem_index(s), MO_TEUQ | MO_ALIGN_8);
+    tcg_gen_andi_i64(addr, mask, PSW_MASK_SHORT_ADDR);
+    tcg_gen_andi_i64(mask, mask, PSW_MASK_SHORT_CTRL);
+    tcg_gen_xori_i64(mask, mask, PSW_MASK_SHORTPSW);
+    gen_helper_load_psw(cpu_env, mask, addr);
     return DISAS_NORETURN;
 }
 
-- 
2.31.1


