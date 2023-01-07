Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D410B660CEC
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:08:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zb-0003ps-5N; Sat, 07 Jan 2023 02:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zS-0003jD-La
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:42 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zR-0004AT-3E
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:42 -0500
Received: by mail-pl1-x635.google.com with SMTP id n4so4095072plp.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xRarcor/wbrlmQ6/1SUQDwNV/2PA1HoUGLA4N0wOFk=;
 b=lDn6VQoCg6J25d9jXlkhizJMcvf6DlzSzxtkz12uuDc3qGZSMYMJiYeK5znFUSd1yY
 qkq0V3bFQZfYanWH4lekM3GLKbQyfus1Zz4T5UVW/6WLgag6acuSnMzQtm9dNMhietmz
 3qD5Sd98S6faEiiwCCohynqPlFsDNinRz6Qg9M8P2Azw/ArpNIbiuhGdU+9xdyeu6CJ2
 4L/nHZZ6sNm/ZKUWFwpD91k5XHYb3QHdQOjXH3lz2GY8CyKgiapXQklAMpxY6LjfQUOG
 wY3AL/tROwMuv7aA8ehWLoPMKjoAxPX32sW1XQvTJ1nOjXtmrQBevGuNjRYMtOfM4Kc/
 QMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xRarcor/wbrlmQ6/1SUQDwNV/2PA1HoUGLA4N0wOFk=;
 b=IqRL+Iia3xbkRDR9UqNpwY8EP92VxT6jWN6O8+IclXIvBbelW+g637GQG5GKaKBP1a
 FuQOhf/iLVZnNZJo1u1lOQdw2kWRGliAsqD/a6oYsnsY9pJlEb6VzFRldrhLqJHIe+DO
 QxfrIkrYXbgrQuNXK9+jwsqMALtvRILLZc08YTCQ4PkIXSYRdyeFhACZyiJyZlIkLMBE
 YF+3mrPBDftARcrkTP3Mi/IOsEt1UB8rciA3Aip427+lAtaMIGVT77IGq2wRCWOOyL1u
 OiSB+fk8wkWkS+/exp5Kk7ZsAUaruTHP0+BsnsxGFhyLeWLJREb2Oz7oyz5Ra4OJu4wu
 nUJA==
X-Gm-Message-State: AFqh2krwdi5IMPnkL91IhmtT4sGjXyF5dBkqAhq1NKeyderTuSXSFCQI
 rglHVi7Zh9xJCTYxm8fjIRBex0YvqUtOpZsy
X-Google-Smtp-Source: AMrXdXsO9Qm9XVlmooaRoDE5J0L6F4lHxOPKu1yWlAg2VV74VNxKHBU2mTCCDMeqKlPXchyuBtlzKQ==
X-Received: by 2002:a17:90a:294f:b0:226:f7f6:ad2f with SMTP id
 x15-20020a17090a294f00b00226f7f6ad2fmr676637pjf.38.1673077900366; 
 Fri, 06 Jan 2023 23:51:40 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 22/27] tcg/s390x: Support SELGR instruction in movcond
Date: Fri,  6 Jan 2023 23:51:13 -0800
Message-Id: <20230107075118.1814503-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 30c12052f0..ab1fb45cc2 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -202,6 +202,8 @@ typedef enum S390Opcode {
     RRFa_XRK    = 0xb9f7,
     RRFa_XGRK   = 0xb9e7,
 
+    RRFam_SELGR = 0xb9e3,
+
     RRFc_LOCR   = 0xb9f2,
     RRFc_LOCGR  = 0xb9e2,
 
@@ -626,12 +628,20 @@ static void tcg_out_insn_RRE(TCGContext *s, S390Opcode op,
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
@@ -1376,6 +1386,11 @@ static void tgen_movcond_int(TCGContext *s, TCGType type, TCGReg dest,
             src = v4;
         }
     } else {
+        if (HAVE_FACILITY(MISC_INSN_EXT3)) {
+            /* Emit: dest = cc ? v3 : v4. */
+            tcg_out_insn(s, RRFam, SELGR, dest, v3, v4, cc);
+            return;
+        }
         if (dest == v4) {
             src = v3;
         } else {
-- 
2.34.1


