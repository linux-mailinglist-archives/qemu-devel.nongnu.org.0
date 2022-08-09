Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97C358DC59
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:45:07 +0200 (CEST)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSLq-0001wP-PO
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLSK8-0007S4-Fh
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:43:20 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLSK5-0006bQ-OZ
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 12:43:19 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so11410832pjm.3
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=2QLlX9RX/cSrGJAJe1RXGf+VhriXF6uPxDi06LasPNc=;
 b=hjt3Wd7osu+dQ2APVgmIjm+Hqeu8E8gesI9FHhs+y5S3Wp3QmUwuusv2xXJMuM5HlL
 1i27cpbP2X2VlsnWTG8w4qeOGxLok6dJ3SRxq8L4qZlPy8gSdcgbo/sVCJGjML2VOGmV
 xDaVBKbD6fLtMgVQlFbthjvi09F/SFhVG5x8i+gJqiIxMW6cIgkLjNxJo4iduB9XS/W9
 faRupbinOy8Abi2RCcqh5HSIViW4Uhv2u8Qc9n/gvcNO48l9rm3j/1F8VuUOaTV2IIkp
 AJhMUdkREkiRE16Ai90Hr+LlVcJ+F/jV9YzlCPbE5gALKjoyTZqkEjWqSth+txJRWqsW
 XGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=2QLlX9RX/cSrGJAJe1RXGf+VhriXF6uPxDi06LasPNc=;
 b=vLKIyvqb4K8MWvktbL+2urTH7rOY9Vyct+uTRxE9dCORCZvmoD+62Yfl+Ea03EX66/
 h+1AowVUMbBVWDJ1WBxCgosHiJ0CDSguFDQ+xgTQin5JOfbOrfV0Tn+YHBRFEyoJ30gO
 I4d2t3q8vD4G1lWOPLkr7WVp5IJTEbRJ4jAQKoFvP+i1Gk30dzxe3fsvNIc+k46vMxCo
 Z9/iw4nSxAFoxieVxudWvUpCKRjn67uHBSpW3d7uHI24d7MS5lPGVefclGl7RDdi3ONv
 MtOEbqOz47zGyaX01+fzPDj4nZ71P5edwTI2QhqKN+265bR4nJYepUU6UAeFrFILYNa+
 k7Qw==
X-Gm-Message-State: ACgBeo0ApX8bSiF7v1c/Ht0+D1iq3I69E75kFaEFbE56ntzH40t5oaLt
 9N12OK7ogRjGNFJr2DKwEROkYv/GN8w=
X-Google-Smtp-Source: AA6agR5jg/JLsAHZB28joyn8YKm0+8aRErWKVehCu/XCGei27P58KpGeMVHq4wlrbknrXjzX6ATkdg==
X-Received: by 2002:a17:903:1c8:b0:171:2ed3:6780 with SMTP id
 e8-20020a17090301c800b001712ed36780mr1059531plh.30.1660063392887; 
 Tue, 09 Aug 2022 09:43:12 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 cp17-20020a17090afb9100b001f207d1860fsm10224143pjb.45.2022.08.09.09.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:43:12 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 1/2] util/main-loop: Fix maximum number of wait objects for
 win32
Date: Wed, 10 Aug 2022 00:43:07 +0800
Message-Id: <20220809164308.1182645-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

The maximum number of wait objects for win32 should be
MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.

Fix the logic in qemu_add_wait_object() to avoid adding
the same HANDLE twice.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- fix the logic in qemu_add_wait_object() to avoid adding
  the same HANDLE twice

 util/main-loop.c | 43 +++++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/util/main-loop.c b/util/main-loop.c
index f00a25451b..66b2ae2800 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -363,37 +363,56 @@ void qemu_del_polling_cb(PollingFunc *func, void *opaque)
 /* Wait objects support */
 typedef struct WaitObjects {
     int num;
-    int revents[MAXIMUM_WAIT_OBJECTS + 1];
-    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
-    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
-    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
+    int revents[MAXIMUM_WAIT_OBJECTS];
+    HANDLE events[MAXIMUM_WAIT_OBJECTS];
+    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
+    void *opaque[MAXIMUM_WAIT_OBJECTS];
 } WaitObjects;
 
 static WaitObjects wait_objects = {0};
 
 int qemu_add_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
 {
+    int i;
+    bool found = false;
     WaitObjects *w = &wait_objects;
+
     if (w->num >= MAXIMUM_WAIT_OBJECTS) {
         return -1;
     }
-    w->events[w->num] = handle;
-    w->func[w->num] = func;
-    w->opaque[w->num] = opaque;
-    w->revents[w->num] = 0;
-    w->num++;
+
+    for (i = 0; i < w->num; i++) {
+        /* if the same handle is added twice, newer overwrites older */
+        if (w->events[i] == handle) {
+            found = true;
+            break;
+        }
+    }
+
+    w->events[i] = handle;
+    w->func[i] = func;
+    w->opaque[i] = opaque;
+    w->revents[i] = 0;
+
+    if (!found) {
+        w->num++;
+    }
+
     return 0;
 }
 
 void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
 {
-    int i, found;
+    int i;
+    bool found = false;
     WaitObjects *w = &wait_objects;
 
-    found = 0;
     for (i = 0; i < w->num; i++) {
         if (w->events[i] == handle) {
-            found = 1;
+            found = true;
+        }
+        if (i == MAXIMUM_WAIT_OBJECTS - 1) {
+            break;
         }
         if (found) {
             w->events[i] = w->events[i + 1];
-- 
2.34.1


