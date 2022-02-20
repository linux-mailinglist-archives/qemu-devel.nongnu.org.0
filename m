Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0444BD00D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 18:05:48 +0100 (CET)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLped-00023l-Hq
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 12:05:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQh-0007nd-Fl
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:23 -0500
Received: from [2607:f8b0:4864:20::f35] (port=43884
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQf-0000DD-NS
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:23 -0500
Received: by mail-qv1-xf35.google.com with SMTP id a28so26050593qvb.10
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FIM26iDeobdaVDOFSCZhx4ufdUObSP6716TqaQ3mxlU=;
 b=LVw9XOtm30z6obMt1PBxaXipv2oqFaHO4kYzKqu6KRGjZvfrpURfpUc16GoR3GKLxT
 n0xPtdj12/ag5ifP3koSUHBoVdV57kOMuPiq/4vSdRkryDO3W+lOP6WT2OE/I+KXAaBP
 5IoCyDeZR1uWRxfNEAEJz7pdXb6+dLApwewbg25DgUZGvyT5X8q/wAtTw53alV6hA79W
 JgIEsMNbX4QxuJE/K3zSMAV0har5d65Hrz0Z/VwQiZtBFm50fAi1UhO3nqdRn1n0iLt7
 fFg4WiZtdsq3J2sKFw0XZhWT/rfjzDshzdNTSNpTZ9hC88/tSeRuEAsNGCtG2J1tj2a8
 xdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FIM26iDeobdaVDOFSCZhx4ufdUObSP6716TqaQ3mxlU=;
 b=CyUVsr+osnCMM1NnRmAV8xxGWFLWOUPsDc7klVU70koIYT1n/d433t82QBJ23EBdbF
 DFUb/E3bI2Q21KhJtI0KxBXsU8nX7gEqMOwZO1tBgtbKHcxNGRRRDtUcExf4xdHOYcma
 TQQHUlhopfa/yH6gC0HPUl+EuCFQHrv4KCKreJ0zyhosWjI6SfV2WI/L0cUV8Py0OAeY
 boMf8LhVh+7ICSlgNnX/5zajyZO94pZ4+nQXFMfI/ni7eAJb26cPebObZIHQxuuNOcEp
 rLSAUssYYd0Sj6nNVWJ+0BbE1HIdiDOxLPoQIbOoEkDpnL3YWaktRm1zzaykdHByRzV7
 pdbw==
X-Gm-Message-State: AOAM531xVyKBxSIMUESBXygxaKWrmauD/nfxbMEHm3dUaKS+FOoKDCOZ
 zrlCTAmITl2wC4KX7zxCNtJHpu569soaTw==
X-Google-Smtp-Source: ABdhPJymhz/EKrKwGYLWmUkiG30JD0oc5BlvkkpJWARhkotdeS8vjloED1FSQCTb+A1J+q9m+z3jiQ==
X-Received: by 2002:a0c:c601:0:b0:42c:dee7:486b with SMTP id
 v1-20020a0cc601000000b0042cdee7486bmr12826744qvi.97.1645375880624; 
 Sun, 20 Feb 2022 08:51:20 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n16sm3190995qkn.115.2022.02.20.08.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:51:20 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/11] 9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
Date: Sun, 20 Feb 2022 11:50:51 -0500
Message-Id: <20220220165056.72289-7-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220165056.72289-1-wwcohen@gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf35.google.com
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
2.35.1


