Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C1623BD9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:29:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot10p-0002YU-TP; Thu, 10 Nov 2022 01:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10k-0002Rl-3k
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:26:03 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10h-0001cM-Ho
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:26:01 -0500
Received: by mail-pg1-x52a.google.com with SMTP id b62so895230pgc.0
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AC+ag6DjlMRVYIRoMVgQ7eyLCeIppVPRSyLkAkRwpvs=;
 b=kK/C+42LsThvwCQFrkDc/mlyygvLhVi9rXrMi4AupdNcFwIL30l3TblGgXUouT65zf
 kT43Tl9oVyUNICttiAsetLCSC+qT12RAG8HKz7jO7V75tfAIwLD+Re3JQ84qB/an3OtE
 aJOlIHjJDP/MqI7rlgkn4s2x19IWo1Qrpp26ypAWJMolq12i/gXCby/cUnxuFfBAP332
 KOz4Ht378jQLub9/0AoTLxVjV8NdOY3CbQAwfPsDzuji/wvn0Hgr516LxD+OQDA616oN
 EdXwVq9uN1Utc3uH7hACMMEzvWciWyEJC2rVvLgxFTbRw9xaM9hQB6XqDHQ9wFmHlLVj
 iNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AC+ag6DjlMRVYIRoMVgQ7eyLCeIppVPRSyLkAkRwpvs=;
 b=DzX/xk14nYIwx6M3C7lxdRI6syjFvMdm0Lfk2s64vfAjEMRK87QvSTCMO6UalxPrLs
 gmFsgH+2owl3HXu1X4C1ByrUDxV9U4NQ0krDmKdsKAEXHIL2zLrJiKsKo5n9cCF0AqDK
 MvO/TA+Lp0sxzGBrEvSlhiWK3Sdq7b7tx5pv5T++emK3csWWU3YWEC2yEh4wPs7GSX5U
 ddrHrLmdAPIlOWNA0d4jegR5Pt1yyiHzvxARqCY8ZlvWWNJ2GlICOz+a0ZlXdN3if5Xl
 hXWfU5MuzaP9mUSZi0RnSoEzOaQ7lu46ZMq6/Di7HWTSPlvSRMQbYLVvxU4gxAF98ir/
 R6Bg==
X-Gm-Message-State: ACrzQf3Z7o0qlZhNddnTbSoLKK1fIYqayN1ctJRdGns6fI3S7WqkmcdQ
 2JIFWTSQ8YXfYZDYKXAxETr5JbgMFKrclsOj
X-Google-Smtp-Source: AMsMyM6IAijeGYPaL6noQcBtDCehjnU2U/fk3DnEnRxCrtEsW2uCSqPhMn/t1VbJhcan3XAnB3FzKw==
X-Received: by 2002:a63:4752:0:b0:439:5dcc:fd78 with SMTP id
 w18-20020a634752000000b004395dccfd78mr52947253pgk.104.1668061557966; 
 Wed, 09 Nov 2022 22:25:57 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090ade0400b002108cabbe31sm2289003pjv.9.2022.11.09.22.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 22:25:57 -0800 (PST)
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
Subject: [PATCH 10/10] spice-app: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 15:23:29 +0900
Message-Id: <20221110062329.13363-11-akihiko.odaki@daynix.com>
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

qemu_get_runtime_dir() provides QEMU-specific fallback of runtime
directory.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 ui/spice-app.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/spice-app.c b/ui/spice-app.c
index 7e71e18da9..feb162baa7 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -145,8 +145,8 @@ static void spice_app_display_early_init(DisplayOptions *opts)
     atexit(spice_app_atexit);
 
     if (qemu_name) {
-        app_dir = g_build_filename(g_get_user_runtime_dir(),
-                                   "qemu", qemu_name, NULL);
+        g_autofree char *run = qemu_get_runtime_dir();
+        app_dir = g_build_filename(run, "qemu", qemu_name, NULL);
         if (g_mkdir_with_parents(app_dir, S_IRWXU) < -1) {
             error_report("Failed to create directory %s: %s",
                          app_dir, strerror(errno));
-- 
2.38.1


