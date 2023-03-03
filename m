Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBDF6A8F94
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:02:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcp-0007Wk-NK; Thu, 02 Mar 2023 21:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcn-0007VM-Ib
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:25 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcl-0001q5-Uz
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:25 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z2so1304207plf.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJ4GfexeOkE0loC2ShPfg/ZNhK8OhXGDTJcqqyP7xeg=;
 b=WvfKREH74zSU6SOrM+cbWJhy58mfCltqdqf9hbiCj/XijbahjhE9aP6rL52vvdvrp7
 iXHjug+5eeg72ws8OgHS0HhW8GT0/FvTROCm0BqO4EAHjsBhFVlawWnunbvHlHWVvUv2
 lVIOA+xTMsBzmMLlvX1izslg/aGeLH1ncac2wCFKSp6zq/kbITmAF/e1nNt49oNuiQGc
 24hrgD5ub/kDk98VaGBB5fTxoQqn1EjPcIWrXC3Gog3rCoQVm0wJkEjCZd98cL0JCvxV
 2rjFQLwqcpPU2GX0qJpFaFcMf47fkiB0Pqco34uBVRcPC041J2MRAGb8x8cdjQv5zR3B
 Gmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KJ4GfexeOkE0loC2ShPfg/ZNhK8OhXGDTJcqqyP7xeg=;
 b=U3Jjw+pSH6lRDiszb/7ODSY3UCcYMH+y1INP/AAKC6cUDXhIT0au24ypn5Kvlc20tD
 dfc93kWZB7N9gbDYUqjR333a/9OD5+ugZiF/X/twhAx+m66oECXAWM4F78F66bx6tH/d
 8sRnmwYnXZhhUKMZRHhyhLFaMD0iSa2WV5QeIxBIpb4f5Tb0gvULQp+RPQnV/Q18gioo
 pXW1/2OoiEyp6o6Hghwl2HjiFCqxVxPhIpJrWFRm1NXJPGG+E6C7PKA2XqVC3YuVLLRB
 0hjKXsj/fiXslokTszJouNJa/NJoQ9Cf4C/ChIK7x2tuWi+ibjafn3fWi7+jhKqbfKo7
 nhQw==
X-Gm-Message-State: AO0yUKVWXB/OYFVkkc1dtxQfAgJUgoWvwtLzjf0sM+xzHANXi1XksECT
 QIBwdh+duJe3UyhaqVvOyEJ1GonBLMOwchJcGqs=
X-Google-Smtp-Source: AK7set+ZHI06TC6rKfSKRO14Oj/pUm+BM4G8gnwinygdz52p1AqM1+sl3jAs2dOeIyDkgM7G0ttAYw==
X-Received: by 2002:a17:902:e549:b0:19e:76c4:2d30 with SMTP id
 n9-20020a170902e54900b0019e76c42d30mr542646plf.61.1677812303207; 
 Thu, 02 Mar 2023 18:58:23 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4.5 19/29] gdbstub: don't use target_ulong while handling
 registers
Date: Thu,  2 Mar 2023 18:57:55 -0800
Message-Id: <20230303025805.625589-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

This is a hangover from the original code. addr is misleading as it is
only really a register id. While len will never exceed
MAX_PACKET_LENGTH I've used size_t as that is what strlen returns.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-20-alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

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
2.34.1


