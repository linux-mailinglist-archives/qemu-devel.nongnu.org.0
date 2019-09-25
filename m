Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BD1BE532
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 20:53:40 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDCPz-0008GB-CY
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 14:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCIV-0001eg-0r
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCIT-00049n-Th
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:45:54 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44315)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDCIT-00048s-NO
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:45:53 -0400
Received: by mail-pg1-x52d.google.com with SMTP id i14so142457pgt.11
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6zTCS3a7jbtaH9NaP7Qy7VX+G/mKKsgVF1UpUR0SU0=;
 b=fu9N3v/CyUj/AF1Jqou+Qwav1uyd1l+Fwy4D4qmEZmi33EKs4W3qnvY3yR9jLD0yU4
 veUfrSnFBqm2TZBbmRnZZEm2MPz9c2Ue06agPoeXt2KiXbUAtu28fWtUzuDFBWZsX7Ma
 mJoOPnpKkM6h4ElbPC4fXcS9Kfe7AIXHmbjT5monn04u+UrEcqxodE0sLirLc2dZ0wt6
 j9j6vAGEbVGrkiaqwooATKogVKGaGWMSPKpo3DEFqpzH9zqPL/FoXr9D7TK4ukzRo60h
 cRvESQKVXnq1PvNdtOO8Yw+FiQPZrlf3IrZXyhLKoPs/Q7gKrbGOKjmw5qEamT8AY/Gi
 jlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6zTCS3a7jbtaH9NaP7Qy7VX+G/mKKsgVF1UpUR0SU0=;
 b=XbFR4VjM2draCp9Fcx+ACTWZsm8CWMCn0gd+XnXDSgKj87OLyQokuqQJCOBjIrrn00
 hwpcU2eLLGUsVFya3Hj973F9iZVFg6+sDGDbU7Kd219cltHEpob9jXNRqjwwMdFfnI8L
 gZwcaoYZjpNX5pNr37M6DdmzMEEP18SBR2OsW3v3J5A6yN4k69vzDarav+e3vmmKsb/f
 qId3RYxVxUBeICzw6X6e0zjDKav1nodAe8UeHZBQJNBhDS8nnGRGI2IK4dprL/0A8BcU
 rxBOTtbsX85AzRY9WW8z5y30pOF3nrMeeeZAoRBbmX1wnAbAzf8yeIIyUMs/teyDhVQQ
 LlvQ==
X-Gm-Message-State: APjAAAVFGm3YTyeAiEB/p64oMbJ0801a7xHy/zZYJSszbe0jsegQBoLM
 FuvNNRapEvPFOEKzbqqrGLlCdn1ltJc=
X-Google-Smtp-Source: APXvYqwBtwq69sWjbmzjoL1SWDwe8DNCHdqT2Pdl0lNd4cGMGXqThZuVW+Demfr6rYEWaDZZt1YtRw==
X-Received: by 2002:a62:2b51:: with SMTP id r78mr11146723pfr.149.1569437152312; 
 Wed, 25 Sep 2019 11:45:52 -0700 (PDT)
Received: from localhost.localdomain ([12.206.46.61])
 by smtp.gmail.com with ESMTPSA id l24sm6133229pff.151.2019.09.25.11.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 11:45:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/16] exec: Use TARGET_PAGE_BITS_MIN for TLB flags
Date: Wed, 25 Sep 2019 11:45:33 -0700
Message-Id: <20190925184548.30673-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925184548.30673-1-richard.henderson@linaro.org>
References: <20190925184548.30673-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52d
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These bits do not need to vary with the actual page size
used by the guest.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d2d443c4f9..e0c8dc540c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -317,20 +317,24 @@ CPUArchState *cpu_copy(CPUArchState *env);
 
 #if !defined(CONFIG_USER_ONLY)
 
-/* Flags stored in the low bits of the TLB virtual address.  These are
- * defined so that fast path ram access is all zeros.
+/*
+ * Flags stored in the low bits of the TLB virtual address.
+ * These are defined so that fast path ram access is all zeros.
  * The flags all must be between TARGET_PAGE_BITS and
  * maximum address alignment bit.
+ *
+ * Use TARGET_PAGE_BITS_MIN so that these bits are constant
+ * when TARGET_PAGE_BITS_VARY is in effect.
  */
 /* Zero if TLB entry is valid.  */
-#define TLB_INVALID_MASK    (1 << (TARGET_PAGE_BITS - 1))
+#define TLB_INVALID_MASK    (1 << (TARGET_PAGE_BITS_MIN - 1))
 /* Set if TLB entry references a clean RAM page.  The iotlb entry will
    contain the page physical address.  */
-#define TLB_NOTDIRTY        (1 << (TARGET_PAGE_BITS - 2))
+#define TLB_NOTDIRTY        (1 << (TARGET_PAGE_BITS_MIN - 2))
 /* Set if TLB entry is an IO callback.  */
-#define TLB_MMIO            (1 << (TARGET_PAGE_BITS - 3))
+#define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 3))
 /* Set if TLB entry contains a watchpoint.  */
-#define TLB_WATCHPOINT      (1 << (TARGET_PAGE_BITS - 4))
+#define TLB_WATCHPOINT      (1 << (TARGET_PAGE_BITS_MIN - 4))
 
 /* Use this mask to check interception with an alignment mask
  * in a TCG backend.
-- 
2.17.1


