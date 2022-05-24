Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B74532DE1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:55:04 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWs9-00034a-Ld
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWej-00042Z-QC
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:09 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWec-0005Lz-LR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:09 -0400
Received: by mail-wr1-x436.google.com with SMTP id t6so26286248wra.4
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBtL52cUVXRCn2Iw8uz2+J2VOEbS3hV9Ib2rQvMqV9g=;
 b=FB+WsbPWMMXudRzX/nrHkt/8nRUQMXPRKwDKsm7ykE8csKKpJ/kuARHxSrgXx08dz5
 RWNXbVpeVgNVivIVfWCV20b/ioGObn+PpBuY7UJWIANpX0Qe2tPAQlaZ9p6usidh3OhC
 pHbcUYy7/G9UY6FhD2L+mOZV5gcXjbZSd88S3p2vACVayEP1m+zypJjdlJtIlAs5dd8R
 18z+Ot/es6sS8pyT6YS6ZkDoV2hmZtQxt2GcEpRfmj2vdrw8MlFa1uyhPsmPsHTBXuRf
 qAY+eFT5TQCyXKX2m7V9vLE+2yL4WOPKgRi6QNWcirJ2oayg/P0iEGEal3aEv0EKcno8
 0Clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBtL52cUVXRCn2Iw8uz2+J2VOEbS3hV9Ib2rQvMqV9g=;
 b=uhapn9sEDSjVdKxSVb8Jy4cEnJG5ha8LOnNGkAckc6OWG2IAl0pKaAc/pm/Le9Muhu
 /BjANOHCxByaXh99yB/RRYl40qFAV9UX6WhoaSpvV7Gc+2oLq9vPF4Eern3eupkKzPCJ
 SMq+lbxiQk8aVnf4kubvMMAiwYzQ8H1Bpw8eIknrO8MyjIPTQt1LGV1krhTJJicbM2/G
 9OFPZTqkrPm2bdKKZD0kGZVdRpPgnc5uI3WCylKZHeiJQV71WiHFcwD8XW4Hd/kwcUEk
 8PtPGkw63a1RfCKBQl8cGYfCGjoiQXeuAjJXNtjWoDVcsWH2vKf+s2E89Po/l6CAJnKL
 pJGg==
X-Gm-Message-State: AOAM532wgON9nCNadGDjkTgsIo7PBAhcm4ePkFdT9dAivEeN9duy7KO6
 PE/F1RwMjraFpmLsEp4UQeaqdA==
X-Google-Smtp-Source: ABdhPJxqcBqpANL5pnIvE0Vo/DEFOEk9VZKOf/8V02Gfz1spjbNxVQsShb6bYepOxRtcSdNgAyFuwQ==
X-Received: by 2002:a5d:648e:0:b0:20f:d9b6:a35f with SMTP id
 o14-20020a5d648e000000b0020fd9b6a35fmr9739650wri.333.1653406861281; 
 Tue, 24 May 2022 08:41:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z16-20020adfbbd0000000b0020cfed0bb7fsm13081406wrg.53.2022.05.24.08.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:40:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EB501FFB8;
 Tue, 24 May 2022 16:40:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: [PATCH v2 01/15] contrib/vhost-user-blk: fix 32 bit build and enable
Date: Tue, 24 May 2022 16:40:42 +0100
Message-Id: <20220524154056.2896913-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

We were not building the vhost-user-blk server due to 32 bit
compilation problems. The problem was due to format string types so
fix that and then enable the build. Tweak the rule to follow the same
rules as other vhost-user daemons.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220321153037.3622127-12-alex.bennee@linaro.org>
---
 meson.build                             | 2 +-
 contrib/vhost-user-blk/vhost-user-blk.c | 6 +++---
 contrib/vhost-user-blk/meson.build      | 3 +--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 9ebc00f032..a33ed52b7a 100644
--- a/meson.build
+++ b/meson.build
@@ -1489,7 +1489,7 @@ have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
            error_message: 'vhost_user_blk_server requires linux') \
   .require(have_vhost_user,
            error_message: 'vhost_user_blk_server requires vhost-user support') \
-  .disable_auto_if(not have_system) \
+  .disable_auto_if(not have_tools and not have_system) \
   .allowed()
 
 if get_option('fuse').disabled() and get_option('fuse_lseek').enabled()
diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index cd4a5d7335..9cb78ca1d0 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -146,7 +146,7 @@ vub_readv(VubReq *req, struct iovec *iov, uint32_t iovcnt)
     req->size = vub_iov_size(iov, iovcnt);
     rc = preadv(vdev_blk->blk_fd, iov, iovcnt, req->sector_num * 512);
     if (rc < 0) {
-        fprintf(stderr, "%s, Sector %"PRIu64", Size %lu failed with %s\n",
+        fprintf(stderr, "%s, Sector %"PRIu64", Size %zu failed with %s\n",
                 vdev_blk->blk_name, req->sector_num, req->size,
                 strerror(errno));
         return -1;
@@ -169,7 +169,7 @@ vub_writev(VubReq *req, struct iovec *iov, uint32_t iovcnt)
     req->size = vub_iov_size(iov, iovcnt);
     rc = pwritev(vdev_blk->blk_fd, iov, iovcnt, req->sector_num * 512);
     if (rc < 0) {
-        fprintf(stderr, "%s, Sector %"PRIu64", Size %lu failed with %s\n",
+        fprintf(stderr, "%s, Sector %"PRIu64", Size %zu failed with %s\n",
                 vdev_blk->blk_name, req->sector_num, req->size,
                 strerror(errno));
         return -1;
@@ -188,7 +188,7 @@ vub_discard_write_zeroes(VubReq *req, struct iovec *iov, uint32_t iovcnt,
 
     size = vub_iov_size(iov, iovcnt);
     if (size != sizeof(*desc)) {
-        fprintf(stderr, "Invalid size %ld, expect %ld\n", size, sizeof(*desc));
+        fprintf(stderr, "Invalid size %zd, expect %zd\n", size, sizeof(*desc));
         return -1;
     }
     buf = g_new0(char, size);
diff --git a/contrib/vhost-user-blk/meson.build b/contrib/vhost-user-blk/meson.build
index 601ea15ef5..dcb9e2ffcd 100644
--- a/contrib/vhost-user-blk/meson.build
+++ b/contrib/vhost-user-blk/meson.build
@@ -1,5 +1,4 @@
-# FIXME: broken on 32-bit architectures
 executable('vhost-user-blk', files('vhost-user-blk.c'),
            dependencies: [qemuutil, vhost_user],
-           build_by_default: false,
+           build_by_default: targetos == 'linux',
            install: false)
-- 
2.30.2


