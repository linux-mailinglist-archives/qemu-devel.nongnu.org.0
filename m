Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F847C4DA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:19:25 +0100 (CET)
Received: from localhost ([::1]:58714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzinL-0002Pe-Mr
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJC-00014s-4V
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:14 -0500
Received: from [2607:f8b0:4864:20::1029] (port=42940
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ4-0007fe-Hu
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:13 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso3741717pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jwD0nklpaMv6uE7sTv0yiM3eKKOOZulK+Q3tBkY247E=;
 b=uJFJstexeq5GyyAea3BtYp+1ddbSGHn+35lI0dlRzqJ1TcDB83TWGD17+2MgLabllP
 t2CrsfztYjjN1U7Vc/hWVnPmcodaU0pN+8rdDOemcVE/uqmfbZWE1gW1FwNZMO32KK9S
 JUn4Pgb+jsM5iKtydfHHVb+ufM71iefuQ63apI+1jn95XcZ8YxJYp4z3+Qs3wGm8SdNQ
 DbMi3MCNQ43FJWAHDoT3HZB4skCrDWWRzeZAXiWsOuj7Wxvtakt0cf6UuPZXiZuI+R0g
 0qJ6NbbO/Lj9AzvtL9EahepjU0z+V5dlLyHkpgM6XH/qokyxf353Ua0Y/z/0uPKpGzFS
 mAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jwD0nklpaMv6uE7sTv0yiM3eKKOOZulK+Q3tBkY247E=;
 b=4AU+LRmBZMKDbF6AsE8b+iqQ2z+tpU5C0RB45J2Q9V86be8SqSfeyOGPNpbDd6KLMq
 uLiRCbScC3pTxrcvn2XMD/X71KaNNsMB9yzvA7wNrEpU94GtfiPsbNggFmhTU7ecMsku
 XxtCRmq3rwylQDUzdDefYRGdCJXxTc1/c9V2jzosqOlE0p0eCH2hHxFTHlp1VQoIwTjU
 v3SZ1MH3m/pHIqhkboMK8lOznvlzl1lXT7Ia/Vfn1BDZnBU53QCcuxWL3giEzToDMqKl
 6MFcDpr9qIKI/I1BjNLpSSp6KjMuN0Gb0VQUi+LcHNDEZTjuHWbl3qo8if7OZNoccpf5
 NEdg==
X-Gm-Message-State: AOAM532aeOLFgFhYjt9NMSZCPbhrenzsbMsPUQ6CV7JMZsc3hnGpJmn5
 VHzYdtEitRaRgCr78ZxeOvB2J80tfnKNVg==
X-Google-Smtp-Source: ABdhPJxQuvPGkw55n4WhYmZGmauo3v3lf2mvksmAox1hrWuQ1O/l+9ZrM8qFWb1aBDPeVHAlWw7lMw==
X-Received: by 2002:a17:90a:c68a:: with SMTP id
 n10mr4911607pjt.119.1640105285294; 
 Tue, 21 Dec 2021 08:48:05 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:48:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/31] linux-user: Implement CPU-specific signal handler for
 loongarch64 hosts
Date: Tue, 21 Dec 2021 08:47:35 -0800
Message-Id: <20211221164737.1076007-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-30-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/loongarch64/host-signal.h | 87 +++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 linux-user/host/loongarch64/host-signal.h

diff --git a/linux-user/host/loongarch64/host-signal.h b/linux-user/host/loongarch64/host-signal.h
new file mode 100644
index 0000000000..05e2c82371
--- /dev/null
+++ b/linux-user/host/loongarch64/host-signal.h
@@ -0,0 +1,87 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 WANG Xuerui <git@xen0n.name>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef LOONGARCH64_HOST_SIGNAL_H
+#define LOONGARCH64_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.__pc;
+}
+
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.__pc = pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    const uint32_t *pinsn = (const uint32_t *)host_signal_pc(uc);
+    uint32_t insn = pinsn[0];
+
+    /* Detect store by reading the instruction at the program counter.  */
+    switch ((insn >> 26) & 0b111111) {
+    case 0b001000: /* {ll,sc}.[wd] */
+        switch ((insn >> 24) & 0b11) {
+        case 0b01: /* sc.w */
+        case 0b11: /* sc.d */
+            return true;
+        }
+        break;
+    case 0b001001: /* {ld,st}ox4.[wd] ({ld,st}ptr.[wd]) */
+        switch ((insn >> 24) & 0b11) {
+        case 0b01: /* stox4.w (stptr.w) */
+        case 0b11: /* stox4.d (stptr.d) */
+            return true;
+        }
+        break;
+    case 0b001010: /* {ld,st}.* family */
+        switch ((insn >> 22) & 0b1111) {
+        case 0b0100: /* st.b */
+        case 0b0101: /* st.h */
+        case 0b0110: /* st.w */
+        case 0b0111: /* st.d */
+        case 0b1101: /* fst.s */
+        case 0b1111: /* fst.d */
+            return true;
+        }
+        break;
+    case 0b001110: /* indexed, atomic, bounds-checking memory operations */
+        uint32_t sel = (insn >> 15) & 0b11111111111;
+
+        switch (sel) {
+        case 0b00000100000: /* stx.b */
+        case 0b00000101000: /* stx.h */
+        case 0b00000110000: /* stx.w */
+        case 0b00000111000: /* stx.d */
+        case 0b00001110000: /* fstx.s */
+        case 0b00001111000: /* fstx.d */
+        case 0b00011101100: /* fstgt.s */
+        case 0b00011101101: /* fstgt.d */
+        case 0b00011101110: /* fstle.s */
+        case 0b00011101111: /* fstle.d */
+        case 0b00011111000: /* stgt.b */
+        case 0b00011111001: /* stgt.h */
+        case 0b00011111010: /* stgt.w */
+        case 0b00011111011: /* stgt.d */
+        case 0b00011111100: /* stle.b */
+        case 0b00011111101: /* stle.h */
+        case 0b00011111110: /* stle.w */
+        case 0b00011111111: /* stle.d */
+        case 0b00011000000 ... 0b00011100011: /* am* insns */
+            return true;
+        }
+        break;
+    }
+
+    return false;
+}
+
+#endif
-- 
2.25.1


