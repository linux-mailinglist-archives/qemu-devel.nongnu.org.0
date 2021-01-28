Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB99307F71
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:21:56 +0100 (CET)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Dnf-0002FV-Sx
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5DkX-0008Mj-Iw
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:18:41 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5DkS-00041Q-Bt
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:18:41 -0500
Received: by mail-pl1-x629.google.com with SMTP id b17so3983613plz.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 12:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwPj5CUJWa8K3MHBEU/KHRN6iVPgI6G5msCTjVKG/1k=;
 b=Vf39r2hOMC0mHp7mjpnjQSFeCrN3MieEak1eBTb0wVeE9shchRku30OklUsg4+dREN
 j7f04GEV7o716RzmAgck3Z4/z+rTuJFgblMYasyVpqqNqVboYIOVIrcHzTcI/Ri4PfhD
 JHXG5LhyjS+1U65sq0I4xop3LYSyEE1AWIu4d7cpjxk0x8IRAUOKANJ+sp74CDljM6rs
 k/snZIlGZvroE8RtjTHbMBrGphwYEwNPmmIZZ2dpIq6+4lmbpHZH3xWSQyCqe9rPYhcp
 ZHcnWOijN91Pdu7a1k0CknIFp2m+GKwTlxRoopIO9Br4oG9H3tHPqBTFKcIDakWKYFuv
 UKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwPj5CUJWa8K3MHBEU/KHRN6iVPgI6G5msCTjVKG/1k=;
 b=A/kZO8/ZhdNnYVgduzXMExDN1gX0PUi1kUyPopLFYhsbygwdRT/VHK4Hy+dnYNqU5S
 qkn/SSKHCZAwaheY5w+56zs5XNSDPv7HYydjd37vBIMXXiLv17+7pRw98BT0+IZ2EXR5
 tkV359/vKme7AXzoFwzTh/jMamTMXjzaWZAt9F8tqL+2+MAzX3pSf3xN1nm1SpXUBrx/
 jA8virkNb0yJUKiJ10ZBN5DR9Z/7OleEUVEnXTBXjhl1qKCVRz+3SPhMAawh9ztoAegZ
 6U44imJvJfL5FlPASoeVHGdJsayIs0VerDH+GHVB3gY9v58BH/7xRzLzd9gGJhhSWVlm
 Nyew==
X-Gm-Message-State: AOAM533a5TSXsGYJQlSmEZUy+M2iwjYNh+VXmgREEMd2l0aTlVEbJIYP
 oliADCRkklD7pnmmvs+Q6EEy1WEMdCSrwYOv
X-Google-Smtp-Source: ABdhPJw9euvRpK0BikmIEiLYIqbRcpobq6j7nNYgJdhu1Zb9S+6Z5j9X0G+wfN1yMd4/qB1ZajuNkg==
X-Received: by 2002:a17:902:740a:b029:df:cf3a:72ff with SMTP id
 g10-20020a170902740ab02900dfcf3a72ffmr1122716pll.12.1611865114717; 
 Thu, 28 Jan 2021 12:18:34 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id z2sm6819299pgl.49.2021.01.28.12.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 12:18:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] gdbstub: Fix handle_query_xfer_auxv
Date: Thu, 28 Jan 2021 10:18:31 -1000
Message-Id: <20210128201831.534033-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main problem was that we were treating a guest address
as a host address with a mere cast.

Use the correct interface for accessing guest memory.  Do not
allow offset == auxv_len, which would result in an empty packet.

Fixes: 51c623b0de1 ("gdbstub: add support to Xfer:auxv:read: packet")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Fixes a number of check-tcg failures, which are transformed from
proper failures to "SKIP: PC not set" by the test harness (bug?).
But the qemu executable has in fact crashed.

I'm embarrased to note that I reviewed the original patch, and
should have noticed this.


r~

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


