Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BAF67FE33
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 11:31:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM4wU-0005Oy-NX; Sun, 29 Jan 2023 05:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM4wO-0005LM-IL; Sun, 29 Jan 2023 05:29:41 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pM4wN-0007Cw-2p; Sun, 29 Jan 2023 05:29:40 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 e8-20020a17090a9a8800b0022c387f0f93so7699586pjp.3; 
 Sun, 29 Jan 2023 02:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A96xCuVHr3t/yvA9bSnYfTHNel9t69iWkF+ncfYcpSg=;
 b=oRavDphisDXzkBmHajMvP5/wePKgBRbTzN2ZvKJaG7y7oo6Blm28woX/nv7uU5WzCZ
 jQW8956AytvG6groy9bI7/RgQ8EdXaoe/nT4dGmOy8rLSLggQF+vyj83QB6GshECbf64
 cNmIeUx6ohfKNC6pONoAC0SHaibZ6IgRcCiB2CV+F9p8LDBkivEan8O2C1nIMLGBPOPE
 DToL3uXJ4u7nCJiWGAdX1k2sD8tYPWrcnC273iuIAyFCbR2LUQHsaYzZxxCBDqMTYIEu
 OxGfnNvX+95oO+Ygl10hk3SywR8MJJXZZ35Wzec9fY9Qr6cTRTNvxlGBsmvap7Ucecg7
 bY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A96xCuVHr3t/yvA9bSnYfTHNel9t69iWkF+ncfYcpSg=;
 b=vJrhMI1Q/S/Wq34jbIb51/feOThcxDje9U08oCTeEA2B/ohL8jL91YgYcEcGebflHg
 51ndJDtd2z2NqYxJR/sjwrtFLGwKm6ryCPPF/zWtYS3WrUvQDlnAK0LXZAOLTi22i1SF
 RVT29H0uVe4imcM5im+LaflAhUaAWz17QpgoUFxLdDom1JO8xzDRTk3tqdxziyt7hEhF
 UImwGXDQfv7l/muLFD9nCMie2iXouOkGiEGy6BBG4UT9tIU7xijShezst9DIAQkF+FCz
 GGIc1hl6L1EaCwjiOM2ziMFSJkg3zC/Sq7HIhsgzuxe3Z5pxq779RBisqOoBiV/UH1/y
 4Y3Q==
X-Gm-Message-State: AO0yUKUcZHwzgx6TzB5N67n1VQ7zB4gbg3/KEEFAU67CCBo/WO5cbeyc
 l4FQNuUipjo8KgRwxyIpkvzE8Wy+zbzpaPl1d/U=
X-Google-Smtp-Source: AK7set8RTYdO7eXsfINmVbVgjhtYvrSNnRTJga9CGcZBUzYsaDFShCpyANhMlW1kBBVr9prVnUAZ5g==
X-Received: by 2002:a17:902:e841:b0:196:5554:9a3c with SMTP id
 t1-20020a170902e84100b0019655549a3cmr10071372plg.48.1674988176645; 
 Sun, 29 Jan 2023 02:29:36 -0800 (PST)
Received: from fedlinux.. ([106.84.129.237]) by smtp.gmail.com with ESMTPSA id
 jl1-20020a170903134100b0019644d4242dsm5439416plb.82.2023.01.29.02.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 02:29:36 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 damien.lemoal@opensource.wdc.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v15 7/8] block: add some trace events for new block layer APIs
Date: Sun, 29 Jan 2023 18:28:49 +0800
Message-Id: <20230129102850.84731-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230129102850.84731-1-faithilikerun@gmail.com>
References: <20230129102850.84731-1-faithilikerun@gmail.com>
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
index f661f202a1..5cf92608db 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3272,6 +3272,7 @@ static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
                                            BlockZoneDescriptor *zones) {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
+    trace_zbd_zone_report(bs, *nr_zones, offset >> BDRV_SECTOR_BITS);
 
     acb = (RawPosixAIOData) {
         .bs         = bs,
@@ -3350,6 +3351,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
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


