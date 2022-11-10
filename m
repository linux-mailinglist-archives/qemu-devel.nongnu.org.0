Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072DE623F7D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:08:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Sv-0003LT-Ok; Thu, 10 Nov 2022 05:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4Sq-00037R-58
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:16 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4So-0006Zp-5x
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:15 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q9so1539652pfg.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AC+ag6DjlMRVYIRoMVgQ7eyLCeIppVPRSyLkAkRwpvs=;
 b=Rg2YfPcHB9D9stGXkj+2qQcpiHgjKDmcb3ss4c6FOkou+38XkDHiFgJFCky6oztAEP
 t1dHuEGNlAwA9GZV6wru04vjq5kAFU+zqdMrL/UUG3JFptzRX3uhc1RUNewgc8NH7QcO
 ZL+JEzsP5bMu149evctM+f9NszU+6Dt/0xi45LTD34VhdXQgdqWoBXTHxzq/kEdYevZH
 qZv7nryajoDvjRGTsJlEsOfZ2RozmWjERANZ0xW1Zmn5qwmxSBbBFsuYWBooVapJTebS
 0W0QvqPQ0bjWO9CuyRBQxuw94/fBy4fKfkTM1IqizZXghSe30mXMD+pOSvo6KzpJ0UZP
 H3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AC+ag6DjlMRVYIRoMVgQ7eyLCeIppVPRSyLkAkRwpvs=;
 b=vd9yt0uFtpmISsnv98ovbOFZSrUXAR3yFXiQDa2gQyJVX8750iIkiNaNiEOhIQRWtn
 3wcB2jIkybrZorxokF73Q54Kl4uz8CEA8xYIW9V47ClCREF2I+o/WRon8iAKp9SjYMzl
 DSX1I8JtGHszypH5OIQ2ien0R8Tc+DPv9NRq1SI/WiIFP/A4k77GwxndM46ZCgizY1Y6
 UKcgPeIKSYlOQ3boi3+Pr5fULGI9AZYUADAsh/a9ILtMi6acO2GzTnQDR1CDy2IHMpFU
 BlX8TZ3CCjKfpiKv6mYAWrrFOTilAeTJG4N5CJGwCCth/XWeDNXK9DHkVNa6cA0A9caS
 7tvg==
X-Gm-Message-State: ACrzQf0SaHymgwp8LdTkuXfMEXxBH710Q2YKXkEHzdsYn4jlZWKmsqYw
 y5mp2ZkqIs13vgBw4FmOVSobgqWF/KEAI0TA
X-Google-Smtp-Source: AMsMyM5pBZrZ5K3eStDgapu/lg9PW8UzxvfKaGomPOEfHXFEvcNCotFHUglP/f2Q9UI74kKc0UEgsA==
X-Received: by 2002:a05:6a00:4c16:b0:56d:2634:c28e with SMTP id
 ea22-20020a056a004c1600b0056d2634c28emr61140475pfb.8.1668074831409; 
 Thu, 10 Nov 2022 02:07:11 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:07:11 -0800 (PST)
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
Subject: [PATCH v2 10/10] spice-app: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 19:06:29 +0900
Message-Id: <20221110100629.61496-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
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


