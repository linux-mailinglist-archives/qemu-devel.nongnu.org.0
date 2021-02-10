Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68977316AE8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:16:10 +0100 (CET)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9s9x-0004Tb-Er
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s3x-0007kD-7U; Wed, 10 Feb 2021 11:09:59 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s3v-0000Cy-G7; Wed, 10 Feb 2021 11:09:56 -0500
Received: by mail-pl1-x62e.google.com with SMTP id k22so1458184pll.6;
 Wed, 10 Feb 2021 08:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Abv+wakfYHnDIu4Rl391RohO9DmRG+0B+bBge9capEA=;
 b=D19ZY/OLeEIlxDqa0/quP2Qt6oZlOtpoHZhnvJ4QyEp90zojkeXM1+irQ1URF5QQLE
 B36SateDwNSsxXZmvHwhbkuUMVDPT0LT+lfMx41G3FmIOaiBgojeKe1FdHdMLZ5uDnzW
 o0jcNLU0NnwgVJUzZnUbkEkJzeKqIIQ7IUuRmZquM+z3EaPIkCnHfZutWITzvEgvYA2z
 dDShmpEgXj5jpcYPuPwiY3hFTRTG5RLGUVS7gd6TNhakzzHsf3+RPvelPvsrajvIcjNa
 X04IH4ZhAZwByW5XO3Dz650eIW7Htsc8ImS9oVhFClJMl3jDQDqLvNNigfI6Z08JuopK
 LXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Abv+wakfYHnDIu4Rl391RohO9DmRG+0B+bBge9capEA=;
 b=bZfys1lNlNRHfAcXX2wq6L0TiWxpaLy3sjql9sMhIo/MpjiC5el73nHDCr5yJa4ADV
 fr3Tawyl+9l9tyr+oBSyhs2a5TTWAT3M0NU05jjviH0V7JTqzxMgc62l4IuHW6pkiS07
 NUqMQhYTDoDcmo2BZJqvnk4XWwrS9SN2fg1Woa+wT8oHzrMDO7fvwW08oMRT4swA9CaK
 7aNKV18NC05i2pcYWf7pMLfaIXYCMvpMbI3LJplwyQsNJIZNYR9V9HTjZdQRlxUXRGbT
 c2j4cZ1WVeoeQKizJJdWxEho7eE1zDPP1hQWkd4eFPyYDcE+PGQ/XxB7cxNpNj156aPf
 ZFFg==
X-Gm-Message-State: AOAM530/lw2CmLmHvWCjfGDYLOKr/n3oKGzBUl+e2Ay8a4T3VWLW5Mkk
 vTyN8rZV0WPnrvZPVKgWyROS9MGABn740A==
X-Google-Smtp-Source: ABdhPJzopJFT0EKtS5tmwr95NTQMnqozberlKdP20g8p0rFZXOyjaSqn1rybQc4VMfQ2Zs17UuhLZA==
X-Received: by 2002:a17:902:ea93:b029:e2:b3fb:caac with SMTP id
 x19-20020a170902ea93b02900e2b3fbcaacmr3789367plb.2.1612973393772; 
 Wed, 10 Feb 2021 08:09:53 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 25sm2761195pfj.120.2021.02.10.08.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:09:53 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V2 3/7] hw/block/nvme: fix allocated namespace list to 256
Date: Thu, 11 Feb 2021 01:09:33 +0900
Message-Id: <20210210160937.1100-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62e.google.com
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

Expand allocated namespace list (subsys->namespaces) to have 256 entries
which is a value lager than at least NVME_MAX_NAMESPACES which is for
attached namespace list in a controller.

Allocated namespace list should at least larger than attached namespace
list.

	n->num_namespaces = NVME_MAX_NAMESPACES;

The above line will set the NN field by id->nn so that the subsystem
should also prepare at least this number of namespace list entries.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
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
index bde0ed7c2679..1c7796b20996 100644
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
2.17.1


