Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177B2CA3E0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:31:49 +0100 (CET)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5ky-00044M-8J
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5hr-0002kM-Bq
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:28:35 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5hl-0006ID-CG
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:28:30 -0500
Received: by mail-wm1-x342.google.com with SMTP id v14so2803239wml.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SkU0x0PsOvuU2zhH0806drjS01R88qBbsS1X8IGmXd4=;
 b=LA/X9If1cVCFCMwkEgLppzUp/9UfevjG15I5JF7eCdbqqDE9PEumaHLJv89aznyfYk
 hoRR4feHL18uRP5ypbRZjAqhm/MqKuZRH93kFEaQtTw0+STl0pEXz0MdbtZ32HKnGML6
 zp8I9zWKKLoMYUJVDRehIKnJTTHxi86R6AMYAnOeiuPcYlmHaOnimXvs+rDyHoaJ8lfb
 fxB4S1kteycO97KharTTvReKrgq45dXsS6MphjGsWfHcE1GEFmtcU83jg3KBckzWO/eg
 I5sFNIDn+/oTlI1crmlD1bXW0GsOsWiw1UVRVwJjePy2cOxZry5gSTLUi/67miNlOZkU
 3KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SkU0x0PsOvuU2zhH0806drjS01R88qBbsS1X8IGmXd4=;
 b=eTZK9qCoNzaC0s+WomTlAq31ajBrSdd224JwmmJG+nIrLufrU7lTJBtybQ22pzbxyh
 WAiH7Evqs+uAB6qOT8UTDVAA3ddvikE0qgN8QxM56X6w91Hqssw6hLAUZPawlg23rk8c
 R7ZL3qEahqlW+ROcdCKbTrX0hsHRFNdUAjkEMzlKwkWYjff2xxj2JoMwiN6NNPbDvlha
 zIxo1GHNSYKV6FgMUFc4u9xAnrqYl76CMrLAK7aqC8SOzFLijZ/7n9zZS9OXsJcKH2Ap
 oSDKeGpTAbezvZ7sOgKrVbfR+df/eOk88Q82ovnoSsOIkKFv19cSDQEHwheTjJ8tT40l
 Aigw==
X-Gm-Message-State: AOAM530JjOkPc/ugNmUbiTc/qQoTox9ZuYM5TEFZhG3EQ0/DL0bv4LDC
 JHiq4c8/Oqso9zY8v7Rnt7s=
X-Google-Smtp-Source: ABdhPJzMH4QBH1zWvlegMx2xfQw27rH86wcqPxfO889BQy68vSQ6O5s6Z+7EeQeb/TDoUFoZF+fgCQ==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr1846926wme.99.1606829305464; 
 Tue, 01 Dec 2020 05:28:25 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id x9sm3175063wru.55.2020.12.01.05.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:28:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/3] target/mips: Add CP0 Config0 register definitions for
 MIPS3 ISA
Date: Tue,  1 Dec 2020 14:28:15 +0100
Message-Id: <20201201132817.2863301-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201132817.2863301-1-f4bug@amsat.org>
References: <20201201132817.2863301-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS3 and MIPS32/64 ISA use different definitions
for the CP0 Config0 register.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 23f8c6f96cd..05291cee4db 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -828,7 +828,7 @@ struct CPUMIPSState {
 #define CP0EBase_WG 11
     target_ulong CP0_CMGCRBase;
 /*
- * CP0 Register 16
+ * CP0 Register 16 (after Release 1)
  */
     int32_t CP0_Config0;
 #define CP0C0_M    31
@@ -837,13 +837,20 @@ struct CPUMIPSState {
 #define CP0C0_MDU  20
 #define CP0C0_MM   18
 #define CP0C0_BM   16
-#define CP0C0_Impl 16    /* 24..16 */
 #define CP0C0_BE   15
 #define CP0C0_AT   13    /* 14..13 */
 #define CP0C0_AR   10    /* 12..10 */
 #define CP0C0_MT   7     /*  9..7  */
 #define CP0C0_VI   3
 #define CP0C0_K0   0     /*  2..0  */
+/*
+ * CP0 Register 16 (before Release 1)
+ */
+#define CP0C0_Impl 16    /* 24..16 */
+#define CP0C0_IC   9     /* 11..9 */
+#define CP0C0_DC   6     /*  8..6 */
+#define CP0C0_IB   5
+#define CP0C0_DB   4
     int32_t CP0_Config1;
 #define CP0C1_M    31
 #define CP0C1_MMU  25    /* 30..25 */
-- 
2.26.2


