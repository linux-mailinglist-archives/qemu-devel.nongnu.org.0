Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710BB569D6A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:27:48 +0200 (CEST)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MrT-0005c0-IX
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLk-00032Y-7v
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLi-0007YI-NH
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dea8yWrQIeDLBiDdQQ0067znXc1QZ2VhPfan4n/Ed24=;
 b=dAazEil0oAAHRyFZcsigFR2fTHwlTWUpuMUbT4aiM6gPw/8OkNYFzuIIAtiZNSiuEVz75q
 vnMckESGlrV3Smn0jmzvsRLAn4TAMhvMVFH/Qd5eNoVN/ljgCY5HHI+Ui09OZAf4M5Nvzi
 lZmW0oBS3GjRdJBk+fWlGHSpe6y1OCI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-hiU1JYnJM725l_Jvm8rvHw-1; Thu, 07 Jul 2022 03:54:54 -0400
X-MC-Unique: hiU1JYnJM725l_Jvm8rvHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D3C33817A62;
 Thu,  7 Jul 2022 07:54:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9BED400DFA6;
 Thu,  7 Jul 2022 07:54:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 15/18] target/s390x: Remove DISAS_GOTO_TB
Date: Thu,  7 Jul 2022 09:54:23 +0200
Message-Id: <20220707075426.1163210-16-thuth@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

There is nothing to distinguish this from DISAS_NORETURN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220702060228.420454-2-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index fd2433d625..e38ae9ce09 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1123,9 +1123,6 @@ typedef struct {
    exiting the TB.  */
 #define DISAS_PC_UPDATED        DISAS_TARGET_0
 
-/* We have emitted one or more goto_tb.  No fixup required.  */
-#define DISAS_GOTO_TB           DISAS_TARGET_1
-
 /* We have updated the PC and CC values.  */
 #define DISAS_PC_CC_UPDATED     DISAS_TARGET_2
 
@@ -1189,7 +1186,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
         tcg_gen_goto_tb(0);
         tcg_gen_movi_i64(psw_addr, dest);
         tcg_gen_exit_tb(s->base.tb, 0);
-        return DISAS_GOTO_TB;
+        return DISAS_NORETURN;
     } else {
         tcg_gen_movi_i64(psw_addr, dest);
         per_branch(s, false);
@@ -1258,7 +1255,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             tcg_gen_movi_i64(psw_addr, dest);
             tcg_gen_exit_tb(s->base.tb, 1);
 
-            ret = DISAS_GOTO_TB;
+            ret = DISAS_NORETURN;
         } else {
             /* Fallthru can use goto_tb, but taken branch cannot.  */
             /* Store taken branch destination before the brcond.  This
@@ -6634,7 +6631,6 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     switch (dc->base.is_jmp) {
-    case DISAS_GOTO_TB:
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-- 
2.31.1


