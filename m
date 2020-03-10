Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7619F1805B5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 19:00:15 +0100 (CET)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBjAs-00047s-Hx
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 14:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1jBjA6-0003fz-HK
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:59:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1jBjA5-0003pz-CD
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:59:26 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54451)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1jBjA5-0003nP-6a
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:59:25 -0400
Received: by mail-wm1-x343.google.com with SMTP id n8so2433398wmc.4
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 10:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xf0fbwrnoS7q4GYuxg7MyRF8yDH9ohH5cYbSWyDgGbw=;
 b=MqH+C20fRVK7WDL98cjaoasuoQRNlA8e+q7whqJCYXtB4xLceNlr3eKU6zBk4QZx6/
 nZQWGztgTZsScG7D0vGOzfhoprwx1qUQSi2/q2XPx7Ebwuy3qBmlQbqjqCafxLHhotQo
 ASuawTIat0NbXtLSLFqXJEGUKl+XgZLBiZFj9pRrYQX2gMhqpqQqIputNczSkC5ORDPh
 3UnC5kuS7s6XKWwgrnIlC3OVh82po+ziY5/LwJc2kFWHHMAcAQEqcZkIFl9qnMmLWmcg
 UZXMdc0qB5z1013lxmrdKJNXh4phl+R0NZvSIz2CIK4mIQxk7ygovFr/bFcDULQHGUMb
 jsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xf0fbwrnoS7q4GYuxg7MyRF8yDH9ohH5cYbSWyDgGbw=;
 b=npULp4sCWYXheegvX56TFg2S4J6L8Q0lV2R5yBsyIkDMhwURH9xAXj2roooysvs62g
 Gdr/1HJpsnA9xZWT8EvRGxOT7U/SGXIvVD4rTcKbYa4W9pgzOEHFpfRgT5jMyPHl8UnU
 eu65/5Ky+8cl9DVomxM0JsXSucQ0Di2VVP3N4BIalpM2wHEqaKoOFkgrEZEq9BYS8pBq
 yXj8XlfJgoKymRzcuUQPnYV452VfnO7l6sIeExUZKkxe+3U7T32tPk83akeILCgcbk+y
 y3Fbo7sDg4JhlkFWzkwAQQ6RRLmrQq5GbgKh0bD/DMkFsTa8B8uzRSSsPbUHRWUayVoh
 3YYA==
X-Gm-Message-State: ANhLgQ2s06pky+K3liz+RaP+Tti8Is6WmG2CjkydNi90qBM1183EXOCm
 66R1STsd3GeUOkZGqRPzNVyu42EE
X-Google-Smtp-Source: ADFU+vuxR+WYdPNgpfsuDIHIyxK3YdsE+UQME3iVCru80oRZBAHLTrbymvYGq0ooyoepFT1oqy2RCw==
X-Received: by 2002:a7b:c414:: with SMTP id k20mr1841756wmi.119.1583863163425; 
 Tue, 10 Mar 2020 10:59:23 -0700 (PDT)
Received: from donizetti.lan ([2001:b07:6468:f312:f1b5:9f9:3125:2a5a])
 by smtp.gmail.com with ESMTPSA id a7sm12082594wrn.25.2020.03.10.10.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 10:59:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] oslib-posix: initialize mutex and condition variable
Date: Tue, 10 Mar 2020 18:59:21 +0100
Message-Id: <20200310175921.501191-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 bauerchen <bauerchen@tencent.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mutex and condition variable were never initialized, causing
-mem-prealloc to abort with an assertion failure.

Fixes: 037fb5eb3941c80a2b7c36a843e47207ddb004d4
Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: bauerchen <bauerchen@tencent.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/oslib-posix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 897e8f3ba6..4dd6d7d4b4 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -466,10 +466,17 @@ static inline int get_memset_num_threads(int smp_cpus)
 static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
                             int smp_cpus)
 {
+    static gsize initialized = 0;
     size_t numpages_per_thread, leftover;
     char *addr = area;
     int i = 0;
 
+    if (g_once_init_enter(&initialized)) {
+        qemu_mutex_init(&page_mutex);
+        qemu_cond_init(&page_cond);
+        g_once_init_leave(&initialized, 1);
+    }
+
     memset_thread_failed = false;
     threads_created_flag = false;
     memset_num_threads = get_memset_num_threads(smp_cpus);
-- 
2.24.1


