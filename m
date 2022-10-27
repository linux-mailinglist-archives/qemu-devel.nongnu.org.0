Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C7B60FC45
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:48:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo55K-0002bE-DW; Thu, 27 Oct 2022 11:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo55G-0002Ze-NS; Thu, 27 Oct 2022 11:46:20 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo55D-00016y-OU; Thu, 27 Oct 2022 11:46:18 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d24so1921853pls.4;
 Thu, 27 Oct 2022 08:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnjcNNRonQR6sDedMg/p0/pqlQVkOnSSjXYVlccWeYk=;
 b=emLRHtRrvJVfnMcFMW1URklGMpxPEL6Pmv3dSeJeee+AzbPvy4TWn1DskAghN+tYIT
 kR9EjHEKKyImrGy+kwEIg9YS2HkfVYSR0+MAiBNS5Fmw1bdCYPZyzugXnsCzkkit+tcd
 BaNWoOf0Sq7HUVqGwUdzgjS1kaqXDsak6AirsSGnxm3WQQeLe5KknLpo5iRSEKR/S+bk
 Ep7BDIA17sN5V3KCCMZuKcdDTnVjrrK/X4nb/Rz7tvraUuIKHCW15QQYbsgB5zfHJ7qB
 Hr1kjxvedjvtBIioeusxuHJIQ5wkkSZoomOqi6e8SCzcLVYaqrAwBm9Jszl5Fnwd1Pxv
 giKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnjcNNRonQR6sDedMg/p0/pqlQVkOnSSjXYVlccWeYk=;
 b=vyTNuIXgl7cPNICrVdFx2uoGevohlfouaOK+bdzBJmde/Xm/apnEkOGFcqhKSk9+st
 +O+aXd/p8r8Ssa3OsX8RbYcI0ZbO57h5pLK1DgPeGiCCqkQTyNN2oYmk73xOIC756E0e
 A7jCMfOB6ZjEtZa2OI9reTWEGsThwIcviy6X3UzaeVjHa0lEn9mhSRegHPxdlC/N26yp
 vbRNkDdt8Hr9BxhQUPQfEoFFJeLBL43U9amT/qIpyXcsrgr3C2qDZkESwg/tmMgCcPA2
 8VhILiI3ivQHPyOzpOj3eKKBI3TQM4QCL4K2vpe5AO2HKp4/arBTsNuUI90N/M/ANVjy
 9h3w==
X-Gm-Message-State: ACrzQf07NK5bDTVQoriSDOGDN/50rA/IHzE/X5S/ixZgECtX26sYc+so
 +ZpAicjTQUz70L6P1YPlh5z2eRZ/eKReR+EB
X-Google-Smtp-Source: AMsMyM7jpa5ckmnCm+eP5T5siLt/oGYATBhIO4FhE4IPyvEipIurTFo8Ufc8MY2VXZXWhLeSC8+jWg==
X-Received: by 2002:a17:90b:110c:b0:205:cfeb:cfb with SMTP id
 gi12-20020a17090b110c00b00205cfeb0cfbmr11005500pjb.75.1666885574064; 
 Thu, 27 Oct 2022 08:46:14 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 q9-20020a63d609000000b004405c6eb962sm1232801pgg.4.2022.10.27.08.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:46:13 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Eric Blake <eblake@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v13 7/8] block: add some trace events for new block layer APIs
Date: Thu, 27 Oct 2022 23:45:03 +0800
Message-Id: <20221027154504.20684-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027154504.20684-1-faithilikerun@gmail.com>
References: <20221027154504.20684-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 02476c011e..fe52e91da4 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3259,6 +3259,7 @@ static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
                                            BlockZoneDescriptor *zones) {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
+    trace_zbd_zone_report(bs, *nr_zones, offset >> BDRV_SECTOR_BITS);
 
     acb = (RawPosixAIOData) {
         .bs         = bs,
@@ -3337,6 +3338,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
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


