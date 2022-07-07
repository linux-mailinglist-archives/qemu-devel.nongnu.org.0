Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B8569D82
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:34:39 +0200 (CEST)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9My6-00063z-GA
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLy-0003Yk-Kp
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLt-0007aS-14
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITdvtq8Q+74yy3dAxf8FaU1TpMnyw+GlQ65Es7wyTrI=;
 b=IF+ZSvvMw+K4HYq+6jNmRRpZZvXbB/Hdbv+k1a2pv7SITbe+K2BDr/jS7hAZcbQA0p2TDR
 iv23m+/9qY09CkyGAGplWHFoFWR8z06DCvUrhdTTmKXfIE/NAphBGocAYHCnNATyV5HnyE
 /99ksD4Hrqd3WJh5C/KSgKKXe/4Dz9o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-5v4S-u3rMkWzYEJUrJEcMA-1; Thu, 07 Jul 2022 03:54:58 -0400
X-MC-Unique: 5v4S-u3rMkWzYEJUrJEcMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EE9E857A87;
 Thu,  7 Jul 2022 07:54:58 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72698404754C;
 Thu,  7 Jul 2022 07:54:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org,
	Sven Schnelle <svens@linux.ibm.com>
Subject: [PULL 18/18] target/s390x: Exit tb after executing ex_value
Date: Thu,  7 Jul 2022 09:54:26 +0200
Message-Id: <20220707075426.1163210-19-thuth@redhat.com>
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

When EXECUTE sets ex_value to interrupt the constructed instruction,
we implicitly disable interrupts so that the value is not corrupted.
Exit to the main loop after execution, so that we re-evaluate any
pending interrupts.

Reported-by: Sven Schnelle <svens@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220702060228.420454-5-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index eac59c3dd1..e2ee005671 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6593,7 +6593,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER);
+    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER) || dc->ex_value;
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
-- 
2.31.1


