Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC65F6B3BFF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:26:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZvg-0008Ur-Ge; Fri, 10 Mar 2023 05:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZvc-0008E2-27; Fri, 10 Mar 2023 05:24:49 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZva-0002XK-Js; Fri, 10 Mar 2023 05:24:47 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so9308088pjb.3; 
 Fri, 10 Mar 2023 02:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678443883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QG+AAXzepHKbYqtRZGp9hrm1xZfMYJgGYoJhT6HWfHQ=;
 b=E/ub2t/C6YkAvlcGcsEdP11Q5roNvVS6nWNUIA5seUmzqx4EmD5JVrSckCpsz+QodN
 +jkRsKYe2YPT7Td3NILHvs1e/gJBUJteolaYGBjmCkyR3IemfWV8URMhlbM6JfWm2+7m
 zOZQnw2VZBNSjg+ZturyrgaTyBcWeC6kttURomYzjx63Z3IMeGQpQhx885h/QZd7CXk4
 VVKn8qhDDLC/8Rgb+6Imp6I3FXVd3sDg/CGssh51I7geRIr6B9fLwyCXM0yVyqtPi2mJ
 19T04eN/5VstR5wrXo81e/S8ItAr4DppaVQc0Ec8t5Ez1fUQeeXCTY0a2okc8sxzLdyO
 xSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678443883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QG+AAXzepHKbYqtRZGp9hrm1xZfMYJgGYoJhT6HWfHQ=;
 b=lZ9Vi9uPk1GVpU3BFQ1zlrWQAQPh332lAM10pArbPlT3Ebln5QBZF7A5Dl2fS0htp+
 TVtpOU94XPxamHnMamUvrsdeJct024e3+tXoOtRTEjGgUPZXfi9YaKB+cdasvFLmrZtZ
 CETM3jXPzRQ/bHmC8xsDg6aDaD2q/AEFvC7F5jrZm/zMYXfYlBFyM6bFJRj54ZLZPptZ
 2zWvTVXH4nBi4LK9fo11D8O7qBGh024A8GfZTbP6XcgxRmMBpq5dJ0oaIYdai4YGRvcs
 1Y+TIqqiTQMBEqYkVtQrogKAXj/HY1snxpHkgoZ85VeZIu6hj+UPoexqM8fFtqpTEN5W
 /wmw==
X-Gm-Message-State: AO0yUKXmO0ZP6SlEHQVUsCb81WIOcDzlFC/3yYunh/7+SdN38PjSDLGL
 UOTP7eOGdO1hNl/I9Z5hnSg1p5Cn0uJ8iZGQByQ=
X-Google-Smtp-Source: AK7set+cuA40IYZ2/ov237l6gMdwaoYKqVebEQ7jnjNHGWYzYcCo66jIFib+unbg3se4e7U7qDFRlw==
X-Received: by 2002:a05:6a20:7d8b:b0:cc:39c5:1241 with SMTP id
 v11-20020a056a207d8b00b000cc39c51241mr34010794pzj.16.1678443883179; 
 Fri, 10 Mar 2023 02:24:43 -0800 (PST)
Received: from fedlinux.. ([106.84.129.9]) by smtp.gmail.com with ESMTPSA id
 f8-20020a63f748000000b005030113f46dsm1008719pgk.37.2023.03.10.02.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:24:42 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 dmitry.fomichev@wdc.com, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v16 7/8] block: add some trace events for new block layer APIs
Date: Fri, 10 Mar 2023 18:24:02 +0800
Message-Id: <20230310102403.61347-8-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310102403.61347-1-faithilikerun@gmail.com>
References: <20230310102403.61347-1-faithilikerun@gmail.com>
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
index 2eceb250f1..563acc76ae 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3256,6 +3256,7 @@ static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
                                            BlockZoneDescriptor *zones) {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
+    trace_zbd_zone_report(bs, *nr_zones, offset >> BDRV_SECTOR_BITS);
 
     acb = (RawPosixAIOData) {
         .bs         = bs,
@@ -3334,6 +3335,8 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
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
2.39.2


