Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6377B311A45
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 04:39:14 +0100 (CET)
Received: from localhost ([::1]:56666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ERA-0007r5-CS
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 22:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOv-0005u6-8K; Fri, 05 Feb 2021 22:36:49 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOt-0003i3-Pa; Fri, 05 Feb 2021 22:36:48 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i63so5612303pfg.7;
 Fri, 05 Feb 2021 19:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Abv+wakfYHnDIu4Rl391RohO9DmRG+0B+bBge9capEA=;
 b=fggVsCVzwKn8lIOoMJNsX4LJ652swjZcP/FeHWVk9I3cjdmIfQxnCO9AzlHJ/GKOiZ
 +fJpZ/iAmAqRHmmlCrTTXzP1FgUJnHBFy32H3Nfptrwrk+G3JKjHAFU3fbqdg3+hLigO
 KKxa6dZ/4VDwrB8QPdACfgAHsKrGJv3pTgYAyU3tK5qEl44nRm6NU4sw5Vg4z0Z3zg+R
 mJLdPxrMEFmK5NZ/OBAUJDNBwDE0nTCPd2Z2RixtipTryyVE31a5r6fqcmzsn1N1jCEz
 vjCEqobD26oMwptt6jOTtkxsBBC4Q+uK9/LhkyQhRMwfuKKc9ujoTPSS3KSRWos9r0Hj
 FvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Abv+wakfYHnDIu4Rl391RohO9DmRG+0B+bBge9capEA=;
 b=lTv67Cf5NrhvlVf3y2Vyt7YgW28p3XDeXGqw5p6VvDAG5uAWnkLiAKG7ToES7PsOxh
 pkPGTQLSalscMuA98QdXotHYmb+eXl7hhxW5TH6JDvKbedJz/VK7ViPB62hWaCagghJr
 V7fKTYQyaV+eO3IwmErDmyG69AYJhkOWC51CnMeHVvGBtUNFjymAx2wY1puvhT6Q+cIs
 UeC0b/wcfirCZU6pQQl43YuqzEFIJ5os5YrboXZu3V4N7rHaut8drTlpAFjhvrKcy2zd
 4dQZYINm84di6NKkJjrjJ2iQBeP1/Ei5RzbjGBswMCtvNCdBqZvT1j3V+y6gmudEMIGf
 3g9Q==
X-Gm-Message-State: AOAM530bfRt3JjIwRH0+aRfH90aFQf0hVSI2LkedlThUJwPPHG2oS0mn
 STGHioDts/7+4iTuqUm2YiB27e1AKH5JUg==
X-Google-Smtp-Source: ABdhPJx6R1t17JZzCdGOCV6jctuJpLuDtVb971M8v/HimEQrRqpLokEGhwbR5qi0/pxCVzuT1KvT8Q==
X-Received: by 2002:a63:c205:: with SMTP id b5mr7422154pgd.281.1612582605807; 
 Fri, 05 Feb 2021 19:36:45 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id j17sm10862375pfh.183.2021.02.05.19.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 19:36:45 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 3/6] hw/block/nvme: fix allocated namespace list to 256
Date: Sat,  6 Feb 2021 12:36:26 +0900
Message-Id: <20210206033629.4278-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210206033629.4278-1-minwoo.im.dev@gmail.com>
References: <20210206033629.4278-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42d.google.com
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


