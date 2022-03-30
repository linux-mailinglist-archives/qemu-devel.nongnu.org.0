Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976E34ED034
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:34:22 +0200 (CEST)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhpV-0002I1-MJ
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:34:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsy-000870-A0
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:48 -0400
Received: from [2a00:1450:4864:20::230] (port=37708
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsv-0003Gc-Dj
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:48 -0400
Received: by mail-lj1-x230.google.com with SMTP id r22so29480179ljd.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=USBtfhdisamEP3StAFvJ5Y3uMotND/oftiJcCE6F1NQ=;
 b=Ba2vLrR5jxSEEfMpe9Q5GfP89Xg/quvd3ufJx01tQhUffufruSVXvrkkQKwAP8G8so
 Ph+kFQgiZ5z5TUOzWVVyxIfBwvOCce6Hz7cvpyb9Uvjc+0Hd8DqNMGci5TkxuykX0JL8
 RgJxwSeLyKSNp7RYiUZdgE2mryXMcx9PHy95Idfda0Af/5l+U4EUi2/EDD+T0l1v9uGq
 pCTnisZiUDeRnLrKrkRWcjgmNl/2CIypPUjMLz4Z/WZ/nLDuQgZN64w269Ud2elckgou
 hjubAKUpXiUJG4HL879dhj8GKkS55QX2qcvEnRrJtZpLqwR2xllQJXLUCDGL8imAOwhN
 PisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=USBtfhdisamEP3StAFvJ5Y3uMotND/oftiJcCE6F1NQ=;
 b=WMS6zngqQoWzNybRvipJWH8lRIHRkjSO6vifBM5IUI4bdMmtUvICEkGesmQ0jwAO5N
 YHhOfhcAJyyieuXW4thOQAOpRZ+qFCzOEUNpPwIKBSJ1oEHHKG7b8ErOdyQ4cyaw+ndB
 Fip4Ta3emCyAqGRohBFCRpOkyF4/K77qvqakIG9Z3OlrGa1cCQilb3fMI2iYmdENXMD4
 9NsWbcbLSiFs8DFOkIacyNIDsCyWJ/CCxh7sE30Bwy1kz6SCGCAkECKZeOPNYhaCoonn
 sTrVtjLU3Nnyco/pbg2r6mCH7jaHzoxSOl39he+rbOU2tF7BSD951vb8VDsR3JABtJpD
 BWzQ==
X-Gm-Message-State: AOAM530CI0pURIxNZqnwxOcMQObiJ0o4qOvKI5GfEkeJmYQIlGbDsvu4
 tT8rcC5A+j3Xu3t000Fl9dRGvp9CZ5Klxw==
X-Google-Smtp-Source: ABdhPJz4bFnbTuTgVD7EYdVmD4t27e0dcxdlsPyYktUMrhal9TlUGYXTKYLFRU3NMSv8fn2pGXv67w==
X-Received: by 2002:a05:651c:b8b:b0:249:808d:b522 with SMTP id
 bg11-20020a05651c0b8b00b00249808db522mr8169669ljb.194.1648675783779; 
 Wed, 30 Mar 2022 14:29:43 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:43 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 20/45] block: make permission update functions public
Date: Thu, 31 Mar 2022 00:28:37 +0300
Message-Id: <20220330212902.590099-21-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x230.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:24 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll need them in further commits in blockdev.c for new transaction
block-graph modifying API.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c                            | 7 +++----
 include/block/block-global-state.h | 4 ++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 9009f73534..be19964f89 100644
--- a/block.c
+++ b/block.c
@@ -2519,8 +2519,8 @@ static int bdrv_do_refresh_perms(GSList *list, BlockReopenQueue *q,
  * topologically sorted. It's not a problem if some node occurs in the @list
  * several times.
  */
-static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
-                                   Transaction *tran, Error **errp)
+int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                            Transaction *tran, Error **errp)
 {
     g_autoptr(GHashTable) found = g_hash_table_new(NULL, NULL);
     g_autoptr(GSList) refresh_list = NULL;
@@ -2580,8 +2580,7 @@ char *bdrv_perm_names(uint64_t perm)
 
 
 /* @tran is allowed to be NULL. In this case no rollback is possible */
-static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
-                              Error **errp)
+int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran, Error **errp)
 {
     int ret;
     Transaction *local_tran = NULL;
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 600afcf5bd..c307b48b2a 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -253,4 +253,8 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host);
 
 void bdrv_cancel_in_flight(BlockDriverState *bs);
 
+int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                            Transaction *tran, Error **errp);
+int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran, Error **errp);
+
 #endif /* BLOCK_GLOBAL_STATE_H */
-- 
2.35.1


