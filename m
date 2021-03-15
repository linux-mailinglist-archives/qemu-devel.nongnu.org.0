Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985F733B083
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:00:35 +0100 (CET)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkxd-0001Y0-7I
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLkvv-0000Gz-D7
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:58:47 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLkvt-00036M-2g
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:58:47 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso19988419wmq.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vOl85i3gsnl4nScUKWxpWtvzRuoZf1YV+64Qg7MEYQw=;
 b=Pc0OIAnyVK410jgjFMy2YFQt/I0kvE1tE8AVR2He1l/8Gzor2NUz/qe5R0zS8RiLQq
 +6s2udBLtCymgNpobqwSMR7CJ92yuz9Ew+IrBhaTUqSxT1tVgldvwHFePku6YiFRlcgE
 +9DOcP4vwvLBQwRoyasYZTf1jIOTIoMrhEcHRNd+KU6JOU82i3FK0f0tMsAJdYuNODSy
 ON02De7+JXlFd19Fe8WX/10yKZnVVjrJaYDW5v1StcSj3xwldtselS5NwzIomKSNXdYs
 UPIUwmgcy5Bb/vv8a4qDkiJPHMMV8z+0t1kQW6I+KZu4pgpAXqO1SA3MceQ7FnESRoGq
 GiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vOl85i3gsnl4nScUKWxpWtvzRuoZf1YV+64Qg7MEYQw=;
 b=D+oAnikfiLaACJXzE0eMZYa2UiCJe4J9QIvxjgxcXQqypUZS1M4lVDpjEa4jpHwm1l
 LBzagaNyltDJS6ezVDsDzJlh97yTxm+0lrUD31rUop4GxU34Nf2kK4CByWwC9v1Ys/SP
 dpqYXELQEe1KaHzUgNKrciP0ilAHcGuFw2sUjijA+M9WnclBMhWILFLK3vqQ+3iZEMx0
 I7zSb6IKKaw5TW/05bU+rgWybeTDQFZOLljIsi4BpNHAN8AK6Noleavtww8oFx8bKv7e
 U0G+hUAxNBloL9giC+y1su/1CErM0Gsb9ngobQQqYZ0X6syhhm2hkREWkUFR1JfwJ9iB
 KXKQ==
X-Gm-Message-State: AOAM530PxUxTpxxPmQpzagwevLuflpeKKJkw0WvP8hdGlrk99dv9VBxr
 CFyzIw7cISrI5lakk0Juf9xECRmvG2c=
X-Google-Smtp-Source: ABdhPJzCBRgyi3lu+XMQaZPLC/Yg1lhKTv5zUv8XxohKQxKym/mR7YQtcxS4vrz43XaU2FsYRJyFiA==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr25651455wmh.111.1615805923592; 
 Mon, 15 Mar 2021 03:58:43 -0700 (PDT)
Received: from localhost.localdomain ([197.61.219.7])
 by smtp.googlemail.com with ESMTPSA id r11sm18538747wrm.26.2021.03.15.03.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 03:58:43 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] util/compatfd.c: Replaced a malloc call with g_malloc.
Date: Mon, 15 Mar 2021 12:58:14 +0200
Message-Id: <20210315105814.5188-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315105814.5188-1-ma.mandourr@gmail.com>
References: <20210315105814.5188-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced a call to malloc() and its respective call to free()
with g_malloc() and g_free().

g_malloc() is preferred more than g_try_* functions, which
return NULL on error, when the size of the requested
allocation  is small. This is because allocating few
bytes should not be a problem in a healthy system.
Otherwise, the system is already in a critical state.

Subsequently, removed NULL-checking after g_malloc().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 util/compatfd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/util/compatfd.c b/util/compatfd.c
index 174f394533..a8ec525c6c 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -72,14 +72,10 @@ static int qemu_signalfd_compat(const sigset_t *mask)
     QemuThread thread;
     int fds[2];
 
-    info = malloc(sizeof(*info));
-    if (info == NULL) {
-        errno = ENOMEM;
-        return -1;
-    }
+    info = g_malloc(sizeof(*info));
 
     if (pipe(fds) == -1) {
-        free(info);
+        g_free(info);
         return -1;
     }
 
-- 
2.25.1


