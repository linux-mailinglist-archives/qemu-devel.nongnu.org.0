Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ABB38B4E5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:07:17 +0200 (CEST)
Received: from localhost ([::1]:54552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljm8i-0004Uu-RG
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7I-0001Xv-Ec
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7A-0005b4-04
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621530339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g107d0hwMDuwWAJZE2QhIBSosIuw4vKnPSj9OwtVGoM=;
 b=VaNKC+ybfez8vqKdhJXneOITuVaVYoXxzaQZa0swIm9cXUMQztT8jFlHmDzM29vcIyCsmb
 iy+SoATf4IaYSnaTku+zYrirCGt+74Wr2bZEz0gBpT5iEV/K6BgJ4MEY4493JlxB0eJ5pD
 LQTP6QzQ+cpIFCLwPew2LTQeq+UszzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-iDyfv5gbPSi_MI_lmad1Jw-1; Thu, 20 May 2021 13:05:35 -0400
X-MC-Unique: iDyfv5gbPSi_MI_lmad1Jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 976B41927800;
 Thu, 20 May 2021 17:05:34 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 466555D6D5;
 Thu, 20 May 2021 17:05:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 3/9] target/xtensa: Make sure that tb->size != 0
Date: Thu, 20 May 2021 19:05:13 +0200
Message-Id: <20210520170519.300951-4-cohuck@redhat.com>
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
2.31.1


