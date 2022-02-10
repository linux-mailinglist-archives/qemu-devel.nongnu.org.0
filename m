Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8384B13AA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:56:54 +0100 (CET)
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICkW-0002w7-Jk
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WY-00033F-4k
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:14 -0500
Received: from [2607:f8b0:4864:20::f2f] (port=35532
 helo=mail-qv1-xf2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WU-0004Gv-Jm
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:13 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id d7so4936007qvk.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42w8zH8fh4oqZPs0bvaBNjORXWqdsJUdc9cHlnfnog0=;
 b=A6ak7nLjQX2lOR5SicpzXxn34TwZBwsBTLUNmkP/uOn48q4PuZLXoTTwXz8VrZ5b5X
 yt8q0ZgMOhMQvfbl9ZiqlQk4mkD2MGiJY8JtFTaLaHQhKL+25Wljz1u6Jh2ReRuBP3v4
 eCk26fD/yO1KtU7POkdRY7BSUmg2ReqOoIsFFfORexG6x/9+Gs2qRwVCZ3POPHJ36DRX
 wz0oRmU8Yj9JmweJilXzq7ICB5W/yoR9X5F7hiERBIjXGnyJH4GN5hW+FZ8LLOCC+lRV
 cMpv9jFKQe1o/3DNlMLcydODPYWLLhYQNLGYcQjrhoufYQmBUSlEmPd8S/3iiRc6JetH
 /FOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42w8zH8fh4oqZPs0bvaBNjORXWqdsJUdc9cHlnfnog0=;
 b=gxX22W38H0H8FEHCJf9OzWknQwUs430wztKhoD0rLanmRfziNHSNF6xFonN/tamu63
 kKd7fOPKv6R6eM25wsU4/27H2421vxgtFjI58rGjRUDKw4HSo/iKgH8pPk8KgdAEZAgf
 fttXPwHBsx5gIw81ku1CRaac+ToPlzmMwoCU8OoIpQRi2+lwsO2VO6hHYcCbJCy4smHA
 utiIfxb8N29jKyLmm4X/0b+xsYdRoRoh2C96RN0sGf6e+cWRrW2g1+AUfwqEQ2+yGzJl
 x3EaOfgpj91KlO8Hcoq7jfxLbiGEt/NtVA6sGDbVu5Ph1ZZaJgUlMJOJnyAUP+eg93Ne
 5/WQ==
X-Gm-Message-State: AOAM531sStQrZrXXqGJc95NGVxcZNL0YGBiahLjNLHDMAFtidWbrZGnS
 BN71/stwS0h5zoEhB6QXqp7E+yweoEJvFw==
X-Google-Smtp-Source: ABdhPJwXgsHgi64nDMei6VGkqq/4pTbFYFxDTfAtHK2xEWv5rxI5EHsTPWkMrqsny5dBW7eMEDhWcw==
X-Received: by 2002:a05:6214:2428:: with SMTP id
 gy8mr5077755qvb.122.1644499809389; 
 Thu, 10 Feb 2022 05:30:09 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id t1sm11289616qtc.48.2022.02.10.05.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:30:08 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/11] 9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
Date: Thu, 10 Feb 2022 08:29:41 -0500
Message-Id: <20220210132946.2303-7-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210132946.2303-1-wwcohen@gmail.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
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


