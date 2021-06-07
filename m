Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832FA39E540
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:24:21 +0200 (CEST)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIz6-0002WS-Ew
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaw-0007ig-BX
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaR-0007zn-Qe
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c5so18397531wrq.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WttECluiQs8PiWTuhXDPR0B557G5Nz9drpIG9WwzYtA=;
 b=FTruKnZsF7qHB7367HBbzjV6fBJhdMkK9o1Q7SUNLDLvakQuuamnVIH1YK9f+OEqi3
 vJGXJx2d4TD0IViborbMQnWrXv405KaidA2R/lreHj+nhyoqHL3Kf3LZGyserTXBW70w
 cJsBmQRqMu0GCfiPmxvT1mAGzWfq5Mp/ST6oeJnylSHvV+eUPI7VvcnpB2wUB6gQuvc+
 1diOMfxKsRHz8ZOs7/Nonmsxd9pRarL4w9wwuUTx1+0K5tE9c+oQja86NfCXDebpAwOM
 Ea/weMkTzJU0YWLNOSCJJGG1F6vnhkwFNR3yrU4LeWfr/+4IrXh1kcZF0sM3MGn5q47F
 5o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WttECluiQs8PiWTuhXDPR0B557G5Nz9drpIG9WwzYtA=;
 b=X3ntA6huXW3siNtox6OIySLCXP2o975gFqxcBXLgTid3TsqBdLM8qDyFJ/j+uX8PDb
 nLlZV68jM3VMmj+HGUeLpCRpJiAWVXn4wih0nCHqV/AuRREnNFmhc+zWI67zxFu+AYXV
 58oApHbmOtasW5vcgxL4Pfpw22e4jxFzrwD6B9Cj9u+0vAPcp2qUAxiT8LZR0S92X2dm
 l3xmGyJBfX8b8WkBgz2bzL3P69eiWFvOhDBCTNaOwR8dLJ5Eca9LFL6m7prCMhE/C39x
 Efr/oVIyUFQXy7kI29RxXF7wzyq3wvEPxw8MbshUM+GFI/q24qVeyoGLBOgS4oB/tRXf
 CU/w==
X-Gm-Message-State: AOAM531VKtv6QRRY0mcjDJeH9xdicFsCrb6ZGmG9XZQEtNsoqyy2l/S2
 QoYqelutI/5Lh5F5gLbpLJ1W+A==
X-Google-Smtp-Source: ABdhPJydfRYx+L0uY8UPiUhsdT7+tr4YT3VBbV1VVfIoDuIJRXfafZeMU6yRpHLMl2PgDCW0FdYmdg==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr18081765wrt.133.1623085124610; 
 Mon, 07 Jun 2021 09:58:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 26/55] target/arm: Implement MVE VABD
Date: Mon,  7 Jun 2021 17:57:52 +0100
Message-Id: <20210607165821.9892-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VABD insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 7 +++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 5 +++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index bc9dcde5dba..bfe2057592f 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -111,3 +111,10 @@ DEF_HELPER_FLAGS_4(mve_vminsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vabdsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 42d5504500c..087d3db2a31 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -93,6 +93,9 @@ VMAX_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
 VMIN_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 
+VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index f53551c7de5..f026a9969d6 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -410,3 +410,8 @@ DO_2OP_S(vmaxs, DO_MAX)
 DO_2OP_U(vmaxu, DO_MAX)
 DO_2OP_S(vmins, DO_MIN)
 DO_2OP_U(vminu, DO_MIN)
+
+#define DO_ABD(N, M)  ((N) >= (M) ? (N) - (M) : (M) - (N))
+
+DO_2OP_S(vabds, DO_ABD)
+DO_2OP_U(vabdu, DO_ABD)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index c12b0174b82..a732612a86f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -387,3 +387,5 @@ DO_2OP(VMAX_S, vmaxs)
 DO_2OP(VMAX_U, vmaxu)
 DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
+DO_2OP(VABD_S, vabds)
+DO_2OP(VABD_U, vabdu)
-- 
2.20.1


