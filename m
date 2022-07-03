Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3872564A0C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 23:34:41 +0200 (CEST)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o87En-0003Sz-1L
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 17:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879N-0003xk-FO
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:05 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:50960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879L-0006NR-W5
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:05 -0400
Received: by mail-pj1-x102f.google.com with SMTP id a15so796503pjs.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 14:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XzVtM7jNZntW2ICseJWIzEx5QJb2NL5Wk2zg4Z/3nI=;
 b=hL3WLTmmrLcuv7P6JhsfNwYpnNK/zHsCfgAqyptezt81DHooxYfiwmSG5j5HgL4cy8
 9gjNYvQdm0MFP70dGHn5hKst80PsBsUUDFZHQx0fTvujJhOhahVCXJHbnTfDwMHvBXf9
 cLyNb87pm0yDbjugWPHI+QvDm7GpVh+2bHO3/szawygTluUJKJuUaHzlWeh3Z97iW4G9
 1wOuaeIsn1X93U9N4sLRJTnN4PcOBBNUq9U5Q6/qdNomXFuMPw9aNTe3vJiXWzdKuirm
 NZYZN4DTPiypZMdTlaUUEqVmYhLLZfIGkO3mQRYBnj8DGxiW3t8oTsP03jcO1Bvya1i5
 kafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XzVtM7jNZntW2ICseJWIzEx5QJb2NL5Wk2zg4Z/3nI=;
 b=xND7lKNbbft2ifQhFNlOHX1tYLl2niAcgPzYsWrgnnQvaHWW12aKFlml7K1TqUEDQA
 GhOF8kPHOIzsBd58CvKoeTey1MphwXlbLKV4J5GIwsjYaasFsufqp8Y1yhSXCYQywgkJ
 856B3YlUCoCk1Ep45GCOeA1RE+cLve8J2rjEiUol/QVE2/+YwCnfpullipQEZCISWeyE
 Yqh144XRBpMUMCWdIfd81OssIVcZu7+gvEgm7eVuug/fAXpeSnmhXTgUMP6BQ44jGH3o
 3/hVIDTqUbOJPPKQ30Qebk2pYqNeG4ad5CVfiGfSJCwzkubW9DKY7g1rxEMxnU9K7wpC
 g+BQ==
X-Gm-Message-State: AJIora/iQMrInvT2uvSmPzQLwvTtKds1t8oY+01Wn1V+veehQyACo1Hk
 crysee+G6ueu8SsCqTw93DSIsEl6JZ0=
X-Google-Smtp-Source: AGRyM1sQxQEL8AlR6JmsnMMwjL1/mdd6o/NKyxK5nUr92sXnXv7t0rBLO3w24er8mGQDNRHufbpAkQ==
X-Received: by 2002:a17:90a:f2d7:b0:1ef:8859:d61 with SMTP id
 gt23-20020a17090af2d700b001ef88590d61mr1812191pjb.215.1656883742538; 
 Sun, 03 Jul 2022 14:29:02 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902e54a00b0016191b843e2sm19527228plf.235.2022.07.03.14.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 14:29:02 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 07/11] target/openrisc: Add interrupted CPU to log
Date: Mon,  4 Jul 2022 06:28:19 +0900
Message-Id: <20220703212823.10067-8-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703212823.10067-1-shorne@gmail.com>
References: <20220703212823.10067-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

When we are tracing it's helpful to know which CPU's are getting
interrupted, att that detail to the log line.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/interrupt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index e5724f5371..c31c6f12c4 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -83,7 +83,9 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
             [EXCP_TRAP]     = "TRAP",
         };
 
-        qemu_log_mask(CPU_LOG_INT, "INT: %s\n", int_name[exception]);
+        qemu_log_mask(CPU_LOG_INT, "CPU: %d INT: %s\n",
+                      cs->cpu_index,
+                      int_name[exception]);
 
         hwaddr vect_pc = exception << 8;
         if (env->cpucfgr & CPUCFGR_EVBARP) {
-- 
2.36.1


