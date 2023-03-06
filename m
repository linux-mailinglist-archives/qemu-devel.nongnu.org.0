Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894046AB48F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Lj-0003EO-2j; Sun, 05 Mar 2023 21:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lh-0003Dz-9O
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:13 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lf-00060k-O2
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:13 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so7532141pjz.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U6sNLD8XHJNiSXrFn1QLQM94uDPxds/0DDVitXItwws=;
 b=GXbui6B0Ff5augnmFC3SJ9MST6JBFnwBZcnR2OMqZyGPTbgnw/yxKLkNacspnPb4f2
 mdPGLpD5GcIUr/NjZSzRs3LTgoykIb3eIvMFiCOFW35tx6/6b+IEQizZZGrF3BnyweoW
 itBm7FpeczYhSvzgF2IYTn9X/kPpymIVI581GNB3e05HWBAh5REZk7x1rQEC2lqC6uMc
 ma3b9xLg0T2zGdBeLPhBu7mXRBVNtaEZs7HaFMjBj2Y6kfM69b3jWzwnBzOQN88o0l9w
 Y+jcw1DsCb1YoJvNVqAWkB2cFrffNXtqQUwhpvNIUQUWfafFyX6ozb/tPp2YiYgGTTwX
 xuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U6sNLD8XHJNiSXrFn1QLQM94uDPxds/0DDVitXItwws=;
 b=F397NXeZq8iz1ncczA6/Y+sNbAhMa78CvjWvrd+fgxbasXK4tPxyTpHgZZ6fkkWXLN
 wfy82gO3Z5VObRu4Xd5nZ6/L0H5srTgo5tWr2/zWVIgRaI6ls+BgAWaUAqzyiHhNRms1
 jWEt5PTPW0SQ4Ajel3MUmnRdfyfgN+D9aO6MRBfKQMAQis0ZoprDj2j5Dt6WDBJVhzCu
 F5LDU83Qr7lUTYUMrn1jNjASdwCdnfHR+uC8LvIz9a019YPNn/W6Bl9u4qG3matx6mGx
 7eB4iZEAoxkJRKRyOh2y3T34/c/Ru19OFxxFY72vVJiDjLoSyYgnsXw+txqgHCncZuyg
 JQoA==
X-Gm-Message-State: AO0yUKWsQEtMojfz0HYQBBW9VIHObLyCdwilFRJJUC/qBWKmFTCE0i37
 a/Dwp+zmZxOiHpXFVzt3ipkC6xwFvWV8ErHswljDuw==
X-Google-Smtp-Source: AK7set/GmDGrIw4mNYfySjnN3/NioN4HjajFk6bXPYt66ruqSuGWukWVHsResvld2+5m5vop2H555w==
X-Received: by 2002:a05:6a20:8f27:b0:cc:65c3:c8cb with SMTP id
 b39-20020a056a208f2700b000cc65c3c8cbmr10653059pzk.42.1678068790318; 
 Sun, 05 Mar 2023 18:13:10 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] linux-user: Rename max_reserved_va in main
Date: Sun,  5 Mar 2023 18:13:00 -0800
Message-Id: <20230306021307.1879483-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Rename to local_max_va, to avoid a conflict with the next patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index f4dea25242..5fcaddffc2 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -680,7 +680,7 @@ int main(int argc, char **argv, char **envp)
     int i;
     int ret;
     int execfd;
-    unsigned long max_reserved_va;
+    unsigned long local_max_va;
     bool preserve_argv0;
 
     error_init(argv[0]);
@@ -786,9 +786,9 @@ int main(int argc, char **argv, char **envp)
      * still try it, if directed by the command-line option, but
      * not by default.
      */
-    max_reserved_va = MAX_RESERVED_VA(cpu);
+    local_max_va = MAX_RESERVED_VA(cpu);
     if (reserved_va != 0) {
-        if (max_reserved_va && reserved_va > max_reserved_va) {
+        if (local_max_va && reserved_va > local_max_va) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
         }
@@ -797,7 +797,7 @@ int main(int argc, char **argv, char **envp)
          * reserved_va must be aligned with the host page size
          * as it is used with mmap()
          */
-        reserved_va = max_reserved_va & qemu_host_page_mask;
+        reserved_va = local_max_va & qemu_host_page_mask;
     }
 
     {
-- 
2.34.1


