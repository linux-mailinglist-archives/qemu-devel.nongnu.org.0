Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49F2BB83A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:19:15 +0100 (CET)
Received: from localhost ([::1]:59162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDoI-0003TS-Ok
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfR-0004FR-Vz
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:06 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfP-00046Q-3N
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:05 -0500
Received: by mail-wr1-x442.google.com with SMTP id c17so11654487wrc.11
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JEHnZl4YADHNWK7TNk7/iWZzROyNDdjEmMHtpAgiEoE=;
 b=FmBsuO3NLt3j/xxyd1q3DSWYS3iWvp+KYaLJ4Ia7sTlqM0LkWnuLO4ivEWFd+Z/0V3
 2IHPUY4OXjuUjtLKf8SxWi4kHcpKKZPtUf1QVImhiuBY5VI3T893wyZgWhkeUFwwi06e
 eCCEhY6XaxwcqBZY84ack2VDU5Sea29GZsihft+lZ3+fXfJtwFLTM0SQ77LWKxYNSRbl
 wkderKC/o4m2SwxqNBNVEUgs+HR28WzHy+hhHADrmxrOFE4rmDo7IetZP7/ItHiOtuim
 EizlzPPnG0e8ACrweNuwARhE5DrW21ffB5kRK3eMIcJg6soUaKVQZpzH9sdzwwkgbNSt
 RfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JEHnZl4YADHNWK7TNk7/iWZzROyNDdjEmMHtpAgiEoE=;
 b=k05KKAU0HBE0Y5tFym33aby7mHSMz8bfJ9vkmuH85bR2g1oFYXK2Hd+r8w7Hrpn95o
 zNTKrPEjTkmhO1tzi7rTj3iVDow9rajSKz8GjlGflcYeJeIdJN24A2h13SFObz7hKsRX
 uKaKJgkbiHbBG083pjAvudE/J/n54DopatnKPq4rBdCG95nd1pGV7aLDvoWwV33gU1Di
 7xvaeP9HR6qEp2Mq/2PrFHBXWrI2/MkxS+EL41wUIm4N/YeROBimZGFIiXouJNyV1VeX
 1SP7Oa4+CJqI3uOXvaHLDgF/GVdVGtvaWZDFwzPnpTCeemoMkt78qch9o+uPu/NWlh5O
 3MIg==
X-Gm-Message-State: AOAM533Dlk+2yS4oOGHM9+S25x1AwQh8hYFOGjHKc9/sd9Ws8qVkKg9u
 6YMsOyY7pw7rAuMVVSYAGppiLvQWMwA=
X-Google-Smtp-Source: ABdhPJxLpvbPQU9WdLtOjPYTyNa7CsfXOf6CDfzI6e+Y8eC7/pFlpH/EIlxz6swOvjRvGf0vu9KckA==
X-Received: by 2002:a5d:6cc5:: with SMTP id c5mr19342972wrc.301.1605906600988; 
 Fri, 20 Nov 2020 13:10:00 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id r9sm7081829wrg.59.2020.11.20.13.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/26] target/mips: Extract NEC Vr54xx helper definitions
Date: Fri, 20 Nov 2020 22:08:32 +0100
Message-Id: <20201120210844.2625602-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the NEC Vr54xx helper definitions to
'vendor-vr54xx_helper.h'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                   | 17 ++---------------
 target/mips/vendor-vr54xx_helper.h.inc | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 15 deletions(-)
 create mode 100644 target/mips/vendor-vr54xx_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index ee93c2de836..77d66018c8c 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -20,21 +20,6 @@ DEF_HELPER_3(lld, tl, env, tl, int)
 #endif
 #endif
 
-DEF_HELPER_3(muls, tl, env, tl, tl)
-DEF_HELPER_3(mulsu, tl, env, tl, tl)
-DEF_HELPER_3(macc, tl, env, tl, tl)
-DEF_HELPER_3(maccu, tl, env, tl, tl)
-DEF_HELPER_3(msac, tl, env, tl, tl)
-DEF_HELPER_3(msacu, tl, env, tl, tl)
-DEF_HELPER_3(mulhi, tl, env, tl, tl)
-DEF_HELPER_3(mulhiu, tl, env, tl, tl)
-DEF_HELPER_3(mulshi, tl, env, tl, tl)
-DEF_HELPER_3(mulshiu, tl, env, tl, tl)
-DEF_HELPER_3(macchi, tl, env, tl, tl)
-DEF_HELPER_3(macchiu, tl, env, tl, tl)
-DEF_HELPER_3(msachi, tl, env, tl, tl)
-DEF_HELPER_3(msachiu, tl, env, tl, tl)
-
 DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 #ifdef TARGET_MIPS64
 DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
@@ -424,3 +409,5 @@ DEF_HELPER_3(cache, void, env, tl, i32)
 #include "mod-mips-dsp_helper.h.inc"
 #include "mod-mips-msa_helper.h.inc"
 #include "mod-mips-mt_helper.h.inc"
+
+#include "vendor-vr54xx_helper.h.inc"
diff --git a/target/mips/vendor-vr54xx_helper.h.inc b/target/mips/vendor-vr54xx_helper.h.inc
new file mode 100644
index 00000000000..50b1f5b818d
--- /dev/null
+++ b/target/mips/vendor-vr54xx_helper.h.inc
@@ -0,0 +1,24 @@
+/*
+ * MIPS NEC Vr54xx instruction emulation helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_3(muls, tl, env, tl, tl)
+DEF_HELPER_3(mulsu, tl, env, tl, tl)
+DEF_HELPER_3(macc, tl, env, tl, tl)
+DEF_HELPER_3(maccu, tl, env, tl, tl)
+DEF_HELPER_3(msac, tl, env, tl, tl)
+DEF_HELPER_3(msacu, tl, env, tl, tl)
+DEF_HELPER_3(mulhi, tl, env, tl, tl)
+DEF_HELPER_3(mulhiu, tl, env, tl, tl)
+DEF_HELPER_3(mulshi, tl, env, tl, tl)
+DEF_HELPER_3(mulshiu, tl, env, tl, tl)
+DEF_HELPER_3(macchi, tl, env, tl, tl)
+DEF_HELPER_3(macchiu, tl, env, tl, tl)
+DEF_HELPER_3(msachi, tl, env, tl, tl)
+DEF_HELPER_3(msachiu, tl, env, tl, tl)
-- 
2.26.2


