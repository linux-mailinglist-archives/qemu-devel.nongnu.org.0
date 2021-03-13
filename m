Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A426339F27
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:40:30 +0100 (CET)
Received: from localhost ([::1]:57350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7JV-00041n-4g
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HN-0002Tk-LT
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:17 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HL-0007Ma-H9
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id l19so5558357wmh.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCmAvra+9pdnWt5HPQ7qb167aeUA8Zrq2LTIBRXk/CU=;
 b=See2a8S1wnQTu12mCkpQ21/eYHwq7+7WZqBcBCOxcr4nTogG9QCrrO1Am3Q90nwXXL
 D3Xh798YuGxTIG4FbdyFVvp14I4nZEDPNVFUu/jYPe9bSxI+8dCl5YKMDQYoTw8AdbGa
 4JPgUnV7Kl6cGH1jANAogV+eX6pkGhyL7UbCBUGBhLDEi3tn7EY47uKlqf3zCeyV9NmG
 WE+29xhhyXHCJ3tmkrnDDwnlFh/PxIbQKIabpsYJ7j8qbfCd6ZZvynk1LrcNCOcwIGBF
 mR38mRr+zd3tmw1h9lJ5JHwSusKFTRnPBAMynsdafAMJNj+V2wENNKE+a2t5cvkgyfzj
 l1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCmAvra+9pdnWt5HPQ7qb167aeUA8Zrq2LTIBRXk/CU=;
 b=XeR5gjmsOZWDTXMSFcyFE+nvRZgzqSwFcv+ZQt5ldR0yAnx6Olgb88M5rSSqi31CBm
 bqjTiMXQClFHiTs7xur+Y4vSIDnREdN+IKJJhF+AnBV/KzaRWkGJYuPYamprHLiMMDw6
 AMYFnBCFrpPjKQ4ubPKwweBB4vryFQmvJIgCQHTftAmw2cJuSKE0/FyI1KDHH+hSKM0E
 R+LZGcsiqu1Cgaw98Hv1q7tOEZUP8MJf2esGBf17Dm/fYMzM0tsJDXWk6K45geoemXXK
 8Ng9eDOO74OziZAG/0139pb1djVM1KjsUYTYVbkiGHDYjAdhPtbg8nFS3JgUoOJ0E/4j
 3HgA==
X-Gm-Message-State: AOAM533/ueNtDO0J+A1E17tD9yxF6JqDlgNymW0Bgp1jzVpnGKIjROrW
 tVJAaWlBxJtmrqXrAVaa8v/eNtPJ8rY=
X-Google-Smtp-Source: ABdhPJx4zyOgQlp7udBSXkPrs4mYz0mckWfKPf78h+Ua4fk5s7N/3rrrFcRIeLvp1jOfhAMDDP2vLQ==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr18257469wmk.63.1615653493064; 
 Sat, 13 Mar 2021 08:38:13 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id n6sm13173441wrt.1.2021.03.13.08.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:38:12 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] tools/virtiofsd/fuse_opt.c: Replaced a malloc with GLib's
 g_try_malloc
Date: Sat, 13 Mar 2021 18:36:52 +0200
Message-Id: <20210313163653.37089-9-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313163653.37089-1-ma.mandourr@gmail.com>
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32e.google.com
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


