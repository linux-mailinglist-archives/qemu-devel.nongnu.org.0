Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C652FBD8A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:27:26 +0100 (CET)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1umr-0005wl-BQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOZ-00007N-SV; Tue, 19 Jan 2021 12:02:20 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOX-0003J6-VR; Tue, 19 Jan 2021 12:02:19 -0500
Received: by mail-pj1-x1031.google.com with SMTP id b5so276240pjl.0;
 Tue, 19 Jan 2021 09:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1ZqTEcO0+My4S8yR9ghwKwwVY5i+OyKUS3wk+3jeLfM=;
 b=twsaXYlafCduFD0SZCo3ogB7gSzNF1iLA13ZD8qpqAJMBlKeVQ6PmW3lqSj7Gn9Y8I
 9JkkUkFPvp9Xfgj/x05dWEEAKDVgV5bZWRte54ImqbUhl5MQZ5lGrSwb1CwRMCRAhWu0
 NK7E7A0FGyXY/07Rehz/MD/EmiKHwxT58UCht9sI0blQ7mrnxIBiyLJMgEa6wQUCAndo
 FaJMylJ/33xi4OBWXqxNziEm0Z1hjKNgqy84fWOq/9wZRPOH/hFniy7w8LAb/P9aKGAF
 jYt9OquGIawO7mSQutT0fZfCtfbE2AmJwtRYCkj9bvD7ONFD4mAnFYDNIo/v5qjMXzAw
 XfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1ZqTEcO0+My4S8yR9ghwKwwVY5i+OyKUS3wk+3jeLfM=;
 b=R8dD45I2ZF99Eyg/4Cya4+WCOS9p70loAwesDYgP+fDm6cgFKxP74XBr568K2FI5q9
 iyy5EMscQmxXDmQIeaFhvBGORnNV5W2sxXSTAFcpHOsCOA4pRR7lbslzyQdRjzRR4AfI
 8kRIDJ4hiJ5ElNagJ6VAHUV7leI/CR+m68Z+R0GKYIwZGb58wAf/mD/1hwqJwWYi5U1x
 HqiqUSWofVI3yoxpcW5EswO2TccESdIrEGXOcBmCqsWZG+/qKzJGRu3vrx1cz2yuzHN8
 dtWe54uunBgXjIb0DT5jvPXfET905ByMLmYwt4lSIdsOhnO2dv2Aced4IX8vrG/lctlL
 p+9A==
X-Gm-Message-State: AOAM531FXcdzlp44mrs0NOMWvvuPATdPFS9Cpe15KUiaJDmEuvOc4rT8
 xSzwEIMu+n4AQnHlwjkxCrmsG7mXMcngnA==
X-Google-Smtp-Source: ABdhPJz81YzMphrreX9vaiWuale1KkD3uBGwx4HRjh/4Xkg6/EuaUlk15l4zYcS76l7U0mmvFXkYlg==
X-Received: by 2002:a17:90a:e28c:: with SMTP id
 d12mr648707pjz.236.1611075736148; 
 Tue, 19 Jan 2021 09:02:16 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m4sm19396001pgv.16.2021.01.19.09.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:02:15 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V3 8/8] hw/block/nvme: Add Identify Active Namespace ID
 List
Date: Wed, 20 Jan 2021 02:01:47 +0900
Message-Id: <20210119170147.19657-9-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spec v1.4b 6.1.4 "Active and Inactive NSID Types" says:

"Active NSIDs for a controller refer to namespaces that are attached to
that controller. Allocated NSIDs that are inactive for a controller refer
to namespaces that are not attached to that controller."

This patch introduced for Identify Active Namespace ID List (CNS 02h).

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2b2c07b36c2b..7247167b0ee6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2883,6 +2883,39 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_FIELD | NVME_DNR;
 }
 
+static uint16_t nvme_identify_nslist_active(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns;
+    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
+    uint32_t min_nsid = le32_to_cpu(c->nsid);
+    uint8_t list[NVME_IDENTIFY_DATA_SIZE] = {};
+    static const int data_len = sizeof(list);
+    uint32_t *list_ptr = (uint32_t *)list;
+    int i, j = 0;
+
+    if (min_nsid >= NVME_NSID_BROADCAST - 1) {
+        return NVME_INVALID_NSID | NVME_DNR;
+    }
+
+    for (i = 1; i <= n->num_namespaces; i++) {
+        ns = nvme_ns(n, i);
+        if (!ns || ns->params.nsid <= min_nsid) {
+            continue;
+        }
+
+        if (!nvme_ns_is_attached(n, ns)) {
+            continue;
+        }
+
+        list_ptr[j++] = cpu_to_le32(ns->params.nsid);
+        if (j == data_len / sizeof(uint32_t)) {
+            break;
+        }
+    }
+
+    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
+}
+
 static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
@@ -2914,10 +2947,6 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
             continue;
         }
 
-        if (!nvme_ns_is_attached(n, ns)) {
-            continue;
-        }
-
         list_ptr[j++] = cpu_to_le32(ns->params.nsid);
         if (j == data_len / sizeof(uint32_t)) {
             break;
@@ -3045,7 +3074,7 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
     case NVME_ID_CNS_CS_CTRL:
         return nvme_identify_ctrl_csi(n, req);
     case NVME_ID_CNS_NS_ACTIVE_LIST:
-         /* fall through */
+         return nvme_identify_nslist_active(n, req);
     case NVME_ID_CNS_NS_PRESENT_LIST:
         return nvme_identify_nslist(n, req);
     case NVME_ID_CNS_CS_NS_ACTIVE_LIST:
-- 
2.17.1


