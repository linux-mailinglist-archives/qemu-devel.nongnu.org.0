Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65243128FF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:40:37 +0100 (CET)
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wTc-0002o2-Qy
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR6-00010e-Lk
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:00 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR3-0005gB-MP
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:00 -0500
Received: by mail-pl1-x631.google.com with SMTP id s15so7010339plr.9
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06H8W/q0v8WI5yMb4Dgc4NhHzAw8roTrWJkM0Lw1UXA=;
 b=Ifk6btvJv/vvkD9V1CnOdmEiAIpE7+ILWRn41HqaD1WH2XW21yCuyBSFJDBzJBqh5j
 00I1CDs1c8iemez7ANp3M+wvB/6XVgwGsAYvIIiddHyBBABt96IbmFzZwmLLs/HV0TYP
 2YNXvUEwP6Qk57RoHozMcBwl+3VjA5KPpJTvTAvOZE9s2J9Kg06nNgOXsuUFu54pY98M
 /+spc/NhBrDKiCfMNPNWCxOrhxu6iReq1hjtgF5qKzLU25Xu+Qfb01wItc/jmAfXIunS
 nIuRzVCsvFc4pgJ3JvhQnZ/r1gD3cFDlkaDmCcvwnrz2c9aMBWlxM3S3srK7qolz4KSE
 YqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06H8W/q0v8WI5yMb4Dgc4NhHzAw8roTrWJkM0Lw1UXA=;
 b=Df2UvuiHyKCavgO9rpFDDz9n/P9ZnvN4Bu2/E8E52kN76LCMjFPWdG+D+F7fyBMhwI
 ebn3ouFxm4pDy7oFic5YuE0kJYcImu49wiW8QRLOtQKjUNQ0qGSfbSvoYepbVKTQsoI/
 6OdTfeD5UiIpuAxV6TWwn+MQVlwhKIa0o3gL0rzJxkohQPTcRzyr0XxV0SKI4Dyv687s
 JUJxyi5TAL2IqniJvcyjlSPS1xEPPo2oZFEi+MO0oNl1mBF+WpEaS50bAj9CGXeeRpow
 /hBD2RAUsRDsEyK45F2LNwCvb0M+xbZriffAQpx6aJ/j8dfJEsnSc4aZ+bRjYBUqpRQY
 8V7Q==
X-Gm-Message-State: AOAM5304ZWX5y0nAbofJLc8RFCirvCul6nQ4uO/RPP6qa85mosnnbgPp
 ygetihnfKe1pnvClp4wckGs4U6whpub+2A==
X-Google-Smtp-Source: ABdhPJxlbqHh/DBmPqUPFsis7rPukv6s9ISHtUwEVKUZZEvrtKXQRA8iW2zWHL6mxxlRAU/IdY86gA==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr14676243pjb.166.1612751876427; 
 Sun, 07 Feb 2021 18:37:56 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:37:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/70] gdbstub: Fix handle_query_xfer_auxv
Date: Sun,  7 Feb 2021 18:36:43 -0800
Message-Id: <20210208023752.270606-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main problem was that we were treating a guest address
as a host address with a mere cast.

Use the correct interface for accessing guest memory.  Do not
allow offset == auxv_len, which would result in an empty packet.

Fixes: 51c623b0de1 ("gdbstub: add support to Xfer:auxv:read: packet")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index c7ca7e9f88..759bb00bcf 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2245,7 +2245,6 @@ static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     TaskState *ts;
     unsigned long offset, len, saved_auxv, auxv_len;
-    const char *mem;
 
     if (gdb_ctx->num_params < 2) {
         put_packet("E22");
@@ -2257,8 +2256,8 @@ static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
     ts = gdbserver_state.c_cpu->opaque;
     saved_auxv = ts->info->saved_auxv;
     auxv_len = ts->info->auxv_len;
-    mem = (const char *)(saved_auxv + offset);
-    if (offset > auxv_len) {
+
+    if (offset >= auxv_len) {
         put_packet("E00");
         return;
     }
@@ -2269,12 +2268,20 @@ static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
 
     if (len < auxv_len - offset) {
         g_string_assign(gdbserver_state.str_buf, "m");
-        memtox(gdbserver_state.str_buf, mem, len);
     } else {
         g_string_assign(gdbserver_state.str_buf, "l");
-        memtox(gdbserver_state.str_buf, mem, auxv_len - offset);
+        len = auxv_len - offset;
     }
 
+    g_byte_array_set_size(gdbserver_state.mem_buf, len);
+    if (target_memory_rw_debug(gdbserver_state.g_cpu, saved_auxv + offset,
+                               gdbserver_state.mem_buf->data, len, false)) {
+        put_packet("E14");
+        return;
+    }
+
+    memtox(gdbserver_state.str_buf,
+           (const char *)gdbserver_state.mem_buf->data, len);
     put_packet_binary(gdbserver_state.str_buf->str,
                       gdbserver_state.str_buf->len, true);
 }
-- 
2.25.1


