Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484EC4EE0E4
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:45:42 +0200 (CEST)
Received: from localhost ([::1]:50010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZznh-0006D2-DK
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:45:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZzVh-0000lS-TY
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:27:05 -0400
Received: from [2607:f8b0:4864:20::72d] (port=34384
 helo=mail-qk1-x72d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZzVg-0003tG-0A
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:27:05 -0400
Received: by mail-qk1-x72d.google.com with SMTP id 1so252104qke.1
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 11:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5snQ8CRQ0a9ojoSJnUT3ylTF5nEXOe5Qzom4D/g7BJA=;
 b=eAXZwwWhmSkS4/TYr7fRs/0iVRTl6Gl6GHvRJEV9zObaBwog4UoK1pekT2Ssnht4wz
 O/ytSpa+ZmVFleW683QVePLU+gT/W6M8QTaQmIsX+JEHYln7ntZ6yXfmg2AXASU8j86d
 mK1MdOF40tesF6PEMyKsirZ+FvJV+6ZixNcjtqHfWKsyrp2J02elbzshZOrgdggIBg39
 ZBv5uayc781bnVBTrskhs2xzitbT2lm1k8g7yS6adfBQ4Q5OYzWfPQ3IzbzkVLvNGvNQ
 lkcuqsGRC7R53wfbDKFZ6fN8XZ3jdOWSjIE4J0LlaJcrbYMUsznwMCvLgacKt8KOqa/n
 FQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5snQ8CRQ0a9ojoSJnUT3ylTF5nEXOe5Qzom4D/g7BJA=;
 b=Se7zc6M7dXNiGk0n3la5x+c0irQllzSgGXNmdqcUbroZ4me8Ji6kh4jwTJ2+Rrm94n
 X0Zs6D6NMPWbPI9gwAQE/xi/0gq+4FTl3VnFr6A8ZPQQ8XSsXptl6E5nftOdJoDcQ8aG
 nMvSlSwIxHxwhpiJjt9pbH6iL9keQBAj4DB5RpScV963fuiG5rUSddS2abEU2cNjisbI
 sBqiOooZ0tOna+5z9Y/97geeHFvrHL5NbQCawZdyT3fXrHtxueJxef+5E4Vi09BqK0Ty
 fkTa86xY8tIOBvTDWFl4sKq8wxhMUR4PYEpoxiNOcgEkE2GyLAR6jTPbFOP+9x2kQYtG
 JELQ==
X-Gm-Message-State: AOAM532rmaHQQ3vks7lyzLnKxh7Y5LvVg90P2D8r8nTeygPMhXNf1+Wn
 /Ug8VQqHXLyS36NGnzw9xLXJVmSLKkUdfQ==
X-Google-Smtp-Source: ABdhPJx4Fc/8MHP8xcnUMmo4+5rPqeFGEd3WWEF3K4c4rjUbQcYmnSyNHlnOpSX2focubM0VPj+U+A==
X-Received: by 2002:a05:620a:2993:b0:67d:7119:9f19 with SMTP id
 r19-20020a05620a299300b0067d71199f19mr4220182qkp.494.1648751221994; 
 Thu, 31 Mar 2022 11:27:01 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05622a130c00b002e1b3ccd9adsm43322qtk.79.2022.03.31.11.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 11:27:01 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] 9p: move P9_XATTR_SIZE_MAX from 9p.h to 9p.c
Date: Thu, 31 Mar 2022 14:26:51 -0400
Message-Id: <20220331182651.887-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, fabianfranz.oss@gmail.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 keno@juliacomputing.com, reactorcontrol@icloud.com,
 philippe.mathieu.daude@gmail.com, Will Cohen <wwcohen@gmail.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch set adding 9p functionality to darwin introduced an issue
where limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c,
though the referenced constant is needed in 9p.h. This commit fixes that
issue by moving the definition of P9_XATTR_SIZE_MAX, which uses
XATTR_SIZE_MAX, to also be in 9p.c.

Additionally, this commit moves the location of the system headers
include in 9p.c to occur before the project headers.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/950
Fixes: 38d7fd68b0 ("9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX")

Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p.c | 28 +++++++++++++++++++++++-----
 hw/9pfs/9p.h | 18 ------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index dcaa602d4c..b9152c7882 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -16,6 +16,11 @@
  * https://wiki.qemu.org/Documentation/9p
  */
 
+#ifdef CONFIG_LINUX
+#include <linux/limits.h>
+#else
+#include <limits.h>
+#endif
 #include "qemu/osdep.h"
 #include <glib/gprintf.h>
 #include "hw/virtio/virtio.h"
@@ -33,11 +38,6 @@
 #include "migration/blocker.h"
 #include "qemu/xxhash.h"
 #include <math.h>
-#ifdef CONFIG_LINUX
-#include <linux/limits.h>
-#else
-#include <limits.h>
-#endif
 
 int open_fd_hw;
 int total_open_fd;
@@ -3925,6 +3925,24 @@ out_nofid:
     v9fs_string_free(&name);
 }
 
+#if defined(CONFIG_LINUX)
+/* Currently, only Linux has XATTR_SIZE_MAX */
+#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
+#elif defined(CONFIG_DARWIN)
+/*
+ * Darwin doesn't seem to define a maximum xattr size in its user
+ * space header, so manually configure it across platforms as 64k.
+ *
+ * Having no limit at all can lead to QEMU crashing during large g_malloc()
+ * calls. Because QEMU does not currently support macOS guests, the below
+ * preliminary solution only works due to its being a reflection of the limit of
+ * Linux guests.
+ */
+#define P9_XATTR_SIZE_MAX 65536
+#else
+#error Missing definition for P9_XATTR_SIZE_MAX for this host system
+#endif
+
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
     int flags, rflags = 0;
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index af2635fae9..994f952600 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -479,22 +479,4 @@ struct V9fsTransport {
     void        (*push_and_notify)(V9fsPDU *pdu);
 };
 
-#if defined(XATTR_SIZE_MAX)
-/* Linux */
-#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
-#elif defined(CONFIG_DARWIN)
-/*
- * Darwin doesn't seem to define a maximum xattr size in its user
- * space header, so manually configure it across platforms as 64k.
- *
- * Having no limit at all can lead to QEMU crashing during large g_malloc()
- * calls. Because QEMU does not currently support macOS guests, the below
- * preliminary solution only works due to its being a reflection of the limit of
- * Linux guests.
- */
-#define P9_XATTR_SIZE_MAX 65536
-#else
-#error Missing definition for P9_XATTR_SIZE_MAX for this host system
-#endif
-
 #endif
-- 
2.35.1


