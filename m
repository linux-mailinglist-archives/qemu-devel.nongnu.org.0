Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A418664BBE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:59:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH67-0003Iu-Uc; Tue, 10 Jan 2023 11:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5Z-0002y8-2Q
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5X-00050M-Hp
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpagXfRHheB3cgO38uMf1S16+fdPzjO7pS5QWsjJ4sc=;
 b=LcwSPLW0sndpltK74laQR5s+pqIXKfMQBbXy8H/ovhafEKBnecA1+4fdN55rhRHz/o61hF
 DmATU10ANP6DKoBFR584U+m5VQmDqGj40TOHidtADKgs2lXIIupgq+p34EjUMVbV+923gD
 rXvDfZIsgO/7LGWj2blHKt1IX7Hb9HE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-541-hj3-imHCP1q39TWMYCDS1g-1; Tue, 10 Jan 2023 11:02:56 -0500
X-MC-Unique: hj3-imHCP1q39TWMYCDS1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so2672831wmj.8
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zpagXfRHheB3cgO38uMf1S16+fdPzjO7pS5QWsjJ4sc=;
 b=gzwSqScA7+D6dwxC+s6wwiFNgS0503ONYFeavDT+n1SIlL7dd5w1Xd3/UOkJSQFvN3
 viq1SuzEurowsJXfNfqvFm71z4u8jMoyDH9TJusHIyEggK5/CESIzMv9KQw2HIA63ZVW
 +9VMYjajsFwV/esRV+4bHk1itDRsRddn2m4TwJrpgWxYaWtc0vfUGPCDOKmHcNmPl1M+
 y/nhyAN+lffwqbRKffnkeTFPdODtNqA2soC1Nx3OcSOYpphS9mTuOIadU7WFgd5tbyNM
 Qnvf/RhwbDbqum8o3rTFfnI+I8J72ixCxXq72CMFrz8I0KECo1uajAK0OF7oRVc3e1jl
 lc7A==
X-Gm-Message-State: AFqh2krDTbO3fOKDPm61OjTjmp2MVHV7wKZ4XUbna3VrTCizV6VEWil7
 VrY1F0S8R4StuEei5cD41kRkYRr10e8UkwwmJ6JsqB25Iffb+pp2FhTnaW1dnRXbphSiIeVbjye
 TR/vcOn8EgSY5Zjrmx0DQZiWZ/0ZBVl+W9BKRo4VrY7rHur/Gf+uUy/pyVy0qxeuTRhw=
X-Received: by 2002:a5d:6447:0:b0:2bb:9f31:3568 with SMTP id
 d7-20020a5d6447000000b002bb9f313568mr7323125wrw.69.1673366574636; 
 Tue, 10 Jan 2023 08:02:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsKigboLcZOoFGRUkDA8RLUBsG6rk/MfLayqwV0Z1deWd+6zX3T0eJP4AuG+F8fLO1fhx5Dyw==
X-Received: by 2002:a5d:6447:0:b0:2bb:9f31:3568 with SMTP id
 d7-20020a5d6447000000b002bb9f313568mr7323094wrw.69.1673366574061; 
 Tue, 10 Jan 2023 08:02:54 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d404a000000b00275970a85f4sm11457740wrp.74.2023.01.10.08.02.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:02:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/29] chardev: clean up chardev-parallel.c
Date: Tue, 10 Jan 2023 17:02:11 +0100
Message-Id: <20230110160233.339771-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
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
index 664f77b8879a..789b50056ae4 100644
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
+  chardev_ss.add(files('char-parallel.c'))
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


