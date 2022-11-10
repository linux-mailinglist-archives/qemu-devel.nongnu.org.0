Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA8623F7F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Su-00039x-62; Thu, 10 Nov 2022 05:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4Sn-000351-Qm
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:13 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4Sj-0006YG-Gn
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:11 -0500
Received: by mail-pg1-x529.google.com with SMTP id 6so1341730pgm.6
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djQvtbI+5ceah01/E9QXrKDRfdUAtdLN189JgwjzOBQ=;
 b=X7619O6+AdiYwxaT+Q0YWH3poE/y/5bmr5FbkZZd/9sZtKl7M659hX3aOJebhv1yTg
 H24CA6PMegkFkfvXIwXlHtTpNP8NvBiWrUgupsUQHROjhWIqwIKofkIvFdxZh70Blvb1
 YWiHSdSUYGoF3Bmy0h0ajrO4vFrCoaA2KdAj4GWdhiiv8UUmjE74DZ1D59Ky1DnOEZ1L
 jmoBy5AgGa5mu5ZXXi1UuIDb2Cb6zoLaaR7c8O+dJxsb1uBqRnr6Ov+oWigM6Gy9o7wV
 AEV7MG1l1f0FyGRkWf1XFzlpaUhwZ1c9fW4z83U9B8MGTHOIahkADiJBqA19/WsUn2sT
 3/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djQvtbI+5ceah01/E9QXrKDRfdUAtdLN189JgwjzOBQ=;
 b=3/1OKOKD1K2Kii/BLNSqy8V4+7DyjUywEzvJ3E2B5JV+ZGSyXWY1piNZJI94S4J4CL
 eQ7csYwJaKXAXWeTFH0JLzFOgqCLcFu0JRSZC1xFarnlrWcKpK60NRs+1ZqpMTj0PuXd
 Mhckg0h8F33FzMU5wP3TGpYP9MnwRWhw8j8Lm2deJQAFjdP3lmd8hOEDiS6AgUDEz3aX
 9FXHPTcVQf5y0awU1HiEGa31i9dnYTDF+luxW8k81yarQGihxDPD4p2mz8wj4EoazQfu
 1tyD5bt5BfrUH4I5M1bQO5xQ2RM0QoZfY63dFPyyK+egN+/G7hLCu4B7ZKs8+vp3pmhO
 wS4g==
X-Gm-Message-State: ACrzQf3ZrvTSCGajQEQsDkOf6JhMZxMrotz3NDchqZ5oid1H3/YOlo4g
 M7hAmhOh5CmWrhjyYZgqkOKU+QTe5Ox1X/yC
X-Google-Smtp-Source: AMsMyM6mFNpylu2jXfj/RIX/HLoFNk0MpSwVAUx3FMHlQBea78m2DuOoZgFBAIuh9EGaVelUE23IgQ==
X-Received: by 2002:a05:6a00:420f:b0:56d:a89e:19e2 with SMTP id
 cd15-20020a056a00420f00b0056da89e19e2mr50249716pfb.85.1668074827944; 
 Thu, 10 Nov 2022 02:07:07 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:07:07 -0800 (PST)
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
Subject: [PATCH v2 09/10] util: Remove qemu_get_local_state_dir()
Date: Thu, 10 Nov 2022 19:06:28 +0900
Message-Id: <20221110100629.61496-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


