Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102B6F0AB8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:22:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps5Is-0006ru-IG; Thu, 27 Apr 2023 13:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5Iq-0006p9-07; Thu, 27 Apr 2023 13:21:08 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5Io-0007NX-CG; Thu, 27 Apr 2023 13:21:07 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63b5465fb99so7258066b3a.1; 
 Thu, 27 Apr 2023 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682616064; x=1685208064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ThsgU5dxftQSrGWB8lAXUWGk9tQClLWkofAITVagcVg=;
 b=WrW5NWPkyhijadMPqA8BFyLH3d3lx4DwdYz2tPNwWVRxfE7gf3+slyl1aPkeCfBFH4
 nmJ5ViSM2AP4kdVF0nShmIlKL2tUa3m+mBxoASOrr6Pt2V313XIC/N6Cw6pL/F1NiOy5
 TPWrmHUHV95FRc6U5fnBwQ3Ut9rNDbyId3maUdxAYfKxvI2OtC1SAJLVPDuq0PjYzczL
 U9ksrt6aEMWKCeTL0k4H0V6Yi8HGkIqmPa3JdWo4tGCkig+FyzFCDcglkr80JuhZpx5T
 kpPMfpsjQhJXfwjh+5z9b3I5U9V4WOW0/J0NcvFwTOlETkYKMJXJmcabw92wzmAC/yAK
 zaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682616064; x=1685208064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ThsgU5dxftQSrGWB8lAXUWGk9tQClLWkofAITVagcVg=;
 b=j7jgkUHbM7rY9KXFjBsxvp6sbuLuXG1KExdIf4ZLWtgyysqiK8i8gjUVryAWvB9Xx5
 KWJIQsePIm9ixRcDb3Zwr5hPlfQE3sQ63azaF0yyLr3ag2gAZP//rUJSpV7cSojA14rm
 +nkq/X/xyOHJNGV9Kw98It1pXuSNqTqdoi6g+aNb61fQvyhfBpNVnQo3+g/3kPVmlm9X
 S7TqdOrxthCkjNGCzpYYZ3svN7ltHXE3mO532eXXeQ3buG3AqlW9kUKp1m0KMKkNPq9p
 E4Vpi0NYKp4t4VayNWDb6BwM9+RumMCj4LuIwNerqIE+Ep8FOT99RHafACEkzyH8jQax
 bXbg==
X-Gm-Message-State: AC+VfDwm9cdOd/u3rL9pg3R/ftOUc5Q9MqtNv5WzW9zEvSg0eqahuYYc
 byA85Ng4ZwWGqa9xvP+NcarPuwIuPAWIcGd+ux4=
X-Google-Smtp-Source: ACHHUZ4UuAobScOR45gdyoikjNFY1+aaoPlAkQm7RbzUUeSxs4Bq8LRUj/Grcg+rV02kJt0g/KxmhA==
X-Received: by 2002:a05:6a21:7884:b0:ec:88e1:1452 with SMTP id
 bf4-20020a056a21788400b000ec88e11452mr2804678pzc.62.1682616063696; 
 Thu, 27 Apr 2023 10:21:03 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.101]) by smtp.gmail.com with ESMTPSA id
 p1-20020a170902a40100b001a95c7742bbsm8878578plq.9.2023.04.27.10.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:21:03 -0700 (PDT)
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
 Sam Li <faithilikerun@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [PATCH v19 4/8] block/raw-format: add zone operations to pass through
 requests
Date: Fri, 28 Apr 2023 01:20:15 +0800
Message-Id: <20230427172019.3345-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172019.3345-1-faithilikerun@gmail.com>
References: <20230427172019.3345-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42d.google.com
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


