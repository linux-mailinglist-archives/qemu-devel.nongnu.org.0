Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B96F9ED8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 06:56:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvsv8-0001EA-IS; Mon, 08 May 2023 00:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsv6-0001Dl-BK; Mon, 08 May 2023 00:56:20 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsv4-0005c4-Rc; Mon, 08 May 2023 00:56:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1ab14cb3aaeso28020285ad.2; 
 Sun, 07 May 2023 21:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683521777; x=1686113777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96krboaY65tjRC/hxvTfm8jhMVKSj3WQaI78UbKnhlo=;
 b=iPWLSq5YsyFyr9VOuzgHq6elqb+9oOkQAH41aJXOOAijSHJh5xl1S7Ub3w6X/+lfcC
 exu1dv++NUadjlqDv+gNi90fsySa5NjGUnwcDo2PX3V3qm6pOVqFPfC8p2WUSfP5/Dwt
 gZo77NeJwrMYyvHW23H3z8K7zf4jbZniZub32LLxr9/xsF54BCaZ2G7dLwblm4Y98FMe
 Oz1VGJ8KUIcs7pfoMuchexfbxZu5Muh59atQmwkPXmo2jDKi8XJNr8nE2yxjA4qe9Q1G
 u6SCPqxMtAkdPVpDM30f6pFoqVyRMtrl0L/A3IepX2blQr6DMrogK1KFTlEyTuC2fIoj
 5QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683521777; x=1686113777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=96krboaY65tjRC/hxvTfm8jhMVKSj3WQaI78UbKnhlo=;
 b=T7442qPBgIkWTkBuNcvqmJPG7Iq//o2aK5OJBHk5fi2kr4zApKL65TB7ar9LFJaA2g
 iJzfYY2qjNoC634DGT7oonHDOec7MVRwWZglkBRRSFrbiHhxVPMc4+a2m9P0x+9L3qUx
 8pe0VcMxetZAZPZHi9v6X0rLLddzRTXOdfZLgiBX/l6IqFYpE0VobX3OdWeFprkHXtcn
 LtSNcIFGayzSpLnMath576g3KsjE3cHM6l4BW5BrFMkEQMFrmDcSGcSiC3W+zfrD4lFJ
 HKudH3IfqtEMHPSJnFgDUhZRcepieS9lZDiC9LdtUN21r8X5hQqJ+fL1KSfvMwCi67mP
 Z3Mg==
X-Gm-Message-State: AC+VfDyQdTLqHNPll10wb6vfhUV380yaLFz9bwM+OsZ5Pl1aU15mP6v7
 TiR9LF4dOTksrq1s9SjGvmPak/9sWRiAIhii
X-Google-Smtp-Source: ACHHUZ7t6eDP/6SB5MeWdNIM8CN0eYv1lQIeWZW4ocwugDF/bqUch/8OQ6NYqgQaX0yyicfikT7wjQ==
X-Received: by 2002:a17:902:eb46:b0:1a6:5487:3f97 with SMTP id
 i6-20020a170902eb4600b001a654873f97mr8614477pli.64.1683521776233; 
 Sun, 07 May 2023 21:56:16 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a1709028e8c00b0019ef86c2574sm6007112plb.270.2023.05.07.21.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 21:56:15 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, dmitry.fomichev@wdc.com,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 dlemoal@kernel.org, hare@suse.de,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v20 7/8] block: add some trace events for new block layer APIs
Date: Mon,  8 May 2023 12:55:32 +0800
Message-Id: <20230508045533.175575-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508045533.175575-1-faithilikerun@gmail.com>
References: <20230508045533.175575-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20230324090605.28361-8-faithilikerun@gmail.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 9a52ad4c65..e143de8217 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3267,6 +3267,7 @@ static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
         },
     };
 
+    trace_zbd_zone_report(bs, *nr_zones, offset >> BDRV_SECTOR_BITS);
     return raw_thread_pool_submit(handle_aiocb_zone_report, &acb);
 }
 #endif
@@ -3333,6 +3334,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
         },
     };
 
+    trace_zbd_zone_mgmt(bs, op_name, offset >> BDRV_SECTOR_BITS,
+                        len >> BDRV_SECTOR_BITS);
     ret = raw_thread_pool_submit(handle_aiocb_zone_mgmt, &acb);
     if (ret != 0) {
         error_report("ioctl %s failed %d", op_name, ret);
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
2.40.0


