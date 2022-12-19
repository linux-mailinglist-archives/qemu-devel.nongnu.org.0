Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46EE650864
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 09:07:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7BAN-00055M-TL; Mon, 19 Dec 2022 03:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BAK-00054A-1g; Mon, 19 Dec 2022 03:06:28 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BAH-00011J-Bw; Mon, 19 Dec 2022 03:06:26 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so8100325pjd.5; 
 Mon, 19 Dec 2022 00:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=68cnbVdHo5xfPHXvFvmTVixSlcdk34mEABJbpnc1zkM=;
 b=ENt5p6OHjetc3Dz2b5g8GtrgwrKKbhfbsRiwqzzuTXqIDPwxpa0xqh+acyWxufBTgY
 8iJx43803Tip97o1aeKtCSugtsLETWNer8KqXaryq6ZeWgqhPKB7HilZInY0/rGiHoD2
 WUEUHk1rTXRqptXEXrr9aPC98Su2F9vjJT4+PxWo6i+PxuXBcgmObHKR/V7DUkktTfHa
 dAjnByRyRtZaQn9LgU9K8ICLOVATOueE3nIFHz6s6UrbUNbROlJsXQIiSB7eAvwDmTFb
 K7olQ4QTTQyDRLxVCqtmAbx+XQxoDeOsq0+NDWdybmtLejEVuRhzhksr8h7pY0ileb3T
 IzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=68cnbVdHo5xfPHXvFvmTVixSlcdk34mEABJbpnc1zkM=;
 b=cT+19xZ5aXQqCe7MVNk42MUlQSI7yDb6SYCMUkBpKbKImgSGEoSni1Xu29tPMiXOZE
 3CFMaiLoH9ylu/wTeEUyxXM1h+1rdb9VqkDts6CaryKvrIwjsPr/AIfNklSB4PgwdQHZ
 gXhoFIsdNa2lO9LsD9fGBsErFlwmk8aaafHCS1bBPyt/H0or9pMQfG94uyrddtgGTUxP
 CNWlwsjUWq8YIKwbkdYb9P3vSz7g+6ZBOH691dSj/OzCgLcgcYvqmwJ2eczXO++5Am2b
 CZTY7MURsqpvBp2hjLAxWMhl4TtigRZhESCGfwZGa1IunjpAn7XcRjD+yZ0TSXd+r5OF
 OMDQ==
X-Gm-Message-State: AFqh2koeDfimgS9qyp+sQFdEgjnI0MjBKkwnegdS9KdLFiJY9Gga4Yia
 mvmMZKo6DOfwHrwiRnOW2ESzBxnaGFN1J0gb
X-Google-Smtp-Source: AMrXdXs6gNTc00dpe7PKw3/iCwt2RmFN9pk7d4GL9BjH8wQ2szUv3H4QNIsUGF6LD1TkfHbmOnD8Qw==
X-Received: by 2002:a05:6a20:9d8e:b0:a3:b698:d036 with SMTP id
 mu14-20020a056a209d8e00b000a3b698d036mr20126474pzb.39.1671437182366; 
 Mon, 19 Dec 2022 00:06:22 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 b3-20020a636703000000b004768b74f208sm5818043pgc.4.2022.12.19.00.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 00:06:21 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, hreitz@redhat.com, kwolf@redhat.com, dmitry.fomichev@wdc.com,
 pbonzini@redhat.com, damien.lemoal@opensource.wdc.com, fam@euphon.net,
 thuth@redhat.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 berrange@redhat.com, eblake@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v14 7/8] block: add some trace events for new block layer APIs
Date: Mon, 19 Dec 2022 16:05:56 +0800
Message-Id: <20221219080556.10156-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1036.google.com
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

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 091a95c1a9..517400a63b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3274,6 +3274,7 @@ static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
                                            BlockZoneDescriptor *zones) {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
+    trace_zbd_zone_report(bs, *nr_zones, offset >> BDRV_SECTOR_BITS);
 
     acb = (RawPosixAIOData) {
         .bs         = bs,
@@ -3352,6 +3353,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
         },
     };
 
+    trace_zbd_zone_mgmt(bs, op_name, offset >> BDRV_SECTOR_BITS,
+                        len >> BDRV_SECTOR_BITS);
     ret = raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
     if (ret != 0) {
         ret = -errno;
diff --git a/block/trace-events b/block/trace-events
index 48dbf10c66..3f4e1d088a 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -209,6 +209,8 @@ file_FindEjectableOpticalMedia(const char *media) "Matching using %s"
 file_setup_cdrom(const char *partition) "Using %s as optical disc"
 file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
 file_flush_fdatasync_failed(int err) "errno %d"
+zbd_zone_report(void *bs, unsigned int nr_zones, int64_t sector) "bs %p report %d zones starting at sector offset 0x%" PRIx64 ""
+zbd_zone_mgmt(void *bs, const char *op_name, int64_t sector, int64_t len) "bs %p %s starts at sector offset 0x%" PRIx64 " over a range of 0x%" PRIx64 " sectors"
 
 # ssh.c
 sftp_error(const char *op, const char *ssh_err, int ssh_err_code, int sftp_err_code) "%s failed: %s (libssh error code: %d, sftp error code: %d)"
-- 
2.38.1


