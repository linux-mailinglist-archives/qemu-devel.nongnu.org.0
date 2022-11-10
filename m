Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89971623F7A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:08:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Sr-00036I-OX; Thu, 10 Nov 2022 05:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4Sb-0002xU-BU
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:09 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SZ-0006WE-KV
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:01 -0500
Received: by mail-pf1-x435.google.com with SMTP id b29so1508491pfp.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23qHkaFNj9aYRMMJ3RksdGA2UgOinYhFW/VeC2eRFU4=;
 b=wGAjvNz1Ybx65GNezzdNcfC8V9vD0cReHNxRKrc/z0FB/yisCuwU5aTnEPaF94nEc4
 OLW4wIZc5LrDd6So17Lmg0hhbEepNTyQnVjUV2H6zL1ARqqQkRHeF5dgDeeEUre8Kc9l
 K5og5SgviKNlfjwMoJA5OXzrO/w4iIQuaIooWD6XCUiCXs+ZKLainB0ovH32PIDDPJ5q
 gahHSPm/cWEMTxpRzn+N5ql41oQPjnfCQtaKw7Z29cwyCb2Q7nqywlfSk0x/pdJmpL2a
 nIup9xPmJ8LaOdipFkLzR2Sp9tpBao3bE8RhCOaUy5D0tiMxIN/N/5JPm/wKf+OWtd4z
 elNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23qHkaFNj9aYRMMJ3RksdGA2UgOinYhFW/VeC2eRFU4=;
 b=5LziTFD5ZraOfD87tsh8YV0gk0kLL8uovnBXs63mEZpn0BaSFPF/YbbEBnxwrYMG7j
 wP/dEpKWjSZ7kGt1ph/J4dGvPCudXVE3b/DBV2X/r3VTgH718w8ZLhHxcc1+SDTgwkua
 9RD74VxTX/l3IHXd7HjMqeR3seUASMGmA8/iN77UmBjBsvEpxSoOfzGAmmCY/iWH/7ax
 NcbbJN4Qzi+zIcipOoVi1PQuWKsQhzx8yQXsnev7YYfKVBKao3lhTf12zn0NzJMp999H
 z1m3Tv31VEr9YK/oWcCc/bvpePQe+oaNr4t9T/AedRN7C26DsBc9p+gHGIE+yJU3BMae
 m9/A==
X-Gm-Message-State: ACrzQf1gJWXGVw4Kii+NJHtyCe5M6kU3HpzdrKhCsA9doh5b5yU/G2aE
 Qap1AI++NQjG/aO4POXyCY58rFeKQFqtEXgb
X-Google-Smtp-Source: AMsMyM7tmK5TXzCK9EKFO1I+/THv6firtjH1Cv5SqSsQJ4j85niHuHSOhayfq9ObFpbkrOlYBPc5rA==
X-Received: by 2002:a63:1145:0:b0:46a:e00c:579c with SMTP id
 5-20020a631145000000b0046ae00c579cmr55806640pgr.279.1668074817581; 
 Thu, 10 Nov 2022 02:06:57 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:06:57 -0800 (PST)
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
Subject: [PATCH v2 06/10] scsi: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 19:06:25 +0900
Message-Id: <20221110100629.61496-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x435.google.com
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

qemu_get_runtime_dir() is used to construct the default paths.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 scsi/qemu-pr-helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 196b78c00d..adb7baecaa 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -77,10 +77,10 @@ static int gid = -1;
 
 static void compute_default_paths(void)
 {
-    g_autofree char *state = qemu_get_local_state_dir();
+    g_autofree char *run = qemu_get_runtime_dir();
 
-    socket_path = g_build_filename(state, "run", "qemu-pr-helper.sock", NULL);
-    pidfile = g_build_filename(state, "run", "qemu-pr-helper.pid", NULL);
+    socket_path = g_build_filename(run, "qemu-pr-helper.sock", NULL);
+    pidfile = g_build_filename(run, "qemu-pr-helper.pid", NULL);
 }
 
 static void usage(const char *name)
-- 
2.38.1


