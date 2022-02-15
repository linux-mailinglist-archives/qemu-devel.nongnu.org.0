Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06D4B74C1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:42:46 +0100 (CET)
Received: from localhost ([::1]:59136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3in-00044y-Uw
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:42:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38A-0000r2-9D
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:54 -0500
Received: from [2607:f8b0:4864:20::82b] (port=40627
 helo=mail-qt1-x82b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK387-0002kj-UH
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:53 -0500
Received: by mail-qt1-x82b.google.com with SMTP id l14so19520708qtp.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42w8zH8fh4oqZPs0bvaBNjORXWqdsJUdc9cHlnfnog0=;
 b=Nu8nOHwBTquMCe7fcasecUcyLyHLr2x57f4QMp/IPL8gLz6pEEn47Y5L29Cf3zDqyw
 UetID7BrMGRPTgcRkv0dJMFUl6kQMm3VCHHnQZv6UqVjyhRQfy/Jsu3KvL61Ntetsxdy
 dXLnkncGKdYoZZzva7uUuCufl9TV/c4B9GlCJQpXQ4+V8EZ0FeoXk6AHCenthMy3kG0C
 MMIDfcRGrD2BE0eDSlfhXEgzQCA58zNMgR1/R/uc3Uvo4MbUQWfMvnBecrzE7pXIOz+P
 zspwgGMPX9YFzG16+ya+pLSHdbU6z1q9kzqiIEsJ5nOxc5/z9pktmx7aNMmYgkHYqlOQ
 0dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42w8zH8fh4oqZPs0bvaBNjORXWqdsJUdc9cHlnfnog0=;
 b=zHtWnKdqP4MfRzU21qfmqPcvkEfkw30XE7Vhxtwb5BcIn76L9PZRHcndXjjB/XU/QT
 wM+MNXMT44Pd8lMYY8w+JsWZ79oFVzL7Mxu9LBOSYLQQCXWOLI8/TURVP8HZvohsKYue
 mJKlT5WPA7Jaj4weqZbd5d+U+Bxh/sSGFZn5ulyWQmARznKf4janqGHBHclrA4+OSvF3
 g5bLat4itdT0lrWGfvhPA+SpaWKYRxBXzMmPXQDgXjQzf099v3kLglEzl7eVBBWwJnV6
 H8xwhtyfe0HQlV+eBvbcYiZaas+42AWJhFWgLhEnGp5FCGGqnkaBRBNdSdzkp5JndVUC
 q1aA==
X-Gm-Message-State: AOAM532lLfUAAoiluzfqQh0hNZ4HG2Ah74UgoW45Y8e0kRN32HMui7xm
 W+JcklRLST5oOysx8Z/0TL2CCHWH/0MfLQ==
X-Google-Smtp-Source: ABdhPJw3A5pf4WF/W8b6L6X7omnq1hVqYtERBZ3KRECBuFx+oc/BvlLTf8SxeTCwHb+5o9psK9hHWQ==
X-Received: by 2002:a05:622a:30e:: with SMTP id
 q14mr448767qtw.48.1644951889668; 
 Tue, 15 Feb 2022 11:04:49 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:48 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/11] 9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
Date: Tue, 15 Feb 2022 14:04:21 -0500
Message-Id: <20220215190426.56130-7-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>

Because XATTR_SIZE_MAX is not defined on Darwin,
create a cross-platform P9_XATTR_SIZE_MAX instead.

[Will Cohen: - Adjust coding style
             - Lower XATTR_SIZE_MAX to 64k
             - Add explanatory context related to XATTR_SIZE_MAX]
[Fabian Franz: - Move XATTR_SIZE_MAX reference from 9p.c to
                 P9_XATTR_SIZE_MAX in 9p.h]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
[Will Cohen: - For P9_XATTR_MAX, ensure that Linux uses
               XATTR_SIZE_MAX, Darwin uses 64k, and error
               out for undefined hosts]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p.c |  2 +-
 hw/9pfs/9p.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 14e84c3bcf..7405352c37 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -3949,7 +3949,7 @@ static void coroutine_fn v9fs_xattrcreate(void *opaque)
         rflags |= XATTR_REPLACE;
     }
 
-    if (size > XATTR_SIZE_MAX) {
+    if (size > P9_XATTR_SIZE_MAX) {
         err = -E2BIG;
         goto out_nofid;
     }
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 1567b67841..94b273b3d0 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -479,4 +479,22 @@ struct V9fsTransport {
     void        (*push_and_notify)(V9fsPDU *pdu);
 };
 
+#if defined(XATTR_SIZE_MAX)
+/* Linux */
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
 #endif
-- 
2.34.1


