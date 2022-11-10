Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC304623BE0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:33:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot10n-0002Rm-Rs; Thu, 10 Nov 2022 01:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10g-0002NO-Jk
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:59 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10e-0001bk-W0
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:58 -0500
Received: by mail-pj1-x1036.google.com with SMTP id k5so822684pjo.5
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djQvtbI+5ceah01/E9QXrKDRfdUAtdLN189JgwjzOBQ=;
 b=dxs3uNSNJO66VN/n0oFa/UNI60Ugn1Trsz2q1+NuHqy4eZMGW6DpgGBz/x1Ocy6uZV
 zQXs7zeXfARZRZh0kUJDAWvCuUojRH36v1/H3y3KuJmSPbX/azyfxAMry9B2679iTDK9
 el0DC8PwKgwWgmgb1OXq/Y++nVFl/wtcxDnPiv7idKtEOPNI0YmBGp/0uNp3iZZmw7iz
 yvQ+2wBzy/lwA64vS216cv+3ORbsu/PE9FsFZ45SCPpkDUxrAIGhtqws7afeAqqJJgyT
 6Vmak6US2jvVP/PP6CKVwFqbeC1F9+DGRsCC80tXaLHkPOJNI1KUyMINqLMcDPGpgLTo
 SR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djQvtbI+5ceah01/E9QXrKDRfdUAtdLN189JgwjzOBQ=;
 b=P3EJrFMs+a0WBmVcY/xietFqHKuMTKMV45gxLPojh8OpUUlYkOWkSiT7dQDGGTa0Kz
 aAXt7CWhObQBkw2JpHfeNoipka0n991+majkN4j2MvjVb78IPp2/Kvzau5H2WkLS5Nbe
 b6I2oo078uIpeisfUYaN4WGHDJpxKb19I0lI75EpJ4QB/2i92wQ0eekQOsfveDSgAH6g
 jNysK4dKnXbVfQA0zGNq+Ib42simCnBG2CYF3Ow/xNv8r0yEqrmj7uKbt9EdUr+NIlVE
 CVTyBgVZmSjaQKMyfOAhALQS4Mq7ABD2AKjeKY0gPkU9pqiBCHL4jUl2gb+MCqLRA6Fm
 ZPUw==
X-Gm-Message-State: ACrzQf0Ss+DaxjetlxhRCSf2libX6ynqkVApl1qd+Eex6rkZqe1DSRBg
 mfTMaCeIfLVIeBI6mwXHDPOA8uZJhX4zgTaj
X-Google-Smtp-Source: AMsMyM5TghrS/8nhttMh/cvsxPXWm0EWfRsVFpm6UrYNzQ/FoRwB6swBHjoBWEvzY96cZ4IrClbjzA==
X-Received: by 2002:a17:90a:1b44:b0:213:1035:f913 with SMTP id
 q62-20020a17090a1b4400b002131035f913mr63785378pjq.133.1668061554410; 
 Wed, 09 Nov 2022 22:25:54 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090ade0400b002108cabbe31sm2289003pjv.9.2022.11.09.22.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 22:25:54 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Yan Vugenfirer <yan@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 09/10] util: Remove qemu_get_local_state_dir()
Date: Thu, 10 Nov 2022 15:23:28 +0900
Message-Id: <20221110062329.13363-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110062329.13363-1-akihiko.odaki@daynix.com>
References: <20221110062329.13363-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

There are no users of the function anymore.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/qemu/osdep.h |  8 --------
 util/oslib-posix.c   |  6 ------
 util/oslib-win32.c   | 10 ----------
 3 files changed, 24 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 86445aad25..f21ebf2b27 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -557,14 +557,6 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t count)
 
 void qemu_set_cloexec(int fd);
 
-/* Return a dynamically allocated directory path that is appropriate for storing
- * local state.
- *
- * The caller is responsible for releasing the value returned with g_free()
- * after use.
- */
-char *qemu_get_local_state_dir(void);
-
 /**
  * qemu_get_runtime_dir:
  *
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 9a0b3913ff..b8d79876b2 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -273,12 +273,6 @@ int qemu_socketpair(int domain, int type, int protocol, int sv[2])
     return ret;
 }
 
-char *
-qemu_get_local_state_dir(void)
-{
-    return get_relocated_path(CONFIG_QEMU_LOCALSTATEDIR);
-}
-
 char *
 qemu_get_runtime_dir(void)
 {
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 6ad1bb4bac..a32cc5b1be 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -233,16 +233,6 @@ int qemu_get_thread_id(void)
     return GetCurrentThreadId();
 }
 
-char *
-qemu_get_local_state_dir(void)
-{
-    const char * const *data_dirs = g_get_system_data_dirs();
-
-    g_assert(data_dirs && data_dirs[0]);
-
-    return g_strdup(data_dirs[0]);
-}
-
 char *
 qemu_get_runtime_dir(void)
 {
-- 
2.38.1


