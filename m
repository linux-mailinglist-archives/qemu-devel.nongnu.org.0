Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7F65082A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:47:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Aqu-0007IK-5m; Mon, 19 Dec 2022 02:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7Aqn-0007GR-DN; Mon, 19 Dec 2022 02:46:21 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7Aql-00068O-ID; Mon, 19 Dec 2022 02:46:16 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gt4so8236042pjb.1;
 Sun, 18 Dec 2022 23:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xdKA0ESbpnyuVxVYQ4Q43Ey250Lv9NrFytWGQvnSqac=;
 b=meoRvNXag2W7GnAe2lAZfn/gUU0xxc0JdfVdxqWRI+Bt+qoHMFo0W6/z5wEYKT5wLx
 q27WARoyIsO6yznnJ4u/HspqT4cxr9JxD3e6TSZH7qCTFJrs2pC0+xJlAWOtVVBXRWc5
 kL2MRQr5V2qVbg6DthxJKDen8gIfjrAfDke+YVEnFW92yXLZAsdZp4dj97Ztw70HlxS2
 KI9WkT5TZQQOgLEQEV9dJ0i8pplAya1ShfGTjFO2btMjccp0tdF871q2aYKYDqXGohhp
 01seN0kCxRsqSUz9D/w2hAMCX5saqiW6KZgzAATFd+I7at3Y4ZPkPcBZXh2EMEbAoQ+0
 yNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdKA0ESbpnyuVxVYQ4Q43Ey250Lv9NrFytWGQvnSqac=;
 b=3z32GzGR9xUEkbVtsALG2XKb8ChyjkkKLVFVJppHDWqlvOejoeBjWKp/8UMBEyKwv/
 XYwkYV9Q3VXnf9AIA1gZlHQogXbMbkqiuhY972swoA/DQ+iRkIclshl06CHSvatSpRzI
 LewriwdAiEzMpYCTFVJCecaG3BF95+q0v8LIsF/i0zBH7732eqCz+tPFEXhyWEv1iMdj
 lL/ms+yPJW3gFAEheWc2OA0fMMe1n2t9lwe4HimwYhO88Res+Vy6qA7qjZA/z1R7nGur
 hfv9fM1hKwIct719KbejIvbQVTdsqLFquGrjnJdoB2/ROyymDOrGPWN1UsgAW18CCIaj
 2RJQ==
X-Gm-Message-State: ANoB5pnq7U2JtL0HR+0PlX86JlyctFfnYk1NArEFW709oFG1zJYaRcuD
 XgzKjsabypcU2eR2d8hqe6PAR/QDGN4gua8P
X-Google-Smtp-Source: AA0mqf4eR2RU+u/z8lB4yAlt2KZnOsRKslxY+F33qjrOFhZ5l8P05rUW0sbxjZ4RFbQ4D8C4VRXijg==
X-Received: by 2002:a17:90a:3005:b0:221:719f:d209 with SMTP id
 g5-20020a17090a300500b00221719fd209mr26467122pjb.12.1671435972072; 
 Sun, 18 Dec 2022 23:46:12 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 l23-20020a17090aec1700b00205db4ff6dfsm5254801pjy.46.2022.12.18.23.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 23:46:11 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, hreitz@redhat.com, kwolf@redhat.com, dmitry.fomichev@wdc.com,
 pbonzini@redhat.com, damien.lemoal@opensource.wdc.com, fam@euphon.net,
 thuth@redhat.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 berrange@redhat.com, eblake@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v14 4/8] raw-format: add zone operations to pass through
 requests
Date: Mon, 19 Dec 2022 15:45:58 +0800
Message-Id: <20221219074558.7355-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
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
 block/raw-format.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 28905b09ee..8e42fa83ed 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -316,6 +316,17 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
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
@@ -617,6 +628,8 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pwritev      = &raw_co_pwritev,
     .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
+    .bdrv_co_zone_report  = &raw_co_zone_report,
+    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
-- 
2.38.1


