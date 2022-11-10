Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D412623F89
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Sv-0003Lm-Sk; Thu, 10 Nov 2022 05:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4Sg-0002xt-0U
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:09 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4Sd-0006Wo-Kp
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:05 -0500
Received: by mail-pg1-x52d.google.com with SMTP id h193so1325716pgc.10
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAOm4xAwUIMS3nIWuITf2mBCrb5XaCIFaM5bi4ZPZPo=;
 b=FzX5sSAo1Yghg/9iJmCKRz6A0J0oBZyMFd7GIvtQkSc0AtS+KpbwVYSKQ0JviepakQ
 dSCZ1fwzZvpS/VyYyQtQBe37/PW7POcjekM7H2TK+YpEpxCpGspq1RwJVwTGQxZ6Z/Im
 GhWOPYgQbGPIf5Oq/Asbc3faa4temdUQpuUARn5A7CXA0Xio6L6nmI+HJBdtocy5+rMS
 5navhqpgfZpgapSPGqmknLkhvDH01TZV6hxW93pfT3vYD3yx/I9e7Khrq9GaRV+0SB1S
 e+jBx3++sqv8HcX+vta9efK+01F6sMPI8L29yK3U6JNPf8t+BUC2blqIXnDQrz0rtzSC
 9lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAOm4xAwUIMS3nIWuITf2mBCrb5XaCIFaM5bi4ZPZPo=;
 b=wyt3sN31jd+eVtLOZ3L2yf6GePwZG77QQ2wawhja+3txifOf0EdZafA8PbHG6mJePq
 p/rUj2r+mJJGWvbTkwEeS0WIKkSundAkLSBexH3KJ7CaOuy4zavMiNXzl+I4DWS11PKu
 tKndXds3aRXPj7s3GKXn86TQgDIETmDGYiKkU5UvnYBLOG5zkVSrSPvlE1Qn51BAiMX1
 K18j36d7iqhkb9V8/Q3YHB1hFY4nh8HORho/XwkJN+bqcDPo53IaWpg8blMNvnUIFQmR
 7EwhUGgHfPg9CUU2M9LAD0MSzZdggYUWl0QZGOtF2mAQLwnLLsLQib0Fc+M28PImu8oa
 dGVA==
X-Gm-Message-State: ACrzQf2a8Gr3onsJJ8GAZFs1odesoLBuvR4yunJFN3DAB2iWmifwJISf
 xfNBK9WooMTlnzU7rjma17paPi57u/qfmiPQ
X-Google-Smtp-Source: AMsMyM4TyVnAG+CPyw3qO98UboKFICZ+4vOHPJM+KKopATlB/0WjzWFE2sc/56gzt73n49DaQFQwJQ==
X-Received: by 2002:a63:e348:0:b0:46f:25cc:d554 with SMTP id
 o8-20020a63e348000000b0046f25ccd554mr55884639pgj.598.1668074821018; 
 Thu, 10 Nov 2022 02:07:01 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:07:00 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Yan Vugenfirer <yan@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 07/10] virtiofsd: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 19:06:26 +0900
Message-Id: <20221110100629.61496-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qemu_get_runtime_dir() is used to construct the path to a lock file.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tools/virtiofsd/fuse_virtio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 9368e292e4..b9eeed85e6 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -901,12 +901,12 @@ static bool fv_socket_lock(struct fuse_session *se)
 {
     g_autofree gchar *sk_name = NULL;
     g_autofree gchar *pidfile = NULL;
-    g_autofree gchar *state = NULL;
+    g_autofree gchar *run = NULL;
     g_autofree gchar *dir = NULL;
     Error *local_err = NULL;
 
-    state = qemu_get_local_state_dir();
-    dir = g_build_filename(state, "run", "virtiofsd", NULL);
+    run = qemu_get_runtime_dir();
+    dir = g_build_filename(run, "virtiofsd", NULL);
 
     if (g_mkdir_with_parents(dir, S_IRWXU) < 0) {
         fuse_log(FUSE_LOG_ERR, "%s: Failed to create directory %s: %s\n",
-- 
2.38.1


