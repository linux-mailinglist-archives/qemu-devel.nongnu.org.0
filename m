Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAAA445515
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:17:14 +0100 (CET)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midYH-0002tj-Ik
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNq-0006r0-KK
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:26 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNo-00010V-Ir
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:26 -0400
Received: by mail-io1-xd33.google.com with SMTP id 2so3674146iou.1
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9IbbLGjnRnokIuDKxQfCzJoAx075CoGnpnzgfUmRKo=;
 b=bjfIrnmnRdCx9FwDgLWOCcc2qCcgyQowvcSbtL9jvDVezWV2sBRB5ghP+N1lTN0Wt8
 FtcnsdFJf6DKsYYJH6hGGniDT9GiVt92OC2zt4qH1/JjKiInYlxKhYepCseVETKHoE1a
 YpdgqhJGQtnRQeQzWft+PVqFm1O0BGBVQMccrYy9ZaHy7SHZcuSMl5P+4Y96r6QKIuut
 0KR8YEbYhRxZ7kCBxXyiyEOpl3KReNr2wnkARQaSD8b7d/Fn85F5L088S5ko6/cJAjOW
 xxr0vNeS4NOHXf9VRwg5u5ASaBjcWVlJTp7KU0aseLZDfnvxlgKms6xBqwYMs8OuO8ME
 cPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9IbbLGjnRnokIuDKxQfCzJoAx075CoGnpnzgfUmRKo=;
 b=L5mkqdcYIcj3n7pjEPA322GvUOfrj9XTrrhn6/bSOz7poRtbH757xuTT3Q92UE7Fuk
 5z3aRYmtjH/YXbgsev4dnt/144Pse8KbxpaLexbPeGoSmlSMuaJl2fabYzEPuOjohC/Z
 EeoDlrSse6vvS98ShLkT6jbDK0csY9pzlRyU+fZ6T6kqgIuE3Oxt6exBHQpFcuNARQU1
 kamx/OgW/bRlmKH71V9LVwb2v6mJXAFq9/QcKglJgWecSLdeqOsxpLF60Nopfs8Drf6y
 RwVI+YxjhWURQyL6vIhoaojJMTNIt6WqYdsNR0h0CcOdLgXKDpFXaMXummjT4cmUPQEW
 rDqQ==
X-Gm-Message-State: AOAM5338qpjItc5Up1u5eOKa07wIeCEuiTv+WcXtQq3Gc6Sc6ef8EtG7
 l3qZUJg7eCB/DdFVcw/NaWfZPPgsW0R8Dw==
X-Google-Smtp-Source: ABdhPJx31xve4U5O9Z4kfNcaxY5j5an/l1OEBXHfdKPOz2EPfiLu1VTi6nHUBzMobQDiZbQErWwoQQ==
X-Received: by 2002:a5d:81c7:: with SMTP id t7mr38230769iol.65.1636034779468; 
 Thu, 04 Nov 2021 07:06:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:19 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/29] bsd-user/arm/target_arch_sigtramp.h: Signal
 Trampoline for arm
Date: Thu,  4 Nov 2021 08:05:19 -0600
Message-Id: <20211104140536.42573-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy of the signal trampoline code for arm, as well as setup_sigtramp to
write it to the stack.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_sigtramp.h | 49 +++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h

diff --git a/bsd-user/arm/target_arch_sigtramp.h b/bsd-user/arm/target_arch_sigtramp.h
new file mode 100644
index 0000000000..5d434a9e7e
--- /dev/null
+++ b/bsd-user/arm/target_arch_sigtramp.h
@@ -0,0 +1,49 @@
+/*
+ *  arm sysarch() system call emulation
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_ARCH_SIGTRAMP_H_
+#define _TARGET_ARCH_SIGTRAMP_H_
+
+/* Compare to arm/arm/locore.S ENTRY_NP(sigcode) */
+static inline abi_long setup_sigtramp(abi_ulong offset, unsigned sigf_uc,
+        unsigned sys_sigreturn)
+{
+    int i;
+    uint32_t sys_exit = TARGET_FREEBSD_NR_exit;
+    uint32_t sigtramp_code[] = {
+    /* 1 */ 0xE1A0000D,                  /* mov r0, sp */
+    /* 2 */ 0xE2800000 + sigf_uc,        /* add r0, r0, #SIGF_UC */
+    /* 3 */ 0xE59F700C,                  /* ldr r7, [pc, #12] */
+    /* 4 */ 0xEF000000 + sys_sigreturn,  /* swi (SYS_sigreturn) */
+    /* 5 */ 0xE59F7008,                  /* ldr r7, [pc, #8] */
+    /* 6 */ 0xEF000000 + sys_exit,       /* swi (SYS_exit)*/
+    /* 7 */ 0xEAFFFFFA,                  /* b . -16 */
+    /* 8 */ sys_sigreturn,
+    /* 9 */ sys_exit
+    };
+
+    G_STATIC_ASSERT(sizeof(sigtramp_code) == TARGET_SZSIGCODE);
+
+    for (i = 0; i < 9; i++) {
+        tswap32s(&sigtramp_code[i]);
+    }
+
+    return memcpy_to_target(offset, sigtramp_code, TARGET_SZSIGCODE);
+}
+#endif /* _TARGET_ARCH_SIGTRAMP_H_ */
-- 
2.33.0


