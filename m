Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1584FA073
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:09:51 +0200 (CEST)
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyfm-0003EB-FL
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydo-00088i-BV
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:48 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:40616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydl-0003Pd-V4
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:47 -0400
Received: by mail-pf1-x432.google.com with SMTP id a42so3240622pfx.7
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bsIZuuOFl21oF1yTY/+qyLzpHVhgT0vup4ac2EKKMU0=;
 b=f3tpx/2QeX/GaEjY0MjWWZiXHhYBkui0HWp6Z0QGU/Dev2qUABzf8PSIRbILQrECN6
 gY3+929yIppa3fMB/14cm7PxWput/4WKAkpU4BXgthkxe/KkaVPmPAB0/Ujq6TMC42Pj
 pkT/7YWnQdarana54zRMB/Yy36CD2jlWVSrY8+pfcOf4f/Gof6X47tZnAbYqa7/f/aBo
 LMkQGwM1avrmBUeomQS3wM/QL6ZH6fLiEjXG3rZrqM5GQe8MAvxZNN99eWpzDPLde1np
 ch3TXSPONzjxm09D0ndyVu+0bh++6vzudopjjB8gzYeSEzFeqhA0d+zfEl5N5COWMGx4
 fBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bsIZuuOFl21oF1yTY/+qyLzpHVhgT0vup4ac2EKKMU0=;
 b=GjC8J8JASXLLcY5DtIgLNp5mUE5Yb6Y82qIczHBZYFaddeqroeCq8KsQNfsimxQVwS
 X8ScuWm86m6qHJsjZKav+O27JBtVZmBCFkCRhIP4q9W/JM2edT8fHju+hgZ3FphEYaxd
 ZzQrnzGWIdQ0xvfnscQyXwc0awSqG6LgJUy/Ff7UgcxofmGSK2uzyAXXZzJn8rhtshzm
 IBy1f3hbBYAJ0J4jSsntFudh8/0nKtlyFcVQiqGKNUCYIBCN5hdk+5T2h5Ymz+8rgh4L
 8P0cZIUdb5Ba9F5lsiWv81lM9E3GF/KI91177VLgL0IlMn7rIF8ok0eo8klkTfDJfttR
 OKUQ==
X-Gm-Message-State: AOAM532gw4oXipTlCCuyO5XyQvgzmryXmzHtuYILZmZdPBMqfqNrCZ8D
 mnlZCeiYCquWz1Rtx9l6UQZ3GIpn8CIgpg==
X-Google-Smtp-Source: ABdhPJyY4WYFo8aAMkX142//gn3BVNekEL79h2f9pnRvDXjWnmYVrSDk0BmJ64P1hcrugnJgqel+bg==
X-Received: by 2002:a63:2f46:0:b0:382:230f:b155 with SMTP id
 v67-20020a632f46000000b00382230fb155mr18180747pgv.64.1649462864342; 
 Fri, 08 Apr 2022 17:07:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/16] target/arm: Add isar predicates for FEAT_Debugv8p2
Date: Fri,  8 Apr 2022 17:07:27 -0700
Message-Id: <20220409000742.293691-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 23879de5fa..9c456ff23a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4026,6 +4026,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4332,6 +4337,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
+}
+
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
@@ -4415,6 +4425,11 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
     return isar_feature_aa64_tts2uxn(id) || isar_feature_aa32_tts2uxn(id);
 }
 
+static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1


