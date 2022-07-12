Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D76F57101D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:25:06 +0200 (CEST)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5aD-00086Q-86
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Ps-0001Eb-6t; Mon, 11 Jul 2022 22:14:24 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pq-00081Y-Js; Mon, 11 Jul 2022 22:14:23 -0400
Received: by mail-pf1-x42f.google.com with SMTP id l124so6279679pfl.8;
 Mon, 11 Jul 2022 19:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IEva+i6vtaMTudz/mittdmHp6URnOdrUbp0T/SibzHA=;
 b=CYTOJjfpmG9gtJfRTGEdQEFjcg+w96hONXOsrHy/K085BIf3crJYJYlGbKOnGd9HDi
 k8DnWTFciS0z8nAYL8fBh9e0eY2U9LblnG01KC1kLrt90Jvvs/YKIczP1bdb/uq9SaQf
 5tfouWC8HYZl1WLR02VsM8jaW++ScxQa8tDSU6YEjv5HCkZun1uDkGMf/em0cAzg00Kc
 BtROKwXLi/064kEZbtqBoRyJAPbJG9s1ZN722pTVt0xsIFl9N6niT6JGUct7wOSnRIKv
 3TBqk7+TAVRXLHYhNx6UmlNyZkcFZGpGpSdriHv8189bWzcrmxi6OwndtpWF5ATM95I1
 1LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IEva+i6vtaMTudz/mittdmHp6URnOdrUbp0T/SibzHA=;
 b=u1cjQyieLoSt6A6cS52wcl03dlBIZTvu6UirNVB4zCOmvmfK9j+hEHxp6NiDcXUOGa
 Z82azMQU2XGapMb0NFtQ1eB7Hkwe5V2cKqVZwPo6lFVf2S2NQNmHS5EO9gPHvMjXQ6fW
 kaDs/8GT/DehrgmqaoqFDxMLDJpf7T1mNVZFy35cNebq9WpfsxdKwnXYkcEb94PYMWCf
 mnxGXXiqnFnf97YYRQSqBvgHFwaVEM5TBD7Mvl9CImv+FopkLvWbQ4H3yy45WFGmTLlz
 qXguhLZcSFOSWxWNO+Zd9xHxJADL3BGZi3AnVyEIpLAOC0NXwublp8W4MLQbM8LH+0SO
 P00Q==
X-Gm-Message-State: AJIora+BDWstKIf/vgyVrEYb0Cz5UPApyZoq0BbvOeYJ03QLybUikQx4
 1vwOhTAb5V6SUpgj1kkY8v4Erpy5+uaKtOdT
X-Google-Smtp-Source: AGRyM1uWSbJUr57dQ2oCfNBlO3V6xjqxw21SUPB0egDsX6K5vQgIGZoodq83LmF2oHpmg/m8T1G2cA==
X-Received: by 2002:a63:1f5f:0:b0:412:9ace:9fd6 with SMTP id
 q31-20020a631f5f000000b004129ace9fd6mr18854208pgm.199.1657592058836; 
 Mon, 11 Jul 2022 19:14:18 -0700 (PDT)
Received: from roots.. ([106.84.131.214]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa79736000000b00528f9597fb3sm5430251pfg.197.2022.07.11.19.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 19:14:18 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 7/9] config: add check to block layer
Date: Tue, 12 Jul 2022 10:13:43 +0800
Message-Id: <20220712021345.8530-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42f.google.com
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

Putting zoned/non-zoned BlockDrivers on top of each other is not
allowed.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block.c                          | 7 +++++++
 block/file-posix.c               | 2 ++
 include/block/block_int-common.h | 5 +++++
 3 files changed, 14 insertions(+)

diff --git a/block.c b/block.c
index 2c00dddd80..0e24582c7d 100644
--- a/block.c
+++ b/block.c
@@ -7945,6 +7945,13 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
         return;
     }
 
+    if (parent_bs->drv->is_zoned != child_bs->drv->is_zoned) {
+        error_setg(errp, "Cannot add a %s child to a %s parent",
+                   child_bs->drv->is_zoned ? "zoned" : "non-zoned",
+                   parent_bs->drv->is_zoned ? "zoned" : "non-zoned");
+        return;
+    }
+
     if (!QLIST_EMPTY(&child_bs->parents)) {
         error_setg(errp, "The node %s already has a parent",
                    child_bs->node_name);
diff --git a/block/file-posix.c b/block/file-posix.c
index 42708012ff..e9ad1d8e1e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3924,6 +3924,7 @@ static BlockDriver bdrv_host_device = {
     .format_name        = "host_device",
     .protocol_name        = "host_device",
     .instance_size      = sizeof(BDRVRawState),
+    .is_zoned = false,
     .bdrv_needs_filename = true,
     .bdrv_probe_device  = hdev_probe_device,
     .bdrv_parse_filename = hdev_parse_filename,
@@ -3971,6 +3972,7 @@ static BlockDriver bdrv_zoned_host_device = {
         .format_name = "zoned_host_device",
         .protocol_name = "zoned_host_device",
         .instance_size = sizeof(BDRVRawState),
+        .is_zoned = true,
         .bdrv_needs_filename = true,
         .bdrv_probe_device  = hdev_probe_device,
         .bdrv_parse_filename = hdev_parse_filename,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 6037871089..29f1ec9184 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -141,6 +141,11 @@ struct BlockDriver {
      */
     bool is_format;
 
+    /*
+     * Set to true if the BlockDriver is a zoned block driver.
+     */
+    bool is_zoned;
+
     /*
      * Drivers not implementing bdrv_parse_filename nor bdrv_open should have
      * this field set to true, except ones that are defined only by their
-- 
2.36.1


