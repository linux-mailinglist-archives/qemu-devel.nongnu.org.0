Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76816655A76
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 16:19:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p96IA-00057K-Nv; Sat, 24 Dec 2022 10:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96I8-00056Q-6D
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:28 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p96I6-00014M-Ju
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 10:18:27 -0500
Received: by mail-pg1-x531.google.com with SMTP id h192so110570pgc.7
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 07:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XUu9359dynbQsE7pTFU+n7TagGz84N6z5eJx4KKYfOM=;
 b=p90cuqayz2D8C1fde3coYBN3FrySuRK9VpuL+CBMNb72WE1BoE3ruW5XhKmV9Rt6Be
 5ThCYAOUclbmOGBL2keWz5dqIutOk4+XPBdvCBtW5Iqnd0VE8dRrhCUMxWms654eR72I
 Oy7E9Z7cKXEgqJ+06ZeWt/FrglAWGSk4uaqDXmgDmwAW+bo5W0mcN7FTupPMEVABlKm1
 19ywGbecDEXqXfUTJ4kj0S3i/AriHvD1O2eaq0aIFiyZogFDz8aAGdhxO6+TVVgn1ygM
 KHPrnh2adQJYEi7Vnp67CGjhY5T9/Prw+cc2d+Iq32dd8/N20SZjeQ605oysAlg7BxEv
 JFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XUu9359dynbQsE7pTFU+n7TagGz84N6z5eJx4KKYfOM=;
 b=K1vqAMzN8IjZs550P9M2QkkgX0TMNAKOenmevunP/G2K0QLdQgti2+/8HDLQEA0xRD
 1r50oVCkFfQf8kAqorY1SjWF5lGj1zY0oq0K+QIsAxl3VBWD5+O/+pzYeAxX1IT6kc6W
 QxpDffDdWtqT9UfHhhxymBviwb0atytm+64UbaiwpDWviKN+XfUr2/Sh6a2Wt3U0W8dM
 xxqO3BUnqR4BCMC7TKgeauB+C/m5Vexp4yef1CvhAkwvQrL5ORQZj5wBQVJLDZpMEPK9
 G0n8LzT37P1xIdpD5jy7itt6SNSuehB0d1tIkxp71YOpsP9hO6Rq/RSFj/pNMEmKthbj
 RnhA==
X-Gm-Message-State: AFqh2koVTeEN7Z8FOz/upbkh3nS1yKCxHriM03Lk9/5vWS8GgzI52Wbu
 78s9fwY9MF0VtLTlTL3Gv2y8RGWAl55VmjEX
X-Google-Smtp-Source: AMrXdXvAodledKn7IW9rm7IGdoAJ82Pb8gfKcm6mCWTKOCB1dLN+htPOE2kChXT/rWWO/UtTrMnhLA==
X-Received: by 2002:aa7:9143:0:b0:580:cfbd:3fd3 with SMTP id
 3-20020aa79143000000b00580cfbd3fd3mr4557291pfi.26.1671895105737; 
 Sat, 24 Dec 2022 07:18:25 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 t64-20020a625f43000000b005774f19b41csm4231124pfb.88.2022.12.24.07.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 07:18:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
Subject: [PATCH 3/4] accel/tcg: Handle false negative lookup in
 page_check_range
Date: Sat, 24 Dec 2022 07:18:20 -0800
Message-Id: <20221224151821.464455-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224151821.464455-1-richard.henderson@linaro.org>
References: <20221224151821.464455-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

As in page_get_flags, we need to try again with the mmap
lock held if we fail a page lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 2c5c10d2e6..c72a806203 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -525,6 +525,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
 int page_check_range(target_ulong start, target_ulong len, int flags)
 {
     target_ulong last;
+    int locked, ret;
 
     if (len == 0) {
         return 0;  /* trivial length */
@@ -535,42 +536,66 @@ int page_check_range(target_ulong start, target_ulong len, int flags)
         return -1; /* wrap around */
     }
 
+    locked = have_mmap_lock();
     while (true) {
         PageFlagsNode *p = pageflags_find(start, last);
         int missing;
 
         if (!p) {
-            return -1; /* entire region invalid */
+            if (!locked) {
+                /*
+                 * Lockless lookups have false negatives.
+                 * Retry with the lock held.
+                 */
+                mmap_lock();
+                locked = -1;
+                p = pageflags_find(start, last);
+            }
+            if (!p) {
+                ret = -1; /* entire region invalid */
+                break;
+            }
         }
         if (start < p->itree.start) {
-            return -1; /* initial bytes invalid */
+            ret = -1; /* initial bytes invalid */
+            break;
         }
 
         missing = flags & ~p->flags;
         if (missing & PAGE_READ) {
-            return -1; /* page not readable */
+            ret = -1; /* page not readable */
+            break;
         }
         if (missing & PAGE_WRITE) {
             if (!(p->flags & PAGE_WRITE_ORG)) {
-                return -1; /* page not writable */
+                ret = -1; /* page not writable */
+                break;
             }
             /* Asking about writable, but has been protected: undo. */
             if (!page_unprotect(start, 0)) {
-                return -1;
+                ret = -1;
+                break;
             }
             /* TODO: page_unprotect should take a range, not a single page. */
             if (last - start < TARGET_PAGE_SIZE) {
-                return 0; /* ok */
+                ret = 0; /* ok */
+                break;
             }
             start += TARGET_PAGE_SIZE;
             continue;
         }
 
         if (last <= p->itree.last) {
-            return 0; /* ok */
+            ret = 0; /* ok */
+            break;
         }
         start = p->itree.last + 1;
     }
+
+    if (locked < 0) {
+        mmap_unlock();
+    }
+    return ret;
 }
 
 void page_protect(tb_page_addr_t address)
-- 
2.34.1


