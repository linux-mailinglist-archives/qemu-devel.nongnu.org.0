Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F9623BCE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot10j-0002Ou-JG; Thu, 10 Nov 2022 01:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10X-00029K-JC
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:50 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10W-0000JT-9j
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:49 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 130so859927pgc.5
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAOm4xAwUIMS3nIWuITf2mBCrb5XaCIFaM5bi4ZPZPo=;
 b=nowE1IAA3TGJ2TwAu946s1Mt5gRJ4WGCCeomIEZ2aw6iXrsh7KC7oG83L7z7jzy/NR
 YFglAZm/Cv/A1CBKViAsr0k5QuhF8zC8gWCXHenDZXkTE2auK3xvczb9WAt+iTbF5HSE
 blEk20WqLHxh1WNBY5guI8BTPR5RriHNsuu+lGzXqjuSMsAnJl/s+7DIiutcV7bhmJyG
 bG5KlZeOmoJUs9rZNXfPe/On20/9Ji9Ad7XMK82WhE+1X5AcdDKnU4kYFLn4lT8NVzh+
 b8mbwdCH9XJI128sMewCCTNTza/khpSj32KMB6zNR1BMU7DXv3M2u3TL+Cv1BKcRfXA4
 A0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAOm4xAwUIMS3nIWuITf2mBCrb5XaCIFaM5bi4ZPZPo=;
 b=nxK7aU0FX73+NgBmvm86LQu/3GoBgocYnRtX9ulsIwe16whtqu6juQLuarIc/h3T+N
 KiOZFm982kQsBIeIi38E97QVRx8vdwFN59GzH2uMPH9+13go2OwNhIq2wSbHsito0SZ1
 oGtg63uOkfoxb6K7vz6QiDWkrA6DXzQTwxGZZg6SLQxEnLz6taRZq4/AEr9v62/ZfKPw
 Mlsz+kHzigTXD7VCIHxeSCi2ilU3P0CLpHVXrfmQjo0Z+ZO4FbPlgioVb4I0LrXM7/qH
 d41x+5eIVAw7pYDqGvl92KpJhrusRpMX3JAHlLn+5aqqZk1t90DHuh2lC2U9n4jX2P2P
 f3Yg==
X-Gm-Message-State: ACrzQf2E4NJUrZQpNHxZQg3i39fxVcjkJRsKT5D2r/qS5ymrbtL1HXhw
 UyXzmfNBHvSQ3ZbYCEjAlRekx2xQybatvMm1
X-Google-Smtp-Source: AMsMyM5PTsKrxbLLp9LfQTSdR8AfANj1OgYxTAajCmDAVBnDihDZEGjkMEWxl0sP8w5hKE5y3fiYmw==
X-Received: by 2002:a63:4b5f:0:b0:43c:428d:507c with SMTP id
 k31-20020a634b5f000000b0043c428d507cmr52328556pgl.607.1668061547445; 
 Wed, 09 Nov 2022 22:25:47 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090ade0400b002108cabbe31sm2289003pjv.9.2022.11.09.22.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 22:25:47 -0800 (PST)
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
Subject: [PATCH 07/10] virtiofsd: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 15:23:26 +0900
Message-Id: <20221110062329.13363-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110062329.13363-1-akihiko.odaki@daynix.com>
References: <20221110062329.13363-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


