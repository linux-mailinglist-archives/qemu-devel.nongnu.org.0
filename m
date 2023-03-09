Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5E76B2E89
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMgW-0007BL-9O; Thu, 09 Mar 2023 15:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMgM-0006NY-C2
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:16:10 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMgK-0002s2-LJ
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:16:10 -0500
Received: by mail-pl1-x62f.google.com with SMTP id a9so3211672plh.11
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqkTjaGJM8DnE14G+6CyxH6VE5+2RWIp+jWXl8vO804=;
 b=FXbZtCukePVi1EMXlwW5cuzVyT7KfLOT80SqSeSf/kBf+w6zgEf1W/VTAdslOJsQMK
 yrYQEg49OGtHT6qBkQor6+McahtEof5KeU2a4x3um0i15UCNmOW5vMlFrE4beTO//NLR
 oYzF9NOSPBVEzUo0xMljGZcmMXJ/xZiIAKzlZylRA5l2w18ZHXbbVHQBd8GdOQwN0L29
 dvQcitS3/xRRYmL0qy7j6Zq2N7jIEY5KxUjSarJtu9kJBMzsDdtznqXJ5m00diamfOBa
 encI4AJomFrl8QdIoiPKCSgSM8uKmH576wFVmcloKDc8DlTEY1O/CEeg+c8z+EUZdKjW
 p1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XqkTjaGJM8DnE14G+6CyxH6VE5+2RWIp+jWXl8vO804=;
 b=QwFtG9DxDM4fwGboucf5mFYqBoUgtm/bzUevYMkArmYp/5JQDYxb0BrQCWA4RF1p1X
 iA0gfki+zlTSsAfycyqu7uSc5rV9fCZq17eT/vhxeLQhDqEiDAcWf933dFT+VmmMVx6L
 lHyBybyaDCzffT0LZFfO3G5q5YrkLDKcn6KLK3O2LZmTLres33U1R7rQZT062bdkAumI
 Vj2eJ6XVejURPJNsq+YR5BMEO8IrB+t2TQfuuT0kWGHAZ1/natb98JepFT1n9b94HBKV
 MsJx2OpEhpcOYCzP2P1Ue4l9lJOcpXvVg1RSyQe2qMVh1bGZDxCcb7nOU1U/sBSoWyMd
 BKvw==
X-Gm-Message-State: AO0yUKUVQ3vAXWjXsw3YJOjgh++I1w8q0ZP/lEtwABYhFFlxKhxXVx2P
 fPraHB0Uykw1MHDXeHOI4M5eWzYpuAbdxt6QFUs=
X-Google-Smtp-Source: AK7set/CjWGEluCFCHYQ4p+99Nb4XUkkzFJdJJXINe7dTI4qpPBLssMB5ttK58Tm9A3vFdPhBQ2NHQ==
X-Received: by 2002:a17:90a:1a53:b0:234:b4a7:2abd with SMTP id
 19-20020a17090a1a5300b00234b4a72abdmr24525040pjl.12.1678392966504; 
 Thu, 09 Mar 2023 12:16:06 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a17090a1b8400b0023377b98c7csm304094pjc.38.2023.03.09.12.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:16:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 1/2] target/m68k: Reject immediate as destination in
 gen_ea_mode
Date: Thu,  9 Mar 2023 12:16:03 -0800
Message-Id: <20230309201604.3885359-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309201604.3885359-1-richard.henderson@linaro.org>
References: <20230309201604.3885359-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In theory this should never happen, as all such instructions
are illegal.  This is checked in e.g. gen_lea_mode and
gen_ea_mode_fp but not here.  In case something higher up
isn't checking modes properly, return NULL_QREG.  This will
result in an illegal instruction exception being raised.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 422f4652f1..e16c608ef8 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -894,6 +894,10 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
         case 3: /* pc index+displacement.  */
             goto do_indirect;
         case 4: /* Immediate.  */
+            /* Should never be used for an output or RMW input. */
+            if (what == EA_STORE || addrp) {
+                return NULL_QREG;
+            }
             /* Sign extend values for consistency.  */
             switch (opsize) {
             case OS_BYTE:
-- 
2.34.1


