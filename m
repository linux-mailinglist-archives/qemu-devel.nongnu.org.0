Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132FE57102E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:27:58 +0200 (CEST)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5cy-0003nh-T1
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pm-0000zJ-JU; Mon, 11 Jul 2022 22:14:19 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pk-00080v-Qf; Mon, 11 Jul 2022 22:14:17 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso337254pjb.1; 
 Mon, 11 Jul 2022 19:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LnocqEql15XybyUUiK+n2EXh+6pjpEpQkwpJSSpKAPU=;
 b=XRhGZDgBPhnhAzRjNDBae5fkpAjJb6vJ5z4XpQcB6XRJqotPuqPnlLM/lR+8I7hi1P
 i9xnUuDMUoGK3MgNH1oLM17gPGEL1FuqeTHreI10qclqwy7XY7YTInv68iOWQzFp1Kvk
 hbYdJkHAUTuUYJNdr1jqsjmnKDhRXwU+Db+xJtm2J/TTp/rReYH+oIlW/1fG0/hpXDqp
 XgmOmG0dElk+QH7dVzSP2auEubhBAPHMHqYo6TbqTqtty4kq44Yq3Rt5q+nNbGp8gMpC
 zN7XBYSYUmfbQ/4K3XBVdfSOTsPgvGVILxdhxTmCFrrU9cZRBR+sF4uO+Y0CvRtqtBQW
 7WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LnocqEql15XybyUUiK+n2EXh+6pjpEpQkwpJSSpKAPU=;
 b=BCdaME4cIYgU8gXUj11Wk3eysWXajj3HakwlBeudRO3nYV8sg+x3LMeH5ei7PXMnKT
 PUPdH3ewurBydnem63lXFdcM3xZka/JU+RNxGij8uzMA/oXhsjBiRndT9OvhEoFVlBrr
 GtEFhSHezsb0zs4eDgADtTpNYfBAV8sG5SrXprniORhOIzfjdldZKzh1aas8HJOx1NFd
 YzD0t49OsBGscUApKTsnYClVITtMsmhIbf42FKQPbd7QbCAtpXgBzuv3qGjI1vloMJpr
 i+jwHkxio24swXto0sNLSHwmTDsu3oUUnvp17TrRkCyvYs7dxdmLlz7sHN+xXa2owlUy
 HGWw==
X-Gm-Message-State: AJIora8wDoXm1B85Q4sywXG6ihIfwWS/OSeoJ+PqE2/GcCHeYqaMXmGJ
 FA/xnNifKwrY7EVteV2rdSg+m/zyYWjTpacL
X-Google-Smtp-Source: AGRyM1vOfYUanDs0Afa2uc6bhlCk1hVuetmcGs2zBaZQJxsIpkDhhOhhGbfiBruKFhQJA+nqnTH86w==
X-Received: by 2002:a17:90b:1a84:b0:1ef:dc5c:3088 with SMTP id
 ng4-20020a17090b1a8400b001efdc5c3088mr1492997pjb.245.1657592055131; 
 Mon, 11 Jul 2022 19:14:15 -0700 (PDT)
Received: from roots.. ([106.84.131.214]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa79736000000b00528f9597fb3sm5430251pfg.197.2022.07.11.19.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 19:14:14 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 6/9] raw-format: add zone operations
Date: Tue, 12 Jul 2022 10:13:42 +0800
Message-Id: <20220712021345.8530-7-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1033.google.com
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

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/raw-format.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..96bdb6c1e2 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -314,6 +314,17 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
+static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                           int64_t *nr_zones,
+                                           BlockZoneDescriptor *zones) {
+    return bdrv_co_zone_report(bs->file->bs, offset, nr_zones, zones);
+}
+
+static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, zone_op op,
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
2.36.1


