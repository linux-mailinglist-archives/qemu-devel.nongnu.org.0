Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0CC4ED077
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:56:05 +0200 (CEST)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiAW-0007zi-Rs
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:56:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft8-0008IH-VR
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:00 -0400
Received: from [2a00:1450:4864:20::234] (port=41636
 helo=mail-lj1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft4-0003Ns-9d
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:58 -0400
Received: by mail-lj1-x234.google.com with SMTP id 17so29456693ljw.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YAkCwHsQwrIG2ydiqn7fJ/NYS3bLCPh00tQPn4N14mc=;
 b=oJOoLdL3hF3hAGuVofUlZ7YX/siwW8pkeetbjVuQ2PaiMzBwjM+nZlxMB15Wh30vmG
 0TDb37QbhjpAZSuNH8ffDoP6HC+1LlU8EXrg+fpn2zSCT+7jmjuZETKQhkf5ayArhQYz
 ll+I6w/3Fw5nyu0zToNE0BZFSLKqpPJ2bcCWPURDMT4/zAAYCDhF898EFOlqMByKnVXH
 PZwdHzgTY1j9xduClAjP8WS6c3O86qBUpj3foQ8uXcoSxB0CXMN1u0yMiTB+nZQ5EydO
 ABYNS5bG3/mekc9IwYwIYD+lusxTxt3OWBi+bIVB4XO5v+dq8G4j0ilTafEUUxa5J2jf
 Js8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YAkCwHsQwrIG2ydiqn7fJ/NYS3bLCPh00tQPn4N14mc=;
 b=VuEYv7YgkUt/HDJttbh1xP7u1PTS6IBBE/5W1og7hElHveq/SMWRbJ5WEq6Bnr009k
 fewGiFCXsQb5tYqYUdwaLJTHsy6LK6zMYJCMoirFbArHoyybKRIgW9S3gS/NH2d8ghyA
 tz6UNtLgfYQTxOaVAC6UY+QVYmhSpNaWC6rJIlwkQ/KRANjFB0AWBXmyZhptB6QWZJiQ
 Wr7Y9q7zNhh0OriZJqYJwEqKpuZ6VQ6ryiZAo6bQxnqswJqPQVR0hUE8SNZ5NP40dOw/
 Xkn4ct8c1YnOwfFdVI43OlUViBv8bZkSoSYGmuihTQH/bBcdQiaRvqbuwl8+c3jM4k44
 x16g==
X-Gm-Message-State: AOAM532BNGNUDORoBAoDhuH5YUsCnXphlaO+ujS/FYD4hpm5NxLs8Crw
 rCwqAC5rbIwUi4UwAVPW38SCUBW7CpYuow==
X-Google-Smtp-Source: ABdhPJwvwLszQxBVHJNYV8+E5uB88SKNpzXQYe9tiSSqsTocotNVVH0xEe8hyUjr+LPLXOX6eOGIZg==
X-Received: by 2002:a2e:97c9:0:b0:24a:f64d:e67d with SMTP id
 m9-20020a2e97c9000000b0024af64de67dmr961713ljj.115.1648675792651; 
 Wed, 30 Mar 2022 14:29:52 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:52 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 34/45] block/export: add blk_by_export_id()
Date: Thu, 31 Mar 2022 00:28:51 +0300
Message-Id: <20220330212902.590099-35-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::234
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x234.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/export/export.c                       | 18 ++++++++++++++++++
 include/sysemu/block-backend-global-state.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/block/export/export.c b/block/export/export.c
index 7253af3bc3..66e62f0074 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -362,3 +362,21 @@ BlockExportInfoList *qmp_query_block_exports(Error **errp)
 
     return head;
 }
+
+BlockBackend *blk_by_export_id(const char *id, Error **errp)
+{
+    BlockExport *exp;
+
+    exp = blk_exp_find(id);
+    if (exp == NULL) {
+        error_setg(errp, "Export '%s' not found", id);
+        return NULL;
+    }
+
+    if (!exp->blk) {
+        error_setg(errp, "Export '%s' is empty", id);
+        return NULL;
+    }
+
+    return exp->blk;
+}
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 0ee6dced99..ea1a93d787 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -58,6 +58,7 @@ void blk_detach_dev(BlockBackend *blk, DeviceState *dev);
 DeviceState *blk_get_attached_dev(BlockBackend *blk);
 BlockBackend *blk_by_dev(void *dev);
 BlockBackend *blk_by_qdev_id(const char *id, Error **errp);
+BlockBackend *blk_by_export_id(const char *id, Error **errp);
 void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops, void *opaque);
 
 void blk_activate(BlockBackend *blk, Error **errp);
-- 
2.35.1


