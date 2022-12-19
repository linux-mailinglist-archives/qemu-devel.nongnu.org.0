Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8477265093F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:19:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7CHE-00072o-VK; Mon, 19 Dec 2022 04:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p7CHD-00072d-5k
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:17:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p7CHA-0004vL-Vp
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671441455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oW2z9PDb9P+CdOBRzz18yiXe8IKELEen4ep6VnGXwqg=;
 b=Ut0mPegP49ivJ2achIXcaQ74YLadnSVYJhHXed7X1z8gs57Kt9SmcRWQ1vPnikGz+SVnKr
 bKQUxOPSqiyLYp+fbuRHT1DbvFds+S72YjhGSgw9w4YPNT91wlrPuvBkDLFXG0uqUQuk/F
 8fgiuYWUI0bAK4ACryIY9OgIgCvMfuA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-roUPNEJ5NWaafUnLB49slw-1; Mon, 19 Dec 2022 04:17:34 -0500
X-MC-Unique: roUPNEJ5NWaafUnLB49slw-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb19-20020a1709076d9300b007c17017bb51so5764285ejc.21
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oW2z9PDb9P+CdOBRzz18yiXe8IKELEen4ep6VnGXwqg=;
 b=D2l8eUOD0j1aV7H4IDIuxUqiFO1uAZUgSi/i9YiI0fwlq9mq1i6BEDFRiL2oG3WboQ
 Voy55oOCwpeNrJIvftV2PdVAhJlcsZX5+3fxZgVaNOxTlC5hBU4WA9wAXQj8RGGCBR3o
 5+Iek8cU0J6PgpDYIlypi9dGDBPhsFaZsCxc/FPSaylZsh8SDWuXNmu3JYgJGCyWKpuR
 P+ZOVIJzWeeYOufZu34x+OnVyhOFOiq/y4LuFfr3qz+TuolucbH6OpTG128sqWG1wxQs
 DVmPfHtZ1iorEXtuLdGy+2zc0BeA1ApCP+M95XsKDvNOEA8+r+xbCzDBlUjwOo0Z4dfX
 /lSg==
X-Gm-Message-State: AFqh2kr+vnoAlHFp14ZcpwfIyIAkCErPmm0/eOgoC/tImqft1zIIuP4X
 UugLMO+m5I8QriO99VDBbIx0FhlbylOV5DPQemAVAOtwvx/swJfjb3VDoRdB53Z9WhEScVIug7V
 KGBTcFCcpLnbPaitDcDkHBk/T0WvYcAyEIgMEdLbyWz/Bhm4Heiq6cJiwrsyjnPpEOVM=
X-Received: by 2002:a17:907:7244:b0:82d:1d5f:2617 with SMTP id
 ds4-20020a170907724400b0082d1d5f2617mr1188810ejc.69.1671441452725; 
 Mon, 19 Dec 2022 01:17:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtlrDuKGU60CUxo8yGFvKXwAb7m8SS6pqgbzNctOC12e+SkIFRs1UdOIF885gVIBKNPVzhGmQ==
X-Received: by 2002:a17:907:7244:b0:82d:1d5f:2617 with SMTP id
 ds4-20020a170907724400b0082d1d5f2617mr1188795ejc.69.1671441452444; 
 Mon, 19 Dec 2022 01:17:32 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 d30-20020a056402401e00b0046b25b93451sm4048274eda.85.2022.12.19.01.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 01:17:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@redhat.com
Subject: [PATCH] chardev: clean up chardev-parallel.c
Date: Mon, 19 Dec 2022 10:17:29 +0100
Message-Id: <20221219091729.690645-1-pbonzini@redhat.com>
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

Replace HAVE_CHARDEV_PARPORT with a Meson conditional, remove unnecessary
defines, and close the file descriptor on FreeBSD/DragonFly.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char-parallel.c | 15 ++-------------
 chardev/meson.build     |  5 ++++-
 include/qemu/osdep.h    |  5 -----
 3 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index 05e7efbd6ca9..a5164f975af3 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -238,7 +238,6 @@ static void qemu_chr_open_pp_fd(Chardev *chr,
 }
 #endif
 
-#ifdef HAVE_CHARDEV_PARPORT
 static void qmp_chardev_open_parallel(Chardev *chr,
                                       ChardevBackend *backend,
                                       bool *be_opened,
@@ -276,29 +275,21 @@ static void char_parallel_class_init(ObjectClass *oc, void *data)
 
     cc->parse = qemu_chr_parse_parallel;
     cc->open = qmp_chardev_open_parallel;
-#if defined(__linux__)
     cc->chr_ioctl = pp_ioctl;
-#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || \
-    defined(__DragonFly__)
-    cc->chr_ioctl = pp_ioctl;
-#endif
 }
 
 static void char_parallel_finalize(Object *obj)
 {
-#if defined(__linux__)
     Chardev *chr = CHARDEV(obj);
     ParallelChardev *drv = PARALLEL_CHARDEV(chr);
     int fd = drv->fd;
 
+#if defined(__linux__)
     pp_hw_mode(drv, IEEE1284_MODE_COMPAT);
     ioctl(fd, PPRELEASE);
+#endif
     close(fd);
     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
-#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || \
-    defined(__DragonFly__)
-    /* FIXME: close fd? */
-#endif
 }
 
 static const TypeInfo char_parallel_type_info = {
@@ -315,5 +306,3 @@ static void register_types(void)
 }
 
 type_init(register_types);
-
-#endif
diff --git a/chardev/meson.build b/chardev/meson.build
index 664f77b8879a..ceedb68d4f95 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -14,9 +14,12 @@ chardev_ss.add(files(
 ))
 chardev_ss.add(when: 'CONFIG_POSIX', if_true: [files(
   'char-fd.c',
-  'char-parallel.c',
   'char-pty.c',
 ), util])
+if targetos in ['linux', 'gnu/kfreebsd', 'freebsd', 'dragonfly']
+  'char-parallel.c',
+endif
+
 chardev_ss.add(when: 'CONFIG_WIN32', if_true: files(
   'char-console.c',
   'char-win-stdio.c',
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b9c4307779c5..4886361be6a7 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -421,11 +421,6 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 #define HAVE_CHARDEV_SERIAL 1
 #endif
 
-#if defined(__linux__) || defined(__FreeBSD__) ||               \
-    defined(__FreeBSD_kernel__) || defined(__DragonFly__)
-#define HAVE_CHARDEV_PARPORT 1
-#endif
-
 #if defined(__HAIKU__)
 #define SIGIO SIGPOLL
 #endif
-- 
2.38.1


