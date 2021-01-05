Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D922EB178
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:36:02 +0100 (CET)
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqFV-0003hP-CK
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0e-0002S2-Bc
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:40 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0c-0006dB-QY
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:40 -0500
Received: by mail-pl1-x631.google.com with SMTP id g3so71057plp.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MOmUYS+2+okyDd2n7XwYqRe+eURAl58gvEsSNOVb+48=;
 b=lKQTEa2J6twkaMH79bT86tXW3YD7i8Fg3sN0m6rTYxiY+TwTPaT1K5Et634nZJh+FZ
 AEodrGXkUK2oQ05+gyhtt/56mi2OVayKHEZCbZJj39WMwMwOFb0tZjmKSzoPIHPMSNhW
 9Nc2DaudNHbKQWx0wAGYCqXVAhyQAQ/+45blxI3/ryyl45g3oEfS2X9yYi0ESf3hEwlQ
 kXG1aasXr0MY5I8iIZhOnceHurvDRLNkrTpPrx0kbvfVZaeixDmXSVna6Bu4WtSkTWlT
 qt8bv03FzDX2VRRI3XWTnJmuAW78HQmXmdFHK0PGa94Ho0nGDiijuesorLrLZjrytvZ/
 ixsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MOmUYS+2+okyDd2n7XwYqRe+eURAl58gvEsSNOVb+48=;
 b=TKUzRFFAoRKbxuVy/Zyd/R5kuYzZAwjIxlAp3DnHRkKW5RsiLByWtq3KYUkSdDQTs9
 2MiypYRuYTCOKCi/Yf0qoydEgRHtaNyM5nET8VgWiRvgKZ/VwWQywVKwO/RgbrIBPAcH
 NAOr3gY/YYhAvZLh1RNyJvO+Zi5oASEqKRtRvmle5IrHuT6Xg+fGo39zeHEsPuQkZiI9
 H2onpus0RRUkEYAP1UR44x7l3D1OUdG93RBcduo5VoL1kBZJPf9VoA6CQs9WHog6zAX6
 OUkNz/+majgz7l0o6Kbt/OWpLlZbWfE0iKqbYADgcbNcBJtu7Xrr2Y38sc4blhNVymIc
 aDbg==
X-Gm-Message-State: AOAM5311/rLKOttFNy+XAAWBCVxSbOjFdxM9cOkE7BwYsM0OieI0EfzK
 AM1wFep31bcv8TkY0JWoXi68WbODuwS2AQ==
X-Google-Smtp-Source: ABdhPJxYAvJlASBWwTTA/QS+j4Rwr6ddA7qKohvv7cZWlrnzIGvFrTp0tG02WGJbO0CVnponFhTSMg==
X-Received: by 2002:a17:90a:5b06:: with SMTP id o6mr154305pji.49.1609867237113; 
 Tue, 05 Jan 2021 09:20:37 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/43] disas: Push const down through host disassembly
Date: Tue,  5 Jan 2021 07:19:31 -1000
Message-Id: <20210105171950.415486-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/dis-asm.h | 4 ++--
 disas.c                 | 4 +---
 disas/capstone.c        | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 2164762b46..d1133a4e04 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -358,7 +358,7 @@ typedef struct disassemble_info {
     (bfd_vma addr, struct disassemble_info * info);
 
   /* These are for buffer_read_memory.  */
-  bfd_byte *buffer;
+  const bfd_byte *buffer;
   bfd_vma buffer_vma;
   int buffer_length;
 
@@ -462,7 +462,7 @@ int print_insn_rx(bfd_vma, disassemble_info *);
 
 #ifdef CONFIG_CAPSTONE
 bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size);
-bool cap_disas_host(disassemble_info *info, void *code, size_t size);
+bool cap_disas_host(disassemble_info *info, const void *code, size_t size);
 bool cap_disas_monitor(disassemble_info *info, uint64_t pc, int count);
 bool cap_disas_plugin(disassemble_info *info, uint64_t pc, size_t size);
 #else
diff --git a/disas.c b/disas.c
index de1de7be94..a61f95b580 100644
--- a/disas.c
+++ b/disas.c
@@ -299,10 +299,8 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
 }
 
 /* Disassemble this for me please... (debugging). */
-void disas(FILE *out, const void *ccode, unsigned long size)
+void disas(FILE *out, const void *code, unsigned long size)
 {
-    /* TODO: Push constness through the disas backends. */
-    void *code = (void *)ccode;
     uintptr_t pc;
     int count;
     CPUDebug s;
diff --git a/disas/capstone.c b/disas/capstone.c
index 7462c0e305..20bc8f9669 100644
--- a/disas/capstone.c
+++ b/disas/capstone.c
@@ -229,7 +229,7 @@ bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size)
 }
 
 /* Disassemble SIZE bytes at CODE for the host.  */
-bool cap_disas_host(disassemble_info *info, void *code, size_t size)
+bool cap_disas_host(disassemble_info *info, const void *code, size_t size)
 {
     csh handle;
     const uint8_t *cbuf;
-- 
2.25.1


