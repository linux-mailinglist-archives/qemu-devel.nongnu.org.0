Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BBC30E9A1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:51:43 +0100 (CET)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7To6-0001xo-F5
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Thv-0004Uz-Mq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:19 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tht-0003WL-B7
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:19 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t25so1048727pga.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06H8W/q0v8WI5yMb4Dgc4NhHzAw8roTrWJkM0Lw1UXA=;
 b=DuqrYvMwhBsc+qfGK1FRo0OYd+ObwZJjKbK91T39gCwuU3LrSqkOrErS6AAw+3ogQ6
 HoP1IYIAMqYv5yLwGI4i2ICtFICfW4Yn6b9HJKauwAOmh+ImpeoP/yWcmGDB8KD/Vukh
 RAHahpVMWLMGXPu5RRoAji87XBIvYRoG1hRU5YZohGnZdzL7sdPibIKBbyfEDhJFufLc
 /9waZnEeTskxdNC89DYgkQkNv4bHNW1KksxoG9MEyCTVYYsXeixEZE1Q91DMVWsRRpOQ
 ytJj5HWx2iydLXfoebTvT4p4e8ufAMr3OUYCOIqIdJiRh+Ac65sJEnmdayAYtpsl9qaK
 9FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06H8W/q0v8WI5yMb4Dgc4NhHzAw8roTrWJkM0Lw1UXA=;
 b=YA74PkgLDnOauqAENe5lUoG9rrmVhJ7KS2laoFVz5cYyBYv/R6kLQm2JXnuuftQM9o
 Gh5W9pQNU5ikT4DaSRXaocZY1HgP04wkY/rvFBzeG/PrnYBdhFb4vKF8RUayg2BphV32
 rlvD9UY+NyiTwuKOzCgl69PFf7OMnr8pCf6DKtPTzeth9CjTS1Q3qREGufp052sX/NJg
 +4E3tohXdIdaz6jpOBT0D+k8yQYHo/+6RXTfesj7zm3bFBTPz2prTlg8mENWetpI9Saw
 HvCAHIoKW0FMYUSxsJANe7Dkg1VsFMGrzyPGavAeZO4hjpY6mQ+QYEdxpOVOFz7IkAev
 0HCg==
X-Gm-Message-State: AOAM532/EnrQPac/WpUyAVPZ6BPgNamVt3BjGI4zbj1C80cXbJYkKHSp
 UN1TMkuNVsCxXH9lQhA4+iqBmTl1hoMFSZVR
X-Google-Smtp-Source: ABdhPJzLN6FM2njZLsbVLKAuUAgkNXInu3QxWRRxovKjKH6Es3fTt7HJe4ldbi6CYaDEay+pftptVA==
X-Received: by 2002:a62:f243:0:b029:1c2:8424:2495 with SMTP id
 y3-20020a62f2430000b02901c284242495mr5827298pfl.32.1612403115921; 
 Wed, 03 Feb 2021 17:45:15 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/93] gdbstub: Fix handle_query_xfer_auxv
Date: Wed,  3 Feb 2021 15:43:37 -1000
Message-Id: <20210204014509.882821-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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


