Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD3050491E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:59:17 +0200 (CEST)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA7A-0006oi-Lu
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fH-0000P8-TP
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:31 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fD-0001jh-T6
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:25 -0400
Received: by mail-pg1-x531.google.com with SMTP id k29so15048317pgm.12
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUBe0C4iT5t4/OHe4DJ+hJf3HvDnr2dd4byJPft2OJg=;
 b=Y5IflK46uLun63N0EBTAWzspumDw3Qmb5P3qn1olZyhJkTj0RJ+yeH2jnzDfdIXZwj
 7sZW9E84fBFc6Tzauvqh8z9gOyXuSjUDiZn0AcLolVs5rwtj3aMaiw5HFVV8P0Z+DJDb
 dIhhSk6uSvq6HLWP+vAbgm4i/2yV+Sv4xo5h9HqJ0xQE9aztdUwZjXTLoNc+Ij+pzP8f
 Wvpsl61WKkNGuitj4MWwr2uB2YPHH+kpeOQOZJDabYa1lHLHqEZXtDXTTDDhIE2j5uM5
 xNKUtOCNmEyqrsbs/xusZlwBqPTV9JVQJkyqubcI95s97+MLHgM4UKx/IyfH85vQkPHO
 ku/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUBe0C4iT5t4/OHe4DJ+hJf3HvDnr2dd4byJPft2OJg=;
 b=yBr3ODSvTFlDTyVbfG/584qye8TQTIvBA5sNDNcBy7aiINCsi4V//dx+WXCDZUMTRC
 ESJc4uYCsHF/T1e3hrD6YgdPhEdonRi+erthsZGEwEBqI0qOFJZ9sWFzQ83FBeUQNn4+
 iG+36mo1PGHCTNyarjyrcFrUkA5XqpKtBRIlzCg5uk/a6RYwmaesO9QmE3NfRYJuFTyE
 B5KpRYWfaNA0KB6M70IR2Q2b3Jrip3QLkwaKZkz9t4dHCS+fkjzLZB8VJ1vI3KNb7zI+
 D350SlcG1MsVf+vXiFGXK0iRfejjfxTOwivFPYVHhCRjFXlyAgT9i/vTbfyf2Tn7YY/w
 j9vA==
X-Gm-Message-State: AOAM532uyo9IXv5EtArxMePnNEKT+zA3EcyxbtTwg9+cAOPtVhqXsCzL
 azapm8GwU/cEWpSSQi3rtWIPIpvq+ChUqg==
X-Google-Smtp-Source: ABdhPJzGI1sVlNrvqBBf8ao106Fm0M3UfV9f6JYttU5J8lE4AqhInamvboszXnUKt4Oh6QixEhuJZg==
X-Received: by 2002:a05:6a00:814:b0:505:9fad:4252 with SMTP id
 m20-20020a056a00081400b005059fad4252mr8582399pfk.54.1650220222178; 
 Sun, 17 Apr 2022 11:30:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/39] target/hexagon: Remove qemu_set_log in
 hexagon_translate_init
Date: Sun, 17 Apr 2022 11:29:42 -0700
Message-Id: <20220417183019.755276-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code appears to be trying to make sure there is a logfile.
But that's already true -- the logfile will either be set by -D,
or will be stderr.  In either case, not appropriate here.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index b6f541ecb2..98f1452cad 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -874,12 +874,6 @@ void hexagon_translate_init(void)
 
     opcode_init();
 
-    if (HEX_DEBUG) {
-        if (!qemu_logfile) {
-            qemu_set_log(qemu_loglevel);
-        }
-    }
-
     for (i = 0; i < TOTAL_PER_THREAD_REGS; i++) {
         hex_gpr[i] = tcg_global_mem_new(cpu_env,
             offsetof(CPUHexagonState, gpr[i]),
-- 
2.25.1


