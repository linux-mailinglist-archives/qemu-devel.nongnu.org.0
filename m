Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74181A1593
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 21:08:31 +0200 (CEST)
Received: from localhost ([::1]:52184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLtaI-0002lw-R1
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 15:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jLtZX-0002BY-76
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 15:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jLtZV-00008i-Ow
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 15:07:42 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jLtZV-00006X-Hw
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 15:07:41 -0400
Received: by mail-pg1-x542.google.com with SMTP id g32so2171013pgb.6
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 12:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZGk61WNrpGDP6QSZdndDZCbGnp9yVuwh0dhPIo77VUo=;
 b=h2hKGpjqhgCC3I9QJ7UJ72N/QtdTZpED2R+k4xbpWC6QML50GYLqu4BsNLjRaIFklJ
 FHj4d5ymRBRtJw3Ar2Hr3uuTrcafbtGw+35FZXx5KbUaqP3GKtLX/8U4QUEGvEKAPvs/
 YtLeOfUPM35KpX74ryAsYRCQSfrirJ+V6kdtluo+EtQQpPSXY0fe5kXX5FaTBWlnnWap
 2d2y+v0M3FEP13q+P2Jf5mKYWuSMU5fw0X/yd/af860qrDF5J7Ch+P9SsnLJalIGYTjp
 jDJSgRDp5U9I0zLXe3KPOZZcWzxwjQ8BLszhPD4x4uch5THIZHcdSvyhiN3vs77rVU3e
 4AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZGk61WNrpGDP6QSZdndDZCbGnp9yVuwh0dhPIo77VUo=;
 b=XVAu+qQKmzJloPhZggEOeC3rwlgjkH4bQUDBYqQnRCCc+t3twlNTfxDXOTFGnNTQG5
 G8mf5G4udQfe5+WxGoxouXtmdxGm1BKArqnOLAA6DdU/UInRw1/YEWPglfwjFjuyF7AU
 RIkt0J/WtpeNSNV73FvpgdwxebCzegmqpa4ATPQ6ELeIwFX36WqMDUlRvbhAh3rnLS/V
 Z6bUTtHnMYS4a/EGy/ODj1v3IMJpNmmBu+KIbIJglCBan++8B8GSZ2PEFO/tewiO7y1D
 co5E+6vabEBzJdVAJkvnxfPh25jrbZcdFEDXOT4gH+R2t4P9GQnsyXq0RFYBRG1wTIXA
 6ZfQ==
X-Gm-Message-State: AGi0PubM59RHmS1i/wNlb6unPizz3ssA99aLVwZ7qnQ8BniHy3hyXB+s
 l+1r6kyX9R+6TmwjoXCWvin9o+VZKq4=
X-Google-Smtp-Source: APiQypLGHcXiq025MQYpGcRmMk30OLSldijn8Os4+rPYW8xkTd5tXRiGfNJU9x2l/Kzcx37u+jxQIQ==
X-Received: by 2002:a63:e4a:: with SMTP id 10mr3425064pgo.90.1586286460128;
 Tue, 07 Apr 2020 12:07:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id q71sm14830635pfc.92.2020.04.07.12.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 12:07:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.0? v2] target/xtensa: Statically allocate
 xtensa_insnbufs in DisasContext
Date: Tue,  7 Apr 2020 12:07:38 -0700
Message-Id: <20200407190738.15162-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Filippov <jcmvbkbc@gmail.com>

Rather than dynamically allocate, and risk failing to free
when we longjmp out of the translator, allocate the maximum
buffer size from any of the supported cpus.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
[rth: Merged the fixup in Max's reply to his original]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h       |  3 +++
 target/xtensa/helper.c    |  1 +
 target/xtensa/translate.c | 18 ++----------------
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index c0d69fad96..7a46dccbe1 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -213,6 +213,9 @@ enum {
 #define MEMCTL_IL0EN 0x1
 
 #define MAX_INSN_LENGTH 64
+#define MAX_INSNBUF_LENGTH \
+    ((MAX_INSN_LENGTH + sizeof(xtensa_insnbuf_word) - 1) / \
+     sizeof(xtensa_insnbuf_word))
 #define MAX_INSN_SLOTS 32
 #define MAX_OPCODE_ARGS 16
 #define MAX_NAREG 64
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 376a61f339..7073381f03 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -96,6 +96,7 @@ static void init_libisa(XtensaConfig *config)
 
     config->isa = xtensa_isa_init(config->isa_internal, NULL, NULL);
     assert(xtensa_isa_maxlength(config->isa) <= MAX_INSN_LENGTH);
+    assert(xtensa_insnbuf_size(config->isa) <= MAX_INSNBUF_LENGTH);
     opcodes = xtensa_isa_num_opcodes(config->isa);
     formats = xtensa_isa_num_formats(config->isa);
     regfiles = xtensa_isa_num_regfiles(config->isa);
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 37f65b1f03..b898ee2261 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -72,8 +72,8 @@ struct DisasContext {
     unsigned cpenable;
 
     uint32_t op_flags;
-    xtensa_insnbuf insnbuf;
-    xtensa_insnbuf slotbuf;
+    xtensa_insnbuf_word insnbuf[MAX_INSNBUF_LENGTH];
+    xtensa_insnbuf_word slotbuf[MAX_INSNBUF_LENGTH];
 };
 
 static TCGv_i32 cpu_pc;
@@ -1173,16 +1173,6 @@ static void xtensa_tr_init_disas_context(DisasContextBase *dcbase,
     dc->cwoe = tb_flags & XTENSA_TBFLAG_CWOE;
     dc->callinc = ((tb_flags & XTENSA_TBFLAG_CALLINC_MASK) >>
                    XTENSA_TBFLAG_CALLINC_SHIFT);
-
-    /*
-     * FIXME: This will leak when a failed instruction load or similar
-     * event causes us to longjump out of the translation loop and
-     * hence not clean-up in xtensa_tr_tb_stop
-     */
-    if (dc->config->isa) {
-        dc->insnbuf = xtensa_insnbuf_alloc(dc->config->isa);
-        dc->slotbuf = xtensa_insnbuf_alloc(dc->config->isa);
-    }
     init_sar_tracker(dc);
 }
 
@@ -1272,10 +1262,6 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     reset_sar_tracker(dc);
-    if (dc->config->isa) {
-        xtensa_insnbuf_free(dc->config->isa, dc->insnbuf);
-        xtensa_insnbuf_free(dc->config->isa, dc->slotbuf);
-    }
     if (dc->icount) {
         tcg_temp_free(dc->next_icount);
     }
-- 
2.20.1


