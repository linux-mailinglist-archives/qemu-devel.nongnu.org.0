Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179495BB705
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 09:49:58 +0200 (CEST)
Received: from localhost ([::1]:33662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZSaK-0004dD-Vb
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 03:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oZSVR-0000Sn-3x
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:44:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56086 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oZSVK-0006Hi-5h
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:44:52 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72uVeiVjfgQcAA--.38083S3; 
 Sat, 17 Sep 2022 15:43:18 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
Subject: [RISU PATCH 1/5] risu: Use alternate stack
Date: Sat, 17 Sep 2022 15:43:13 +0800
Message-Id: <20220917074317.1410274-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220917074317.1410274-1-gaosong@loongson.cn>
References: <20220917074317.1410274-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72uVeiVjfgQcAA--.38083S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AryUWw45JryDWw1xCw17ZFb_yoW8JF43pw
 43Ca4ftrZ8JrW2q39xCrWkW39xJwn7AryUuF43u3yUXayDGr9Yv3Z8GFy3uFyxGFs8A3yD
 ArZYka15uF4DCrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can use alternate stack, so that we can use sp register as intput/ouput register.
I had tested aarch64/LoongArch architecture.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 risu.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/risu.c b/risu.c
index 1c096a8..714074e 100644
--- a/risu.c
+++ b/risu.c
@@ -329,7 +329,7 @@ static void set_sigill_handler(void (*fn) (int, siginfo_t *, void *))
     memset(&sa, 0, sizeof(struct sigaction));
 
     sa.sa_sigaction = fn;
-    sa.sa_flags = SA_SIGINFO;
+    sa.sa_flags = SA_SIGINFO | SA_ONSTACK;
     sigemptyset(&sa.sa_mask);
     if (sigaction(SIGILL, &sa, 0) != 0) {
         perror("sigaction");
@@ -550,6 +550,7 @@ int main(int argc, char **argv)
     char *trace_fn = NULL;
     struct option *longopts;
     char *shortopts;
+    stack_t ss;
 
     longopts = setup_options(&shortopts);
 
@@ -617,6 +618,19 @@ int main(int argc, char **argv)
 
     load_image(imgfile);
 
+    /* create alternate stack */
+    ss.ss_sp = malloc(SIGSTKSZ);
+    if (ss.ss_sp == NULL) {
+        perror("malloc");
+        exit(EXIT_FAILURE);
+    }
+    ss.ss_size = SIGSTKSZ;
+    ss.ss_flags = 0;
+    if (sigaltstack(&ss, NULL) == -1) {
+        perror("sigaltstac");
+        exit(EXIT_FAILURE);
+    }
+
     /* E.g. select requested SVE vector length. */
     arch_init();
 
-- 
2.31.1


