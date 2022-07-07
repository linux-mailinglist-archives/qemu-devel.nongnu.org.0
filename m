Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42097569D27
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:18:31 +0200 (CEST)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MiU-0002l8-3N
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MM0-0003ZL-2m
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:55:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLu-0007b7-LB
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wL0hgUDAenXher0J65sDriO5cdDWQ+loZqkbDpxz3s=;
 b=g3dzi84Hf7IsVfdu8b6XSc2adtwEyYz7yjiHDJMWK/ixIFmx+6haob9D+hm/k1YtXkpT0E
 caUh/M4XJmcK6keNKsYORWvk4SXLZFY6g+dIl1QCa7M+LGLjinU/KvnClmHHRLtmSoZhWS
 HGOWjgGtOx0qsqQBh4tZmrt2VaFE590=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-PrxLpx16OZqbbqmIZ3NGbg-1; Thu, 07 Jul 2022 03:54:56 -0400
X-MC-Unique: PrxLpx16OZqbbqmIZ3NGbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12B6685A582;
 Thu,  7 Jul 2022 07:54:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ACBB40CF8E5;
 Thu,  7 Jul 2022 07:54:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 16/18] target/s390x: Remove DISAS_PC_STALE
Date: Thu,  7 Jul 2022 09:54:24 +0200
Message-Id: <20220707075426.1163210-17-thuth@redhat.com>
In-Reply-To: <20220707075426.1163210-1-thuth@redhat.com>
References: <20220707075426.1163210-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There is nothing to distinguish this from DISAS_TOO_MANY.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220702060228.420454-3-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index e38ae9ce09..a3422c0eb0 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1126,10 +1126,6 @@ typedef struct {
 /* We have updated the PC and CC values.  */
 #define DISAS_PC_CC_UPDATED     DISAS_TARGET_2
 
-/* We are exiting the TB, but have neither emitted a goto_tb, nor
-   updated the PC for the next instruction to be executed.  */
-#define DISAS_PC_STALE          DISAS_TARGET_3
-
 /* We are exiting the TB to the main loop.  */
 #define DISAS_PC_STALE_NOCHAIN  DISAS_TARGET_4
 
@@ -3993,7 +3989,7 @@ static DisasJumpType op_sacf(DisasContext *s, DisasOps *o)
 {
     gen_helper_sacf(cpu_env, o->in2);
     /* Addressing mode has changed, so end the block.  */
-    return DISAS_PC_STALE;
+    return DISAS_TOO_MANY;
 }
 #endif
 
@@ -4029,7 +4025,7 @@ static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
     tcg_temp_free_i64(tsam);
 
     /* Always exit the TB, since we (may have) changed execution mode.  */
-    return DISAS_PC_STALE;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_sar(DisasContext *s, DisasOps *o)
@@ -6562,13 +6558,13 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
     /* io should be the last instruction in tb when icount is enabled */
     if (unlikely(icount && ret == DISAS_NEXT)) {
-        ret = DISAS_PC_STALE;
+        ret = DISAS_TOO_MANY;
     }
 
 #ifndef CONFIG_USER_ONLY
     if (s->base.tb->flags & FLAG_MASK_PER) {
         /* An exception might be triggered, save PSW if not already done.  */
-        if (ret == DISAS_NEXT || ret == DISAS_PC_STALE) {
+        if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
             tcg_gen_movi_i64(psw_addr, s->pc_tmp);
         }
 
@@ -6634,7 +6630,6 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-    case DISAS_PC_STALE:
     case DISAS_PC_STALE_NOCHAIN:
         update_psw_addr(dc);
         /* FALLTHRU */
-- 
2.31.1


