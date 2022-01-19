Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75767493662
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:34:48 +0100 (CET)
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6QZ-0005G5-1o
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:34:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62g-00070W-4X
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62X-0000vQ-5E
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r648Y3X/bfN5BCV7H2OloEH+uVhiyU6Y+C3RrlsatDo=;
 b=SIRsomhLZn8xlhrR9x4oqO5OJGP1pStLmuW0jrtgXcVkuTLLT1/nmOz9z/BmbWtOhF570+
 XHJwN6jNrnf9Q20x/DtbZzIlmip8/s/bGQK0u0gC0365cqCP1xsmDtBH8pRLaDD/Yg+lOo
 GtBR+ZnaFJTdoBiPjBxPoksD8S2VBI4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-oxoB_fJLPBq29nvnUm3TOQ-1; Wed, 19 Jan 2022 03:09:55 -0500
X-MC-Unique: oxoB_fJLPBq29nvnUm3TOQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 s17-20020a7bc0d1000000b00348737ba2a2so1339733wmh.2
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r648Y3X/bfN5BCV7H2OloEH+uVhiyU6Y+C3RrlsatDo=;
 b=YbpIrdTDyMco7iuJ0vjn0DkbJqwAIVeYSdsP2fxouC+biRt21utn7GCXwyG38A/7T6
 wElEmuFEDdJ/CtNxbjeg50iuVnyeOf1PPKzNmNZbQnRkJTLx2O9kyB39fEj1wnSSgEoz
 ZxO6pp5JnUOX9sZqVZCfTSxTklxxuMdAl+qkZJL58VLZGIE4SOeyo6sw/K7Ycs2/k4va
 R3yNrVfFys6QmHqgqiwCuVYIP5s/Hne5cZ1iE7W/oAgoguc4rYrqa4p34LHo+j4SZHgX
 x29NlcWJCG1zIxL8NDyZpkim7URgXCpTfnB5vfwqG+IusGMrzIPVZtzU96MtpOwUEyRE
 xrZw==
X-Gm-Message-State: AOAM530NJsMG9e87Ryzluu8z5/wlbXZlomPBcMdRGCiIBmxbGfpx5aVI
 IGBvtCH+5BipA1/NNW1/GzKIeAD866QeK2kLxMfU4RBC5poQ8NAiRz0sS8B/DP+0QjCmegTJO/i
 E9dMF/4zTK17ISjcAACe77wDhAwKlg7rUAUAvMPBwobYh3ERJc395VEXyUsEhcwlG
X-Received: by 2002:a05:600c:4f16:: with SMTP id
 l22mr2304619wmq.122.1642579793325; 
 Wed, 19 Jan 2022 00:09:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvbuRGHw8shqHx/kqnSXogOiMfHZVnDrneMu9PayetmUffFh0sw55Dfe6pkR7v+NMYFNvcZg==
X-Received: by 2002:a05:600c:4f16:: with SMTP id
 l22mr2304594wmq.122.1642579793046; 
 Wed, 19 Jan 2022 00:09:53 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.09.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:09:52 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 03/15] migration: Enable UFFD_FEATURE_THREAD_ID even
 without blocktime feat
Date: Wed, 19 Jan 2022 16:09:17 +0800
Message-Id: <20220119080929.39485-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch allows us to read the tid even without blocktime feature enabled.
It's useful when tracing postcopy fault thread on faulted pages to show thread
id too with the address.

Remove the comments - they're merely not helpful at all.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d18b5d05b2..2176ed68a5 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -283,15 +283,13 @@ static bool ufd_check_and_apply(int ufd, MigrationIncomingState *mis)
     }
 
 #ifdef UFFD_FEATURE_THREAD_ID
-    if (migrate_postcopy_blocktime() && mis &&
-        UFFD_FEATURE_THREAD_ID & supported_features) {
-        /* kernel supports that feature */
-        /* don't create blocktime_context if it exists */
-        if (!mis->blocktime_ctx) {
-            mis->blocktime_ctx = blocktime_context_new();
-        }
-
+    if (UFFD_FEATURE_THREAD_ID & supported_features) {
         asked_features |= UFFD_FEATURE_THREAD_ID;
+        if (migrate_postcopy_blocktime()) {
+            if (!mis->blocktime_ctx) {
+                mis->blocktime_ctx = blocktime_context_new();
+            }
+        }
     }
 #endif
 
-- 
2.32.0


