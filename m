Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB99E3757DB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:50:08 +0200 (CEST)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legGN-0007tG-SE
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legBG-0002CF-0s
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legB9-0002tc-K6
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XziMhFVt0tkHIkN3xwf17QDAQIwbUzy1C7jdRS9nlS4=;
 b=FLpkV+gdTHKxpX3TJ+lR89/ZUM2UAKIR77DDSSjpr5UEkSst/n7sBCzZ8NwxNIjUDDzuH8
 SaYGFfiJO91cwIpWt/+oZpNnKRp+rQpmLSsd3ZIBd+he5UMGdg/VMaeP7P+j+EBwgSHT1b
 lSBzsHhI5BRo7Z1E3QJD/XkGesdPwao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-yEEjy2CMOvS7pCgE3XZ_hw-1; Thu, 06 May 2021 11:44:38 -0400
X-MC-Unique: yEEjy2CMOvS7pCgE3XZ_hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D7691898296;
 Thu,  6 May 2021 15:44:37 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-111.ams2.redhat.com
 [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCCF31349A;
 Thu,  6 May 2021 15:44:35 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/7] target/xtensa: Make sure that tb->size != 0
Date: Thu,  6 May 2021 17:44:19 +0200
Message-Id: <20210506154423.459930-4-cohuck@redhat.com>
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

tb_gen_code() assumes that tb->size must never be zero, otherwise it
may produce spurious exceptions. For xtensa this may happen when
decoding an unknown instruction, when handling a write into the
CCOUNT or CCOMPARE special register and when single-stepping the first
instruction of an exception handler.

Fix by pretending that the size of the respective translation block is
1 in all these cases.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Max Filippov <jcmvbkbc@gmail.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Message-Id: <20210416154939.32404-4-iii@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/xtensa/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 0ae4efc48a17..73584d9d605b 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -917,6 +917,7 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
                       "unknown instruction length (pc = %08x)\n",
                       dc->pc);
         gen_exception_cause(dc, ILLEGAL_INSTRUCTION_CAUSE);
+        dc->base.pc_next = dc->pc + 1;
         return;
     }
 
@@ -1274,11 +1275,13 @@ static void xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if ((tb_cflags(dc->base.tb) & CF_USE_ICOUNT)
         && (dc->base.tb->flags & XTENSA_TBFLAG_YIELD)) {
         gen_exception(dc, EXCP_YIELD);
+        dc->base.pc_next = dc->pc + 1;
         dc->base.is_jmp = DISAS_NORETURN;
         return;
     }
     if (dc->base.tb->flags & XTENSA_TBFLAG_EXCEPTION) {
         gen_exception(dc, EXCP_DEBUG);
+        dc->base.pc_next = dc->pc + 1;
         dc->base.is_jmp = DISAS_NORETURN;
         return;
     }
-- 
2.30.2


