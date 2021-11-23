Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED37245A37B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:12:07 +0100 (CET)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpVag-0002xW-Ku
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpVYA-0001iy-RK
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:09:30 -0500
Received: from [2a00:1450:4864:20::531] (port=36608
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpVY8-0006Gy-6h
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:09:30 -0500
Received: by mail-ed1-x531.google.com with SMTP id z5so92112658edd.3
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 05:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+uvHFs+Na01GYejBTKeXryWI+qPBrrpX9VAzNs9m3s=;
 b=C4J0pcNbPbwfBb23bJOIs33mQ5UNYvmF2SPiHpAlTG5QmgBZ/0x5aQBn+Zdt/9McdA
 1EV64P9aYr2CEF7+bLiiwvD/CNIJXmUfI6UEmtfqPKZAJBJF4ILOLELC/CCsGA9Z8Fre
 CeaINF0XVvEdLYMmWUN2Uw7/4LXQaovImyIcl4c0wNPfT7vteBgwAqtQ1n4wGwHexYTI
 jAHEgd3Y/Z1HFOhGaOhgutbr8dIP5BENJtarGpwiw0SB6BvZRUyt0ojXG/ocP6WrHKuo
 lNBT3aGX1dm6BHSdoCV988G46Uq3455NdQgFXUzaSKTxWqO1/ZIZ+usOt88rcQSYemSB
 4hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=e+uvHFs+Na01GYejBTKeXryWI+qPBrrpX9VAzNs9m3s=;
 b=TSxmj7eM181YK81XUy+HHG4lc8fWUnEqAi1OdecsHdkr91VEmEojDWvXcc8XvYTyiv
 5EJV97gcp9UpW73v0uTsYo1Rdqe8S2LxC8C6ewqMyuRZT6Tv2KBAoXkB0zO8MccGmTAs
 mdfDKY5eG5fCa5BKNJCyBBbrOvGiZmWNHnR4nyvKQPTiBdObcdGmMP45tDYa/w1XeHS1
 uFv8ZZwEZSyrHOOBYPnSPsVXcQXkJNLdViWO1jFYRwmz9kIaL+ZrHz93P7BhdTvnqBhc
 Y7zNUUflQpn8cOhUX1cx3F9SwOSRsDEE2z1zLGsMvnl40TQM29htFHFL16OpTp2CGR+d
 rG/g==
X-Gm-Message-State: AOAM530FmAsOgzIQ66bDr00CbhteMyEnlK1CIQHTPsapvu4gVGzXBQIe
 3AQQe8QtxWoqRL8D1BLZRTNwtmyAzWk=
X-Google-Smtp-Source: ABdhPJwqm+dNxTiwKrDRTTq4nPT8bR1K9H4xW/WZC/qx67LYpDlIHoznwNqgpgR/QATB5vjwVnDHxQ==
X-Received: by 2002:a17:907:2cc3:: with SMTP id
 hg3mr7715666ejc.452.1637672966602; 
 Tue, 23 Nov 2021 05:09:26 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 z6sm6080710edc.76.2021.11.23.05.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 05:09:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] chardev: delete QemuOpts when a chardev is removed
Date: Tue, 23 Nov 2021 14:09:15 +0100
Message-Id: <20211123130915.390848-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU cannot add a chardev with the same id as a previously unplugged device.
The root cause of this issue is that the QemuOpts is still registered,
causing qemu_opts_create to fail.  Remove the QemuOpts when a character
device is removed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/chardev/char.c b/chardev/char.c
index 0169d8dde4..d46b307830 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -277,6 +277,20 @@ static void char_init(Object *obj)
 
 }
 
+static void chr_unparent(Object *obj)
+{
+    const char *id;
+    QemuOpts *opts;
+
+    if (obj->parent == get_chardevs_root()) {
+        id = object_get_canonical_path_component(obj);
+        opts = qemu_opts_find(qemu_find_opts("chardev"), id);
+        if (opts) {
+            qemu_opts_del(opts);
+        }
+    }
+}
+
 static int null_chr_write(Chardev *chr, const uint8_t *buf, int len)
 {
     return len;
@@ -286,6 +300,7 @@ static void char_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
+    oc->unparent = chr_unparent;
     cc->chr_write = null_chr_write;
     cc->chr_be_event = chr_be_event;
 }
-- 
2.33.1


