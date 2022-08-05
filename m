Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB14F58A7E8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:18:43 +0200 (CEST)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsXW-0003gX-GA
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsE4-0003Ja-8I; Fri, 05 Aug 2022 03:58:32 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsDz-0001y2-Vz; Fri, 05 Aug 2022 03:58:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso7536156pjq.4; 
 Fri, 05 Aug 2022 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WgTioHR22IT5Y1Gxy5Cwuruw+nplwJ4ECOjTCIRKC8o=;
 b=TgompkQWNMgL2oMrfZtIdIGhhbjlZPaPlCeZHxLiiD1oTnya+nJFeN+SN1sAgErckC
 YU5kJr6zyl6blhzNkT+ccTy3sUsUwCYLHGYzIG4VV6pwJ1q8FzECgVXxY0oezC5DtBtI
 DcGd8gxja9ZLi0LBQY610weZ2HEETmHUSNTdFX/JuEtYLBefgAvCB1vGm1eVzvrZGX78
 Jy3FcdqoAsvVYpsHEjsZokfI9I1EL4dlXLkOhdv9cZZ6QxyNbP1wRo383mhiwMU2019d
 VKrcKAxN6ILtMBR8ueuTRduiFkwLj6qOg77I7/G2m02qM7SWBwA9yYgIL8zk1ntivZS1
 fCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WgTioHR22IT5Y1Gxy5Cwuruw+nplwJ4ECOjTCIRKC8o=;
 b=hEGEPDScuJY32d1wWv2B1qiOCPhD4JbSa/7yqEIHW4vVR+0OYRhRMyE51yA1CZGuSn
 bSjiomfriTl8fa2r3ChSr9TRa6vdpBUMeWw3AeITJow8sh3U90GyaCu4Uh3h57ZFS8Dy
 MtOjkeW2S+sfz4FrtR56kuVnMGrxyDYjK6VdbFoZTjemetHucjn4gqDkbjyZRoObK4ru
 SCYydeNbPZNFK4eqBpg45rBxKAHu8RX/yknRO7pm7krLBCK4bPIgKQtVzEIseD87oGn6
 zEJmWKtyYX2Ny1n8aAyjV4pfreFHhIw93/v8G0fsWcShb2asXHQkDqo5dNPhcbY8F63J
 khbw==
X-Gm-Message-State: ACgBeo1PzfN4qvJOb6ELxlykQJkRUTvKA3+tmJLrot7hIqlagKWebP79
 mwriMBULntIVcbZfNVuFuvKJMabQASANPg==
X-Google-Smtp-Source: AA6agR4g5Mjqr8dE07MiyFxjrGGOdYtym+CFPZggKIrA5KfwiHTx5OLFCDV+TQ7MnYhLzY3aES3bjA==
X-Received: by 2002:a17:90b:4b8a:b0:1f5:942:dcc6 with SMTP id
 lr10-20020a17090b4b8a00b001f50942dcc6mr6440961pjb.78.1659686306071; 
 Fri, 05 Aug 2022 00:58:26 -0700 (PDT)
Received: from roots.. ([106.84.130.246]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0016ee708350bsm2418564plg.14.2022.08.05.00.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:58:25 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hare@suse.de, Stefan Hajnoczi <stefanha@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 5/8] raw-format: add zone operations to pass through
 requests
Date: Fri,  5 Aug 2022 15:57:48 +0800
Message-Id: <20220805075751.77499-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805075751.77499-1-faithilikerun@gmail.com>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
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


