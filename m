Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C412C1705
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:52:09 +0100 (CET)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIoi-0007W8-28
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIif-0001qv-Jt
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:53 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIid-0001WB-SJ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:53 -0500
Received: by mail-wm1-x342.google.com with SMTP id h21so744351wmb.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cmro0DZbICWkoZ0DnoHpC16jsvuCgJAkyQiwC9svvb0=;
 b=Zh/nqo8qtgMEX2sACstBwM9amNJUoXJg8opQAffYEsgp180fvPyobtZ9IuR1VENvX+
 kPjvuQpHXHVsDEKo+TtAc7aQW5sPK9c0gI3/gzopvnjPjr/noC0frWzUssRoQqaWKhPW
 9VKwEQuchLiAq1D7np7mHv3JJNXWOR5zeZrwgXBAVPerDmwNEb8WjpDRKJB8Q3jLKJ8G
 00qeJnDmX+l3UIZHXpIkShN3MitPt03McIlspldjXuRO4Mwh+/HRN190dawk3Ri5QCgq
 vwN+rdzusUMs7m5Rmt5vweR2eyVa0msXDEGMo9Wguwy3itRoaaqIdPZz0RJkSZJ6cmk3
 YzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cmro0DZbICWkoZ0DnoHpC16jsvuCgJAkyQiwC9svvb0=;
 b=HpTpioWV6eP3DJSy3u36ZtCk7xnr2WESGeNBftwwutKYHZBWkLoiA6GPD2tTNJkAmU
 HYxo4CVJZd6kO6kaNwsJybONGHBfkKhDmkeyI/FN5Lcn7YIA1se6yxpT3yIYaSgc4snD
 YGUsCK5wgEKtql+zUIxXkgU/EwZir0/5fPQtAXr/JzMImPHtncgakwEER8W/loaoi8NQ
 e7SDoT2udwJ1ZCPBgVJMl7UABTrBWKuykJuXgEl9Lt86uZmH9AgBOZhpkkXkfZhztP3O
 MNrI4ON1DaDk95onpGv40bFDaoNQQa31roqTwKEcx8AjH4gsmF3xxOBAQzLSEKvBTMI3
 9f6Q==
X-Gm-Message-State: AOAM531EoN02GvMwut9WLt5Aq2EwYrtV0MROAX+IoD/2CrkTMipEX0DA
 Bn9/tDbSGSYcPST9EwJJtrPC+tmJnq4=
X-Google-Smtp-Source: ABdhPJw3Y4Fsjv6z/ddyveOtks6wH7LTgx1LMNXCvZjGkzUslDjGn692FNLnToiAmcsuZ42DK/EpDQ==
X-Received: by 2002:a1c:4957:: with SMTP id w84mr751889wma.84.1606164349878;
 Mon, 23 Nov 2020 12:45:49 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d8sm863531wmb.11.2020.11.23.12.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:45:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/28] target/mips: Extract the microMIPS ISA helper
 definitions
Date: Mon, 23 Nov 2020 21:44:32 +0100
Message-Id: <20201123204448.3260804-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the microMIPS ISA helper definitions to
'isa-micromips_helper.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-11-f4bug@amsat.org>
---
 target/mips/helper.h                   | 10 ++--------
 target/mips/isa-micromips_helper.h.inc | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 8 deletions(-)
 create mode 100644 target/mips/isa-micromips_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 18366bc0345..06da4c6cf68 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -181,14 +181,6 @@ DEF_HELPER_2(dmtc0_entrylo1, void, env, i64)
 
 #endif /* !CONFIG_USER_ONLY */
 
-/* microMIPS functions */
-DEF_HELPER_4(lwm, void, env, tl, tl, i32)
-DEF_HELPER_4(swm, void, env, tl, tl, i32)
-#ifdef TARGET_MIPS64
-DEF_HELPER_4(ldm, void, env, tl, tl, i32)
-DEF_HELPER_4(sdm, void, env, tl, tl, i32)
-#endif
-
 /* CP1 functions */
 DEF_HELPER_2(cfc1, tl, env, i32)
 DEF_HELPER_4(ctc1, void, env, tl, i32, i32)
@@ -427,6 +419,8 @@ DEF_HELPER_FLAGS_1(pmovmskb, TCG_CALL_NO_RWG_SE, i64, i64)
 
 DEF_HELPER_3(cache, void, env, tl, i32)
 
+#include "isa-micromips_helper.h.inc"
+
 #include "mod-dsp_helper.h.inc"
 #include "mod-msa_helper.h.inc"
 #include "mod-mt_helper.h.inc"
diff --git a/target/mips/isa-micromips_helper.h.inc b/target/mips/isa-micromips_helper.h.inc
new file mode 100644
index 00000000000..66a764c4aac
--- /dev/null
+++ b/target/mips/isa-micromips_helper.h.inc
@@ -0,0 +1,17 @@
+/*
+ * microMIPS instruction emulation helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_4(lwm, void, env, tl, tl, i32)
+DEF_HELPER_4(swm, void, env, tl, tl, i32)
+#ifdef TARGET_MIPS64
+DEF_HELPER_4(ldm, void, env, tl, tl, i32)
+DEF_HELPER_4(sdm, void, env, tl, tl, i32)
+#endif
-- 
2.26.2


