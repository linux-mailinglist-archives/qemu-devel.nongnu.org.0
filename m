Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A461C3AB126
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:16:47 +0200 (CEST)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltp4o-0001cR-Od
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNc-0003Dx-IC
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:08 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNa-0006Pa-SX
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:08 -0400
Received: by mail-ed1-x52b.google.com with SMTP id b11so3068468edy.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y56nUWEYX1Cg83SkEbZbhuCRN/h8u6OlN8CrNOsG72o=;
 b=M8dceNHHdIEU8fVkaSXqQyVKz/ejMeXciudm5NGt71cDEcd3RKPgahB+nnDDxQ/bdi
 1NwZdWINQGN7uwzhja22qCJWZu/Rv3qos9zTZzbeljeahkbYiwNpNO1Q49H5Jo0HvcJZ
 soaoKsiLAUp+sqae9raoCkjiCRFSTA226D+crEHdFgvijhTKl2eqwThVAiL6hfBQ0Tu6
 MGtGZ/iC4lwInKI2Com9u6LVVzbNxYLG5M7hUl5unHSVS+GFvY//IgCvyqy6GcVlIAmp
 KXy7IBHrxwpfhcJ3gDEDaDtLQn1LvPVGyYuLe7nxa4uH3UvaehLTcdTGiIvvoxkdp2zI
 RFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y56nUWEYX1Cg83SkEbZbhuCRN/h8u6OlN8CrNOsG72o=;
 b=WMspPYx+A5ifoipTig2C1OlZesR/OOp1Qa+h9v/MHL7kBeqK75C81mBsXiE/OL1WdD
 HBUn7i6u2B/IwbJ+0QmL3z9wSGqG2QOBjUrsRYU0hW0jT5Vp55cmAis8q3oUe+WdqqP6
 l3eBmGO8rtdzG1oYx/KY7w5Hlm5PhAGuZutt9xYGLgDWXR7BlF2u++Wsn1uAh6Z3llpb
 iKKJ+iF/2DWHgEjsylOjAvkAQXvHmDe7yiwM6mLr9BEzjMf/6OTNN3pyiSBmNsaOvwNv
 ebvegZJmSz7bRJk/i28eFWXqc4dSSqFJ65xeR4TlGzGXkj627yjFD0EEX+DzkXgFVRL3
 K9lQ==
X-Gm-Message-State: AOAM530DofGsDtl9xka5F2RHxRehsRO7TKX7K1HymBfhvpHNBR41HX3+
 qd3GoHebT4vcqbk+uZf33GC6laKupzI=
X-Google-Smtp-Source: ABdhPJwpa0pPg9VSiqdaQ4IFb0Uic1JUoNptwBhcu2TryPaqXCOPAi88KmO5jxM8eQVySHBlmVKX5Q==
X-Received: by 2002:a05:6402:35cc:: with SMTP id
 z12mr5298937edc.45.1623922325530; 
 Thu, 17 Jun 2021 02:32:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/45] util: Pass file+line to qemu_rec_mutex_unlock_impl
Date: Thu, 17 Jun 2021 11:31:30 +0200
Message-Id: <20210617093134.900014-42-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create macros for file+line expansion in qemu_rec_mutex_unlock
like we have for qemu_mutex_unlock.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210614233143.1221879-5-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/thread.h    | 10 +++++++++-
 util/qemu-thread-posix.c |  4 ++--
 util/qemu-thread-win32.c |  2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 2c0d85f3bc..460568d67d 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -32,7 +32,7 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex);
 void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
 void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
 int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line);
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line);
 
 typedef void (*QemuMutexLockFunc)(QemuMutex *m, const char *f, int l);
 typedef int (*QemuMutexTrylockFunc)(QemuMutex *m, const char *f, int l);
@@ -110,6 +110,9 @@ extern QemuCondTimedWaitFunc qemu_cond_timedwait_func;
 #define qemu_mutex_unlock(mutex) \
         qemu_mutex_unlock_impl(mutex, __FILE__, __LINE__)
 
+#define qemu_rec_mutex_unlock(mutex) \
+        qemu_rec_mutex_unlock_impl(mutex, __FILE__, __LINE__)
+
 static inline void (qemu_mutex_lock)(QemuMutex *mutex)
 {
     qemu_mutex_lock(mutex);
@@ -135,6 +138,11 @@ static inline int (qemu_rec_mutex_trylock)(QemuRecMutex *mutex)
     return qemu_rec_mutex_trylock(mutex);
 }
 
+static inline void (qemu_rec_mutex_unlock)(QemuRecMutex *mutex)
+{
+    qemu_rec_mutex_unlock(mutex);
+}
+
 void qemu_cond_init(QemuCond *cond);
 void qemu_cond_destroy(QemuCond *cond);
 
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 8e2b6653f5..d990826ed8 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -139,9 +139,9 @@ int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
     return qemu_mutex_trylock_impl(mutex, file, line);
 }
 
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    qemu_mutex_unlock(mutex);
+    qemu_mutex_unlock_impl(mutex, file, line);
 }
 
 void qemu_cond_init(QemuCond *cond)
diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index cb5aa2018c..52eb19f351 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -105,7 +105,7 @@ int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
     return !TryEnterCriticalSection(&mutex->lock);
 }
 
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
     assert(mutex->initialized);
     LeaveCriticalSection(&mutex->lock);
-- 
2.31.1



