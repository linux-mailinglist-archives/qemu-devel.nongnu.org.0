Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0778B4ED030
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:32:10 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhnM-0007Nj-LS
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:32:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsp-0007ut-U8
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:39 -0400
Received: from [2a00:1450:4864:20::143] (port=44548
 helo=mail-lf1-x143.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsn-0003AG-FS
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:39 -0400
Received: by mail-lf1-x143.google.com with SMTP id m3so38065070lfj.11
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oBtEQJ45kQI05tOh3SKMvr4vDTTUhOlBeGizKxkbGs4=;
 b=b5dkbVII2N8tIX5kPuaHhDLAND7hwH1GN824h5fvGCTXFhHfpenKPpABjDkCmf4xPu
 u1L1MewYkbY7Zf1N6BfQpdOgn8mOY6ilkoUNK1KKDhr84OAEIjIJNPd75ttROmqr+UOx
 dvDXbvNoDAso+sD5cqHCy3r/nI4EjtGLODCdUovJ/8EjDnyfQNmLtd63yn1m41vBg+fK
 GMwq2FukmxDrdsosmdlvBWwtv9SEsVSW3wC6nTX9sG1MTLeypzwNGbgsyxg0Y3ElFd+F
 3tgo66YnJcRCTRoE85pO9ALtV1IqDyaB/K6N0WCOjbs9GclHo72s3BjCIkAvz+bm+X21
 R3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oBtEQJ45kQI05tOh3SKMvr4vDTTUhOlBeGizKxkbGs4=;
 b=AByg5DdB5YBwLGWy232VG9RDYYGwuHXgZra8ylNdIwMGZlqAw3Advt3bXNxD0haSqi
 po4U+Clf1wjIpkuv/unqOw5+vpYmI6QWTCJZ6M0t4qnmF73XoxOmMbwvj7eGm1wMQmWf
 WM9wU4VzKA4lGHqIw2lLLsZq/imHsD65H+zk2D0p8bYlq8y6iTN5T+xd5ilF9MDkP/9e
 zmDbYRGLajlKwG8LGHr0F4hvFsZmxtldBMYRQRBK25ctfeuRkQkd0Vc/UXmFf5q3yeNQ
 raVHmSIE8wysQsvB/IkQF2QR9TJDwTUOG7QBGFtoIO3DctpgFzc49MLvac944cftLAnv
 jTyA==
X-Gm-Message-State: AOAM533q/Ucyw5zQeJ4+G5JQ9Y7/WUySb6cG9V4ObehaziZXWjvZOItU
 xvRb8Zje/Px+WnmjRxKvsjjcwWQaetHh5A==
X-Google-Smtp-Source: ABdhPJwWHQ/HU5jd2ebwIGSOeive4Ltg4KqdPhNYBIk0Sz6/MOo3a9LEvdUC42FTL+SI9gRC2V3rQQ==
X-Received: by 2002:a05:6512:3f90:b0:446:6b95:24aa with SMTP id
 x16-20020a0565123f9000b004466b9524aamr8534262lfa.610.1648675775840; 
 Wed, 30 Mar 2022 14:29:35 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:35 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 07/45] block: document connection between child roles and
 bs->backing/bs->file
Date: Thu, 31 Mar 2022 00:28:24 +0300
Message-Id: <20220330212902.590099-8-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::143
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x143.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:15 -0400
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

Make the informal rules formal. In further commit we'll add
corresponding assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 include/block/block-common.h | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..2687a2519c 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -313,6 +313,48 @@ enum {
  *
  * At least one of DATA, METADATA, FILTERED, or COW must be set for
  * every child.
+ *
+ *
+ * = Connection with bs->children, bs->file and bs->backing fields =
+ *
+ * 1. Filters
+ *
+ * Filter drivers has drv->is_filter = true.
+ *
+ * Filter driver has exactly one FILTERED|PRIMARY child, any may have other
+ * children which must not have these bits (the example is copy-before-write
+ * filter that also has target DATA child).
+ *
+ * Filter driver never has COW children.
+ *
+ * For all filters except for mirror_top and commit_top, the filtered child is
+ * linked in bs->file, bs->backing is NULL.
+ *
+ * For mirror_top and commit_top filtered child is linked in bs->backing and
+ * their bs->file is NULL. These two filters has drv->filtered_child_is_backing
+ * = true.
+ *
+ * 2. "raw" driver (block/raw-format.c)
+ *
+ * Formally it's not a filter (drv->is_filter = false)
+ *
+ * bs->backing is always NULL
+ *
+ * Only has one child, linked in bs->file. It's role is either FILTERED|PRIMARY
+ * (like filter) either DATA|PRIMARY depending on options.
+ *
+ * 3. Other drivers
+ *
+ * Doesn't have any FILTERED children.
+ *
+ * May have at most one COW child. In this case it's linked in bs->backing.
+ * Otherwise bs->backing is NULL. COW child is never PRIMARY.
+ *
+ * May have at most one PRIMARY child. In this case it's linked in bs->file.
+ * Otherwise bs->file is NULL.
+ *
+ * May also have some other children that don't have neither PRIMARY nor COW
+ * bits set.
  */
 enum BdrvChildRoleBits {
     /*
-- 
2.35.1


