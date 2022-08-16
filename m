Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B84F5952BF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:42:22 +0200 (CEST)
Received: from localhost ([::1]:54640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNqHN-0002Gl-2h
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1O-0005vH-AM; Tue, 16 Aug 2022 02:25:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1M-0003aC-R1; Tue, 16 Aug 2022 02:25:50 -0400
Received: by mail-pl1-x632.google.com with SMTP id p18so8338113plr.8;
 Mon, 15 Aug 2022 23:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WgTioHR22IT5Y1Gxy5Cwuruw+nplwJ4ECOjTCIRKC8o=;
 b=QfLlPzxVqd1bqi9080PlqcbKSukQuLrWPRvvBNjkGdjiBbNAyeeUl/bhleyASaVo4+
 lRZEUTWNhF8uShqI9w6bJdXopu823MRIbCR3n3jG92AYv+9wO1FchKGH7YHuw6YOuD4q
 0LOnxlzbdIlCgh6GW8N9g8cOiCyT/Nz5hdxFOl4e2Y/vd2YjJvsVQRb3Gf6JbMP4ODRD
 QU8uOVJUAWBTUTBcIDjwyLEF4lpR98iVfczohhSdqqvW8IYTtTulO5y9va8t+bVikTI3
 B4ljaI9WdZSwE4956TGbWBVyTNEalGJr7H8kIDUurVLJiWo4/IsATBMbItNuJEhTD541
 oTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WgTioHR22IT5Y1Gxy5Cwuruw+nplwJ4ECOjTCIRKC8o=;
 b=7LcuOZZHPks1wZ+GP3eohe7/gcBcYbV3N63ZSAzQrvvwsKwi1iX+lUomZh4NBkQxNw
 IJ8o8chEuqANMksuaFAUWIQ9bRw/cuOqqBiUD+cgCl2MB2Uw/a4ue1xq52rlOk1xDgK8
 FkijGtQNr1idy5QZSJHi3ZUObgy2sIFrW8bQwDS9S1rQCrNogV0qg8odCSgTNkYB2ejf
 FpOXz2+LyE3yDyxcQaYz5P+/W/g5MKH+6XJE1zD7culCkZXysN+VnyH4AOseBDgRHdg8
 Z9NK52OUtUbZ5KPQx/8DATD0A6cC/Pxe+lS+UYlWoqbNrLQMbQO4VVKSYd0/bCZEF9qC
 jF7g==
X-Gm-Message-State: ACgBeo3iAUZ/AQIyqQnjkpbgvkW+TIDFPs3DTdxZaGPBg/kPaYw7NUfp
 yT/Hcf5f1HaysfX7ZPJWF/udp2AOciIaXw==
X-Google-Smtp-Source: AA6agR76SCQCPbZ3ex2gSY4qP8N213Q7VdA56JoKkYzmUEr/JCvTjIdEvErgp+eE8M85094wSzNCTw==
X-Received: by 2002:a17:90b:3502:b0:1f3:550:5f6f with SMTP id
 ls2-20020a17090b350200b001f305505f6fmr22422513pjb.49.1660631147149; 
 Mon, 15 Aug 2022 23:25:47 -0700 (PDT)
Received: from roots.. ([106.84.129.185]) by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b0016f1c1f50f4sm8082868pln.235.2022.08.15.23.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 23:25:46 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 damien.lemoal@opensource.wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 5/8] raw-format: add zone operations to pass through
 requests
Date: Tue, 16 Aug 2022 14:25:19 +0800
Message-Id: <20220816062522.85714-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816062522.85714-1-faithilikerun@gmail.com>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x632.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

raw-format driver usually sits on top of file-posix driver. It needs to
pass through requests of zone commands.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/raw-format.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..6b20bd22ef 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -314,6 +314,17 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
+static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                           unsigned int *nr_zones,
+                                           BlockZoneDescriptor *zones) {
+    return bdrv_co_zone_report(bs->file->bs, offset, nr_zones, zones);
+}
+
+static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
+                                         int64_t offset, int64_t len) {
+    return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
+}
+
 static int64_t raw_getlength(BlockDriverState *bs)
 {
     int64_t len;
@@ -614,6 +625,8 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pwritev      = &raw_co_pwritev,
     .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
+    .bdrv_co_zone_report  = &raw_co_zone_report,
+    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
-- 
2.37.1


