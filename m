Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA0A4282C0
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 19:51:31 +0200 (CEST)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZcyw-0000bP-Kg
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 13:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcrq-0000Sj-2n
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:10 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcro-0005nh-Go
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:09 -0400
Received: by mail-pg1-x534.google.com with SMTP id 133so8632091pgb.1
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 10:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/4DccFejM9tuchtxwnYOK2Yuhc7vks/tEm5XhG4ki0=;
 b=v4eTKvgUM8STMOEZQu+m6eFugUylSowKOIlCE1ybt2xTgYUOeFtXK0XziZ+7+rEolX
 5aluMMEyIyGzpVlEKHespx+QMe6+039Q3Oi4J2zNVHaWvwm5KovTzpQD/rvXEyRElf4n
 g341nAZ4sL4I2ue+L4jO6MdK+wO4b7T4NxhfcWYiqCXoqZIYKVKfTueS+g3A2NXASxQZ
 aQ9iN7yl4hZvgs+UgSXfhiRbSTVRu7zVQy3mi4bjttimqOXX3W48KvBjjeOzvf3tCJzO
 ywO3vt76ccPQNtq9FwahrpIRUIrl8hDf0ORDpnvh9J7jFEdKacKabbP12p6n08Js1krF
 vFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/4DccFejM9tuchtxwnYOK2Yuhc7vks/tEm5XhG4ki0=;
 b=jEYTiO1yKfu/Xuh7ut52GvXRGJflUhpZ7PCXb9m3/Uqo869AKagDwntcQh8CzO3it2
 syi8Vn7sV2cLCyglXr884VYS7qA/sSsXlX4QOCjt5Xtjoi8Zr7qTthDVq9WtEFIFWPKh
 fXjKy59YjWHnk1FLTxCVjapaHXDOQ98MuSXC/ApDzYl4AFpQX/2cEEjjgYf5ajqfIJ12
 yMc6p4u+3e8V8oLUl0iiQH4R07lVgs5fmt4mlTnE1eXThbMXzQpcdjQ/UjIacKnLLdXK
 ULxNdC98a5YMNslHy63JmoXiIf0XxPeITLR7t/g64+dM0IbDKGKqcldKbzz2+cd6OeUb
 TTVQ==
X-Gm-Message-State: AOAM533BtToIoorCA+CkeX7yzIRvWK6B04UzpeawgsHystTNMbkQMit9
 xXe2MtgwN2tdxmS8r+y4wcgvXg/ZAYNFMFln
X-Google-Smtp-Source: ABdhPJwPOo99b9WvuoIAQksP0klM40ArXYVD90svM47G1VuYA2vlCZpvlStdffgFYNOrJoTJhu50XQ==
X-Received: by 2002:a63:df05:: with SMTP id u5mr14444660pgg.323.1633887847144; 
 Sun, 10 Oct 2021 10:44:07 -0700 (PDT)
Received: from localhost.localdomain (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 18sm5095391pfh.115.2021.10.10.10.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 10:44:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] tcg: Add TCG_TARGET_SIGNED_ADDR32
Date: Sun, 10 Oct 2021 10:43:54 -0700
Message-Id: <20211010174401.141339-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010174401.141339-1-richard.henderson@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define as 0 for all tcg hosts.  Put this in a separate header,
because we'll want this in places that do not ordinarily have
access to all of tcg/tcg.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-sa32.h | 1 +
 tcg/arm/tcg-target-sa32.h     | 1 +
 tcg/i386/tcg-target-sa32.h    | 1 +
 tcg/mips/tcg-target-sa32.h    | 1 +
 tcg/ppc/tcg-target-sa32.h     | 1 +
 tcg/riscv/tcg-target-sa32.h   | 1 +
 tcg/s390x/tcg-target-sa32.h   | 1 +
 tcg/sparc/tcg-target-sa32.h   | 1 +
 tcg/tci/tcg-target-sa32.h     | 1 +
 9 files changed, 9 insertions(+)
 create mode 100644 tcg/aarch64/tcg-target-sa32.h
 create mode 100644 tcg/arm/tcg-target-sa32.h
 create mode 100644 tcg/i386/tcg-target-sa32.h
 create mode 100644 tcg/mips/tcg-target-sa32.h
 create mode 100644 tcg/ppc/tcg-target-sa32.h
 create mode 100644 tcg/riscv/tcg-target-sa32.h
 create mode 100644 tcg/s390x/tcg-target-sa32.h
 create mode 100644 tcg/sparc/tcg-target-sa32.h
 create mode 100644 tcg/tci/tcg-target-sa32.h

diff --git a/tcg/aarch64/tcg-target-sa32.h b/tcg/aarch64/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/aarch64/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/arm/tcg-target-sa32.h b/tcg/arm/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/arm/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/i386/tcg-target-sa32.h b/tcg/i386/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/i386/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/mips/tcg-target-sa32.h b/tcg/mips/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/mips/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/ppc/tcg-target-sa32.h b/tcg/ppc/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/ppc/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/riscv/tcg-target-sa32.h b/tcg/riscv/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/riscv/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/s390x/tcg-target-sa32.h b/tcg/s390x/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/s390x/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/sparc/tcg-target-sa32.h b/tcg/sparc/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/sparc/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/tci/tcg-target-sa32.h b/tcg/tci/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/tci/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
-- 
2.25.1


