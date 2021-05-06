Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF833757D9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:48:03 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legEM-00043p-DB
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legB8-00029C-HA
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legB3-0002sZ-S3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTbuRckAQNyqAkhPbTOm4s+j4D3trwrMUqXbdGQI9Ow=;
 b=fOPPpA1wOOkR1EZmbpEJtCbnUXUXunjOM1YSRW2gsTeAS4YzPpdqeO8iZnpDjo6Kjl3qLP
 fBV/Kqr5vYTPm5eJBqtgo8BjLEcAlRFoQGIChYvh9aigWLx5aHyo1eigJRAEfqK0dxEijL
 OPcuEg01GRkYZzoaQxz606ABmmASS3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-ri3ZWDj7O16kZzNmR_urZw-1; Thu, 06 May 2021 11:44:35 -0400
X-MC-Unique: ri3ZWDj7O16kZzNmR_urZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6FB08042B5;
 Thu,  6 May 2021 15:44:33 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-111.ams2.redhat.com
 [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D85E620DE;
 Thu,  6 May 2021 15:44:28 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/7] target/s390x: Fix translation exception on illegal
 instruction
Date: Thu,  6 May 2021 17:44:17 +0200
Message-Id: <20210506154423.459930-2-cohuck@redhat.com>
In-Reply-To: <20210506154423.459930-1-cohuck@redhat.com>
References: <20210506154423.459930-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
happens is:

* uretprobe maps a userspace page containing an invalid instruction.
* uretprobe replaces the target function's return address with the
  address of that page.
* When tb_gen_code() is called on that page, tb->size ends up being 0
  (because the page starts with the invalid instruction), which causes
  virt_page2 to point to the previous page.
* The previous page is not mapped, so this causes a spurious
  translation exception.

tb->size must never be 0: even if there is an illegal instruction, the
instruction bytes that have been looked at must count towards tb->size.
So adjust s390x's translate_one() to act this way for both illegal
instructions and instructions that are known to generate exceptions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210416154939.32404-2-iii@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/translate.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 4f953ddfbaf6..e243624d2a62 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -6412,7 +6412,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
                       s->fields.op, s->fields.op2);
         gen_illegal_opcode(s);
-        return DISAS_NORETURN;
+        ret = DISAS_NORETURN;
+        goto out;
     }
 
 #ifndef CONFIG_USER_ONLY
@@ -6428,7 +6429,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         /* privileged instruction */
         if ((s->base.tb->flags & FLAG_MASK_PSTATE) && (insn->flags & IF_PRIV)) {
             gen_program_exception(s, PGM_PRIVILEGED);
-            return DISAS_NORETURN;
+            ret = DISAS_NORETURN;
+            goto out;
         }
 
         /* if AFP is not enabled, instructions and registers are forbidden */
@@ -6455,7 +6457,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
             }
             if (dxc) {
                 gen_data_exception(dxc);
-                return DISAS_NORETURN;
+                ret = DISAS_NORETURN;
+                goto out;
             }
         }
 
@@ -6463,7 +6466,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         if (insn->flags & IF_VEC) {
             if (!((s->base.tb->flags & FLAG_MASK_VECTOR))) {
                 gen_data_exception(0xfe);
-                return DISAS_NORETURN;
+                ret = DISAS_NORETURN;
+                goto out;
             }
         }
 
@@ -6484,7 +6488,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
             (insn->spec & SPEC_r1_f128 && !is_fp_pair(get_field(s, r1))) ||
             (insn->spec & SPEC_r2_f128 && !is_fp_pair(get_field(s, r2)))) {
             gen_program_exception(s, PGM_SPECIFICATION);
-            return DISAS_NORETURN;
+            ret = DISAS_NORETURN;
+            goto out;
         }
     }
 
@@ -6544,6 +6549,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 #endif
 
+out:
     /* Advance to the next instruction.  */
     s->base.pc_next = s->pc_tmp;
     return ret;
-- 
2.30.2


