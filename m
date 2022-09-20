Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564C15BE6C5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:12:17 +0200 (CEST)
Received: from localhost ([::1]:46220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oad2u-0008Ct-DL
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZO-0001Nj-5W
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:38 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZM-00050i-JI
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:37 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so10320080pjq.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/IRfRlUZ8PHyxDl3ny4yy2ispddiqfXne/7ixyNzdlE=;
 b=Fon+t1eYCQtRz0Q7E+Sg6H1dWmaLaD57FbtpKg8An272UU3Cnl90+zc6L3NEnqIq/h
 DMcSC3jPaeV75mdH3NVQcF+DXSdOuFi/Gov8350QT//8PMHYmF2Zt5hgKgqydP37wZIl
 4eBG+SATJxt0oIOjoYlKmBU5Y4cVr4vdTDUrDapcA2rOVnTP6acUoqTlsQfdJN7xl+JT
 pk9beRrnumkOUjPOWFphw5f0Mzzv+lD9Sdm/4nGveZMeT4HGaBex0VI/52aInvXZXNkb
 ntz3sjf9hg0Ssxr6RhFbKtpzkDKLwn8Q50Jo1X4f2XCI1R8eOOOrp9WdDeLt3Dz9kbOB
 BUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/IRfRlUZ8PHyxDl3ny4yy2ispddiqfXne/7ixyNzdlE=;
 b=eYLZKPIgvFVmLKZffHzuWVmBYO15IffncxPge4zwnBsEK4k7dtF8t1U2eUYLs6p16J
 WK16fnvqXXoA7W++aiiMNqEl4qEL4y/zgEMhK3IML8crYA2ASwq/SIUWcHLjEAhRmKGr
 DXH5FThmaP8cSlzORetedhqV+ThCnubRDKjeCodhnx62N4DxENchOkfmt3R/fqujpWcJ
 e3e9m55OpEqva0J9QAcAFH+UzA3o8AbgkyAuhUrH5SKvDwoYYr3i7ROcKmmwMnhV09JZ
 WFBL92EFUtlq/QHs2eeclw8lswFrbvKBwG4i0KUFbSjM2f5GS5vXJsVE6Tya4h5hs0LL
 H+qQ==
X-Gm-Message-State: ACrzQf26Dv6uTB525f13itZT9/QcOLH9ml2LL4lS54GxmXWWScRLkHin
 vIYsBwl943i2Tt5g683X0EH8FYE4v1M=
X-Google-Smtp-Source: AMsMyM7jw86x7d9INGsbihOntsTC2aaGqQbJ59KUOAw95lNLu03Aqp/rGem2UQG4KfIyokBIRcpZlQ==
X-Received: by 2002:a17:902:7c0d:b0:178:a6ca:1dbc with SMTP id
 x13-20020a1709027c0d00b00178a6ca1dbcmr4220287pll.115.1663670015312; 
 Tue, 20 Sep 2022 03:33:35 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 30/39] tests/qtest: libqtest: Replace the call to close a
 socket with closesocket()
Date: Tue, 20 Sep 2022 18:31:50 +0800
Message-Id: <20220920103159.1865256-31-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/libqtest.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 5d15e39289..08c4e76ffe 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -113,7 +113,7 @@ static int socket_accept(int sock)
                    (void *)&timeout, sizeof(timeout))) {
         fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
                 __func__, strerror(errno));
-        close(sock);
+        closesocket(sock);
         return -1;
     }
 
@@ -124,7 +124,7 @@ static int socket_accept(int sock)
     if (ret == -1) {
         fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
     }
-    close(sock);
+    closesocket(sock);
 
     return ret;
 }
@@ -507,8 +507,8 @@ void qtest_quit(QTestState *s)
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


