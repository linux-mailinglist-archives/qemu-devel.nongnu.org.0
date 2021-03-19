Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13DF341E67
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:34:08 +0100 (CET)
Received: from localhost ([::1]:48766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFGM-00019O-FY
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF8x-0000yw-9k
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lNF8n-0003wV-Ay
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:23 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so8385379wmq.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zPz2JDY4qZl9EO9V+0iDtCjid2U+jmokq/nSA43V4JA=;
 b=VFjFHRsevYNfm2YPKvnRzOa7XrI+03W/j8Q8FfE8+zG2n41LCw71lau0dkEs1rcgcL
 3UPwcDqneGqCV5ZoH6n37S3hS/CXhHN/7XlEvEzRDCNVBq2UnMiNmwtr4jGLO0TCkEwh
 0j3bqDcS6Y+YEgFxVujMYIONjTVyiJhMyHUKbJ25D7tjBTe+1HX2mAOyuAlfcDzxHaf5
 fwQexeri5SnIxOSA7J0kHMz6FU8BnZRX42TbJoEOjv5bN0SjwpkRZy+E8IZWOIVC4UYU
 NIwpnGQi79XR8S50RarNgpgIU40dcowUMO2wK1xS/EyMF/TFGeK5ekBlK+Ru35gigFML
 lbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zPz2JDY4qZl9EO9V+0iDtCjid2U+jmokq/nSA43V4JA=;
 b=tiK1RL0K9fuecAsAVYiQRz2yh+KxgWNhM4CIN2bI6iSfRRP4SQDvai8sF3yaTMaoko
 sg6qAa3d1nt2fMT5VA4/d0PM7rM0dEptZ9mTxAV9TQLJXVvRrLKeXqJTmPMox/Hc58Yg
 pVZWrSaxgYx6OTYhBgOOMTsuIEwOHeMu4RDYF6jvxvkVSSOwtz41H+bqO8DhKJbjdEFF
 NlgT1AhcjjBuxQ2bSYE/l4I9AccnhtRVsit6Pk6XQ6++whI6LeheKWAPlJe+SORYNzyU
 kLvtqAOcx+CNJTfkAGkJUiKYi2wM+lcdpPDr2TejS9O87TBCIEGjbE6PFhR5jSr0hWp+
 vyIw==
X-Gm-Message-State: AOAM533viyuYfSelptzqbz86y6C0Ufq6F3/ygQzJQmxT49+0lMTUhGq+
 y0Du/X9IE3rnKj6gfKETJiCdRqtLRjs=
X-Google-Smtp-Source: ABdhPJy8T+PVD7Tu0SMcSPI79lQzZY1uHEzVY397hkzJoQuSJFvxWg7CwaDn0LAgVIeU0iGP6Jpr5Q==
X-Received: by 2002:a1c:c244:: with SMTP id s65mr3770884wmf.96.1616160371326; 
 Fri, 19 Mar 2021 06:26:11 -0700 (PDT)
Received: from localhost.localdomain ([102.47.92.134])
 by smtp.googlemail.com with ESMTPSA id v13sm8889584wrt.45.2021.03.19.06.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:26:11 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] virtiofsd: Changed allocations of fuse_req to GLib
 functions
Date: Fri, 19 Mar 2021 15:25:20 +0200
Message-Id: <20210319132527.3118-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319132527.3118-1-ma.mandourr@gmail.com>
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the allocation and deallocation of fuse_req structs
using calloc()/free() call pairs to a GLib's g_try_new0()
and g_free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 1aa26c6333..ba20c73778 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -106,7 +106,7 @@ static void list_add_req(struct fuse_req *req, struct fuse_req *next)
 static void destroy_req(fuse_req_t req)
 {
     pthread_mutex_destroy(&req->lock);
-    free(req);
+    g_free(req);
 }
 
 void fuse_free_req(fuse_req_t req)
@@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct fuse_session *se)
 {
     struct fuse_req *req;
 
-    req = (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
+    req = g_try_new0(struct fuse_req, 1);
     if (req == NULL) {
         fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate request\n");
     } else {
@@ -1684,7 +1684,7 @@ static struct fuse_req *check_interrupt(struct fuse_session *se,
         if (curr->u.i.unique == req->unique) {
             req->interrupted = 1;
             list_del_req(curr);
-            free(curr);
+            g_free(curr);
             return NULL;
         }
     }
-- 
2.25.1


