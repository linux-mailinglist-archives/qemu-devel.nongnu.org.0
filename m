Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAA585ADE
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 16:52:42 +0200 (CEST)
Received: from localhost ([::1]:45160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHnpa-0007PV-39
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 10:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnnj-0004YU-9f
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:47 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnnh-0007ZP-Sd
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so7798106pjf.5
 for <qemu-devel@nongnu.org>; Sat, 30 Jul 2022 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CAT2FKyokp6jIbF5cQnfF4hEF5YeiWS/OD4dpe4OUP4=;
 b=cE8nL+RBiNlRWaapYpRyuRjmDBMIuHMh+AXyMHG6C2KVAMYdhRIhH+2D2Zl+7NqJcK
 ckZiPXFeZ9rosGe7fP0JQ1Syyn3wwu+5INIp3i5Cl9KTzaxnZDWmKcQzZXK4d//k9Lbt
 j+cmPRIpOfOjQ5Tg3/OPrd/OGvLoIVACj8GaeZIEN/A9aCAN5mumV41Q4hdo0sgjArDF
 bUYsUBr18SAGv8spy6McQL1jm9eFL4K6/d8P+YWG9x4+XAk7DC0YQ60LM7Na9kpfqk3W
 C/9bJaKMfWKhNlAKQIIPPRaIfO+N1/fiI9OkL0c17ZUQAfm7jVg7Fk/Ds1Pz1IxHbxN8
 j6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CAT2FKyokp6jIbF5cQnfF4hEF5YeiWS/OD4dpe4OUP4=;
 b=dVcDupGg43jubKx804viKueeP9AjlLlKtl+eRuWhxjtD4FdrYAKVyxTMU/gmdnX+Lx
 bOOHVY63Mb6EyEKGXcC4LLRb06CP4XJw5r8l3FEBjmPk7BB9BgzVBfF6Vx72za/GjSCB
 yewTVKfA/KHB7h5HNbW9ym+i96QF37Urb8kCe7yA6VEIA/B/cHzgMK7Vf/H0uxBdmULy
 /ypXL4fs54AlJhXHMUWUK3zsXlHRnhmg66/iWVgUWAK2ATIzFpif7iNFEv1GVHqhqaCp
 sbcG5VQEH5O0NF179Yr9yi4wjxlpsp6SA/E+EN0K619+T7N+2J9pE3FCO/0ahiR83jc1
 YBxQ==
X-Gm-Message-State: ACgBeo2EQSQwAd7ZBNpStiJuVnpDwwlnDfc1jdmRGP+EnB7q0WVVBYJd
 5wt4CY37TziANCdw2rdr5MmzUY6T93M=
X-Google-Smtp-Source: AA6agR7RM7OIBssW+TnhJSp3r84F2qwAeh+C1g7XOH9Q6hAjPIKzRtvZ94kw9dbAKl31LhQorBSyhg==
X-Received: by 2002:a17:90a:1fcd:b0:1f2:1a72:ae5d with SMTP id
 z13-20020a17090a1fcd00b001f21a72ae5dmr10457165pjz.78.1659192643668; 
 Sat, 30 Jul 2022 07:50:43 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa78f0b000000b00525343b5047sm4882499pfr.76.2022.07.30.07.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 07:50:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 1/4] util/qemu-sockets: Replace the call to close a socket
 with closesocket()
Date: Sat, 30 Jul 2022 22:50:33 +0800
Message-Id: <20220730145036.865854-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220730145036.865854-1-bmeng.cn@gmail.com>
References: <20220730145036.865854-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 util/qemu-sockets.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9..0e2298278f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -487,7 +487,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
 
         if (ret < 0) {
             error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
-            close(sock);
+            closesocket(sock);
             return -1;
         }
     }
@@ -1050,7 +1050,7 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     return sock;
 
  err:
-    close(sock);
+    closesocket(sock);
     return -1;
 }
 
-- 
2.34.1


