Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E047C4C0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:10:39 +0100 (CET)
Received: from localhost ([::1]:36934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzies-0004W6-Lt
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:10:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ5-0000gO-Ja
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:07 -0500
Received: from [2607:f8b0:4864:20::1035] (port=38875
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIo-0007bE-Ob
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:06 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 n15-20020a17090a394f00b001b0f6d6468eso3113900pjf.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=An2Fj85dq9l2EupXbwm7D8t73GeHD7BVJ48kGEVh0Z4=;
 b=C5J67Kv83CFhlGbbr8r5T0CqFIkvwAvFJ9FQ1Pb2vL2homGOHnlccVltMf8w9givBa
 IEb1mDTNADgl9zDngXUDDhBTdzdGF2OYmUChytE9LuBlQTN5QrHMOYNHQ8duNhE2OyH/
 8WmvvgZfBGGJeiJL4iGq8BAGKqZJa59E2lZVAJNsJwrvJp8d0NtQv6dZgjfe3nVkIoxl
 RWTR34aOutGTTdxUQKp2hrGtav7J+MdGSbJhAXCEoGpxGC7gzGN6joFHOiEw5xpP4rpZ
 1LoroZU2xguZjKabAxTyLPI7fr+IVtKghhY19CF4eW/eVuD8WTJs5SLGKjeLZVKzFf1L
 xVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=An2Fj85dq9l2EupXbwm7D8t73GeHD7BVJ48kGEVh0Z4=;
 b=QXBv/Je7xcHORnVRzI8+etQfejCVop6YovNQEI3olHSCCwAyJ0PmOOmBEhxmP6671f
 0oCvjGUZEYhKp/znhw61VLZUB2tpkjCdpOIK1fGiUEhS5sANmunoatCSEVp1lG6MY+tY
 gShwp8vEpbfrvTEeMjV0pIFM0OJsc1H8b1Em0xEhsjrl8tsK5ei8PfbxT6QWu49qEW+x
 1NZX7PBPYvd76UT5I9NGnOatHcMDLRngYmfRgyrGW1niJwEcMNIudGqzwaMoiNwHPkI6
 wUJLBVHpBNxIaNI94DAYwQOnfQ3L2H9QBoKyLme5bQHmS4InsOCRjyCX7+7vKEAyf4m6
 zqbw==
X-Gm-Message-State: AOAM532Kpu1ZzE2oy3iiM6Dnn06dgCDeFGcjx8xt4rOHgXUQNUZUXO4h
 keu7EvXKJQWXOMX69o9HOE1S3c1TCs4HeQ==
X-Google-Smtp-Source: ABdhPJwuky73eBocrRapPqOQeYnqi+TJJ9avsJR4Hj4Auq5BuYyIXWcOH8naJA7JghqdmdUt4RVMMQ==
X-Received: by 2002:a17:902:8505:b0:142:892d:918 with SMTP id
 bj5-20020a170902850500b00142892d0918mr4024049plb.39.1640105266608; 
 Tue, 21 Dec 2021 08:47:46 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/31] tcg/loongarch64: Implement the memory barrier op
Date: Tue, 21 Dec 2021 08:47:14 -0800
Message-Id: <20211221164737.1076007-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-9-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a88ba9a253..615bed9096 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -234,3 +234,35 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         g_assert_not_reached();
     }
 }
+
+#include "tcg-insn-defs.c.inc"
+
+/*
+ * TCG intrinsics
+ */
+
+static void tcg_out_mb(TCGContext *s, TCGArg a0)
+{
+    /* Baseline LoongArch only has the full barrier, unfortunately.  */
+    tcg_out_opc_dbar(s, 0);
+}
+
+/*
+ * Entry-points
+ */
+
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
+{
+    TCGArg a0 = args[0];
+
+    switch (opc) {
+    case INDEX_op_mb:
+        tcg_out_mb(s, a0);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.25.1


