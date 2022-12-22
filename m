Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95671653CA1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 08:40:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8G9x-0003n1-1n; Thu, 22 Dec 2022 02:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8G9j-0003md-J1
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:38:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8G9g-0000TL-QX
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671694695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oW2z9PDb9P+CdOBRzz18yiXe8IKELEen4ep6VnGXwqg=;
 b=SXsy3TkkuIuObwyyISdIbkpWkF2G3aIUChx45k7T+NZHWvllTcJrE9oqTia2WV8Sdoh9Y2
 +fKlydIw4gVwqHhf9qM9+88cOuvxwpYmSqHB7dKCx0V7cUhCobVviiXwsBxD31EofrawNQ
 KfeTJbdRPwwc9Qz/jy9Az51bP+hDu24=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-vWlLBliXMiWqvR_AFWdriw-1; Thu, 22 Dec 2022 02:38:06 -0500
X-MC-Unique: vWlLBliXMiWqvR_AFWdriw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hd17-20020a170907969100b007c117851c81so892365ejc.10
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 23:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oW2z9PDb9P+CdOBRzz18yiXe8IKELEen4ep6VnGXwqg=;
 b=4O1/CiFw7smbrGfn1REPCIVfB/UAb0tSMyMfLBh5xyUsDYEElpt6Eju3W2KddSBAdX
 2D7J8urKxESErrenQMJFIVdH2KgIV/gQ5SV5yVfYZQ5ar1JcDXECtNAgdSsYlA49wNnM
 HmiyNTf5kiS7rgNmyRT+DtXrH7eNDB4n1UqSpBlZBoVQZj2EuG5dE92KtdLSysQVqQXK
 ZlSsa7vN9ELYwhqo8o9cpF3Xv9r2gx9DB11pfXDVj4pkZhKlBAApjOzhJHYXSfPwF+6f
 UG7iX1m1cbjy8gpPyDHuZakcN6bMy3cvxaLLEklonM5HiMAe9Cey/3mzjSFeFmN3ivrF
 wfQA==
X-Gm-Message-State: AFqh2kqCgcKMwf4JBlSZJhBNpU9AeffkxpSEFtteV0ec42o06jn7kBye
 W17L9TuCQFMFmCCS6/gsKy2qg4DgGx4622pnPJlteoYMbRZGVKjho6SB7LYXQo6LHLL1u6G5NWa
 C9ilVroWq0E/xKe5oFrWVyFSQvEbrq0apB05tAZYrcxN2K9h/mwm0N9fVKqn1ELdAOg0=
X-Received: by 2002:a17:906:354c:b0:7c0:e988:4157 with SMTP id
 s12-20020a170906354c00b007c0e9884157mr3537307eja.40.1671694684555; 
 Wed, 21 Dec 2022 23:38:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtv3oExnx6LK2SoyutUw/mC/Yr3VndcZVX8H8wle87FlQoc73YDvTmNaNYyFKZwYPTK6J8/LA==
X-Received: by 2002:a17:906:354c:b0:7c0:e988:4157 with SMTP id
 s12-20020a170906354c00b007c0e9884157mr3537293eja.40.1671694684279; 
 Wed, 21 Dec 2022 23:38:04 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a17090646d400b007838e332d78sm7996175ejs.128.2022.12.21.23.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 23:38:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH] chardev: clean up chardev-parallel.c
Date: Thu, 22 Dec 2022 08:38:00 +0100
Message-Id: <20221222073800.856970-1-pbonzini@redhat.com>
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


