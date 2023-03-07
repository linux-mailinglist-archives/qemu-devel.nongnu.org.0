Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CBF6AF7A2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:31:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesH-0004mQ-79; Tue, 07 Mar 2023 16:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesF-0004lD-M1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:31 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesB-0000xD-GB
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:31 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h14so13530766wru.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tovsKLnHyRC5Jr8RVQNb+BGVJpjepZY5l8jF5RO6m40=;
 b=TiRxd89XmTcGt/lWvsGpJDEbd2PevcQd3FREMyWXS5Gofeg8wuSJPmptDvcYwc2FLV
 XnkxvvE2rpO7QwvbuX/qd62cuInC2RDCCQdbJXwijbcRtK2exQpQPa9qvfYEtoOMX8KH
 PwBQgL2hgp2RqZz9bk3Oq4QvTjSdrOlJ2nekSpFQtVhXfSp44s//Qy1MVhgROMSk4WcH
 UrcovZIfmKgctWbfp1F2EDp3JpwTDykfD76JI3ZTnIMurDRFsAJW+Dqt8mdOOYRf8Lhe
 pz47oM3XziEdR/b/WlhReYI6+U8yvaeifL/UB7rqwTZZp5d4ykfOEQkwHGMnlyzUh0SA
 rjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tovsKLnHyRC5Jr8RVQNb+BGVJpjepZY5l8jF5RO6m40=;
 b=MCznJmmeWrW25Tc1rCsDQi1sAv90zui3wfJD6WGXf+VeiznTeVnItUYw1ZfIffh/0L
 rDfTUeZa3GTCVTJCOKqeeM1QT+XnH8vwB4WNjn/YxuC4IfJw7DVAD+OAwULHTUetn0XF
 87ZmfSK/TXxrILKj6EloDoAjpzgzLOzWLw/VctN29VyUpBqq65MIbUpzkd5qJuPzl11w
 PKXmWY2kj5QgU9hWSGAzEunc91GAIeQ5lDYc4wF7Wn3HDnmHk4fZ236Qaukeuc39eKX3
 lmotNfa/hBQowFtt7VWlUqvNfkmfbWm7f5s4gGHjVR5osfWW9x+PYS6BXLjZ6b8wgk/w
 FtXA==
X-Gm-Message-State: AO0yUKVFTm8BSuEGXTEG5B6oYd3LswSfAM3Jad7m3RaW3BHm+15uwFwG
 E+Gu52qNvivtnManLsNO0RD01A==
X-Google-Smtp-Source: AK7set8i9REhkR7nkNNggqMeJjgl4yqbwuVCyPzeR471WONaXf6Y/vl6dGPwY3y46hiDBLdn0AbmnQ==
X-Received: by 2002:a05:6000:a:b0:2c7:694:aa18 with SMTP id
 h10-20020a056000000a00b002c70694aa18mr10279710wrx.15.1678224565918; 
 Tue, 07 Mar 2023 13:29:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000100c00b002c55ec7f661sm13724477wrx.5.2023.03.07.13.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D53E1FFC7;
 Tue,  7 Mar 2023 21:21:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 19/30] gdbstub: don't use target_ulong while handling registers
Date: Tue,  7 Mar 2023 21:21:28 +0000
Message-Id: <20230307212139.883112-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a hangover from the original code. addr is misleading as it is
only really a register id. While len will never exceed
MAX_PACKET_LENGTH I've used size_t as that is what strlen returns.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-20-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-20-richard.henderson@linaro.org>

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index b8aead03bd..f1504af44f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1193,7 +1193,8 @@ static void handle_read_mem(GArray *params, void *user_ctx)
 
 static void handle_write_all_regs(GArray *params, void *user_ctx)
 {
-    target_ulong addr, len;
+    int reg_id;
+    size_t len;
     uint8_t *registers;
     int reg_size;
 
@@ -1205,9 +1206,10 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
     len = strlen(get_param(params, 0)->data) / 2;
     gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     registers = gdbserver_state.mem_buf->data;
-    for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
-         addr++) {
-        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, addr);
+    for (reg_id = 0;
+         reg_id < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
+         reg_id++) {
+        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, reg_id);
         len -= reg_size;
         registers += reg_size;
     }
@@ -1216,15 +1218,16 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
 
 static void handle_read_all_regs(GArray *params, void *user_ctx)
 {
-    target_ulong addr, len;
+    int reg_id;
+    size_t len;
 
     cpu_synchronize_state(gdbserver_state.g_cpu);
     g_byte_array_set_size(gdbserver_state.mem_buf, 0);
     len = 0;
-    for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs; addr++) {
+    for (reg_id = 0; reg_id < gdbserver_state.g_cpu->gdb_num_g_regs; reg_id++) {
         len += gdb_read_register(gdbserver_state.g_cpu,
                                  gdbserver_state.mem_buf,
-                                 addr);
+                                 reg_id);
     }
     g_assert(len == gdbserver_state.mem_buf->len);
 
-- 
2.39.2


