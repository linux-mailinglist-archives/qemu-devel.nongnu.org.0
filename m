Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C124D59F86F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:13:10 +0200 (CEST)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQoJp-0006Me-KX
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvA-0004Vk-Rz
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:37 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmv7-0001sw-NF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:35 -0400
Received: by mail-pf1-x433.google.com with SMTP id y15so11987232pfr.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=F0tptSCqhJOQrvbB4isSFD9NCdxNi1hMprPFt8tETzY=;
 b=LYsjvN/x9aEuSqhpXHXwgLQ5k8RXHez+dJbE4zvToHUDwX7/e/riE8UggNCli7Euiw
 qcsIn4vwlB/Px3dfrKq2yg1BnaKltp5lbuGkMjAN25uGQUMGj/dJwzN1R85m07GNF9R9
 uR7xYfIiLFTFB8sD6v563LLnaKU999iyF/iMCvmxXRXtlvHrJjsnRWf1mKFHLrR5fjh2
 sHS7Iv+YLtYLECz1E1sVou070aZOm8+/eSFZuZgI2pNHXon3ZijJA8IouF9jM8gO1xEc
 EzaoDS6AIgMFMWYuABDiUUd/UkAogqznjfpzOETJvb4QVajxn2raXKEQVcrtHeR/6LRS
 RWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=F0tptSCqhJOQrvbB4isSFD9NCdxNi1hMprPFt8tETzY=;
 b=00tIZGp9B04aG6AsCwAnJFfHmD94daPtRLmnbdrNG8VWlKaX18SB56ykGg+tHuaPPn
 LztCt0TNcPkK3pvUr096riecQPjNmn0J6A4wn+NcveFvCuQ/IqGaQ6IjWZdNKKCfLwFD
 FWuzktxGUodGWHVdRK8srJ5wWaBxxUyV0KYAlqUgdOUZk9VXNTPxf3WtZFwbU+Oeen7f
 g4G35cA1vPykgd+TzzgZYh4p+pi5nOOYhbMHMrnmtT020gAHGXtT9p4lsJd/5oRfR4NL
 DmW4tuCpjaDLXnVUSeELWzrhGg6boCew1uv7CaGDY7qeKKvHKXL83+qM8sk1r8AJJzfo
 YYog==
X-Gm-Message-State: ACgBeo2QGZwRDA7REBE42FXp7HHPHnQbbZNagU0YyTogViuWC00csx53
 iTt7JnW+1tdfAID9nTslOkknNy0BwIk=
X-Google-Smtp-Source: AA6agR4wKbwtpR8AjgdyQdje8U0tJQ4vNu7ni5C0B1FebCH9MA0Yy2jk9pXfBc31uSxglIjmNpWzkA==
X-Received: by 2002:aa7:8e05:0:b0:536:5dda:e634 with SMTP id
 c5-20020aa78e05000000b005365ddae634mr17547436pfr.35.1661334212217; 
 Wed, 24 Aug 2022 02:43:32 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 46/51] tests/qtest: libqtest: Replace the call to close a
 socket with closesocket()
Date: Wed, 24 Aug 2022 17:40:24 +0800
Message-Id: <20220824094029.1634519-47-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

close() is a *nix function. It works on any file descriptor, and
sockets in *nix are an example of a file descriptor.

closesocket() is a Windows-specific function, which works only
specifically with sockets. Sockets on Windows do not use *nix-style
file descriptors, and socket() returns a handle to a kernel object
instead, so it must be closed with closesocket().

In QEMU there is already a logic to handle such platform difference
in os-posix.h and os-win32.h, that:

  * closesocket maps to close on POSIX
  * closesocket maps to a wrapper that calls the real closesocket()
    on Windows

Replace the call to close a socket with closesocket() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/libqtest.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 99e52ff571..918f4657ed 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -115,7 +115,7 @@ static int socket_accept(int sock)
                    (void *)&timeout, sizeof(timeout))) {
         fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
                 __func__, strerror(errno));
-        close(sock);
+        closesocket(sock);
         return -1;
     }
 
@@ -126,7 +126,7 @@ static int socket_accept(int sock)
     if (ret == -1) {
         fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
     }
-    close(sock);
+    closesocket(sock);
 
     return ret;
 }
@@ -512,8 +512,8 @@ void qtest_quit(QTestState *s)
     qtest_remove_abrt_handler(s);
 
     qtest_kill_qemu(s);
-    close(s->fd);
-    close(s->qmp_fd);
+    closesocket(s->fd);
+    closesocket(s->qmp_fd);
     g_string_free(s->rx, true);
 
     for (GList *it = s->pending_events; it != NULL; it = it->next) {
-- 
2.34.1


