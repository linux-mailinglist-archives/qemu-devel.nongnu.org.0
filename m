Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87F33471E1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:51:40 +0100 (CET)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxMh-00047Y-Lu
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lOxL3-0003JW-5J
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:49:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lOxL1-0005EX-EE
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:49:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id j18so23256012wra.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 23:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DzccFn9iM+66nmFROYEwpA55RtBy7+FO6X0SyyckR1E=;
 b=PnUe8t5ngjH9CL3QXyqfBCWP831bTMpb1/JVzq3AeG1OO/oK47G2rCWFUu7XbgNBro
 KCHBRTC7mjmJrYvG8apOhoYSYkTE8NTaTG3w4YzhPbwIn8rKkSDnsc44HJaMBj08Lj0I
 MQ1X2tG+QzvtS0w64fTKwM0vdhY7jGSqVQ8285W56hmtdmN3zNgReV0VpGHpSfwQjIqS
 Xj4dA7uWScBxaq0/TSojIwF+IF2b5SYRAy3gOjSdhJPf3rVLMc41YaNy81PD4r8eWEn9
 ffYyHG6Z+mDJhPmLJao7Xnq4KPOU3FkDXbyZ0fiP9JCFkgTPWnBqT18Bih0lNcVifsun
 Kkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DzccFn9iM+66nmFROYEwpA55RtBy7+FO6X0SyyckR1E=;
 b=orXqrPiHO1bcuxPEPef1CLY9zf22RIJ/0LWq8nmTWwHnGbv/IN3YMFxv9JhMhQ8PsE
 9iYh/7zYEb4fqltYuMNrHBHmpjv5nTZm+Ypj6NFRG2GFntJTkvirz74x4OLWByoI0AOV
 uxuTBlhOYojribiSMnmCiaXrg06SFO3On1qa+BJt5XjsJ9np33z3LhOBmacpbUm3EY9R
 yR/9zdXtSOl2ZW7W1Pnp/71bY6dfmXZOO3hz/Zq/s1iLeMYfBTkxB8ViN8g/qtMsWqNw
 1DhqTZp6sTuMWdnqcxPv0iIxDn4ezChMdFAVP50NFNyh5ldVczRL/3xIHxrHE8qERJLS
 eVIA==
X-Gm-Message-State: AOAM532ankEuVzh1ELTqgTed63uDa1SmCGOYX3ez47zo/AgwZIw4XAHk
 QvLokYLy50mf7BX/4rB55H9desVFDw8=
X-Google-Smtp-Source: ABdhPJwIwo2bAfqeDx+F2inw3klWkq3N4ltWNzg6LEjWS93fg6fzGUPEEtI2d8allYdIRI5nUi/6Vg==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr1705312wrq.39.1616568592131;
 Tue, 23 Mar 2021 23:49:52 -0700 (PDT)
Received: from localhost.localdomain ([197.61.14.200])
 by smtp.googlemail.com with ESMTPSA id b17sm1739046wrt.17.2021.03.23.23.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 23:49:51 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtiofsd: Changed allocations of fuse_session to GLib's
 functions
Date: Wed, 24 Mar 2021 08:49:43 +0200
Message-Id: <20210324064943.35827-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x434.google.com
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

Replaced the allocation and deallocation of fuse_session structs
from calloc() and free() calls to g_try_new0() and g_free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 1aa26c6333..54e401f074 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2476,7 +2476,7 @@ void fuse_session_destroy(struct fuse_session *se)
     free(se->vu_socket_path);
     se->vu_socket_path = NULL;
 
-    free(se);
+    g_free(se);
 }
 
 
@@ -2499,7 +2499,7 @@ struct fuse_session *fuse_session_new(struct fuse_args *args,
         return NULL;
     }
 
-    se = (struct fuse_session *)calloc(1, sizeof(struct fuse_session));
+    se = g_try_new0(struct fuse_session, 1);
     if (se == NULL) {
         fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate fuse object\n");
         goto out1;
@@ -2559,7 +2559,7 @@ struct fuse_session *fuse_session_new(struct fuse_args *args,
 out4:
     fuse_opt_free_args(args);
 out2:
-    free(se);
+    g_free(se);
 out1:
     return NULL;
 }
-- 
2.25.1


