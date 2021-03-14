Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432E733A281
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 04:29:04 +0100 (CET)
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLHR9-0003gO-9t
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 22:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMM-0006Xp-Eh
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMK-0004T3-0l
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:06 -0500
Received: by mail-wr1-x431.google.com with SMTP id v15so6907495wrx.4
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 19:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCmAvra+9pdnWt5HPQ7qb167aeUA8Zrq2LTIBRXk/CU=;
 b=C3fsQZjWINmodDF5RjZxzhEd867S9ad8EMBpBOK2Q7+q0isd3NK5dpbHqqq/9X3AYn
 CcZEsBitKYwCAgZFnErz4cGLCGU4VSgU1Yl2Ed2aUYr2kHpCvSsS86o3UHUTOfsP52sJ
 eylXltFmu1TprHKNng/SHnUnq+evSNxJ8HDmKs8zG/TPTBKdUe+UkW5aH/oWZay2YDMj
 HWjKjptNKXdYLWWee94gbQ/mwkncslEz2hoZiHVBaggIyVrctQ1mb+pVEi4m+qgx8+Nr
 htws7uf58LEKJnmFgmX7pHkKsDvE1ZfdDEkb5nrOn1gegQ7TZDWFcojxWWFJyz9micG1
 cFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCmAvra+9pdnWt5HPQ7qb167aeUA8Zrq2LTIBRXk/CU=;
 b=KbEo6JjTOpFXDVo8inZFWphGWs+q/tAKelHnq7JScHmRJzL3EE17iA6l8oXeMbq8Te
 CGvkoLRU85BX4z4NujboE8P7S/5QmLdsZaW3SsWr+4GLCSwEOH4scbV9yo4u3RHnyC+U
 gWEWGoDFsxC4Fu4bENECiwGW63Ej29QKa8wRRXRvxQJDZYpqCETWRI13fzATHOZOUd9W
 82Of7kHk4F9D2SKm3L04FI54Dlz0s+a8HtJTawXKXOdBJIYOrJT6qaPTXU7PRMSAf/KK
 Wz9a0pEP7h4kfKB34g5J36v4Od4juOPb0L7XVaTNf6kZEHzFvWbtsDkcAXOhauTfXgpp
 3JFA==
X-Gm-Message-State: AOAM530wvd6nc0pMroqhTtjEyX8VPo/e4REWBpIBIjUJAkTeSwDOHb32
 ZNmFq5UAZhebpA6dv2axAxN0xr5e3ac=
X-Google-Smtp-Source: ABdhPJwNvu/QQE13zP/lB4aBNUJaPdXgPka47jUDe77Ix3n87gJ/PuI3hmAVV2WdMnMfqOuU1A62sw==
X-Received: by 2002:a5d:6290:: with SMTP id k16mr20354363wru.177.1615692242460; 
 Sat, 13 Mar 2021 19:24:02 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id e1sm14922249wrd.44.2021.03.13.19.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 19:24:02 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] tools/virtiofsd/fuse_opt.c: Replaced a malloc with GLib's
 g_try_malloc
Date: Sun, 14 Mar 2021 05:23:23 +0200
Message-Id: <20210314032324.45142-8-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314032324.45142-1-ma.mandourr@gmail.com>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced a malloc() call and its respective free() with
GLib's g_try_malloc() and g_free() calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/fuse_opt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_opt.c b/tools/virtiofsd/fuse_opt.c
index f0ab8d22f4..9d371448e9 100644
--- a/tools/virtiofsd/fuse_opt.c
+++ b/tools/virtiofsd/fuse_opt.c
@@ -272,7 +272,7 @@ static int process_opt_sep_arg(struct fuse_opt_context *ctx,
     }
 
     param = ctx->argv[ctx->argctr];
-    newarg = malloc(sep + strlen(param) + 1);
+    newarg = g_try_malloc(sep + strlen(param) + 1);
     if (!newarg) {
         return alloc_failed();
     }
@@ -280,7 +280,7 @@ static int process_opt_sep_arg(struct fuse_opt_context *ctx,
     memcpy(newarg, arg, sep);
     strcpy(newarg + sep, param);
     res = process_opt(ctx, opt, sep, newarg, iso);
-    free(newarg);
+    g_free(newarg);
 
     return res;
 }
-- 
2.25.1


