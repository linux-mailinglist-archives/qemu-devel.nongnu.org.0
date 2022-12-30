Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E72B6593BB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2ud-0006Wx-LI; Thu, 29 Dec 2022 19:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2ua-0006Tj-2v
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:12 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uV-0004Fp-Ic
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:09 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 7so13303081pga.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1Ju+9+IeyZLpzQCrZ1HI6GENt77SWKubB60iolMVS0=;
 b=PBWdT0puCg8Jw98REanM7U2YOsxgjYhwcixx3ZP/dWp4uiqBha/A+Bv/tUsNXCVUa5
 qa6tY1BcVMhhcEKwvcnc/3QYYUQJlhaMkKm1dXPZdvi9Zu3u62o6xfM5WPkDKnZB4vcd
 OTj05FyAYRmAcxj/cN05haTeGhfoPDL84BkN9RjKcrFogxUmeE46m+P1NYP0EnUpLulZ
 cZc+wacuCWPdXRS5Hye+MDsq3bok0FHxBzm1B6l/XTq8cM7cvfBGN84l+BEJOZyiMJTi
 PL/faRTccLgTNxyjzG8fusNMinsdnOJjPDolH4nBHl86KS+dGf8NkT1y+b0Bi3vonhSC
 bvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1Ju+9+IeyZLpzQCrZ1HI6GENt77SWKubB60iolMVS0=;
 b=49OD1JmVYgp+bZOtzFn0a52sKYYkT1l8QsAX/spobMIeYva5LCHAUmzHFsLFMD1eat
 iipBJVXLnWhdN3zHqhYXlt8BfCBF5myRfB6a6OpI6hhHEB39c30bt0+sfdcGaP93ylNJ
 V8QKlLupJsoEqiBOb67BpYB8hIOo/eiiJYqeps90CBNQauzUIbf+iQrCEchbt+6KwXJf
 Ubsa3AWLid8znnIV+m+vDgX4lbjNeqx44rTEwcOKBln3Ui4t7diweaiYs8tQUJylONqi
 waur85LphdVgaI81PyinRYjFFdKxAabbfEuG+kVRf+DAwgIQ6Chglkw3q7NU3mhxlGhX
 ZXqA==
X-Gm-Message-State: AFqh2kpSzIJGj/JLxluoxuyMiYVyu9HZpK+JzGPdS3ogBoYjYWc/V7Jz
 FK8GMc7jZoWsLtC8Q0r9ypwbQqAEpdW04xjf
X-Google-Smtp-Source: AMrXdXsdRPsXcXkpqkYVSucdITbPOp1M9ORRFGm6oZVMSawevLzkltywdVJmaIwnYqG9slvN/VZkIQ==
X-Received: by 2002:a05:6a00:f8d:b0:577:501c:c154 with SMTP id
 ct13-20020a056a000f8d00b00577501cc154mr46258699pfb.6.1672358765772; 
 Thu, 29 Dec 2022 16:06:05 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6286c2000000b0056bfebfa6e4sm12586151pfd.190.2022.12.29.16.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:06:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 46/47] accel/tcg: Handle false negative lookup in
 page_check_range
Date: Thu, 29 Dec 2022 16:02:20 -0800
Message-Id: <20221230000221.2764875-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 41 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 2c5c10d2e6..a8eb63ab96 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -525,6 +525,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
 int page_check_range(target_ulong start, target_ulong len, int flags)
 {
     target_ulong last;
+    int locked;  /* tri-state: =0: unlocked, +1: global, -1: local */
+    int ret;
 
     if (len == 0) {
         return 0;  /* trivial length */
@@ -535,42 +537,67 @@ int page_check_range(target_ulong start, target_ulong len, int flags)
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
+    /* Release the lock if acquired locally. */
+    if (locked < 0) {
+        mmap_unlock();
+    }
+    return ret;
 }
 
 void page_protect(tb_page_addr_t address)
-- 
2.34.1


