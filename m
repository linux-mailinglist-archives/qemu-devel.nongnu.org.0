Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D81D8DD3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 04:55:22 +0200 (CEST)
Received: from localhost ([::1]:58522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jasPZ-0006mN-B6
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 22:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jasOJ-00057r-2D
 for qemu-devel@nongnu.org; Mon, 18 May 2020 22:54:03 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jasOI-0002Ob-7m
 for qemu-devel@nongnu.org; Mon, 18 May 2020 22:54:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id d3so314320pln.1
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 19:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hFfYOrqCfWexdaAHxTkkt1dBQCoR5xQQDuHTPb8NKqM=;
 b=kovW2DMtDlDpBwcUexCUcC7gk9c2YSE2hZUT12hhyYOqX78PFeQy2jXi61AtM17TWw
 abMlaH9hBkL9kddVVi/DJtjtafaY9t8tqXq8D4Psq99jq2xQNGvor7R8iQC3TVUEwo0Q
 391+oAgDPHHfsXS0v2qQ8fWIumCXqj6JdIVJVVFdVubyzsPdVmkXoUBBqPqsv5lqVl04
 mjyfDO3FlAz68AqixpTRfX+GeU/RukDKnP4Go8K5HP1PxqcNaXtOShBxhf0h9D3PelEC
 fjdhQ+dkb5xdDZnqA0aSQ6yUM88cQ5GplhXXLzPqq/nqGjj94YJdNkNO7pPc2M344Ksg
 Vxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hFfYOrqCfWexdaAHxTkkt1dBQCoR5xQQDuHTPb8NKqM=;
 b=XbwOs09m/DWUoqnyQUAnkxrAjBDB4OJjS9ZJzLUTPlIb/FqZJ63llBCdP7iWFbg/VN
 o1HsihcbRfXd+uI+7W11O1p7bod+SfZstx0VE/i+dcPmS6L2oGPMKSKrXlFsA7549CCN
 ZBFt8Dk8MgRgJpyk/m0yYTPY/x2eAJAF+jssytQzfgb1VRfZ6fbz/w05n/KOpvDOU0aW
 wGmw/RjKHqwqeyyvM0tVD0h91xsi6i1d55VQKbzpoxvZNUd/mw555zR91PnwB+Vkeuc5
 0BG20SkZKtR0oCcT1bRzWGc5DhXLqa9nCVnaza0Hd2AStQ6gBf1rggwWvF06e3n40XBm
 +tTA==
X-Gm-Message-State: AOAM532czBmA/ezhg29XFYVIq7AI/bWoBmzgaSIDRuwmkSsj4nVvptJI
 KR0xI7dcLPX4Q9U8ddSWGKkl5Kr254A=
X-Google-Smtp-Source: ABdhPJxnWZd6yYbDNIgq1ce/NbYQxMh5K7ICUm2xBtAJWOj+mUVYW49n9P9wv2fs5kecenHC0Xkkiw==
X-Received: by 2002:a17:90a:2051:: with SMTP id
 n75mr2578110pjc.112.1589856840321; 
 Mon, 18 May 2020 19:54:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a2sm8772418pgh.57.2020.05.18.19.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 19:53:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RISU v2 02/17] Unify master_fd and apprentice_fd to comm_fd
Date: Mon, 18 May 2020 19:53:40 -0700
Message-Id: <20200519025355.4420-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519025355.4420-1-richard.henderson@linaro.org>
References: <20200519025355.4420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any one invocation cannot be both master and apprentice.
Let's use only one variable for the file descriptor.

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
2.20.1


