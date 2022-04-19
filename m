Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11755064A6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:38:11 +0200 (CEST)
Received: from localhost ([::1]:58274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghV4-0006tL-Un
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglw-0001A3-5r
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglt-0004QW-Pv
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:31 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c10so20947458wrb.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTOCe+fx+0QlZrMhUIaxDBklKAMEi+ux1ML0cki4e7U=;
 b=OKmLr+Sgd1rAWNnyV1ZbjZI8mkBSR+Fek1SeMUbxc/63w+rb1cycYKZR/RRNahZ8+c
 dM5cR6oE563BZR5r7zhOaaf3dS8gJjPqzUYAT89PxDkwpHEbtby7LZr4kEnarEAXCEP4
 9x3KumuFX2+tBedfQXEDpsaNmdSMmIued4GQLPf6k7qYMV8lMUsb89sSqd9KAnQwAvqu
 7GYlOVrcmlHC6nYzq32ehMe7VdIviD/rQdbft8HdAmXTdhjxz9CD9XQmvM34ieJzhsAS
 Zb3GRgXULMVUgmnTkTwHigvqc1wIJ/20KG9HTPalRxoro1iFDbkewjxoMC/0svwyGPfa
 nvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dTOCe+fx+0QlZrMhUIaxDBklKAMEi+ux1ML0cki4e7U=;
 b=61OugcX3os+s9+bRtwWF5fASYaiuGLqj/R3ItldGIPgY+P4Y7DyNcfORodzOMvRm6Y
 N8R3MHQbh5smOhGteZGxTfir4dU8sT4ZMzVY7QzIHIwdwo1zQ1mb0Pvo5TGWIln22NaY
 W+plqBj4J5H1hEoHVc30lS4JhD1KIEBH/oJEkkwMh//F7M2G6Bt+A3JN10DNZ1UMM3Mq
 bcQytB6TejjWJzMlyPxRfhZyfqzPYQuuyC5VYwbktJhgLtoC46cWHjv1mKzQNstDY0j6
 iYyUWm198rjrRNiwNIpzRdx18a9eka6qVT8DqY5rAJ+CTmIE5esGieqYWIa/EQU9C1f+
 vJtg==
X-Gm-Message-State: AOAM532Bdd7bB2Gbrq/RK9n21pcKmqe8Re5o+GIj9XxsHVaz43w0KOzd
 AawRyVU6ZKbVkl8A3CJL4n1jo1NAJhZRwA==
X-Google-Smtp-Source: ABdhPJz2LfSVh1T0p2iwxyhGTGkCcs3m2l0JubQk73HIYpBUIbH24RqF4AZSiB7O2lBVvuPLS+VNIw==
X-Received: by 2002:a5d:64ed:0:b0:20a:a5ea:e0cd with SMTP id
 g13-20020a5d64ed000000b0020aa5eae0cdmr1575694wri.520.1650347488384; 
 Mon, 18 Apr 2022 22:51:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/53] include: move qemu_pipe() to osdep.h
Date: Tue, 19 Apr 2022 07:50:39 +0200
Message-Id: <20220419055109.142788-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-19-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu-common.h | 4 ----
 include/qemu/osdep.h  | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index c6f3ed94bc..2e1e76014a 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,10 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-#ifndef _WIN32
-int qemu_pipe(int pipefd[2]);
-#endif
-
 void cpu_exec_init_all(void);
 void cpu_exec_step_atomic(CPUState *cpu);
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 259436ff53..a733294710 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -530,6 +530,10 @@ static inline void qemu_timersub(const struct timeval *val1,
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
     G_GNUC_WARN_UNUSED_RESULT;
 
+#ifndef _WIN32
+int qemu_pipe(int pipefd[2]);
+#endif
+
 void qemu_set_cloexec(int fd);
 
 void fips_set_state(bool requested);
-- 
2.35.1



