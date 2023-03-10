Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01726B3BF9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:25:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZvd-0008Df-TI; Fri, 10 Mar 2023 05:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZvQ-00089c-64; Fri, 10 Mar 2023 05:24:37 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZvM-0002Sf-2D; Fri, 10 Mar 2023 05:24:33 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso4783121pju.0; 
 Fri, 10 Mar 2023 02:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678443870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtxZ8v3YWpYA+etoCTcOvJcHPgV19dkZSoY9cWpKuXw=;
 b=p8VTohKiqcr5/wknxSovzPT7hYqyRuzJmCXYFvIXtCpNRuBrkqJeHGZz+FN2j01e/8
 WFmm6dCUEcl5ZVJHrym3WkYcrrwvQIGxgK2J1IuV2QqHYMWMerV2qnjq8YoD10VszK+z
 xbpKfbiKwjE4x1pEAKl6Nrby14BZDCgJN3nC6Cd0SMtki+udg5p0Bd9Ps7Xu8MhXKiJ4
 G85nwkR9ygSXbTUqqSeyHgLqVQd4HWxnVL52nNyDGjPIkQ+2QzWTO7i2gj13wa9b/iY8
 EDG8GhvTFXbPrZdyU2l5uUBf++OwjSbP6RZyeJwPu4PKD5+vHIFIp09AGBwwrJI3pX/m
 07lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678443870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jtxZ8v3YWpYA+etoCTcOvJcHPgV19dkZSoY9cWpKuXw=;
 b=xhfBbD5GT3FTQbkghRtIAy9xt/zFgWFk7BBsw2wtYskk2HivIBQd1omfT7G62Exmwk
 ipKr+zYS+l4t3CEvVG35zy6KEkoTvpk8xnUPQUat4kxm4VDwzXPxlH0sWFeJNtFtdOVw
 9Z9+hqSIKxaecOvqCCMxXNmJ1VFGbGREVqb7xnz/ci/cCA192vSFqNK8E7VEFJT2Bv70
 KO8/oKeXHXxBT7mpwKsBeP6Q4uox6MRPaHzxk+BvwjIjq/q36VsEy0p/wOwG3ZYiSNCP
 2+EiWZbw4Dfm9+drHf+4pchCTpeTEmnj4oEwMYIb3Qlx9tgXno9FfPFUC15/2/Fus/ch
 znFg==
X-Gm-Message-State: AO0yUKUiBGtQqHQjxwPwxtPRJSQYAuBjfyJWgE+pReFF9pMxAfeTU/Wu
 yMtwpN0aoKyU+D0APvy/UBCE9CshTl9S2mUl5Z0=
X-Google-Smtp-Source: AK7set+6/zlvS69l2yTuS4NIpE3gmWj1iuS3E+G3+LYaIeA2IppGwpTpxk8QBUY+l5cczPQCiTacsg==
X-Received: by 2002:a05:6a20:9386:b0:cc:d762:64a with SMTP id
 x6-20020a056a20938600b000ccd762064amr30716166pzh.8.1678443869569; 
 Fri, 10 Mar 2023 02:24:29 -0800 (PST)
Received: from fedlinux.. ([106.84.129.9]) by smtp.gmail.com with ESMTPSA id
 f8-20020a63f748000000b005030113f46dsm1008719pgk.37.2023.03.10.02.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:24:29 -0800 (PST)
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
Subject: [PATCH v16 4/8] raw-format: add zone operations to pass through
 requests
Date: Fri, 10 Mar 2023 18:23:59 +0800
Message-Id: <20230310102403.61347-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310102403.61347-1-faithilikerun@gmail.com>
References: <20230310102403.61347-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102a.google.com
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

raw-format driver usually sits on top of file-posix driver. It needs to
pass through requests of zone commands.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 block/raw-format.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 66783ed8e7..6e1b9394c8 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -317,6 +317,21 @@ raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_zone_report(BlockDriverState *bs, int64_t offset,
+                   unsigned int *nr_zones,
+                   BlockZoneDescriptor *zones)
+{
+    return bdrv_co_zone_report(bs->file->bs, offset, nr_zones, zones);
+}
+
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
+                 int64_t offset, int64_t len)
+{
+    return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
+}
+
 static int64_t coroutine_fn GRAPH_RDLOCK
 raw_co_getlength(BlockDriverState *bs)
 {
@@ -617,6 +632,8 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pwritev      = &raw_co_pwritev,
     .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
+    .bdrv_co_zone_report  = &raw_co_zone_report,
+    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
-- 
2.39.2


