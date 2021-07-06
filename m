Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEBA3BDD5E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 20:39:42 +0200 (CEST)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0pyv-0001qK-Uf
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 14:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0pxL-0008MZ-Mj; Tue, 06 Jul 2021 14:38:05 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0pxJ-0000zd-Ij; Tue, 06 Jul 2021 14:38:03 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so2464782pjo.3; 
 Tue, 06 Jul 2021 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ffCk50hWUkyWvK8QDyVZzHqvyd325QoeTJHdY7DLtik=;
 b=eadRdj41ZdNtWV/HfPhucDyHF/Ac+IHoDV895qOHxXnpBSltGgvEjoityJrstcr3iI
 zs2/SebdIpuwNTeGRFllAaTooGDpPe/rJU4yyUQ5EW2e5h0ZrJj/NF86S0Sisvu293+2
 m2vNGWt5fl4o5jZy96dOMBxFsQEKGZTIOTO9KVSU4Rphl6fwl+326Vh089Xe3PJh2056
 ETXfYdEvbg5UghcbDypzHkoj14qoh46GlchlGKtNSvoe+iRf7G9sBKPQb1KTtB42L31t
 Kw6UvydMgYYlTyNB8YHecsbYFXMnx1yc8FIP6ecaaXZhI1l7kdwH+yZzWEDXrvs4AWwy
 8iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ffCk50hWUkyWvK8QDyVZzHqvyd325QoeTJHdY7DLtik=;
 b=ncvOPoaGegnpoIsmwppnODl1KVLRoB2KfxdvAT8Qucymk48f5u+17d4HTnmpiht7bv
 EU0XKJDfd1+gQw0xVNeWT9NP0TNQq8zTRgvjanoyBy67cfamC7c4oqa71PpSukiQ1/2F
 JTpHO8yAfT0alFL9kV1SKO5ToQ4Iv+81Qllg910nx3F1oC80A2nvDojZAosIPG308Vde
 W6t1AqFrOwHsHItQ2N27f+hfuYBYJqua/AXtqU5VemwGiUj01WRb4dwTNUb5seCfx0Bd
 7tuKhqcYy423HSrrxyozjnpsaIGjRBTPNY1nhUZ+IYqla4+JsKMfkHNdriRAmxkbNS2o
 SjKA==
X-Gm-Message-State: AOAM5338hQ46htM2qwGIOM3cE66gnGpwM4CzkYwe5ZzmWRvRFxpArneT
 +OaibZDY9yiYSlJ439djkBNQj+4L8IxdOQ==
X-Google-Smtp-Source: ABdhPJwcp35oPtRNBfExC3jujyqMwk1aeIcj+TNc4WiszMVuVgCFlcH6trbxsLBh7vSd7HGbPkK+7Q==
X-Received: by 2002:a17:902:8681:b029:127:9520:e191 with SMTP id
 g1-20020a1709028681b02901279520e191mr18018615plo.56.1625596678337; 
 Tue, 06 Jul 2021 11:37:58 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d4d3:49e8:7217:8fa3])
 by smtp.gmail.com with ESMTPSA id 11sm18914813pge.7.2021.07.06.11.37.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Jul 2021 11:37:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] block/file-posix: Use O_RDWR for locking on macOS
Date: Wed,  7 Jul 2021 03:37:46 +0900
Message-Id: <20210706183746.7878-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_lock_fd_test always returns 0 when fd is not open for writing and
exclusive is true on macOS 11.3.1.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 block/file-posix.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index b3fbb9bd63a..017fbc6b055 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -130,6 +130,14 @@
 #define RAW_LOCK_PERM_BASE             100
 #define RAW_LOCK_SHARED_BASE           200
 
+/*
+ * qemu_lock_fd_test always returns 0 when fd is not open for writing and
+ * exclusive is true on macOS 11.3.1.
+ */
+#ifdef __APPLE__
+#define RAW_LOCK_WRITES
+#endif
+
 typedef struct BDRVRawState {
     int fd;
     bool use_lock;
@@ -638,7 +646,11 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
                                                false);
 
     s->open_flags = open_flags;
+#ifdef RAW_LOCK_WRITES
+    raw_parse_flags(bdrv_flags, &s->open_flags, s->use_lock);
+#else
     raw_parse_flags(bdrv_flags, &s->open_flags, false);
+#endif
 
     s->fd = -1;
     fd = qemu_open(filename, s->open_flags, errp);
@@ -1004,6 +1016,11 @@ static int raw_reconfigure_getfd(BlockDriverState *bs, int flags,
     bool has_writers = perm &
         (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED | BLK_PERM_RESIZE);
     int fcntl_flags = O_APPEND | O_NONBLOCK;
+#ifdef RAW_LOCK_WRITES
+    if (s->use_lock) {
+        has_writers = true;
+    }
+#endif
 #ifdef O_NOATIME
     fcntl_flags |= O_NOATIME;
 #endif
-- 
2.30.1 (Apple Git-130)


