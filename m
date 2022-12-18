Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F86504EA
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:08:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71p9-0004e7-3b; Sun, 18 Dec 2022 17:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1p71ox-0004X0-MK
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:07:48 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1p71ow-0003PE-4d
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:07:47 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f3so5044308pgc.2
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 14:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nk22t7p/YYJFulH7kgcbkLgyna7/tfnL7kG3wGWyTb8=;
 b=FNIu/0e2JKnWXCMDkVWohFLn6iNPvhxw2KuEVBpIMzTlzMLh4VZYBmOPC+Sp3ZPw3u
 /BcnsG6XK3kDbETmkyORF234A+R76W7IlDRZXq03a8KYrh3w7bYsiCjfHPloPBaEDAEn
 Cp/JTk+gotswydZx2b8/33jpFzGM3vBipeoKbzQehyH1XYuwpIh3qlpNs6PrPrQ+Mert
 wlYl6/vQDV40d/0x3MVTuOlwO8QZeJ5vopENFVDf8E5XmDzSMORCaXdwHzxfHJymw/UT
 pAgVPQuuiGmirUOmE2fTBSTenG/+aMLDm4szK4bblcAf2vzS2IjxAgk8F43tuYstw0O4
 uTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nk22t7p/YYJFulH7kgcbkLgyna7/tfnL7kG3wGWyTb8=;
 b=au7941BdXo7ieJhld8t25ViOT+7ywXFu+4RZts/XBukYBwcPZZheMYs/LySsUY2O/3
 JvILUerKOnMbCBYBG3QLcqcl7BEHlwHaePX3nLMMvR9ijT//o4mX16TwfuiQ23msd7pC
 s6b5zLH/ITXDfIDP3po78i5M45N0vr/6B88qIFd4lbDSYbZKTarsrBr8VK5JXjqN2QjO
 OXZXIrnZw5LIv0jLl6132TsPfGjhq07fozfVxhwnLoe0FepZxSOBxOUY6+2MXXe1ydEi
 vVZyOkI/5pbrGm3Dq59LCqEkJrvInY0EPEkTKo3MQeaZkRAdO5ujsar+RsWiE94Esad/
 zCZw==
X-Gm-Message-State: AFqh2kpHDQukE30AJ1oJa6bZYMcOkg1zxJm078LzL/k3vWsx1o/0RMnv
 id2zstlLFwhT/NGUfKpKSQmxOIKE53I=
X-Google-Smtp-Source: AMrXdXvlYCrfwfiLFvzuULpQh4WBWt//ugna5u2RLrBOYSdECf8nqR3siM3bWU3MuwPoWtLdIaV38g==
X-Received: by 2002:aa7:8753:0:b0:57d:3aa9:3278 with SMTP id
 g19-20020aa78753000000b0057d3aa93278mr17695306pfo.17.1671401263405; 
 Sun, 18 Dec 2022 14:07:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
 by smtp.gmail.com with ESMTPSA id
 x18-20020aa79a52000000b00576c4540b63sm5214922pfj.12.2022.12.18.14.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 14:07:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Cc: Khem Raj <raj.khem@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: [PATCH v2] contrib/vhost-user-blk: Replace lseek64 with lseek
Date: Sun, 18 Dec 2022 14:07:40 -0800
Message-Id: <20221218220740.315839-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=raj.khem@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

64bit off_t is already in use since build uses _FILE_OFFSET_BITS=64
already. Using lseek/off_t also makes it work with latest musl without
using _LARGEFILE64_SOURCE macro. This macro is implied with _GNU_SOURCE
when using glibc but not with musl.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
CC: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
v2: Fix typo must->musl

 contrib/vhost-user-blk/vhost-user-blk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index aa99877fcd..7941694e53 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -532,9 +532,9 @@ vub_get_blocksize(int fd)
 static void
 vub_initialize_config(int fd, struct virtio_blk_config *config)
 {
-    off64_t capacity;
+    off_t capacity;
 
-    capacity = lseek64(fd, 0, SEEK_END);
+    capacity = lseek(fd, 0, SEEK_END);
     config->capacity = capacity >> 9;
     config->blk_size = vub_get_blocksize(fd);
     config->size_max = 65536;
-- 
2.39.0


