Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08A16F9EF0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 07:17:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvtEA-0001dF-5P; Mon, 08 May 2023 01:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtE4-0001bw-J8; Mon, 08 May 2023 01:15:56 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtE2-0002D9-TN; Mon, 08 May 2023 01:15:56 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-24e14a24c9dso2894115a91.0; 
 Sun, 07 May 2023 22:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683522953; x=1686114953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTeO0UwLFjodaSVIBEBRcrlMpkWv2Na4frsvrQ/dgJk=;
 b=ms2ATEPSYXGhpkhyONwe1l706M7+BOtdgNvkudP9ZphDLzCZ35QX4ZfRBtUtYdg0wK
 Yrtnf0p+OspVCaK72gaRElBMHt6UaBViuK62b4WnE4iBjXvHjU9H6gQ3zuFxeVFswmO7
 +1+deYLyuAUXBvLT66hud06iu3KT63A8+ajRbGcNFu2RXvYFUYu9FHmWhTn74dsb+OFY
 1qBcUwBgoJsL1pdhgeIFr1sIV77vuK9Oc0XB2oiBrcBB9NIGDFmP9gpEndGsr35bdBFU
 jl10Idls6qiXbWYqX0XhtKhICTsYDo4MI9PiMCfqoqgEYil3deXNoWChwnvvle5l5Jrr
 PbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683522953; x=1686114953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iTeO0UwLFjodaSVIBEBRcrlMpkWv2Na4frsvrQ/dgJk=;
 b=fm0NraCLM2hHVwnOLyQ6F5qWia94zVHOuZ/5v/uVs0yZFT2YuxqhExRzXP5LqogZiV
 kbnaJyYKIoeCzPrmcmyvMzGOSlNGfs4INEx67I66saKrDYDaxzYEoTWI4NeLp2pWaZnP
 4RKsNJA6OxiWfDj8NxRKsb5IldXxximv9idS4h1Ub7OBDc7tSMbUKLHmy1TmamRLjnNA
 qI7kX0P9h5bMoZj1vCUpC2LBm6r9SJwoNzEws+q6eGElbF72Nx6Q6TTpZRjpDVZtH0Dd
 UW6HLakOiWHs3uccmklt3/iITo/FUdb3L0JshamtH2LuVphgDaJbG3PscLMl3FMaUNNR
 Aikw==
X-Gm-Message-State: AC+VfDz0IrIzusaxBZovUcAZyOnYT86FCaD8hKhK/QbOcCG74JBPlzD/
 qTeeCRbI9aqkmN2iEHMQv4+OPWE6hpP4xs8z
X-Google-Smtp-Source: ACHHUZ4pH9Xa7qm351LWHTOGlWm7tU65JjH0OhRlGIjAaeJ5G8SGtUscmYTBlDG1sevElm6f4Tnifw==
X-Received: by 2002:a17:90b:23c9:b0:247:603a:bd60 with SMTP id
 md9-20020a17090b23c900b00247603abd60mr9521375pjb.45.1683522952203; 
 Sun, 07 May 2023 22:15:52 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 fh11-20020a17090b034b00b00246aba3ebabsm3407140pjb.45.2023.05.07.22.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 22:15:51 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dlemoal@kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 dmitry.fomichev@wdc.com, Fam Zheng <fam@euphon.net>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 4/4] block: add some trace events for zone append
Date: Mon,  8 May 2023 13:15:10 +0800
Message-Id: <20230508051510.177850-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508051510.177850-1-faithilikerun@gmail.com>
References: <20230508051510.177850-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1032.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index aacb50d5aa..cd47167d04 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2513,6 +2513,8 @@ out:
             if (!BDRV_ZT_IS_CONV(*wp)) {
                 if (type & QEMU_AIO_ZONE_APPEND) {
                     *s->offset = *wp;
+                    trace_zbd_zone_append_complete(bs, *s->offset
+                        >> BDRV_SECTOR_BITS);
                 }
                 /* Advance the wp if needed */
                 if (offset + bytes > *wp) {
@@ -3555,6 +3557,7 @@ static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
         len += iov_len;
     }
 
+    trace_zbd_zone_append(bs, *offset >> BDRV_SECTOR_BITS);
     return raw_co_prw(bs, *offset, len, qiov, QEMU_AIO_ZONE_APPEND);
 }
 #endif
diff --git a/block/trace-events b/block/trace-events
index 3f4e1d088a..32665158d6 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -211,6 +211,8 @@ file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
 file_flush_fdatasync_failed(int err) "errno %d"
 zbd_zone_report(void *bs, unsigned int nr_zones, int64_t sector) "bs %p report %d zones starting at sector offset 0x%" PRIx64 ""
 zbd_zone_mgmt(void *bs, const char *op_name, int64_t sector, int64_t len) "bs %p %s starts at sector offset 0x%" PRIx64 " over a range of 0x%" PRIx64 " sectors"
+zbd_zone_append(void *bs, int64_t sector) "bs %p append at sector offset 0x%" PRIx64 ""
+zbd_zone_append_complete(void *bs, int64_t sector) "bs %p returns append sector 0x%" PRIx64 ""
 
 # ssh.c
 sftp_error(const char *op, const char *ssh_err, int ssh_err_code, int sftp_err_code) "%s failed: %s (libssh error code: %d, sftp error code: %d)"
-- 
2.40.0


