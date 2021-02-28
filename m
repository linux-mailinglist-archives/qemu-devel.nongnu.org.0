Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651153273A3
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:26:58 +0100 (CET)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGPqL-0004ZV-Cw
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPn4-0001Ly-6f; Sun, 28 Feb 2021 12:23:34 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:46433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPn2-0004ge-8D; Sun, 28 Feb 2021 12:23:33 -0500
Received: by mail-io1-xd36.google.com with SMTP id u8so15133233ior.13;
 Sun, 28 Feb 2021 09:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3H9nCPAN+eetY3PbT+hXYiOLp/9UGr7Ra/URtIKWm8g=;
 b=CJuiEWYXsX6VrG+1egdK+T5IfX6GEbFNA6i6wqzXjsV8eGp7GT61F1oNCwpwoThi+B
 ZhFpAruCnXheP4IyjCXJDPkpKEXr+aId0Xn+9rzExEM5wA6JTfYSNc6ojxPlGgzrGlZC
 GjuJFRXzpiRpl1L5aHZW8PmJQmKW+J+5g7etEV9e3bgtKOPswD/ZS7D9Re0noqmkqUsB
 TUV9XERChFiWHDV0lhhcmun4CGuncWwj+FePfZndC+u+r/+oV++L5C1fjLE9/zHdwrIJ
 QykdhCpB6Q2tkxHciy8Ga0KdQD/sdhrS9JLujX5M7O4b7Y7qJmfJ74zNzFRedeVxPnBH
 SpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3H9nCPAN+eetY3PbT+hXYiOLp/9UGr7Ra/URtIKWm8g=;
 b=FrI6OkMhzVk/pLo6SDl+2hA+nvXC+6pzXV3CZFZ3u6VLHuZvNKzy709Qm/QV1egWnb
 S6P9D8qAXjmwUhKTILiPJrpCJfOa9wWWNyfvr/egjApen5g5rhKkqEFYcFBSrn6v45IJ
 rXlosy09eCdjzYn5DHUL/kkmoGXPiioOJ4CgQrm2gEAD1/YK7PwsShPnDBQbnFnG4KF+
 NakVOLYIJmiBL7S80z4SOgJIJMhMiLXr4qD0dzQbanQScIbl+7H+8PeGH8fkt4SamJtT
 fMbnjbjbklHgvHv/1cC6dPbDhtsbC7a5ZqKTNETEHMQUYC/+qT3iw1kdsU+0jWlxt4GP
 Fi4w==
X-Gm-Message-State: AOAM531wMtDAov3/X0ssPbLz+ZTf2Cq1oOgbapu8zZxRP8FG/D8fK0Pq
 WAYhwHtsXuUOmRNkQHBa7DidkydCnGK+Vg==
X-Google-Smtp-Source: ABdhPJylsOXkwOblA+SOU85OIcg0qEpY9joI9YB/YwbuhuDy4N3N8GL45jsqBcPrbH3+clsgH+At7Q==
X-Received: by 2002:a63:d057:: with SMTP id s23mr991210pgi.171.1614528674857; 
 Sun, 28 Feb 2021 08:11:14 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x11sm14389781pja.46.2021.02.28.08.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 08:11:14 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V3 3/8] hw/block/nvme: fix allocated namespace list to 256
Date: Mon,  1 Mar 2021 01:10:55 +0900
Message-Id: <20210228161100.54015-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-io1-xd36.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand allocated namespace list (subsys->namespaces) to have 256 entries
which is a value lager than at least NVME_MAX_NAMESPACES which is for
attached namespace list in a controller.

Allocated namespace list should at least larger than attached namespace
list.

	n->num_namespaces = NVME_MAX_NAMESPACES;

The above line will set the NN field by id->nn so that the subsystem
should also prepare at least this number of namespace list entries.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 2 +-
 hw/block/nvme.h        | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 574774390c4c..8a0732b22316 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -14,7 +14,7 @@
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 
 #define NVME_SUBSYS_MAX_CTRLS   32
-#define NVME_SUBSYS_MAX_NAMESPACES  32
+#define NVME_SUBSYS_MAX_NAMESPACES  256
 
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 51b8739b4d1e..7599d6b1a41b 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -10,6 +10,12 @@
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 
+/*
+ * Subsystem namespace list for allocated namespaces should be larger than
+ * attached namespace list in a controller.
+ */
+QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_SUBSYS_MAX_NAMESPACES);
+
 typedef struct NvmeParams {
     char     *serial;
     uint32_t num_queues; /* deprecated since 5.1 */
-- 
2.25.1


