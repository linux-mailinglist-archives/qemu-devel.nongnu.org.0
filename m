Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9D6F0ABA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:22:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps5JE-0007oY-4X; Thu, 27 Apr 2023 13:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5JC-0007kW-IJ; Thu, 27 Apr 2023 13:21:30 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5JA-0007RT-VG; Thu, 27 Apr 2023 13:21:30 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1a9253d4551so68386295ad.0; 
 Thu, 27 Apr 2023 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682616087; x=1685208087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=up0Aat6c1cxPVKLFJNe82cGl0KC/DnBejeUsU/iTVQg=;
 b=gmaG6OPYRke/elocQbjhbcbY08x0sdtqj6lSVUuM3pf70UZJasVclFg0i+KZVR9Y+V
 dBJjYQuMtIuveBCBBlS57tcvTRfol2MgOfNvLF77ZjTnhxAjG4lJF8aqp3FcQjvsyitF
 wWiltgbTprmYksLApVeFh3vEaw8RTFkT47boSco2DReIHvT2Qijz7ONvGspe+pbptHXx
 zwYcQs2dyhaWgOdiGB7UjaYcg/nTTeKpXsQL/8y3WstfmrL5enZDLczEEB8O832LV9UK
 i9NL4pXpvIxNqfxNeVoypJ269wSIh8NGL+Zd2N/MMtcPi2Kzq1m3nGog2cKX+8l4GytK
 FgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682616087; x=1685208087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=up0Aat6c1cxPVKLFJNe82cGl0KC/DnBejeUsU/iTVQg=;
 b=hlrfk4Hu7ISwjNfynQe3zp7IvwgVTqX43S7r8tnuRQkyyVtJkhziXirqbvD4qJZP8y
 5fGcc7PFufyVBfcUdq24m/7pvZgG0dm2OBw+CGWT+/e/ekG9Vu+RwQr13yLgXhHwaRGx
 nEwe0glnPBMkbSP2GZOOjoKAH5DlvGT7qwwc0/JPJeB9GxAPQ7FMpMLmGwRWEznQEqYw
 cJI71hCdHQTzcTNDmhaD07/r/CN8zQ424gSnE7AEbej6/ngVBmkOxgASBA8hz2oTEk13
 A5m3ex7+1AykmYyNKWbNzIk/SZhtw/66j9hM+VgDlww8j2L+uGEMhwbPoOz4SFW0dYsO
 AI5g==
X-Gm-Message-State: AC+VfDxbPrfnJbMZmUqQdUMGJhyJGhKE1udhaL4Uw69/FtQR9IC5T6Ix
 3//8PJblSbHSdYoRUz0GPFVIIuTMfiBhUcqw8dY=
X-Google-Smtp-Source: ACHHUZ6E3V5o5/oH9lXmwM08xUG90NJa2xeRtwF7mRfJv4cgFtYsyVx+Qka9oIYBQzb4ZQWqsWXY1g==
X-Received: by 2002:a17:902:ce89:b0:1a5:2db2:2bb with SMTP id
 f9-20020a170902ce8900b001a52db202bbmr2887145plg.15.1682616086518; 
 Thu, 27 Apr 2023 10:21:26 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.101]) by smtp.gmail.com with ESMTPSA id
 p1-20020a170902a40100b001a95c7742bbsm8878578plq.9.2023.04.27.10.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:21:26 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, dlemoal@kernel.org, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 stefanha@redhat.com, dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v19 7/8] block: add some trace events for new block layer APIs
Date: Fri, 28 Apr 2023 01:20:18 +0800
Message-Id: <20230427172019.3345-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172019.3345-1-faithilikerun@gmail.com>
References: <20230427172019.3345-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62e.google.com
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
index 67d4ec6ac5..701acddbca 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3271,6 +3271,7 @@ static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
         },
     };
 
+    trace_zbd_zone_report(bs, *nr_zones, offset >> BDRV_SECTOR_BITS);
     return raw_thread_pool_submit(handle_aiocb_zone_report, &acb);
 }
 #endif
@@ -3337,6 +3338,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
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


