Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3016C814A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:34:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfdOH-0002f2-F8; Fri, 24 Mar 2023 05:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdOD-0002bo-2W; Fri, 24 Mar 2023 05:07:13 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdO6-0000IL-RA; Fri, 24 Mar 2023 05:07:12 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so1010115pjb.0; 
 Fri, 24 Mar 2023 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679648801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtxZ8v3YWpYA+etoCTcOvJcHPgV19dkZSoY9cWpKuXw=;
 b=PAzWLI5OATGiTfA5tD6JFeho9WekKiq+NkLDBF1LOiIFbazxyjGy4GOscI4lO00fUB
 mtY/L9sqY5LI44AGeYUgUzHe96FTDPPqftWC+R3GDD0pnwyxips6nM2u3pHCnmZ8I5IG
 FyEBzjNF0RgCVm4GWk9h+fwVcCxsYFvUEXDRnTkxciXhD72wPooOstJK5rKSwCTl7uL+
 baiAa4/dfv+i7weJKamR5ncxr9jcp6usqcVtozDS+Txoa2qX4kd+TMr47DxH06Y43n7X
 cKH43KBYXp+0KCSQ/PObLIPcWlzMVBe8csWyFVFt/hrHQ0y1kezAQjzuzxr97HfL4y7a
 DxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679648801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jtxZ8v3YWpYA+etoCTcOvJcHPgV19dkZSoY9cWpKuXw=;
 b=UmYWRI5Y2Oc+o1tt+2JC2Tq57vDbpPvP0ZvNKB+PehSsKdD5v+UHpkpu3VKraU9M+R
 LUss5L2PvMN9/0Dz5aybWW0NC2izJ1bwA1/GPs2jJ3c9TC9HUNX+fczvrYpfq8ZjlA6S
 OqjzrtMArc2VjQ3yZW4byA4g1GhDBC9ewNDUxG0BNqU+L524uuSrUn7SjV5y/ncHnHKO
 ZRYZgvKipDeeSj+8pkc6LvAYk4vzRR5UFBg8BkaIqd9Uoyy3EGezFZdquRRe3AXGK1ZR
 Mv0y/ceei9ns1k1O5cPaGBy2+u9rm9yf+LbNcalck5WKZ2J8b55KPlSL7McxNAXGozqs
 xw0g==
X-Gm-Message-State: AAQBX9dsFi5QapLQ4/eAU9DkvYSzZYfhg/1qCJU7KoH8HuqeFgI7G6pE
 hfS7W3qRVeNDFym6UPINOBgYknrqlSXsKfKR
X-Google-Smtp-Source: AKy350YtDPmPuRIuU+VerLWZUMX+6YQU9J+Miu8JREgb413w9ztwewg2nyB6+JxHy9hmQV3KwRAS1Q==
X-Received: by 2002:a17:902:ec86:b0:1a0:7425:4b73 with SMTP id
 x6-20020a170902ec8600b001a074254b73mr2395748plg.4.1679648800687; 
 Fri, 24 Mar 2023 02:06:40 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 u4-20020a170902b28400b001a06b33923bsm13722350plr.164.2023.03.24.02.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:06:40 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hare@suse.de,
 damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v18 4/8] raw-format: add zone operations to pass through
 requests
Date: Fri, 24 Mar 2023 17:06:01 +0800
Message-Id: <20230324090605.28361-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324090605.28361-1-faithilikerun@gmail.com>
References: <20230324090605.28361-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1031.google.com
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


