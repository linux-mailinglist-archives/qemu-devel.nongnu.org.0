Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5C6F9EDB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 06:57:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvsuu-0001BE-Gv; Mon, 08 May 2023 00:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsus-0001AC-6h; Mon, 08 May 2023 00:56:06 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsuq-0005Xb-K1; Mon, 08 May 2023 00:56:05 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aad55244b7so30214135ad.2; 
 Sun, 07 May 2023 21:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683521762; x=1686113762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ThsgU5dxftQSrGWB8lAXUWGk9tQClLWkofAITVagcVg=;
 b=Nuw/HfubR0mWeId8elllokgzcaMqRlx1XFrbcwRkRFhkkSidsnDHsqhsyh6aFInT5H
 det1cAJtGDGu6V6Z67Q0LxjYgf0xNSW+PvmnAX0QiGo0GyhjL8moCKRO1bupb0yObi/w
 Sw111j6wujIZTG0gDJc7CCGGpovH4DlzBHVRZcSmo9mlF3cksasYvmWU64ZWeoTdbbNj
 HFLN3PJ/8KonR0OoCJElj5j+MWv/T2KPznhvYtFKgDi9qD5b3wGiNxI/1iInYvS1nIag
 iVBDfOcBQaAxT98GAqMsK5DIXgBlC7r/daVMNRNr90sOidAPT1XYtab74Jn1hePrdqxg
 DetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683521762; x=1686113762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ThsgU5dxftQSrGWB8lAXUWGk9tQClLWkofAITVagcVg=;
 b=QI+gnyxffRkhS3U8PvoeTaaGfSioTAqiimKcYBlbuYoJDTWSmM3vi4wAIw20wAc0Qq
 fRSmpwmJEgaVtnWU+eC8h3mWvnzPN3VETS7HyOpPnI7w8ip+6WBrq6PNMQARi0aRi7hV
 3LIjWV1PFpG3HxAWAmYD1px2dEAiTTVaqXnocWa3hlOeLYVBqiAo+p0CczZ3BS0pUNRo
 YbFChXQxCo8owSFHMXkrwXKFl0FH4jS4nYRhNRF17Lupm/Cbf8r9mHM6fu/Mii5Fj5j+
 CZeCQaEdcPDHr7z6DBziDzLawWSGQyYxaQPpYutH+E5LEhf7lkcWsCu1t9KNepyP/5Xj
 r/LQ==
X-Gm-Message-State: AC+VfDzemtnnnSiXvTGruQoDMzPlgcKmY7sK4qX/kAlR0ekgutgEu0Do
 HhrmKhfV+fZZinwvecY7fmPhfGCarIK/X8Me
X-Google-Smtp-Source: ACHHUZ4IGmSF3OEepaMcC1FStkrMZQZ12x91PADU+dfli5ccqSBmFRMivUNc9YGKUHMJGm1gKDm44A==
X-Received: by 2002:a17:903:2448:b0:1ac:3642:bff3 with SMTP id
 l8-20020a170903244800b001ac3642bff3mr11945819pls.38.1683521762051; 
 Sun, 07 May 2023 21:56:02 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a1709028e8c00b0019ef86c2574sm6007112plb.270.2023.05.07.21.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 21:56:01 -0700 (PDT)
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
 Sam Li <faithilikerun@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [PATCH v20 4/8] block/raw-format: add zone operations to pass through
 requests
Date: Mon,  8 May 2023 12:55:29 +0800
Message-Id: <20230508045533.175575-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508045533.175575-1-faithilikerun@gmail.com>
References: <20230508045533.175575-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62b.google.com
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

raw-format driver usually sits on top of file-posix driver. It needs to
pass through requests of zone commands.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Message-id: 20230324090605.28361-5-faithilikerun@gmail.com
[Adjust commit message prefix as suggested by Philippe Mathieu-Daudé
<philmd@linaro.org>.
--Stefan]
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/raw-format.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 06b8030d9d..f167448462 100644
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
@@ -619,6 +634,8 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pwritev      = &raw_co_pwritev,
     .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
+    .bdrv_co_zone_report  = &raw_co_zone_report,
+    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
-- 
2.40.0


