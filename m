Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD6255B494
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 02:21:55 +0200 (CEST)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5cVm-0001Qv-Mi
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 20:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTu-0007aF-K7; Sun, 26 Jun 2022 20:20:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:32983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTt-0000cC-25; Sun, 26 Jun 2022 20:19:58 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 i8-20020a17090aee8800b001ecc929d14dso9145995pjz.0; 
 Sun, 26 Jun 2022 17:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DhnRgF9lt7hzXqkLaTIFS4codVu1vrUHflYtD4rxjHs=;
 b=qPATO2SkgnvroTVv/bkyU1lfey30y9qzTs6pfM2osDxLNlUFdF/aukQ9+KiiiA0rLW
 gr7VfpYQE9VzBXdK0kZ4wNt5j/ydErxy8YKHrl7A8vNqqu2LajuYdjUj+BPEu2cS5ZP+
 T3P8DTZceJTVbCypLx+LVl1gKzsoxT3+LssEdKOr9TPbizffcOhQ0ip5EGfO3fktdled
 oqUM2NxIEm5b5k8x3TwMivCnJ+OWj3zs8+h2A0vYA1kYStiMiNTbs7+LOHnDj2Wfbn2h
 RJz7CxFsKIhxQqGvqbNHjqQaCU1o3ueASW8NMbk3VXVm3oMGb6kBXKlr4an/hZVM9gbX
 VpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DhnRgF9lt7hzXqkLaTIFS4codVu1vrUHflYtD4rxjHs=;
 b=MZqoxMNih4tjGrootu8nDcsus7yn/J5eQuA/3IuE7fU9k4MkJF1mmfs6s5mCehLjD+
 D6S2D3H9REMInowi6EezpgZmjiRTRd4iocU6fxKTU9zZm+YxGZA7CpqJckV293f0tC0z
 di32SDKtXxCHrMD8vREJd+UojI0QTYvn6ll4MA7U+iM4uJW6Hpc3aMRef7l4jfAmyEq8
 q/tSnwtUcZv8O0EIcntGupOytkSQyEB3keCDAyV17OW3SeVePdkKNaaOkxWrtTm/ahoq
 FGvfKxwg0jScY0wg3VwXO7OOW43Sdyq+N3U0KtVImgFz9ztPGDfiMy6wyj10qm7qi9Yf
 +SfQ==
X-Gm-Message-State: AJIora/ZrFaBYbm/tXsCvmszGIfKwbyeBrzCPBkPzqleexOUlVGkgiRz
 xSOxmYyldrVrP78s5QyMlTcOL+dYgS7m/g==
X-Google-Smtp-Source: AGRyM1t3yfUwLJJnbeZ1PeoDUf/dtLrpAyLFfUn2BhbldTKbtr2nB37TcPpu8TCyF/DebWihqQxUrA==
X-Received: by 2002:a17:90b:17d2:b0:1ec:be52:56e2 with SMTP id
 me18-20020a17090b17d200b001ecbe5256e2mr17009057pjb.207.1656289194375; 
 Sun, 26 Jun 2022 17:19:54 -0700 (PDT)
Received: from fedora.. ([106.84.130.34]) by smtp.gmail.com with ESMTPSA id
 e11-20020a6558cb000000b00408b89e4282sm5715294pgu.47.2022.06.26.17.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 17:19:54 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v3 4/5] file-posix: introduce get_sysfs_str_val for device zoned
 model.
Date: Mon, 27 Jun 2022 08:19:16 +0800
Message-Id: <20220627001917.9417-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627001917.9417-1-faithilikerun@gmail.com>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 block/file-posix.c           | 60 ++++++++++++++++++++++++++++++++++++
 include/block/block-common.h |  4 +--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 73c2cdfbca..74c0245e0f 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1277,6 +1277,66 @@ out:
 #endif
 }
 
+/*
+ * Convert the zoned attribute file in sysfs to internal value.
+ */
+static zone_model get_sysfs_str_val(int fd, struct stat *st) {
+#ifdef CONFIG_LINUX
+    char buf[32];
+    char *sysfspath = NULL;
+    int ret;
+    int sysfd = -1;
+
+    if (S_ISCHR(st->st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -ENOTSUP;
+    }
+
+    if (!S_ISBLK(st->st_mode)) {
+        return -ENOTSUP;
+    }
+
+    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/zoned",
+                                major(st->st_rdev), minor(st->st_rdev));
+    sysfd = open(sysfspath, O_RDONLY);
+    if (sysfd == -1) {
+        ret = -errno;
+        goto out;
+    }
+    do {
+        ret = read(sysfd, buf, sizeof(buf) - 1);
+    } while (ret == -1 && errno == EINTR);
+    if (ret < 0) {
+        ret = -errno;
+        goto out;
+    } else if (ret == 0) {
+        ret = -EIO;
+        goto out;
+    }
+    buf[ret] = 0;
+
+    /* The file is ended with '\n' */
+    if (strcmp(buf, "host-managed\n") == 0) {
+        return BLK_Z_HM;
+    } else if (strcmp(buf, "host-aware\n") == 0) {
+        return BLK_Z_HA;
+    } else {
+        return -ENOTSUP;
+    }
+
+out:
+    if (sysfd != -1) {
+        close(sysfd);
+    }
+    g_free(sysfspath);
+    return ret;
+#else
+    return -ENOTSUP;
+#endif
+}
+
 static int hdev_get_max_segments(int fd, struct stat *st) {
     int ret;
     ret = get_sysfs_long_val(fd, st, "max_segments");
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 78cddeeda5..35e00afe8e 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -56,8 +56,8 @@ typedef enum zone_op {
 } zone_op;
 
 typedef enum zone_model {
-    BLK_Z_HM,
-    BLK_Z_HA,
+    BLK_Z_HM = 0x1,
+    BLK_Z_HA = 0x2,
 } zone_model;
 
 typedef enum BlkZoneCondition {
-- 
2.35.3


