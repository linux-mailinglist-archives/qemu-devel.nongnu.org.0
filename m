Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA0499C6E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 23:08:36 +0100 (CET)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC7Vr-0005H3-E3
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 17:08:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7Rd-00080F-CP; Mon, 24 Jan 2022 17:04:19 -0500
Received: from [2a00:1450:4864:20::42a] (port=42845
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7Rb-0002eF-QH; Mon, 24 Jan 2022 17:04:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a13so16216154wrh.9;
 Mon, 24 Jan 2022 14:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxgxCKBNiYaOgKMIodc6FSbutjGheMIARQqSurJB4ww=;
 b=lP45yiopRyZwkNsT5s1BXrR7tdQ9YDkpkzQWytjGh10PAM468O9wEjNjNNYiCYYrx+
 64GGfd87Pf5pHh3UkeKACLjxXg6jP8BP+E6K5Tew7vpOg3LyYGJeS8owzXTM4QgNMykK
 TmJ++nt2EhKcllb7O/dy9I6iv4KZ43/L/YN3c1XJoATFJe2LZ4+RQiZ0jnsf/oxeuc6T
 63KUI6ZlCxHUoC0193qocdTQV+E/9gbtU5e1BC2xVkiSunlJdXgChONRDcTzz0nUI4df
 gEERKOvlmSGX/yby5jGo+9MY0Qfkoa4E4Css9ivKGTLXBhAtjF6vYlza1AYqDokXCupp
 Xa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GxgxCKBNiYaOgKMIodc6FSbutjGheMIARQqSurJB4ww=;
 b=1vw06LKoW+oFJOIsRAWuSO7hX/tjLwDu1S1tbg8aAIgGOEkaGAWwzUilnCJVDk+Ypk
 JchKcyx4b8ruI6rYOF38gdRpBSjQqI4w0DxcMlayEUI8sdcCF95JyEgPhbQKYgWuYhdG
 0wwERHO4sxK207M0/FipUxDU1MKZEn8rrYt6OW/gv/uMIwsGQ+FOpP48aBubfcbdLvTU
 CUUdsDT5PEKb15T12x+fv4uToawdwPjCZHrEa4w3IwtN+n7NcinYbn5Q3/oaVTwT+HFS
 WHWB4SbUtM3t6b1IZablkACUbCEiBOI8vWV0Kyhem4OZVaxF4TuVuAQIN1j6n6OjS8Xh
 W+RQ==
X-Gm-Message-State: AOAM531gIRheFJGESYmKswpOVO8qhs73f7N8ErCFR01ZuVvsevarlpXc
 rM31HGafJQL8U/9EvPGfqRp4TL6uHqQ=
X-Google-Smtp-Source: ABdhPJwfCjxkS+vM/tl6CgDiosxyeuK7yJQjK7k7u868WS4X33a8np34n63yl4huBisZg6j7MXHvNw==
X-Received: by 2002:a05:6000:168c:: with SMTP id
 y12mr9019630wrd.365.1643061849872; 
 Mon, 24 Jan 2022 14:04:09 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 g13sm7598437wri.50.2022.01.24.14.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:04:09 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 2/3] block/export/fuse: Extract fuse_fallocate_zero_range()
Date: Mon, 24 Jan 2022 23:03:56 +0100
Message-Id: <20220124220357.74017-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124220357.74017-1-f4bug@amsat.org>
References: <20220124220357.74017-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/export/fuse.c | 48 +++++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 31cb0503adc..3a158342c75 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -603,6 +603,35 @@ static void fuse_write(fuse_req_t req, fuse_ino_t inode, const char *buf,
     }
 }
 
+static bool fuse_fallocate_punch_hole(fuse_req_t req, fuse_ino_t inode,
+                                      int mode, int64_t blk_len,
+                                      off_t offset, off_t *length)
+{
+    FuseExport *exp = fuse_req_userdata(req);
+
+    if (mode & FALLOC_FL_KEEP_SIZE) {
+        *length = MIN(*length, blk_len - offset);
+    }
+
+    if (mode & FALLOC_FL_PUNCH_HOLE) {
+        int ret;
+
+        if (!(mode & FALLOC_FL_KEEP_SIZE)) {
+            fuse_reply_err(req, EINVAL);
+            return false;
+        }
+
+        do {
+            int size = MIN(*length, BDRV_REQUEST_MAX_BYTES);
+
+            ret = blk_pdiscard(exp->common.blk, offset, size);
+            offset += size;
+            *length -= size;
+        } while (ret == 0 && *length > 0);
+    }
+    return true;
+}
+
 static bool fuse_fallocate_zero_range(fuse_req_t req, fuse_ino_t inode,
                                       int mode, int64_t blk_len,
                                       off_t offset, off_t *length)
@@ -657,23 +686,8 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         return;
     }
 
-    if (mode & FALLOC_FL_KEEP_SIZE) {
-        length = MIN(length, blk_len - offset);
-    }
-
-    if (mode & FALLOC_FL_PUNCH_HOLE) {
-        if (!(mode & FALLOC_FL_KEEP_SIZE)) {
-            fuse_reply_err(req, EINVAL);
-            return;
-        }
-
-        do {
-            int size = MIN(length, BDRV_REQUEST_MAX_BYTES);
-
-            ret = blk_pdiscard(exp->common.blk, offset, size);
-            offset += size;
-            length -= size;
-        } while (ret == 0 && length > 0);
+    if (!fuse_fallocate_punch_hole(req, inode, mode, blk_len, offset, &length)) {
+        return;
     } else if (!fuse_fallocate_zero_range(req, inode, blk_len, mode, offset, &length)) {
         return;
     } else if (!mode) {
-- 
2.34.1


