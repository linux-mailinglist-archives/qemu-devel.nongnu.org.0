Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D16D5B4446
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 07:34:26 +0200 (CEST)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWt8L-0008Fx-4M
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 01:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt39-0002UA-8B; Sat, 10 Sep 2022 01:29:03 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt36-0004o9-Kj; Sat, 10 Sep 2022 01:29:02 -0400
Received: by mail-pg1-x529.google.com with SMTP id q9so3407903pgq.6;
 Fri, 09 Sep 2022 22:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=7O+QsLYhZ8Both8Npds514XyHYENJSnHFw3FwkAI85w=;
 b=gH8XlP9KlEfzTRdeJKSygrLmj9Q11mQP8cTqvaYabj6PrVxRh16qo8qfW8wsYoacSw
 lYHBjj3gPPvCVJVoWc/7BbDF8GvaNLYYlXj0zDkbK5mlAg1QnBa/kLqp4CpjRxpvxdvo
 BXqJUZnjzThCPVlvuV55e+5FOXpgHFHe+4IZa8ikop2+G++j/IXrIP/NrC3m2NJm6Lgh
 lCUph+XMhbTYVO1PMqaDX7JjAweS6n4Acz0RZpOGO1bEPZOxbkwempopcWPPdXses16z
 raY6aSoEluCMR21huuJ2Q0/MDMAK4lQBWBg6cLkBjFaAfzAzk6zxTwQqXsW5v0xLF+jl
 rJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7O+QsLYhZ8Both8Npds514XyHYENJSnHFw3FwkAI85w=;
 b=xS/xsSv5LzMFWAl6gTwLJY21aCZS9x8cv0sm+EP484Fe1vkRiRKecIZdgIxZhmVypP
 43Nvlex1dDFNRj6qKE1sBb/1fQXp3hjLIGVjHDD70GEecKLvAN5ex/BBLaWNXB4adOIa
 c82l34ughJNgUKHdKUL9dfr/ttZfAWtJZqvbMzo2G+7H6N7Ji1doeMQ4GDLOXXDhFOEK
 SVX/pPLoFmEFyvNxQSz7uPN/D6BF6uhX2GP2DHW3kavJzde6SpXb3NXr4MM9vtxNu7XL
 l/MFmMyG+ajUTp8F10PrW3YWFUxfuXllv2IAYftL+VDAOm0jm9uooCgGv8UWlf1GzxXD
 XTcQ==
X-Gm-Message-State: ACgBeo3sg+LiFVC2L6hVRVM6Q8QowDcScKNo7SgiicMWo48Iu1yAYYA+
 wMuuNUloxzzK54K6ZNAuiPzRnHUwy31c8pQT
X-Google-Smtp-Source: AA6agR5T9vACLoRG8rcXpWX1bmDis7vq1o3Q6PTllxt3RoZv4KY0Fi8uIl3BWETaxIJJiO0Wryi1FA==
X-Received: by 2002:a63:4519:0:b0:434:ae87:ca5b with SMTP id
 s25-20020a634519000000b00434ae87ca5bmr15074881pga.194.1662787738672; 
 Fri, 09 Sep 2022 22:28:58 -0700 (PDT)
Received: from roots.. ([183.221.93.83]) by smtp.gmail.com with ESMTPSA id
 y6-20020aa793c6000000b00540d75197e5sm731994pff.47.2022.09.09.22.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 22:28:58 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 4/7] raw-format: add zone operations to pass through
 requests
Date: Sat, 10 Sep 2022 13:27:56 +0800
Message-Id: <20220910052759.27517-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220910052759.27517-1-faithilikerun@gmail.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x529.google.com
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
2.37.3


