Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F177A6400AA
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:53:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuF-0007dI-KF; Fri, 02 Dec 2022 01:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zuA-0007an-NX
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:14 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu9-0003d6-2V
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:14 -0500
Received: by mail-pf1-x432.google.com with SMTP id w129so4088970pfb.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Of98snGjT8xXsaEJexef1vyfcUCPe7JWl42fv+AP/9U=;
 b=oKCdyEw98+YbWJhS/mxQVeCvpeYsgyDbYk4uTue63SJl6LywVEglLDXMYsuL7cObtp
 eNMMIgiMk80bwUpwQzTiWqU2PNYh13f8F0ojgWwn0K1Eid1g4ZUPNVnDXQIl1U/ZJCQ7
 Tn5MYfikmheVxIvUoJthNkDW4ogAZayD8WtOtgH2m4+hpLeHzESGKj6u33pOEgOxLhWw
 iW3Kk1wfjopdOvMhLEOUT4M9BF7LiGvU4yrZfmE63owcn6O4fpIIBSmPSekT+jFdNsg6
 J/GBbvcK1CCeSqB6WPlQlotV8sp2fOwqjb5ZW4a9SnXLfpEtqOgqtnuCsels+nySm4Hs
 n/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Of98snGjT8xXsaEJexef1vyfcUCPe7JWl42fv+AP/9U=;
 b=0rHKIVrfTT+E7iKufeRBGgeNP0wKJSD6gXGO5d+jUgRhPIyr8ib/tnbeOenNEVVSm6
 xRxknvGrWE1FVSmiVzNCf6QghCM+AVWUuok+trvbUE9Ffpk9WnPtJSCl1Ukp2sDsB6JA
 bTjPpTSHRlInHucUeEY1Whyp0I65yhPM+32ual5BLE9AHgtYI23EqfzmeId54+VGtpt8
 /HHFXIAVnhxbJAJzhOhT20Ry7bBDnyblXrLyZf0dmp2wlqtg6efmbzVwGHZ6xUpsbvjg
 m9HZ41HkpMfdTbF9QkcjdwQ1Fg3aIRb0ffY3uE+s0Dqo1F/1fLXKF6TLBQn/5WtkGCa5
 UBcA==
X-Gm-Message-State: ANoB5plF65ruBZqILYJpdUGoYhhsWs5QkXkUubWZOBpImH296IvBrMcc
 uAI9m7sms94b4O+hkxb6PSXajWaZSdPEzI/q
X-Google-Smtp-Source: AA0mqf7YESFHXm0AyWThFFvmWGMoMCw1HLcmcsHC8bOokUP9u3ibWbADejbuCx09HSTB3TvYqbJAqA==
X-Received: by 2002:a05:6a00:1814:b0:56b:d7a5:4be5 with SMTP id
 y20-20020a056a00181400b0056bd7a54be5mr52643505pfa.62.1669963932376; 
 Thu, 01 Dec 2022 22:52:12 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 11/13] tcg/s390x: Support SELGR instruction in movcond
Date: Thu,  1 Dec 2022 22:51:58 -0800
Message-Id: <20221202065200.224537-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

The new select instruction provides two separate register inputs,
whereas the old load-on-condition instruction overlaps one of the
register inputs with the destination.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b2adbbe7de..1e4947b598 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -204,6 +204,8 @@ typedef enum S390Opcode {
     RRFa_XRK    = 0xb9f7,
     RRFa_XGRK   = 0xb9e7,
 
+    RRFam_SELGR = 0xb9e3,
+
     RRFc_LOCR   = 0xb9f2,
     RRFc_LOCGR  = 0xb9e2,
 
@@ -560,12 +562,20 @@ static void tcg_out_insn_RRE(TCGContext *s, S390Opcode op,
     tcg_out32(s, (op << 16) | (r1 << 4) | r2);
 }
 
+/* RRF-a without the m4 field */
 static void tcg_out_insn_RRFa(TCGContext *s, S390Opcode op,
                               TCGReg r1, TCGReg r2, TCGReg r3)
 {
     tcg_out32(s, (op << 16) | (r3 << 12) | (r1 << 4) | r2);
 }
 
+/* RRF-a with the m4 field */
+static void tcg_out_insn_RRFam(TCGContext *s, S390Opcode op,
+                               TCGReg r1, TCGReg r2, TCGReg r3, int m4)
+{
+    tcg_out32(s, (op << 16) | (r3 << 12) | (m4 << 8) | (r1 << 4) | r2);
+}
+
 static void tcg_out_insn_RRFc(TCGContext *s, S390Opcode op,
                               TCGReg r1, TCGReg r2, int m3)
 {
@@ -1474,6 +1484,17 @@ static void tgen_movcond_int(TCGContext *s, TCGType type, TCGReg dest,
         return;
     }
 
+    /* Note that while MIE3 implies LOC, it does not imply LOC2. */
+    if (HAVE_FACILITY(MISC_INSN_EXT3)) {
+        if (v3const) {
+            tcg_out_insn(s, RI, LGHI, TCG_TMP0, v3);
+            v3 = TCG_TMP0;
+        }
+        /* Emit: dest = cc ? v3 : v4. */
+        tcg_out_insn(s, RRFam, SELGR, dest, v3, v4, cc);
+        return;
+    }
+
     if (HAVE_FACILITY(LOAD_ON_COND)) {
         if (dest == v4) {
             if (v3const) {
-- 
2.34.1


