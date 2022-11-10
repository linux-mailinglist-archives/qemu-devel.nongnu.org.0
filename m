Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C354623BDF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot10o-0002WB-Ph; Thu, 10 Nov 2022 01:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10c-0002MH-6l
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:54 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10a-0001bI-LX
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:53 -0500
Received: by mail-pf1-x42f.google.com with SMTP id y203so1029496pfb.4
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1uEBjaTElDdg0Zg5fYZb2Jay1kxJRBlw3oI5Sxs4u+Q=;
 b=D5xo8sPosWK2ntf5I3cR4vD2TXYL5XzKO9qL+N684tiwulV+W14CTiXN3dxv57sZvg
 O2Xre5SxtvF2IwBIPbL4hiJaLWMn8rOzNnFeXNBK19ey3sdVdI0l4LFY2jPwcfK+X3p8
 T6gFow8JD7lhLHe1UVgg/J8eTtEHGKU5eME9rP6HvaAO9Z9NaYdcCJgXg5exBYeAHBRL
 1LWD3PQkDNrUrv7qyaxsb39qojhggYRdmPBr0eh+luzmmkj3pto3aIr07w4HLycrwrau
 NUA+RN0CqJrGc6WrYso7a64w2VrfMRsn9626gT6tk8ZoTQUC3IQr6Cf77nT/lfrkNjEJ
 0yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1uEBjaTElDdg0Zg5fYZb2Jay1kxJRBlw3oI5Sxs4u+Q=;
 b=clWkjORXcUMQbWoeaNpY/Ue6sL1YK10RdvUPvfEnQnZfh3dgQ6VytGPE57KL6xOtwC
 BnW6cASLBmaNs81ccOrKmNpp2Vd/p4O03jdPtfsquVF+azmoWZNnJLjZzgr+yEsO3DFt
 YRT9CUj7iCVSZL5ieyavwfqAZkeAT4fEGEWpUgdhg9vsF/kV/aHbL7Shf/IXW8ulSlfC
 AuEdSwKnFCCS+60tg3LaaUsTpHspHiplvznppzeR65otQhhuCandsuFptBwY1RAhNDwE
 DbCFrDkzkVR9JIiBakMQDsVNATU7CWoKqQmCA4kW+MHS4zTWrZqUZ+a8j0OWHOT0RmJs
 p2Jg==
X-Gm-Message-State: ACrzQf1gWFvrStRig4Fh3eK0qMk6poKHef6st+k4yN4jUcdtwXAcmN4j
 2iRsSpB2CiUgkaYFpPCDYn6LPRS9XxENqmwR
X-Google-Smtp-Source: AMsMyM7awpAt7muj1b0FeHEnEJupIioVE04BCWOQlgv2/+Gg0LRGcl3x+9pkaaS6UsrtOaogDSs5gQ==
X-Received: by 2002:a63:d66:0:b0:46f:8979:30e2 with SMTP id
 38-20020a630d66000000b0046f897930e2mr50248204pgn.348.1668061550947; 
 Wed, 09 Nov 2022 22:25:50 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090ade0400b002108cabbe31sm2289003pjv.9.2022.11.09.22.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 22:25:50 -0800 (PST)
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
Subject: [PATCH 08/10] module: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 15:23:27 +0900
Message-Id: <20221110062329.13363-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110062329.13363-1-akihiko.odaki@daynix.com>
References: <20221110062329.13363-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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

qemu_get_runtime_dir() is used to construct the path to module upgrades.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 util/module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 8ddb0e18f5..50f52b7232 100644
--- a/util/module.c
+++ b/util/module.c
@@ -279,7 +279,8 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
                              G_CSET_A_2_Z G_CSET_a_2_z G_CSET_DIGITS "+-.~",
                              '_');
-    dirs[n_dirs++] = g_strdup_printf("/var/run/qemu/%s", version_dir);
+    g_autofree char *run = qemu_get_runtime_dir();
+    dirs[n_dirs++] = g_build_filename(run, "qemu", version_dir, NULL);
 #endif
 
     assert(n_dirs <= ARRAY_SIZE(dirs));
-- 
2.38.1


