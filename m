Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F135048E6
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:25:57 +0200 (CEST)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9au-0006ou-O4
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90Q-0004X6-T1
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:14 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90P-00043b-0l
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so15541256pjb.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QrZ4LAIma7K6buALjtxKDFsEKoasy1WK64ZnNEpjen0=;
 b=dh+0OvM+1fhLJ5bLIEGS34EBfRXobJqfZ4g+YfjBUCBNpnDWxyhwJusLJ4uQoofIXP
 huKVukvqdIuC3uTFs3MfQq6GrGEkEPA3CI7QuSTVjE7D3ZE5yomy1UoO4iooxmXalve2
 SIkHTviXYlJzQsGxF2fYheHU7Zrw6eaa+GGRgNeEj4t6pX1+7dNlmv43nPFLcyMl7eGk
 Vi0gv2mNUd8trkS3EvvIcjgNvrPYK7voooZzRq/tkseFkSseOJfR9ap5OregW3rP334X
 NnrrEd+IQnc4PFKPTyvP/SPvX/NFeShcrSRclFPGKt8PWWvME00nu93SCgzwQjAowfHs
 s8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QrZ4LAIma7K6buALjtxKDFsEKoasy1WK64ZnNEpjen0=;
 b=7KSgOudYzNy0KiatftXkVtRPAODA75+gF9kJ+CEUua8Z7pOCu/ElfQvJCxdsYpt7F/
 ay+6Dp9KE2K/8qzx87PZ8Fhq5Qj5QCf2H+9nggyiP0SbzAnIJv9l3NtGOyG6Rzs0cApM
 b7J/Up/e+gRa+VrnbhmLzzqA4YDQySB2DnHJ+RI9H4p/rGnt3gLCepupH8Wa3Co4gOQe
 QfmMN82PyPOd4Wc6XtXF+y4f5x0jNsVC/rs+TdeEJ+/Z7kOzAw3pldT1YgEmft+NJ+sK
 4qQ837wnm3eJvbMGoQKKAT6J+S9KfUzFYAFe2LK/wec8ZemAt9jym1b3/jciKlItuyIM
 UsMA==
X-Gm-Message-State: AOAM530cortTe1D+nIHnK/3sK+LDBp37ODdNcdS1+4HLAk/8WvEF/qFO
 +u+yGJC6fArBIhHgcyIuVeFcfF02nxxvzA==
X-Google-Smtp-Source: ABdhPJxYdbtIMD7VW7+p1PR8PRc0BSJMKmkoDvTim4b/6OPsn/jsTHY4vlhXTCIAV4dHruBhWyi8iw==
X-Received: by 2002:a17:90b:255:b0:1cf:39e7:a7aa with SMTP id
 fz21-20020a17090b025500b001cf39e7a7aamr9111100pjb.137.1650217691657; 
 Sun, 17 Apr 2022 10:48:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 48/60] target/arm: Add isar_feature_{aa64,any}_ras
Date: Sun, 17 Apr 2022 10:44:14 -0700
Message-Id: <20220417174426.711829-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the aa64 predicate for detecting RAS support from id registers.
We already have the aa32 version from the M-profile work.
Add the 'any' predicate for testing both aa64 and aa32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 20bf70545e..d71edfc1c1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3885,6 +3885,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
@@ -4107,6 +4112,11 @@ static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
     return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
 }
 
+static inline bool isar_feature_any_ras(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1


