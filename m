Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B3C4EEB12
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:13:06 +0200 (CEST)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naEHB-0006ER-Cs
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:13:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naECe-0003Zu-OB
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:08:24 -0400
Received: from [2a00:1450:4864:20::12d] (port=38403
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naECb-0006FA-Ri
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:08:24 -0400
Received: by mail-lf1-x12d.google.com with SMTP id bq24so3976174lfb.5
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7PV3U0jlWrJUVYNZWk3wSiLas2jl6YKvOTVDaNyvz8=;
 b=3IvvXJj+34mtoL28y6VkAPzztKuR7DX+vNH/+1J7O3M5G/GojGX9Z6t/axAAF7JlVQ
 F92SZtKN+rBMvoXd2IYhjP59sgyt8NxYrKHkRxJbYnK9XbGsu5FQRW4qsm7xOrqPuBXM
 dBt13xns9a1oVbns0gJrG1xGw+O1p2kmETE1/fW+8DUQzHDr5TwtT1QjERpN8/mAL/V3
 F5i5pqOUhQFPb4xA70lV9sHU0rQ6ETrCc09mR4KWSZlNW00oz6iNPTBa4rxjdVWudzpk
 VrVrDNA4tntcXO2wEdBUqcFKpH55H3PcRyT9mkNvesRAiE9n51erohjQ8tjrwzmJ4sKT
 E2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7PV3U0jlWrJUVYNZWk3wSiLas2jl6YKvOTVDaNyvz8=;
 b=T+Ug1kEvc5TWU0aGOn4x4Nm0194vP/8xFOoDqbmvU+JSoVUU+w1KYsOhPJNw2wmRPz
 ZbmIypOMmn6fe7Yk5l3BinKQdYG3sQSVyPVmjg4a9A+DXHNpEZ7yILQo2umI32YL2axI
 CfFa5zA1eXkfm/rV9N2pQD3h6ZwOOfKzBNPFNKfTWfM7RzEV0YzOzSJjZsfo6UBrIOLu
 GilgkimVx/guJKCb0RaaqIf0K2lTa8BWWDKqKlB69dX2M7IrBm+gw42X2MgAXqzFMmIu
 X+QG82XDizl/+yPngGa/E5A2LqZ0Ja1kXcp2LGqcaC/ADr0VlmSU38qKXXY5FYjW5Ece
 lSvA==
X-Gm-Message-State: AOAM533xX4lq3mTVBE8qK8ueAgHlPX97U9FFJLOaHxKm8+0hH79Z2y1C
 xt8i0NqyS5rOYx42K6z1KMnFPw==
X-Google-Smtp-Source: ABdhPJxDWssVjUwCv8+MHz0VQYbvaLR3lBrko257TaaDPbRzaYkXlusNsCOtni2Yg1ssgSbTUd4GpA==
X-Received: by 2002:a05:6512:2251:b0:44a:9707:b54e with SMTP id
 i17-20020a056512225100b0044a9707b54emr13797087lfu.189.1648807700140; 
 Fri, 01 Apr 2022 03:08:20 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 a3-20020a195f43000000b0044a997dea6bsm197508lfj.288.2022.04.01.03.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 03:08:19 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/3] block: block_dirty_bitmap_merge(): fix error path
Date: Fri,  1 Apr 2022 13:08:02 +0300
Message-Id: <20220401100804.315728-2-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401100804.315728-1-vsementsov@openvz.org>
References: <20220401100804.315728-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, nikita.lapshin@virtuozzo.com,
 eblake@redhat.com, qemu-devel@nongnu.org, hreitz@redhat.com,
 vsementsov@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the end we ignore failure of bdrv_merge_dirty_bitmap() and report
success. And still set errp. That's wrong.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 block/monitor/bitmap-qmp-cmds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 8e35616c2e..4db704c015 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -309,7 +309,10 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     }
 
     /* Merge into dst; dst is unchanged on failure. */
-    bdrv_merge_dirty_bitmap(dst, anon, backup, errp);
+    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
+        dst = NULL;
+        goto out;
+    }
 
  out:
     bdrv_release_dirty_bitmap(anon);
-- 
2.35.1


