Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87512571040
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:35:24 +0200 (CEST)
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5kB-0001oe-KP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Px-0001Xx-TV; Mon, 11 Jul 2022 22:14:30 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pw-00082f-BD; Mon, 11 Jul 2022 22:14:29 -0400
Received: by mail-pf1-x435.google.com with SMTP id 70so6299454pfx.1;
 Mon, 11 Jul 2022 19:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yOIRhO0nQgWE0JR20Yhde7NElMEsFtb20MMGKy3mdQk=;
 b=gK84npHSRlMExJA6Sqg1fVZqjS9a2kt/VAlHat0oLc3wmmNRV12Ya8Pj3y3xuOujN0
 8+uOgVsmgdnQ1/Gte+5xyFoeZHvp1tMlUf+PyOmkc4EkBzSyoBTCmmL+TXLS5tNHkH37
 6A4g5hlBmMU3d64er7wW6AsCnMVmk7lFrrDcz+XmEbEOrg+BDLrqbqIv+Ynl6UrkIdmp
 L9IlSvtB7/vkAiZE6v33hiPmYw4bWqy1lCcJ50fzbHVZlR1d2UnmOeZlp1eG5SeKF75y
 ZNyv8ngXm5AovGWNPxClZej+yNuJZ6+uBNi56CKPUw4Amuhl3X8VKWy3P7Vaa6YCUdfi
 sAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yOIRhO0nQgWE0JR20Yhde7NElMEsFtb20MMGKy3mdQk=;
 b=ZLllEInffjVXTpouVlMqWT1b+U7xCWVQyA0GZ/pSbZB+C7yJ1Ff/zurKJ3pm1voY9B
 NLRSqlln3nR6rxy8a2k3I/bZciAgxFxoWkZ1S4FuC4RSEPR2MXRpYn9Lshg5S8fLRvbU
 lLosmqcgZWQfQhnEkGkrQsSk1RNWM3YkHcQ00m8tBXJFXo81I94c6QlZd//y0Ff4NBiQ
 pZWBq5CT07GT/wR1eJJfXHligI9PhUqg4r5rswCxpUu5rEIAA5Nf6mkNolEJUu/BdgTp
 eKYuTweaQQMRtG+53JaAEyoyRDtMxJGK/kg2HvhWRYZzNzkrq/eqviQxMAZ8EMR+YXHE
 vP5A==
X-Gm-Message-State: AJIora+x3L/VQWjlHHUBgPUqpDJnuFa//unkI4fEJO3yvVM2rKKIsBP6
 BbLk2Lf23YiC4pb1gzMF/vS5RAJ2NwQSPyQd
X-Google-Smtp-Source: AGRyM1t9rr+mgx+ZPWdbLlMW0dC0RrulsdFHYJML2ZlHPOqYhHYs1J/eqPQ/6qQEIDhpFKPDO5igxA==
X-Received: by 2002:a05:6a00:114c:b0:528:2c7a:630e with SMTP id
 b12-20020a056a00114c00b005282c7a630emr21442113pfm.86.1657592066463; 
 Mon, 11 Jul 2022 19:14:26 -0700 (PDT)
Received: from roots.. ([106.84.131.214]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa79736000000b00528f9597fb3sm5430251pfg.197.2022.07.11.19.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 19:14:26 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 9/9] qapi: add support for zoned host device
Date: Tue, 12 Jul 2022 10:13:45 +0800
Message-Id: <20220712021345.8530-10-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x435.google.com
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
 block/file-posix.c   | 8 +++++++-
 qapi/block-core.json | 7 +++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index e9ad1d8e1e..4e0aa02acf 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3737,6 +3737,12 @@ static void hdev_parse_filename(const char *filename, QDict *options,
     bdrv_parse_filename_strip_prefix(filename, "host_device:", options);
 }
 
+static void zoned_host_device_parse_filename(const char *filename, QDict *options,
+                                Error **errp)
+{
+    bdrv_parse_filename_strip_prefix(filename, "zoned_host_device:", options);
+}
+
 static bool hdev_is_sg(BlockDriverState *bs)
 {
 
@@ -3975,7 +3981,7 @@ static BlockDriver bdrv_zoned_host_device = {
         .is_zoned = true,
         .bdrv_needs_filename = true,
         .bdrv_probe_device  = hdev_probe_device,
-        .bdrv_parse_filename = hdev_parse_filename,
+        .bdrv_parse_filename = zoned_host_device_parse_filename,
         .bdrv_file_open     = hdev_open,
         .bdrv_close         = raw_close,
         .bdrv_reopen_prepare = raw_reopen_prepare,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2173e7734a..ab05c2ef99 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2955,7 +2955,8 @@
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
             'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
-            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
+            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
+            { 'name': 'zoned_host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' } ] }
 
 ##
 # @BlockdevOptionsFile:
@@ -4329,7 +4330,9 @@
       'vhdx':       'BlockdevOptionsGenericFormat',
       'vmdk':       'BlockdevOptionsGenericCOWFormat',
       'vpc':        'BlockdevOptionsGenericFormat',
-      'vvfat':      'BlockdevOptionsVVFAT'
+      'vvfat':      'BlockdevOptionsVVFAT',
+      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
+                             'if': 'HAVE_HOST_BLOCK_DEVICE' }
   } }
 
 ##
-- 
2.36.1


