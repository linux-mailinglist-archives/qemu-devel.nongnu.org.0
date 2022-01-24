Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB78499BF1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 23:05:54 +0100 (CET)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC7TE-0001a4-W4
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 17:05:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7RY-0007pb-8p; Mon, 24 Jan 2022 17:04:08 -0500
Received: from [2a00:1450:4864:20::331] (port=42690
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7RW-0002e2-OY; Mon, 24 Jan 2022 17:04:07 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso379934wmf.1; 
 Mon, 24 Jan 2022 14:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jCpAbYC9T6HGGGxeJ6RsbykRgxprtZ2L9dWFhM1DvkI=;
 b=ZRG/7gTbKDEQcoa4qoMuGFIkGHQWUo6ODlAtlD+eH7Kb2ebxfDI1I5A79xLenHqCRi
 lEPoEBfQDaaKWFOs7AZjDfJbcjbvBCxgTt3TnQKFrNJ4Q0mqAh26x0nWMTVHrNPdYYFC
 e2OxDLgtP8/8PjRbg/9xTkb91/pm9WRyWojEPuTemqbgS/DErxFFBfpstEkMKePNOnf2
 AfGcm2kjcjzng4mtGRvvD7wZf0TDoIWCprkWnB9XAYVAHGtyv1w4+FJ28lWkyXhkZg6O
 HOZYOqwPmGQunDhvk00dJLTCtdpft81rQm+tUtbrrSQMSl6eC8Gy9nO9Hgda1vkordNY
 6yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jCpAbYC9T6HGGGxeJ6RsbykRgxprtZ2L9dWFhM1DvkI=;
 b=ZXxcbciXeGyhc+u1ddkEIIpLxbedw4QJ/6SxwdxwwVMUmGD2AfbZuBHtspdLBm5SdG
 TlzEsYPv9gFICxtyZU4SRuK8sopKOSreMcYi+1Q/gxqeLty+nHQfYRtIenT5urIeMUIp
 p0YjWRMrF4OfQLZjyg39YwMV+9ZIkmxJLDEG8kuxvBPNG3irOWvYc95MZZBMdZo93b/u
 60r2z5MRiTdRiHbcB3pFT9MUSihcbPw+csa11xzCbVflVEyFd545UL74w5g1zFbMeX1f
 7AcijHZjlmjT81LDuAj9K6DaJr7DO9KhwOI4cUk8chnZH5013K/Bxv3bJSeOIcpNmWBy
 rIjA==
X-Gm-Message-State: AOAM5325Pw0lTKq/iAOs5unhgiLSBcjPtWbY5GU0b5Cc6IgFq6XvHhRp
 SsT7EfMDSAUcszYddxzU8kspynrsI4A=
X-Google-Smtp-Source: ABdhPJyWrY27BXp2jjCW7SuvOQus5YVR8Z3lHKN6oGuHYajf4VyyuMk5+OqtkXOu1a+Alda1A9MYOA==
X-Received: by 2002:a05:600c:3b9c:: with SMTP id
 n28mr256473wms.128.1643061844950; 
 Mon, 24 Jan 2022 14:04:04 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 j3sm563161wrb.111.2022.01.24.14.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:04:04 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/3] block/export/fuse: Extract fuse_fallocate_punch_hole()
Date: Mon, 24 Jan 2022 23:03:55 +0100
Message-Id: <20220124220357.74017-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124220357.74017-1-f4bug@amsat.org>
References: <20220124220357.74017-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

Extract fuse_fallocate_punch_hole() to avoid #ifdef'ry
mixed within if/else statement.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/export/fuse.c | 59 +++++++++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 6710d8aed86..31cb0503adc 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -603,6 +603,38 @@ static void fuse_write(fuse_req_t req, fuse_ino_t inode, const char *buf,
     }
 }
 
+static bool fuse_fallocate_zero_range(fuse_req_t req, fuse_ino_t inode,
+                                      int mode, int64_t blk_len,
+                                      off_t offset, off_t *length)
+{
+#ifdef CONFIG_FALLOCATE_ZERO_RANGE
+    FuseExport *exp = fuse_req_userdata(req);
+
+    if (mode & FALLOC_FL_ZERO_RANGE) {
+        int ret;
+
+       if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + *length > blk_len) {
+            /* No need for zeroes, we are going to write them ourselves */
+            ret = fuse_do_truncate(exp, offset + *length, false,
+                                   PREALLOC_MODE_OFF);
+            if (ret < 0) {
+                fuse_reply_err(req, -ret);
+                return false;
+            }
+        }
+
+        do {
+            int size = MIN(*length, BDRV_REQUEST_MAX_BYTES);
+
+            ret = blk_pwrite_zeroes(exp->common.blk, offset, size, 0);
+            offset += size;
+            *length -= size;
+        } while (ret == 0 && *length > 0);
+    }
+#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
+    return true;
+}
+
 /**
  * Let clients perform various fallocate() operations.
  */
@@ -642,30 +674,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
-    }
-#ifdef CONFIG_FALLOCATE_ZERO_RANGE
-    else if (mode & FALLOC_FL_ZERO_RANGE) {
-        if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
-            /* No need for zeroes, we are going to write them ourselves */
-            ret = fuse_do_truncate(exp, offset + length, false,
-                                   PREALLOC_MODE_OFF);
-            if (ret < 0) {
-                fuse_reply_err(req, -ret);
-                return;
-            }
-        }
-
-        do {
-            int size = MIN(length, BDRV_REQUEST_MAX_BYTES);
-
-            ret = blk_pwrite_zeroes(exp->common.blk,
-                                    offset, size, 0);
-            offset += size;
-            length -= size;
-        } while (ret == 0 && length > 0);
-    }
-#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
-    else if (!mode) {
+    } else if (!fuse_fallocate_zero_range(req, inode, blk_len, mode, offset, &length)) {
+        return;
+    } else if (!mode) {
         /* We can only fallocate at the EOF with a truncate */
         if (offset < blk_len) {
             fuse_reply_err(req, EOPNOTSUPP);
-- 
2.34.1


