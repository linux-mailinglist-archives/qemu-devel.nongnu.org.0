Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5A1EC0BF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 19:09:24 +0200 (CEST)
Received: from localhost ([::1]:46386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgAPj-0002n0-HN
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 13:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgAIn-00063S-1E
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 13:02:13 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:35881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgAIm-0007RK-0b
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 13:02:12 -0400
Received: by mail-pj1-x1044.google.com with SMTP id q24so1759278pjd.1
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 10:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=75Vplu19HS/DHLmTzwjn2UXzNvNogzB2TCcDPegRLPA=;
 b=TD//greZdcMVGpGCfkS/vfsPiN2mKqVLWb+Y8M7P0ZGSt/amqE2M8AXXFH+BxmBiak
 /QRL7cnOYYAi4UQbcnoauITjbxEPcpV2UD+oedqOee9rIL3wEs5rvuSia7Kutr3rzhJs
 RjV8AeU3sVxvPa1B+r0ePqlk2ycy0PAPv7aZf4etkw9Pken3JUOeO/quZ5FhIe2JxKr8
 WriBkWQpo1OVDHKstYsiKdy+iB/4wLaPn5o6OqoYVUn3DCv/sVS30tQ0fFTk1qvXVjX8
 5aTobF2oh/X7EauNtEE6+gYMtbBZ+P2r4mCxJKjqDTTYhdOCF8yZhoJH6MSs/9zJd2V2
 9EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75Vplu19HS/DHLmTzwjn2UXzNvNogzB2TCcDPegRLPA=;
 b=gv9CbVl+k3nQa43sofMuaOz6cBWWDRX1HhD7rDD0UGDQBpSWjyMkwKOB6hBxZ/WPra
 uv9GO+lvN/H1cmOyWksZCrDgimXEN0o38c7s2NUwS/mpIO3C88IL5C3u7NtOoyYTT8er
 eMTpu/mEkz9u7V/Ve26wHxdJ3iv8/J7y/E1nOrov/kO8+8qS1qL6R2XMo/IVoNneZTcQ
 CwjX6Pfg+x+ObMU4oC9MI+9vNH3w7v5S94q/141q/s73xWZ19k7F9Cga7YvyXRuloXuL
 roccVNfhiUgBU65cvKn6INZ1GzKAjEp/H48FbJoOKd34tcuLgHBs5puUIs9oD4oqfyAu
 S7aw==
X-Gm-Message-State: AOAM530k/r9J/FeDlsnukKRquivVZGKukTjNIaLFUg56YKB85pTqgXiV
 0Jc/eEce/Ujth2KEJ7MlzO+UaiespfU=
X-Google-Smtp-Source: ABdhPJwpd0KeBHNo/5K+SiOr4V3x3JcLE32/rkmjRXcnOjbBoxo2dchrxs7wiDj8AzbpedcC28RH1Q==
X-Received: by 2002:a17:902:b904:: with SMTP id
 bf4mr25761929plb.89.1591117330197; 
 Tue, 02 Jun 2020 10:02:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h11sm2723630pjk.20.2020.06.02.10.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 10:02:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] accel/tcg: Provide a NetBSD specific aarch64
 cpu_signal_handler
Date: Tue,  2 Jun 2020 10:01:51 -0700
Message-Id: <20200602170151.321389-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200602170151.321389-1-richard.henderson@linaro.org>
References: <20200602170151.321389-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Nick Hudson <skrll@netbsd.org>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nick Hudson <skrll@netbsd.org>

Fix qemu build on NetBSD/evbarm-aarch64 by providing a NetBSD specific
cpu_signal_handler.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Nick Hudson <skrll@netbsd.org>
Message-Id: <20200517101529.5367-1-skrll@netbsd.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index bc391eb454..d8b027f8c1 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -558,6 +558,32 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
 #elif defined(__aarch64__)
 
+#if defined(__NetBSD__)
+
+#include <ucontext.h>
+#include <sys/siginfo.h>
+
+int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
+{
+    ucontext_t *uc = puc;
+    siginfo_t *si = pinfo;
+    unsigned long pc;
+    int is_write;
+    uint32_t esr;
+
+    pc = uc->uc_mcontext.__gregs[_REG_PC];
+    esr = si->si_trap;
+
+    /*
+     * siginfo_t::si_trap is the ESR value, for data aborts ESR.EC
+     * is 0b10010x: then bit 6 is the WnR bit
+     */
+    is_write = extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1) == 1;
+    return handle_cpu_signal(pc, si, is_write, &uc->uc_sigmask);
+}
+
+#else
+
 #ifndef ESR_MAGIC
 /* Pre-3.16 kernel headers don't have these, so provide fallback definitions */
 #define ESR_MAGIC 0x45535201
@@ -620,6 +646,7 @@ int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
     }
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
+#endif
 
 #elif defined(__s390__)
 
-- 
2.25.1


