Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1056BE27
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:29:17 +0200 (CEST)
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qqy-0004Fw-Ck
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCJ-0003wr-Tc
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:15 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCI-0002Mv-6W
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:15 -0400
Received: by mail-pj1-x102e.google.com with SMTP id a15so11634223pjs.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lcnb+cJ/wyqPfEDRcfJ9HbxKsjqemLvSn/xAJtNX7ic=;
 b=j99DO5x8nS4GWZgN7/isM8hAHv2aQ/GA/Ij2mh7eapSfu61OmoN7atzL7BbqmhY00O
 KrhP2DoYzTl3/b5I011Xo/8pNm5bJZAjvbHQxGOEY/ky39O3gBPFsREaavJmssmQCnw2
 9wZYv0apGloRI0uTNcbZVuvGYWocwiuq1UqV/Dx5yJLf30g6vwZeTyl94PfG7ORonzj4
 qL5KQ1Wsn7eTgf5T53NXxzGtJQTn3VXdc9rao4LQTpfmauNq5XWlzRrkxya39qwfZHNE
 mY6YfpZU2+DDhKr3wPHGVkIx7KDXB1U1GwuBeFsYkufJTtJfoW7uOQsk1YbbsoFW/8Uz
 6Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lcnb+cJ/wyqPfEDRcfJ9HbxKsjqemLvSn/xAJtNX7ic=;
 b=470DCiE7J5GUwbvx47uUzYB1XcAXqqrbP+wNxCfea1rzRDF13SwuaDfjnq9st00dOP
 pGnIVdwCGRsS+HLvPWlCYT3HvIjBx6CsLW768lLj+MiQCk8Qy6VRzfKhxeY2gi5rB8So
 ysRtm1z+VS3KIB22hvA95VAWuLtqkXTc4/Ffxf8hOe8L8X0TnqG5hXAIHZHY2XgL58Tx
 zZyuVn/QtiPqrfSL6bfUoc/+QqJQgNI4332n9UsoT1MeKy3dZGzLqkMyOj+3eODEZIPQ
 d7vR+k2SYDDLKqOQC2zIBGiX/Kbje0G2IM+SY3uOg948E7Ot32GHsqEGkabeyrM68hgt
 hLvQ==
X-Gm-Message-State: AJIora8SEWwVON8/gHAgtOSjs0DNwnbQapz8xeIVEgivxARKy5ZYuo2+
 tPs196R/txizFJO8BPJw1mzpmES7e41oM8Ov
X-Google-Smtp-Source: AGRyM1uZqnPgYRLyayMezs5hhKx5T4d55w9INXOuLMIQx//bwkLFGtzDjsnZBTPPoi3FjPzVo62jGg==
X-Received: by 2002:a17:90b:1b49:b0:1ec:a756:edc with SMTP id
 nv9-20020a17090b1b4900b001eca7560edcmr502319pjb.200.1657295232878; 
 Fri, 08 Jul 2022 08:47:12 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RISU PATCH v4 02/29] Unify master_fd and apprentice_fd to comm_fd
Date: Fri,  8 Jul 2022 21:16:33 +0530
Message-Id: <20220708154700.18682-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any one invocation cannot be both master and apprentice.
Let's use only one variable for the file descriptor.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/risu.c b/risu.c
index 79b1092..059348f 100644
--- a/risu.c
+++ b/risu.c
@@ -30,7 +30,7 @@
 
 void *memblock;
 
-int apprentice_fd, master_fd;
+static int comm_fd;
 bool trace;
 size_t signal_count;
 
@@ -50,7 +50,7 @@ sigjmp_buf jmpbuf;
 
 int read_sock(void *ptr, size_t bytes)
 {
-    return recv_data_pkt(master_fd, ptr, bytes);
+    return recv_data_pkt(comm_fd, ptr, bytes);
 }
 
 int write_trace(void *ptr, size_t bytes)
@@ -58,9 +58,9 @@ int write_trace(void *ptr, size_t bytes)
     size_t res;
 
 #ifdef HAVE_ZLIB
