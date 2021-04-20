Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A537E365CA8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:51:03 +0200 (CEST)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYseU-0003Oi-KI
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbD-0001hh-Rl
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:39 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbC-0003OG-7O
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso9055529wmq.4
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgqSWgggc8NIZdLGsTHPcESqoSDlIYTq+9ZXTSuDuJM=;
 b=Y0f6hvJ0sVqlSteHNXY/4E5fm99CdPtRNXoq0VC6btvAStVgjT+0haXKmNT2VXzbD7
 uICpGraQRHxynoRak714mcQDoJKeW+VL8HKjoXQfB3MDCpUEBv3Rldab3FrH5ZRyjyiX
 RcUYZa6Ra8SF9wj8acoGtm9MPx+wuFFAQtaWvB9i7RVRkTecK+BJ2KgZbWwhcQZvTBhp
 L/xi6eJES5/tr8Wryd0M1XK0vniR+T6BvVOMAQfUDOTzfjf58LdIlJ94rD/400yChGAP
 VjKK9DPMW+dXbfPNBRwG9a+/i2Kk1dfX4Q96xPRc7tE9vrX+qzxcMaYc9FaZFfDN01YK
 NQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgqSWgggc8NIZdLGsTHPcESqoSDlIYTq+9ZXTSuDuJM=;
 b=GP218E2O0xsF9wsxctBTJUd/WmT1WOn2eGlmy4YHcZdcSaykkGyv7wvinIoKkri/nB
 ivuS4xgKLLqDy/DP9lzaYpixVCyb9/gg+ngWTBbKF/dNT2X66HiMz+Ejn7mh1iFmOQGw
 ClIQOylyHYMItsUPQ9xMeib+BSe5/cP7OTmAj7JKohxbsEODY/K5iO/kH6biLKSQ9BI3
 WTkXcIfa549lTbz95LfpC4ooia8FjQd68TTEtD7aMYL1VXL3fIou3cxriI0HOB5bLKYg
 mTPNKg9XnKv3X+gGETTqZTgjhTqfSx5wA4NcMFsyEFMb13c2Wg+oC17zighr/sRI1140
 jwTw==
X-Gm-Message-State: AOAM533R3HiPVDehUxMZQR28a5AsKbXkUZ269/wWSEwn6hNlUDIsq1r/
 QSgSj6dNQMO9J8/Fpy8iZgqy+LFVto8=
X-Google-Smtp-Source: ABdhPJzV5pmzec44tBoedxoesoVGcwAffNJ0JYlNC9Rql5uvqNDnhtbeK7D9EoTuT/MSYESbGsk5jw==
X-Received: by 2002:a7b:c312:: with SMTP id k18mr5185472wmj.89.1618933656615; 
 Tue, 20 Apr 2021 08:47:36 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id d5sm25025824wrx.15.2021.04.20.08.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 08:47:36 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] virtiofsd: Changed allocations of fuse_session to
 GLib's functions
Date: Tue, 20 Apr 2021 17:46:38 +0200
Message-Id: <20210420154643.58439-4-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420154643.58439-1-ma.mandourr@gmail.com>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the allocation and deallocation of fuse_session structs
from calloc() and free() calls to g_try_new0() and g_free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index f965299ad9..ecc20c9310 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2472,7 +2472,7 @@ void fuse_session_destroy(struct fuse_session *se)
     free(se->vu_socket_path);
     se->vu_socket_path = NULL;
 
-    free(se);
+    g_free(se);
 }
 
 
@@ -2495,7 +2495,7 @@ struct fuse_session *fuse_session_new(struct fuse_args *args,
         return NULL;
     }
 
-    se = (struct fuse_session *)calloc(1, sizeof(struct fuse_session));
+    se = g_try_new0(struct fuse_session, 1);
     if (se == NULL) {
         fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate fuse object\n");
         goto out1;
@@ -2555,7 +2555,7 @@ struct fuse_session *fuse_session_new(struct fuse_args *args,
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


