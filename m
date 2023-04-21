Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFFF6EAFDC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:58:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu4n-0000Ll-BF; Fri, 21 Apr 2023 12:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu4l-0000Fo-D1
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:35 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu4j-0005VI-Qq
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:35 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f625d52275so1895057f8f.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096252; x=1684688252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FcKaqIO+2yqGM+rJOuBgSU4ZMdY5iMgVYPogZXLQ3NQ=;
 b=X4dkG0+1SawOj83+wi/ZWE57unyToakduhMEe/PEIczfn/HCGKsOtKubwO36IoD74z
 X2hJaIfXNEznDbKf0dQX/8Ow6DtJwprbnGQNNLzkA90NouiKXLVmsGdBPyfgMNcwOpai
 uk3Z/g7W5ykf4i8w1E/wvknKXm4e6b9OlW9E3nEne7zi+E9bDsC2MYTELWSCoQGKGyPK
 yXd01/QlUe40ZQWjyN7VdPn/d1gUQqRL2BzwEW0znBpXIKkizBUx5yf/Xp4pDoNsqQ+M
 sX3fmc4ijNmPw1LX9VzZXt6pMr+4pUppa2rKlijJQ+gR6M1mpNL1S75IDl1aoQbemZZ1
 MB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096252; x=1684688252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FcKaqIO+2yqGM+rJOuBgSU4ZMdY5iMgVYPogZXLQ3NQ=;
 b=MYEV/kFB+RIwRB9It7i6fPqHE/HwdbVoiqvPHT6ZLegWreS8HsPNTBJRXPZqFNGaYW
 tMQ7xOCTfjDJ3BYCyhtBPMzeOCI2lhSG8LefMFsJo9ckEMXd8wazXBZJI2uLTas5CLaR
 +fWVUKBD3tjYyg7YVAhgYxCbhCcUhJ5iCJvuA+uSH5CrA6H/JTiBgX7gVEtZXt3Puzr4
 h5ZLitoaVupfRwkhgb0Z+B1yIhJabOVnubeVuydrbR7GbLTIc/+SEdNdcjTDOASbjzwz
 pB4UFIZke57y3Qg6EYFxE4O3co4ZqrmmKcbuqMYvu90peXGG3CQQo4ER7EKWAEsk/j5o
 /Veg==
X-Gm-Message-State: AAQBX9f75RYbHlRxsvFwvAJzGFwCwE7ejzjRyPwts1MBWm7354SKtsDP
 j/3G5nZo/vY03azYPisy7cZ1mYPpoII=
X-Google-Smtp-Source: AKy350auggM/D9AoklobN9zMdyADHU9v8N66TxFcSY2h70nr0bqXe3280ZnApTWlRlWX3vqKw7bwrw==
X-Received: by 2002:adf:cc88:0:b0:2f6:25a6:9788 with SMTP id
 p8-20020adfcc88000000b002f625a69788mr4176132wrj.35.1682096251930; 
 Fri, 21 Apr 2023 09:57:31 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:57:31 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 01/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:41 +0200
Message-Id: <20230421165351.3177-2-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Warner Losh <imp@bsdimp.com>

Intialize guest_base in bsd-user/main.c.

Allow guest_base to be initialized on 64-bit hosts, the initial value is used by g2h_untagged function defined in include/exec/cpu_ldst.h

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/main.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index babc3b009b..afdc1b5f3c 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -50,8 +50,22 @@
 #include "target_arch_cpu.h"
 
 int singlestep;
-uintptr_t guest_base;
+
+/*
+ * Going hand in hand with the va space needed (see below), we need
+ * to find a host address to map the guest to. Assume that qemu
+ * itself doesn't need memory above 32GB (or that we don't collide
+ * with anything interesting). This is selected rather arbitrarily,
+ * but seems to produce good results in tests to date.
+ */
+# if HOST_LONG_BITS >= 64
+uintptr_t guest_base = 0x800000000ul;    /* at 32GB */
+bool have_guest_base = true;
+#else
+uintptr_t guest_base;    /* TODO: use sysctl to find big enough hole */
 bool have_guest_base;
+#endif
+
 /*
  * When running 32-on-64 we should make sure we can fit all of the possible
  * guest address space into a contiguous chunk of virtual host memory.
-- 
2.40.0