-    if (master_fd == STDOUT_FILENO) {
+    if (comm_fd == STDOUT_FILENO) {
 #endif
-        res = write(master_fd, ptr, bytes);
+        res = write(comm_fd, ptr, bytes);
 #ifdef HAVE_ZLIB
     } else {
         res = gzwrite(gz_trace_file, ptr, bytes);
@@ -71,14 +71,14 @@ int write_trace(void *ptr, size_t bytes)
 
 void respond_sock(int r)
 {
-    send_response_byte(master_fd, r);
+    send_response_byte(comm_fd, r);
 }
 
 /* Apprentice function */
 
 int write_sock(void *ptr, size_t bytes)
 {
-    return send_data_pkt(apprentice_fd, ptr, bytes);
+    return send_data_pkt(comm_fd, ptr, bytes);
 }
 
 int read_trace(void *ptr, size_t bytes)
@@ -86,9 +86,9 @@ int read_trace(void *ptr, size_t bytes)
     size_t res;
 
 #ifdef HAVE_ZLIB
-    if (apprentice_fd == STDIN_FILENO) {
+    if (comm_fd == STDIN_FILENO) {
 #endif
-        res = read(apprentice_fd, ptr, bytes);
+        res = read(comm_fd, ptr, bytes);
 #ifdef HAVE_ZLIB
     } else {
         res = gzread(gz_trace_file, ptr, bytes);
@@ -218,11 +218,11 @@ int master(void)
 {
     if (sigsetjmp(jmpbuf, 1)) {
 #ifdef HAVE_ZLIB
-        if (trace && master_fd != STDOUT_FILENO) {
+        if (trace && comm_fd != STDOUT_FILENO) {
             gzclose(gz_trace_file);
         }
 #endif
-        close(master_fd);
+        close(comm_fd);
         if (trace) {
             fprintf(stderr, "trace complete after %zd checkpoints\n",
                     signal_count);
@@ -244,11 +244,11 @@ int apprentice(void)
 {
     if (sigsetjmp(jmpbuf, 1)) {
 #ifdef HAVE_ZLIB
-        if (trace && apprentice_fd != STDIN_FILENO) {
+        if (trace && comm_fd != STDIN_FILENO) {
             gzclose(gz_trace_file);
         }
 #endif
-        close(apprentice_fd);
+        close(comm_fd);
         fprintf(stderr, "finished early after %zd checkpoints\n", signal_count);
         return report_match_status(true);
     }
@@ -375,31 +375,31 @@ int main(int argc, char **argv)
     if (ismaster) {
         if (trace) {
             if (strcmp(trace_fn, "-") == 0) {
-                master_fd = STDOUT_FILENO;
+                comm_fd = STDOUT_FILENO;
             } else {
-                master_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
+                comm_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
 #ifdef HAVE_ZLIB
-                gz_trace_file = gzdopen(master_fd, "wb9");
+                gz_trace_file = gzdopen(comm_fd, "wb9");
 #endif
             }
         } else {
             fprintf(stderr, "master port %d\n", port);
-            master_fd = master_connect(port);
+            comm_fd = master_connect(port);
         }
         return master();
     } else {
         if (trace) {
             if (strcmp(trace_fn, "-") == 0) {
-                apprentice_fd = STDIN_FILENO;
+                comm_fd = STDIN_FILENO;
             } else {
-                apprentice_fd = open(trace_fn, O_RDONLY);
+                comm_fd = open(trace_fn, O_RDONLY);
 #ifdef HAVE_ZLIB
-                gz_trace_file = gzdopen(apprentice_fd, "rb");
+                gz_trace_file = gzdopen(comm_fd, "rb");
 #endif
             }
         } else {
             fprintf(stderr, "apprentice host %s port %d\n", hostname, port);
-            apprentice_fd = apprentice_connect(hostname, port);
+            comm_fd = apprentice_connect(hostname, port);
         }
         return apprentice();
     }
-- 
2.34.1


