Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E758508F1C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:10:54 +0200 (CEST)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEmz-0004Jh-FV
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEif-0005Gz-EO
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:25 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:34700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEid-0001AX-6k
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:25 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so3926251pje.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPstaIQPIw+2x97scwvcI65CdFqpKkQGr7FCT5ZeuMo=;
 b=dtI+af1+EmvVO0e+WwYYHbwI+83G4fGMsmGIX87mxC95wHf+XbclDd9hVujM/XMQVN
 Nm+MOanDjwovJJkXmMkvAAbSCi28sH89uJyRYtxNA7zWtL1E1eJUh8L4SJ14MdL+sEAs
 KNEdp5rN8+67UPwfJe8bK7vooiWXqeyfYYnha9hYjUd43jjYgzIwE8cbVw5LUlB+dwRF
 pRJZU4f26CztXFT/BSIUoOvu0sWjq1mMJ+KQAcs6s1hQLFvlESPBq7A8W+5rsqYt4H7O
 dtb5xXvh2nW7YAl3zEXoLiHwmcTEXsw0OU1bcpbXWsZ/deVJm08D6OgRQdm5go8+Zpba
 apGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPstaIQPIw+2x97scwvcI65CdFqpKkQGr7FCT5ZeuMo=;
 b=go5B0iuluV9oKNUZlykMhVENkcvvpVxjbZFeComDNcAooxELKr0VAhhlsSFltc82G5
 KI27vBrrZ5RQqylhwMXSXBU6vNgSK42+PsshXYfgumPpr82qJ5UtbHonruMgukDAsxBf
 qSvU4TrXepjTALPAyTs/ZkHqbBsMeyr9QAyzqQG81OqKdIFeP62obHTDjwgEkRlc8wLi
 ehPx/G9tZCCFlwuYod6sRIW01Aa+JHKwVdsPl52oELfMVJUWTS09auBmErgQ3lWnmORs
 UEPqIvQVz7ueRVmKFa72xZStyrbkQ7/nFDvaPhkyvYM3Eo9VBVUtHDDZDtZfXBEnngXA
 hLFQ==
X-Gm-Message-State: AOAM531ltZ/2f+Mj3l4WLQxEN8SmyjO5rky9gXyo8GJOxIpajT5j9ond
 XDl5Dg6bH5qirilrPWsXLvkpd3QhgzNLzQ==
X-Google-Smtp-Source: ABdhPJw9MhlJorQvKXUBmmURHKGXbRW828GbowDfUHtdhXli9+Mb+myLhwqw3jFt2ETLVjLbEF1VDQ==
X-Received: by 2002:a17:90a:af98:b0:1d4:67d4:d122 with SMTP id
 w24-20020a17090aaf9800b001d467d4d122mr4403111pjq.166.1650477981963; 
 Wed, 20 Apr 2022 11:06:21 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/39] target/hexagon: Remove qemu_set_log in
 hexagon_translate_init
Date: Wed, 20 Apr 2022 11:05:41 -0700
Message-Id: <20220420180618.1183855-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code appears to be trying to make sure there is a logfile.
But that's already true -- the logfile will either be set by -D,
or will be stderr.  In either case, not appropriate here.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-3-richard.henderson@linaro.org>
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
2.34.1


