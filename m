Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D502EE726
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:48:11 +0100 (CET)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcCY-0007Wz-3q
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhK-0001Uj-TR
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:02 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh9-0001gB-6r
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:53 -0500
Received: by mail-pg1-x530.google.com with SMTP id 30so5744002pgr.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MOmUYS+2+okyDd2n7XwYqRe+eURAl58gvEsSNOVb+48=;
 b=TchH5REwXL7vOanvz6c8rxbFqQITTdLtJSQ+wyLl3u1q4NGr26m2wYZi4wxA/MGELH
 rw3d4t8c7j7P+V99LpbsllyGBSz/bRfbxaEhhey4q/iAwNMFjZ+LLdkEh++fgI+P/D/t
 yewlJ3zjvoq6uovGnZfJYd0QZ/WGkdjsgE6gFp0qTPxc4KhnuYkG7WBV1FD88SgWV0Jg
 mCBerGM/j3yl2TVp3hpkjVFl0hAlb9yU8v3hN5VHhlOEXPy39p2biEVBjhCbJz/g14/3
 y4ZXRVsj3rARY8XELosCvAsFCS+RLyNJwnxqFF9w6MC6k2EmcLjiRacKihvH53lBr+Bm
 cQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MOmUYS+2+okyDd2n7XwYqRe+eURAl58gvEsSNOVb+48=;
 b=UioZuIqLvJe6a2D8nixd0lt4HVWgGTi5rVk8iQlgk+gUvCpdLgqiu5HbIrFO9KYiFb
 6lGZAqzU5gMBTiZYHA84Q2wIBfi2XPmIG/GXYSbmXtOS1yUyhiPYPFwo0nj4eOQFIZFn
 K64qu3Sr/r63EyqixXl/OpBDD65Ao0c6sl9+f5XXxn0VKWnwmnOP9yXEUZw9G/aQrxEz
 snXY1P2W6Z4pGzMyc8AvvrjKFRKB8lDg9lElRFE4yzA2J0MlHoD1xFBIPAHF67dKvfNm
 nn3mV4R+edxaFq5fpYiw0YNWMNtl6t3aMezvwqxV8gJeXs8h05++fuUdwAM9AB7B7qPU
 aPIQ==
X-Gm-Message-State: AOAM531CDtd8gTO2gCBYmyFqpPk99ZMWFUOP4uYasPYcnuw2z/A3dK2h
 uL0SouNlwd7wjBjZHcWDzpaMtFYXsVNrAQ==
X-Google-Smtp-Source: ABdhPJxnC6lOGWrVkm337UE5m0opoFIpMOyhVMV+IApSd7mHEXtL5DgYFVdg/y2jTQVeswm7SpUh4A==
X-Received: by 2002:aa7:8f35:0:b029:19b:1258:ec5d with SMTP id
 y21-20020aa78f350000b029019b1258ec5dmr3611580pfr.9.1610050541620; 
 Thu, 07 Jan 2021 12:15:41 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/47] disas: Push const down through host disassembly
Date: Thu,  7 Jan 2021 10:14:29 -1000
Message-Id: <20210107201448.1152301-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>,
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


