Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C4663CDC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:30:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFAL3-0004HJ-BC; Tue, 10 Jan 2023 03:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFAKQ-0004D4-NB
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFAKO-0002dF-Pt
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673340591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+3zdaZdNFTeczIJd07e3iWgeA2mI+VXU0S7q8VlSEaI=;
 b=Mu80miZDQrgX/qJjyKulRbCVl4Kp9yx26uo6IdUue6u8Og1+TNJnWsD3oDSUDkHgrSULjD
 Wx18DRQYY0X3/62iZOObXjiZ9cN8ihoTgeCuDtONX+wcNfCt/XeyORqybJ+qztWuZdpYIz
 HuU6kDwCdqCSsjrTkSvE7i7g6FcfVpc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-tfkJYuDmPFeww8BbWEkJGQ-1; Tue, 10 Jan 2023 03:49:50 -0500
X-MC-Unique: tfkJYuDmPFeww8BbWEkJGQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso7263072ejb.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+3zdaZdNFTeczIJd07e3iWgeA2mI+VXU0S7q8VlSEaI=;
 b=pKaYZX+W9uBPNBavQbMVX8aHhgksrVzuCWZUNN+pBlbBQWshm6mhMXQC/aDpRJYXq5
 /leFJlFh+DRqylEozArC3xAW5pYtfx/bnT1fBglK16hjr+uyrw2MTHUpOVEF1FF7hB7s
 C0S/F1fPxrgtGY8mpj8ON9tk7K+4x0PQkRsG+wn81jKF49NmU324KTZsDRzIkEMp/Wgp
 FdvrqvdK5tPV5A/8JDuuzkOMmgXLmkfX5zxMIUwKC6KGGDCz/l3nTE8Ld032KlKOoMkP
 UqbCrM9umWCKzDcPNW/A2vp13ZVQPpm/+fE7/poeP3Kg2c8Mo9TuJl3DhIu/Wgs3hInm
 mWzw==
X-Gm-Message-State: AFqh2koeLFl9IDwB1ukoU4am0S+AzinFPkdW2UNnhIYVss1zzrWoQw/L
 Fs7eCqm7cO0HRORqWXcEosVbXfuR55gXSN2NIfuQESumfS0WhbWhOju+c8MNf4ycwc/eUzdfMcE
 ljO5sFt2sO8RCNXLDTouN0HnNNxENb9NVG1nLD+4KPWIlukA9JFLXbz9o7E4Frv/avIA=
X-Received: by 2002:a17:906:2816:b0:7c0:d452:2e74 with SMTP id
 r22-20020a170906281600b007c0d4522e74mr58288002ejc.4.1673340588947; 
 Tue, 10 Jan 2023 00:49:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuB1KG+IaBRrnD+Ap/T9SVjj5Egrx6utyFps7myQFx+JkMZ3FKkisjjZOuwt7pboRnY80W0yw==
X-Received: by 2002:a17:906:2816:b0:7c0:d452:2e74 with SMTP id
 r22-20020a170906281600b007c0d4522e74mr58287988ejc.4.1673340588638; 
 Tue, 10 Jan 2023 00:49:48 -0800 (PST)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a170906292a00b00782fbb7f5f7sm4721392ejd.113.2023.01.10.00.49.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 00:49:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] remove unnecessary extern "C" blocks
Date: Tue, 10 Jan 2023 09:49:46 +0100
Message-Id: <20230110084946.299480-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

A handful of header files in QEMU are wrapped with extern "C" blocks.
These are not necessary: there are C++ source files anymore in QEMU,
and even where there were some, they did not include most of these
files anyway.

Remove them for consistency.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/disas/dis-asm.h   | 8 --------
 include/qemu/bswap.h      | 8 --------
 include/qemu/envlist.h    | 8 --------
 include/qemu/rcu.h        | 8 --------
 include/qemu/rcu_queue.h  | 8 --------
 include/qemu/uri.h        | 7 -------
 include/sysemu/os-posix.h | 8 --------
 include/sysemu/os-win32.h | 8 --------
 8 files changed, 63 deletions(-)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 64247ecb11f4..32cda9ef14c5 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -11,10 +11,6 @@
 
 #include "qemu/bswap.h"
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 typedef void *PTR;
 typedef uint64_t bfd_vma;
 typedef int64_t bfd_signed_vma;
