Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF79A6040E8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:28:40 +0200 (CEST)
Received: from localhost ([::1]:51132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol6JU-00055q-30
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol6Bm-0005Lm-Vn
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:20:44 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol6BX-0001eN-SS
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:20:42 -0400
Received: by mail-pl1-x62e.google.com with SMTP id l4so16666152plb.8
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2RsuK/FA5n9JyAC7qgdJyab94SYLZOr92ElbU7zW+U=;
 b=LwDCFLy6Zp+D8M30YhevcJxmww7Gh9Szt7s7rkk+6SasVLs86ZfVq6hw2y91xQEy+x
 giWaqzqb0LymgaTHg8uxkrB5WkhliuldgM3WOGNMZIDBIaMy9P7TrvpP/pQbhxf2FiZ0
 C+fhxj5wzoxDnUGKII99kmDdNXWQPJQ4W8HAF1+AwfHw/zWcM3SAAYJdPKpdIf+gObQ3
 LUmkeNLTr9/NY2FjmyReWVPtS9nJLi/3OMSojzIc4v/gVoon6ogc1H5DoHS/jA0x6tsM
 t/n4/fHFPFzna7Wq992NhjtYf7U5F/8IWe8VQjtnLX25VrYAeFp3MSNqal3MZWXNe3Mn
 49YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u2RsuK/FA5n9JyAC7qgdJyab94SYLZOr92ElbU7zW+U=;
 b=3SvLOi63uA7ajPRqzn9Gfm/uwmtxA75QI79ncEIwiBbRfJcFkK0QqNAh1AQMl/bJlM
 8T3dUFqFQRqAWbSDceXdfSVuKfpvQ6Mkeuec0kZcT9Qlg1Vr2HQKRTGF7TooGA2m58gD
 t0PS0o+O+iUnFchoavhEBRiqOfSnXpi/2RWBRXWAHLsgDev/vfqdO1K/FVPgxRIzxm2G
 hMJT7MQsVCCf5CNLOLwZFCOqfBAf5xiBUQg9e8gCPKFnA4SfuxgXVbqeJTJOnIwgVbZA
 +nNqfqj1QRxcMWTr6/7wTWgUoDN7uOOzxMwMvZGMVytWpEs9zNeVFsaNdb6mR0jcNjMk
 pSww==
X-Gm-Message-State: ACrzQf0Y2AVG/rCq1R4/dUBLTvwfjM+Oie0gOm7RiNbXIRJTWqCXkxwM
 Q96rQfeEavkGDw8g2M8Pos2YUASDQJpbaQ==
X-Google-Smtp-Source: AMsMyM6caV6Py2BtOxeV3zj0BFBF+C3AhdRTmh9WDYmjunQtTiQ87zCJnekUMEmS51ZwwKuvN/jbww==
X-Received: by 2002:a17:902:e945:b0:179:ce23:dd4d with SMTP id
 b5-20020a170902e94500b00179ce23dd4dmr7552933pll.68.1666174826161; 
 Wed, 19 Oct 2022 03:20:26 -0700 (PDT)
Received: from ubuntu.. ([65.20.73.185]) by smtp.gmail.com with ESMTPSA id
 u18-20020a170902e5d200b0017f9db0236asm10543879plf.82.2022.10.19.03.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 03:20:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 2/3] util/main-loop: Avoid adding the same HANDLE twice
Date: Wed, 19 Oct 2022 18:20:14 +0800
Message-Id: <20221019102015.2441622-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019102015.2441622-1-bmeng.cn@gmail.com>
References: <20221019102015.2441622-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fix the logic in qemu_add_wait_object() to avoid adding the same
HANDLE twice, as the behavior is undefined when passing an array
that contains same HANDLEs to WaitForMultipleObjects() API.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v3)

Changes in v3:
- new patch: avoid adding the same HANDLE twice

 include/qemu/main-loop.h |  2 ++
 util/main-loop.c         | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index aac707d073..3c9a9a982d 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -157,6 +157,8 @@ typedef void WaitObjectFunc(void *opaque);
  * in the main loop's calls to WaitForMultipleObjects.  When the handle
  * is in a signaled state, QEMU will call @func.
  *
+ * If the same HANDLE is added twice, this function returns -1.
+ *
  * @handle: The Windows handle to be observed.
  * @func: A function to be called when @handle is in a signaled state.
  * @opaque: A pointer-size value that is passed to @func.
diff --git a/util/main-loop.c b/util/main-loop.c
index de38876064..10fa74c6e3 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -373,10 +373,20 @@ static WaitObjects wait_objects = {0};
 
 int qemu_add_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
 {
+    int i;
     WaitObjects *w = &wait_objects;
+
     if (w->num >= MAXIMUM_WAIT_OBJECTS) {
         return -1;
     }
+
+    for (i = 0; i < w->num; i++) {
+        /* check if the same handle is added twice */
+        if (w->events[i] == handle) {
+            return -1;
+        }
+    }
+
     w->events[w->num] = handle;
     w->func[w->num] = func;
     w->opaque[w->num] = opaque;
-- 
2.34.1


