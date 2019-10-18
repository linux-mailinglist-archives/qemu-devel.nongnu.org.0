Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A66DCD0E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 19:54:11 +0200 (CEST)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLWS1-0006xR-P3
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 13:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIv-0006VF-Ba
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIu-0005Qs-7M
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:45 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33303)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIs-0005OZ-CI
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:44 -0400
Received: by mail-pf1-x443.google.com with SMTP id q10so4340048pfl.0
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
 b=CmQzsPrvDUP7TGC3Xij7NV+0fVY9PVR/mErfUMpWnbVHd0/oFLChlsIsrlZY7Zwrfl
 i0eRuvLYsOB2lO3rnSYAwmuA9V7NX7MQMtEdJq8YXwNNIanQSEFpN4T1Tcj76WqsWRSk
 n+x/LSuytWhOfARUfG9zy1AzkFiofTCTTyk6lcEDwvk3CN5/knom+NbGhKMbdE5/SqlX
 7+JDx+BJLKau+8aK1NqnekbjmsQ9R62XHbnmUoVQDyEGp2gm868uw0XkyqXYt03+fulh
 LWKwCDGlVkAA0aNQmzRWtxLPIteb/oupb3tc/vgYmWhKKMYiR7JL6HVxZBEQX+kLSk/7
 8v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
 b=hshnB8PYALP3LjizqBsOPWaW85gXjCezx1gl+cHzkFc7mXc79560ggrIxG75BMkTkl
 bI7K6ASwZ0Bw1T/SUye1yC2lzMtAAxY5omIeftEfN468wgXj/krGK8FJetnTBXt+zZah
 x6R/0kaWl2+iq8ClgO6Wz2tUEISmrG/hDCcfBLJK1LbHEqNKz0JbDrR7/UC8xNGFYu8j
 48GamPyafuuSjWIaaO0fh6Q9Q1b5c/YTajvnksVRWK/tZmSf5vmD27AbXp5yyaNWVpGB
 kLOIyJFg6+lfdMHxjkONImuBFWysPXMlscr5Y4EQZu1KcBXlbF0OVJqAFhI8Fml7ECvv
 Lzyw==
X-Gm-Message-State: APjAAAV+tlGTkqQgOrqFwEtsi1itjdNVUWeBs4MD/wSNj9v2nlGmlqoB
 nTEkzyEGCoTMWjWLajIiJ/JKzSURXzY=
X-Google-Smtp-Source: APXvYqyB6TfaFS2GJV27stjPhOaxcYlMHWRoS0gl9TVNgUKBUm6XuIz+7hlNPPsF/0QwQjihLEtOag==
X-Received: by 2002:a62:6842:: with SMTP id d63mr7967828pfc.16.1571420680836; 
 Fri, 18 Oct 2019 10:44:40 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/22] target/arm: Split out rebuild_hflags_a32
Date: Fri, 18 Oct 2019 10:44:16 -0700
Message-Id: <20191018174431.1784-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently a trivial wrapper for rebuild_hflags_common_32.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 296a4b2232..d1cd54cc93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11106,6 +11106,12 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11218,7 +11224,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
             }
         } else {
-            flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+            flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
-- 
2.17.1


