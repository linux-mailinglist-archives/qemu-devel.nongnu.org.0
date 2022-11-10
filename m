Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDEF623F70
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Su-0003Ft-O4; Thu, 10 Nov 2022 05:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4Sk-00032b-Lw
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:11 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SV-0006Ve-OH
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:10 -0500
Received: by mail-pf1-x429.google.com with SMTP id v28so1513576pfi.12
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2AW9NaqdulAEV6U7rG6cnfGeNB8asIOOIZhmyN9/Ug=;
 b=NcGBjK6iyNz8mbLlRATavsp9N4j1RA3RBjfTN13/JrJUxwt328n79tCMhlcuniDvdB
 JmBniN7GU93gW+iaZJmfHpyjMHqZEJ0ZClGF/5W6qQTpl2aDnSytsncv/kJw6+mXHZ2d
 /wESlJ0Gjk/dtM44Y3BPKZSJvvylMBwRF664QNIYqPKw/U+/6vFY96ph/vy4BEh907Oy
 pKEZssVaxoFkme2tBnhUhiEx5RuHNMQzbBvdwPVK/xmnv42QuVVThv+5m+tnYTqa7Obv
 q3sFezr3WVr+Kh/LiWvJcOjxz28iE7/nnYgf8NI+hKn/xashnSinZhg8aJ5cy7DtPdpX
 zRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X2AW9NaqdulAEV6U7rG6cnfGeNB8asIOOIZhmyN9/Ug=;
 b=W4MEm6HKbkPc7f6+fglMVK6VCb9UkY/BphPpFlDNxXE3TkDgHPNo6Ftt4RYETdLjxJ
 DMHntcbw7hNL/tTvLRYs1MiJNd1UyO5Bkpm9MgOwHnly+Lx0zbcOgBtLUZLzW7q2UQGY
 WdZOvyVFeQp3yoWFx9G3cAXzELx4eCzjiTeMw+tWwfuoW0U/ELg5DIFD6Y1RtQvT9nhw
 8guztoVul3/b5mls9gBlO7rMizduNsFq0Snh8+X8sdL+v1jLgbHCmg5qkObdtgChKSJO
 PZPiZfamPur9DQX3vDFt9aUMs9xXhvBh/PhqRi4SlMZRwaJtJzSOz5HTaS5Uqhyx414G
 AAFw==
X-Gm-Message-State: ACrzQf1EZqHAeojo4g1hAXNUjvsgZTjlz+62M2F8iQdyTqw3oc9yHKZb
 8UDAnTec8SZ/LeSOz4SW60E5mSgtustA62Oh
X-Google-Smtp-Source: AMsMyM53XSkdl44VjYOWRWfIwMQy8WZJPXtEnRAqRzfSFc56Fi7/4dJsCe2Cd6r+sjBXwz6DWQiBYQ==
X-Received: by 2002:aa7:8bc9:0:b0:56d:3de3:c401 with SMTP id
 s9-20020aa78bc9000000b0056d3de3c401mr2301211pfd.6.1668074814111; 
 Thu, 10 Nov 2022 02:06:54 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:06:53 -0800 (PST)
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
Subject: [PATCH v2 05/10] qga: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 19:06:24 +0900
Message-Id: <20221110100629.61496-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

qemu_get_runtime_dir() is used to construct the default state directory.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 qga/main.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index b3580508fa..dc875079f0 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -46,12 +46,11 @@
 #define QGA_VIRTIO_PATH_DEFAULT "/dev/virtio-ports/org.qemu.guest_agent.0"
 #endif /* __FreeBSD__ */
 #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
-#define QGA_STATE_RELATIVE_DIR  "run"
 #else
 #define QGA_VIRTIO_PATH_DEFAULT "\\\\.\\Global\\org.qemu.guest_agent.0"
-#define QGA_STATE_RELATIVE_DIR  "qemu-ga"
 #define QGA_SERIAL_PATH_DEFAULT "COM1"
 #endif
+#define QGA_STATE_RELATIVE_DIR  "qemu-ga"
 #ifdef CONFIG_FSFREEZE
 #define QGA_FSFREEZE_HOOK_DEFAULT CONFIG_QEMU_CONFDIR "/fsfreeze-hook"
 #endif
@@ -128,12 +127,12 @@ static void stop_agent(GAState *s, bool requested);
 static void
 init_dfl_pathnames(void)
 {
-    g_autofree char *state = qemu_get_local_state_dir();
+    g_autofree char *run = qemu_get_runtime_dir();
 
     g_assert(dfl_pathnames.state_dir == NULL);
     g_assert(dfl_pathnames.pidfile == NULL);
-    dfl_pathnames.state_dir = g_build_filename(state, QGA_STATE_RELATIVE_DIR, NULL);
-    dfl_pathnames.pidfile = g_build_filename(state, QGA_STATE_RELATIVE_DIR, "qemu-ga.pid", NULL);
+    dfl_pathnames.state_dir = g_build_filename(run, QGA_STATE_RELATIVE_DIR, NULL);
+    dfl_pathnames.pidfile = g_build_filename(run, QGA_STATE_RELATIVE_DIR, "qemu-ga.pid", NULL);
 }
 
 static void quit_handler(int sig)
-- 
2.38.1


