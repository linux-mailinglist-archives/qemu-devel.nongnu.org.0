Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DFB2681F9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 02:03:09 +0200 (CEST)
Received: from localhost ([::1]:60238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHbxc-00046t-3a
	for lists+qemu-devel@lfdr.de; Sun, 13 Sep 2020 20:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHbwb-0002bg-6D
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 20:02:05 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:33971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHbwZ-0004C4-Av
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 20:02:04 -0400
Received: by mail-pj1-x1043.google.com with SMTP id s14so418837pju.1
 for <qemu-devel@nongnu.org>; Sun, 13 Sep 2020 17:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uEhRDQbPBvpSG5xc2pJjbxBlGNp1Es5E3WFmyWYEgg=;
 b=vrw+7R58kQ5LK4jlxQL0MS/fmlg++1IqtaK293e8p3GYKqLWMTXNbUpZSkQjn4pFTi
 WtLnwHeufF/paKi7S2P2s7mE5uwds/VdVXj7A5gEpkFPvv09ogeiiDo4k02rGWUB+JYc
 2wDrcMkOh4f7MmE79HVCi1O/sTkhWphooGyMS4MCpXvEtXpgHo6/KYB6K279l/1cCSSp
 oifxrv2hAuiGwwVKl1GjJVAsGrHE4KIUkq2Cao27+iRN6zou+vTbjCsE08E9Om0J6kQf
 5i5BEOnGY5XI5NE2Fub1ahGaLVRRctvJ3uZkx4QwqkI2drI2WiGebrkEDMR1UKNj8Qqv
 sklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uEhRDQbPBvpSG5xc2pJjbxBlGNp1Es5E3WFmyWYEgg=;
 b=oE3XHveCkctfF0CmctVZn1kFOHHbDYjo9JHSznl4YDwCQ2snI5QrZyVM2N7Ja1k+d8
 WezHJX+NxH2YmxLbfjxmH8bY8b0QUrrMvoVryHyfu0zU3PxLStoIgu1T2i1LWUsRFAj+
 LkQGtdOudihyPxKYZGbBeTwwgHyjaBzIPC6wKYxU8euqMRP9qwN205At+NkxsLZd2JLl
 p4wwhWuZE1w0qi/BTjO8PZMCpPAVFnbcYkPc95tndl7NW7fngoK3rVbZjMN47YkZOrrs
 9EtXejZK7a66cwa/ha7zhRfXi1cMF2WVa1BNXmxWIDNnaNNDGwo/mP5W3z87aPEMYv+m
 xpIQ==
X-Gm-Message-State: AOAM530lf+pSbtqIsPiyC+sb3U4TPiq6FjTPxz5G+Hf75P1crQTglQLB
 TM9UYNB/PHyjKAIbROpj8/vAJvzfIz78SQ==
X-Google-Smtp-Source: ABdhPJxwVr1oppoIGobuV9LmqBXCta2XXV+YRKXVMah1ORF4zVuA7eMOzgfMyNcKW9vRRHNX7uzLXQ==
X-Received: by 2002:a17:90a:6a4e:: with SMTP id
 d14mr11001888pjm.63.1600041721573; 
 Sun, 13 Sep 2020 17:02:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 31sm6538252pgs.59.2020.09.13.17.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 17:02:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] disas: Use qemu/bswap.h for bfd endian loads
Date: Sun, 13 Sep 2020 17:01:47 -0700
Message-Id: <20200914000153.1725632-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914000153.1725632-1-richard.henderson@linaro.org>
References: <20200914000153.1725632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: luoyonggang@gmail.com, alex.bennee@linaro.org, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the routines we have already instead of open-coding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/dis-asm.h | 32 ++++++++++++++++++++----
 disas.c                 | 55 -----------------------------------------
 2 files changed, 27 insertions(+), 60 deletions(-)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index d2418c977e..8a216ac495 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -468,11 +468,33 @@ int print_insn_rx(bfd_vma, disassemble_info *);
 
 /* from libbfd */
 
-bfd_vma bfd_getl64 (const bfd_byte *addr);
-bfd_vma bfd_getl32 (const bfd_byte *addr);
-bfd_vma bfd_getb32 (const bfd_byte *addr);
-bfd_vma bfd_getl16 (const bfd_byte *addr);
-bfd_vma bfd_getb16 (const bfd_byte *addr);
+#include "qemu/bswap.h"
+
+static inline bfd_vma bfd_getl64(const bfd_byte *addr)
+{
+    return ldq_le_p(addr);
+}
+
+static inline bfd_vma bfd_getl32(const bfd_byte *addr)
+{
+    return (uint32_t)ldl_le_p(addr);
+}
+
+static inline bfd_vma bfd_getl16(const bfd_byte *addr)
+{
+    return lduw_le_p(addr);
+}
+
+static inline bfd_vma bfd_getb32(const bfd_byte *addr)
+{
+    return (uint32_t)ldl_be_p(addr);
+}
+
+static inline bfd_vma bfd_getb16(const bfd_byte *addr)
+{
+    return lduw_be_p(addr);
+}
+
 typedef bool bfd_boolean;
 
 #endif /* DISAS_DIS_ASM_H */
diff --git a/disas.c b/disas.c
index 50b5677930..20fad6aabb 100644
--- a/disas.c
+++ b/disas.c
@@ -85,61 +85,6 @@ generic_symbol_at_address (bfd_vma addr, struct disassemble_info *info)
   return 1;
 }
 
-bfd_vma bfd_getl64 (const bfd_byte *addr)
-{
-  unsigned long long v;
-
-  v = (unsigned long long) addr[0];
-  v |= (unsigned long long) addr[1] << 8;
-  v |= (unsigned long long) addr[2] << 16;
-  v |= (unsigned long long) addr[3] << 24;
-  v |= (unsigned long long) addr[4] << 32;
-  v |= (unsigned long long) addr[5] << 40;
-  v |= (unsigned long long) addr[6] << 48;
-  v |= (unsigned long long) addr[7] << 56;
-  return (bfd_vma) v;
-}
-
-bfd_vma bfd_getl32 (const bfd_byte *addr)
-{
-  unsigned long v;
-
-  v = (unsigned long) addr[0];
-  v |= (unsigned long) addr[1] << 8;
-  v |= (unsigned long) addr[2] << 16;
-  v |= (unsigned long) addr[3] << 24;
-  return (bfd_vma) v;
-}
-
-bfd_vma bfd_getb32 (const bfd_byte *addr)
-{
-  unsigned long v;
-
-  v = (unsigned long) addr[0] << 24;
-  v |= (unsigned long) addr[1] << 16;
-  v |= (unsigned long) addr[2] << 8;
-  v |= (unsigned long) addr[3];
-  return (bfd_vma) v;
-}
-
-bfd_vma bfd_getl16 (const bfd_byte *addr)
-{
-  unsigned long v;
-
-  v = (unsigned long) addr[0];
-  v |= (unsigned long) addr[1] << 8;
-  return (bfd_vma) v;
-}
-
-bfd_vma bfd_getb16 (const bfd_byte *addr)
-{
-  unsigned long v;
-
-  v = (unsigned long) addr[0] << 24;
-  v |= (unsigned long) addr[1] << 16;
-  return (bfd_vma) v;
-}
-
 static int print_insn_objdump(bfd_vma pc, disassemble_info *info,
                               const char *prefix)
 {
-- 
2.25.1