@@ -506,8 +502,4 @@ static inline bfd_vma bfd_getb16(const bfd_byte *addr)
 
 typedef bool bfd_boolean;
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif /* DISAS_DIS_ASM_H */
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 346d05f2aab3..eb8923b1fe07 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -15,10 +15,6 @@
 #define BSWAP_FROM_FALLBACKS
 #endif /* ! CONFIG_MACHINE_BSWAP_H */
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 #ifdef BSWAP_FROM_BYTESWAP
 static inline uint16_t bswap16(uint16_t x)
 {
@@ -448,8 +444,4 @@ DO_STN_LDN_P(be)
 #undef le_bswaps
 #undef be_bswaps
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif /* BSWAP_H */
diff --git a/include/qemu/envlist.h b/include/qemu/envlist.h
index b9addcc11f7d..6006dfae44c3 100644
--- a/include/qemu/envlist.h
+++ b/include/qemu/envlist.h
@@ -1,10 +1,6 @@
 #ifndef ENVLIST_H
 #define ENVLIST_H
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 typedef struct envlist envlist_t;
 
 envlist_t *envlist_create(void);
@@ -15,8 +11,4 @@ int envlist_parse_set(envlist_t *, const char *);
 int envlist_parse_unset(envlist_t *, const char *);
 char **envlist_to_environ(const envlist_t *, size_t *);
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif /* ENVLIST_H */
diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index b063c6fde81d..313fc414bc2a 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -31,10 +31,6 @@
 #include "qemu/sys_membarrier.h"
 #include "qemu/coroutine-tls.h"
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 /*
  * Important !
  *
@@ -196,8 +192,4 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(RCUReadAuto, rcu_read_auto_unlock)
 void rcu_add_force_rcu_notifier(Notifier *n);
 void rcu_remove_force_rcu_notifier(Notifier *n);
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif /* QEMU_RCU_H */
diff --git a/include/qemu/rcu_queue.h b/include/qemu/rcu_queue.h
index 0e53ddd5305e..4e6298d47307 100644
--- a/include/qemu/rcu_queue.h
+++ b/include/qemu/rcu_queue.h
@@ -28,11 +28,6 @@
 #include "qemu/queue.h"
 #include "qemu/atomic.h"
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
-
 /*
  * List access methods.
  */
@@ -311,7 +306,4 @@ extern "C" {
          (var) && ((next) = qatomic_rcu_read(&(var)->field.sle_next), 1); \
          (var) = (next))
 
-#ifdef __cplusplus
-}
-#endif
 #endif /* QEMU_RCU_QUEUE_H */
diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index d201c61260de..db5218c39ec0 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -53,10 +53,6 @@
 #ifndef QEMU_URI_H
 #define QEMU_URI_H
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 /**
  * URI:
  *
@@ -105,7 +101,4 @@ struct QueryParams *query_params_new (int init_alloc);
 extern QueryParams *query_params_parse (const char *query);
 extern void query_params_free (QueryParams *ps);
 
-#ifdef __cplusplus
-}
-#endif
 #endif /* QEMU_URI_H */
diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 58de7c994d85..616d07790445 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -38,10 +38,6 @@
 #include <sys/sysmacros.h>
 #endif
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 int os_parse_cmd_args(int index, const char *optarg);
 void os_set_line_buffering(void);
 void os_setup_early_signal_handling(void);
@@ -96,8 +92,4 @@ static inline void qemu_funlockfile(FILE *f)
     funlockfile(f);
 }
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 5b38c7bd0451..ef3d1a1b181e 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -47,10 +47,6 @@ typedef struct sockaddr_un {
 #define SIO_AF_UNIX_GETPEERPID _WSAIOR(IOC_VENDOR, 256)
 #endif
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 #if defined(_WIN64)
 /* On w64, setjmp is implemented by _setjmp which needs a second parameter.
  * If this parameter is NULL, longjump does no stack unwinding.
@@ -221,8 +217,4 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags);
 ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
                            struct sockaddr *addr, socklen_t *addrlen);
 
-#ifdef __cplusplus
-}
-#endif
-
 #endif
-- 
2.38.1


