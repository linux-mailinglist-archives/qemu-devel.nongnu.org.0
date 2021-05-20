Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA038B4ED
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:08:56 +0200 (CEST)
Received: from localhost ([::1]:59712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmAJ-0007w5-04
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm76-0001Mc-VO
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm75-0005a8-7y
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621530334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5bvvQ+jCtf8ckhRg23/RTaEsh9OIQNq4YfyNz/nXjCw=;
 b=Rl2zsEEtjrJ8AMCp8/RO42CBFQ/QBNLfwcKvuJ0JyRqdiOHo4BiS67M3+2pJGaszMQXeGX
 OqtsHwP5xlfVeSMbHPiHAwYT8OWkPPcODrDilhhhlqnm1y8RIJ3QSCy8QBmp1He2+lxPOt
 aH8ylQ6XuTfooIqRySjQP+3aF/dYhmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-z1Zf9IGuOMS-VCb2ixpjtA-1; Thu, 20 May 2021 13:05:32 -0400
X-MC-Unique: z1Zf9IGuOMS-VCb2ixpjtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B118107ACE3;
 Thu, 20 May 2021 17:05:31 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31FBF5D6D5;
 Thu, 20 May 2021 17:05:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 1/9] target/s390x: Fix translation exception on illegal
 instruction
Date: Thu, 20 May 2021 19:05:11 +0200
Message-Id: <20210520170519.300951-2-cohuck@redhat.com>
In-Reply-To: <20210520170519.300951-1-cohuck@redhat.com>
References: <20210520170519.300951-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
2.31.1


