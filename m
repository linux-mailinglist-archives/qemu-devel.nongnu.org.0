Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD72832A0E2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:29:35 +0100 (CET)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH55i-0003mS-LE
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52s-0001m4-O7; Tue, 02 Mar 2021 08:26:38 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52p-0001bS-JC; Tue, 02 Mar 2021 08:26:38 -0500
Received: by mail-pj1-x1030.google.com with SMTP id o6so1975565pjf.5;
 Tue, 02 Mar 2021 05:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GdGE+grQfO2nb8ZMWd503EtIY8C7unP/Wyer9ddLIGY=;
 b=G5/Qpk4j1BxjcB7np+asS68rQLYiz8+MgLHx6xWnk70WS6ER/JWqeD3BgxoMKRoYIh
 6P28m5nUje/7vzuxlX6bdmoaXdT901ipMQb2ADWbGAjnYuBxoDEHcGDnYSW/93cJ9blm
 anlDAhiQR7GY0kCfVNCV3WtNJuqsxrIsOzKK3Xm8zKIuysdqJVMHQLpp6bDGMWuz70k/
 3EIx3aOt1MTEP6TyYLWwNhx5rC2XebU1qhlWzqYsdSDW8OMMMQvjttP318WuCdyDAUyE
 glkz1YMyQOJFpkjZ0e3nAeCSeLHwbQSGOjLgcNgi8NR0uwlheO5mZKO4L5Z1pZobOoAj
 D9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdGE+grQfO2nb8ZMWd503EtIY8C7unP/Wyer9ddLIGY=;
 b=i85Xv2yY9JkqAu5/Dim21mGZbL4vbWIZ3QJhJpclriJveyIB3mmBAhloGb29SJzaTM
 ao+fuWhLXwGRzGaLdHtgSEhBnByybJrqWWn30Ol5bqTmGGifuPs8ImokrwW6WNBdJdOd
 /Hw/yzUxyyGo2/WcwVCK3nWVmd8DDUZY/BOIIqMYqI9n6VqPQY17YDCTsO8Jxh8Ex56R
 Tk6c6vemf5XXnUYAZAOPMTrzkAFmKCXLCifVAgO6f55rb4zd8cNPiRFeNBkWSJCye03I
 sR6i0M8AE3cRpluj/1HLCrFlgby+JZJ8grEIH4SyOxt3RT5yHn3SsY7tQ1w135fYlfWh
 Akmw==
X-Gm-Message-State: AOAM531wTvUCyFQ74gFJP2MZQLFzPImIpIhxVsaDwoGhgN6FbPdQrc62
 Kp1yFUkj3Hya5qdNLaWk8doDHc4mt493Dw==
X-Google-Smtp-Source: ABdhPJyMF4mnAqeZLDEhrsesCNYHB4w96Qxvm00nCDpkzuoq7OVlMeKc5fRhJYUtIn0B8nDdhxZZ+A==
X-Received: by 2002:a17:90a:b28b:: with SMTP id
 c11mr4395359pjr.62.1614691592738; 
 Tue, 02 Mar 2021 05:26:32 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u7sm20166956pfh.150.2021.03.02.05.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:26:32 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 3/8] hw/block/nvme: fix allocated namespace list to 256
Date: Tue,  2 Mar 2021 22:26:12 +0900
Message-Id: <20210302132617.18495-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
References: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1030.google.com
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
2.27.0


