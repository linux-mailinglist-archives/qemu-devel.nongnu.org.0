Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD5B4ACC5B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:56:27 +0100 (CET)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCvq-000854-BM
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:56:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgc-0003va-8p
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:42 -0500
Received: from [2607:f8b0:4864:20::834] (port=38820
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgX-0005hV-G3
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:39 -0500
Received: by mail-qt1-x834.google.com with SMTP id r14so13314143qtt.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 14:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufzSiaPZW1iyON8XDFMuTlSSvbuK1+FP5QfBaS7//zI=;
 b=oHYVZak51/SOOnA2oWkq5Boxb4C8Sd05KD6NhTxaEiG8opH/ZYWF11ukLypcuo6i9S
 M8+6ZeWL4jPA+c80OR01mUBn5nLvRLwaYx+MaOsd9AOhO3acHW4nAebURoLvDG2rZJAD
 S1TwQjoMAzlZ2y1i+wr/od25S01MP+wGXjtAKTF0fdzw247zdx12Zt8kl86nOI+9LxQy
 97nZtyPC3mQi4t2eGwhd7QyxAgSqMyDNugo3oKvWOcLzS2cfApQWzPe8HuqjhdEDB+WU
 jTPofYmL1VSCXkYH5MXXcNGBcUKpEoifRNbKRYzHRhVt49PyI0CkSismgzNg45UDeNWd
 O5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufzSiaPZW1iyON8XDFMuTlSSvbuK1+FP5QfBaS7//zI=;
 b=aiyuMojKLyV7HV7bl7cC6e20ysl0QqeZ//YC34DtUkPORZPPZC0KfkNyVLmdtlOoMG
 /MnNsqSqRAcjUeqAG6PEcacY0NDO518k/m50TycU7JNB8YsW+vjbN/OMSW+j0MtH9tQK
 RgLKbLh8Zba/yS93opEsoyW8LSgki5HoaMyBWaqhnUcQacSNmyMFOI38Nml/qoD/0NPk
 wepcQDuXeNKFxSr6mqDfPbNUe935TPWjQD1sZX15xhIvXhpDgOrzCozmAlSMwDKC4nQ5
 VVq3far1dEhdKDRoKnn0sr6aSHMRWQGHmrF2Ld+kfrmyxV41O/qCEiCQAvF2HxqgSKvq
 k0uA==
X-Gm-Message-State: AOAM5302PSd1tLTv1I94ghN7IceOu8p6pbAA/7STvjqVf5Y+Ok9Z/G3X
 SAUoUCHBrzZoh4uyg80h/rvfN7u8xJVC/w==
X-Google-Smtp-Source: ABdhPJwfFzo3UWDN9c/a9IUqjv1z0I5YK0ndZuxHN3ketazcQp9xiNWGA+etGaMgyvG/ay5HJI91cQ==
X-Received: by 2002:ac8:5413:: with SMTP id b19mr1269340qtq.442.1644273634733; 
 Mon, 07 Feb 2022 14:40:34 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j14sm6444744qko.10.2022.02.07.14.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:40:34 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/11] 9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
Date: Mon,  7 Feb 2022 17:40:19 -0500
Message-Id: <20220207224024.87745-7-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220207224024.87745-1-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x834.google.com
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
---
 hw/9pfs/9p.c |  2 +-
 hw/9pfs/9p.h | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index 1567b67841..6a1856b4dc 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -479,4 +479,15 @@ struct V9fsTransport {
     void        (*push_and_notify)(V9fsPDU *pdu);
 };
 
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
+
 #endif
-- 
2.32.0 (Apple Git-132)


