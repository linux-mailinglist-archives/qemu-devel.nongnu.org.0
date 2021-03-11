Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B38336EF5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:33:53 +0100 (CET)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHhZ-0008LC-0e
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBo0-0001Qy-Hi
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:16:09 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBns-0000kH-8R
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:16:08 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso12299019wme.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zh7uFjOqTsCIlaUk87E6M8wvUW9uAxQ0gtkrGdbYKiY=;
 b=GLQnjWoWNz7sWG+sgHcQFj+nj3u9ImsIGPk9Syukrsvs14i798Nhyqx4XEYW9llaJL
 34T2nmz1Hx74aubYsf0BvA4+aMOq4BI8hhOh4z6klaFAJsKPwgtz1P9zhlUmF2sGcF+S
 dCXT+pZEXmIs9yNW1h2P0lgFI995EGHQkuoGdJpCLyxCLyz81juQFvLIxFuc8BvZCKwQ
 saos56jV2v3hc1hC+3Te8SvcIDdfErLhZcDnYU4FbR33DBtMZBrmnrdETb7aHsnFzSzN
 utsh2higpcY4Hzirhaprp1BcxEXs2SpG3B0CNMLpjmNc+s/hJ7+jz6JYWexOYMhvm4nJ
 8ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zh7uFjOqTsCIlaUk87E6M8wvUW9uAxQ0gtkrGdbYKiY=;
 b=HNeLXZ1TaBWAk7zbO9vHauICr/6gwsK0bfMxLSbc28nEGNOOL+MblgTI8H6DLBXadx
 AFdvKHv6ppFJqTD6BpDkDnxEoYGv6v/bu8h1Jdoiv/B5Z6XXYcx/4h5JbXbLidDwxqwZ
 qZVWouhk9BV2sfpGlpPseUdMWu3DGj43Naki+Pmo+GFA80cBchTvIKcIpAqZlXngb170
 g/KLK3zFMOf7/qGDdhAyBfVPsBemTp4xOcu3KfinGBYRwAZX4naS+9Eqdy1q0sRE/UJB
 qYp9Hla/ESs5nJFMpN8BG00i6DUcY6iF8JeSpTKDG6ImZiO09S93iSR7sCDBlQjp5z57
 S1Ww==
X-Gm-Message-State: AOAM531UoAa6j7s8iP2QhSbWJQ4ytvjCheg0D9H0uZ+61xA5viIIn6PI
 6vgOc+EdAFy940Xw0T6UPliQ5PGNVbLYVPF+q4Q=
X-Google-Smtp-Source: ABdhPJxqL5vuZBrxHM/jWvEoNpCgjmb2HTFuQcvNC0VbnuH6wf3S+84zo1gSlKDU03trCOrmbqxTyQ==
X-Received: by 2002:a05:600c:4a18:: with SMTP id
 c24mr5779319wmp.173.1615432558689; 
 Wed, 10 Mar 2021 19:15:58 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:58 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 05:15:37 +0200
Message-Id: <20210311031538.5325-9-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311031538.5325-1-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:25:06 -0500
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced a call to qemu_mutex_lock and its respective call to
qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their place.
This simplifies the code by removing the call required to unlock
and also eliminates goto paths.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 hw/9pfs/9p-synth.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 7eb210ffa8..473ef914b0 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
     if (!parent) {
         parent = &synth_root;
     }
-    qemu_mutex_lock(&synth_mutex);
+    QEMU_LOCK_GUARD(&synth_mutex);
     QLIST_FOREACH(tmp, &parent->child, sibling) {
         if (!strcmp(tmp->name, name)) {
             ret = EEXIST;
-            goto err_out;
+            return ret;
         }
     }
     /* Add the name */
@@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
                       node->attr, node->attr->inode);
     *result = node;
     ret = 0;
-err_out:
-    qemu_mutex_unlock(&synth_mutex);
     return ret;
 }
 
@@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
         parent = &synth_root;
     }
 
-    qemu_mutex_lock(&synth_mutex);
+    QEMU_LOCK_GUARD(&synth_mutex);
     QLIST_FOREACH(tmp, &parent->child, sibling) {
         if (!strcmp(tmp->name, name)) {
             ret = EEXIST;
-            goto err_out;
+            return ret;
         }
     }
     /* Add file type and remove write bits */
@@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     pstrcpy(node->name, sizeof(node->name), name);
     QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
     ret = 0;
-err_out:
-    qemu_mutex_unlock(&synth_mutex);
     return ret;
 }
 
-- 
2.25.1


