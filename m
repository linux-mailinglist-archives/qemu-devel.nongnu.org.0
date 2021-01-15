Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E42F7860
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:14:00 +0100 (CET)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0NzL-0005fm-Cu
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Ns5-0007zc-I8; Fri, 15 Jan 2021 07:06:31 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Nrz-0003XI-Ru; Fri, 15 Jan 2021 07:06:29 -0500
Received: by mail-pf1-x432.google.com with SMTP id h186so5367187pfe.0;
 Fri, 15 Jan 2021 04:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9k+hERDWCB/gTAlWmWagbmZXp7Dw4NAcOtduFW8W68Q=;
 b=jChKcvJw06CZK6u7mJrp08I0BQgqIgooSRgevX2KOpShLHrG2Z0Wsu1li6AKgtjb9D
 GO95JrJesHhrWSqqum7y26UfxhprTzdnFUTKITzi8u9bl1F3KR6kH64uMpLROYpg6b/4
 1NzEicVxPT9X1vt45N5c7I3619FA0e8zUilFuu8P1zbpL7Duph/XXvSR5QZWZ/Qu4FyQ
 FaSBm3qLpOZ/m7vGx5zfASnip/+pJ2FsRKQFpsiBfHwIKqEXS7Lw29rltpq26b2771UE
 RohVnNS4ho9TX7gpI56xn/kJh+ska+owiLMLRyT4BzoI7PajPvpczHu3p3G/ZtlTWF+8
 6/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9k+hERDWCB/gTAlWmWagbmZXp7Dw4NAcOtduFW8W68Q=;
 b=TFsvw/jOl17xZL/yQaww7Vc4pegzBpnArPl75zUFqBMCU65mDxgdR9pFGB+xOoYgp/
 Sz/+nEkz1tQ+RbtgswpOo0WGLC6Yjz6y74oQ6bC1x/f4uFYqZVIYFYnnQcR/PSWXKoQ/
 a11+fTTPhPjz0rga9QBCjQe03WG38e1EhnivrN5Wi89EnEDZwjMCB2b2XxGpZiZy43ye
 7WCpXc95kyvoermau+cOMLUyd8sJl1G4qL6sOWK7k9NsCzcL/Lpofa1pEy8aGTq+xE+N
 sOYm3VdhWhdWbKt1Pwjg6IyjmH83g4bhv4RpcdlDmaOXC0qTnaafna6sO1kzgfy1Oh5R
 MVJw==
X-Gm-Message-State: AOAM530yt43cl+z2/OKh1T6QsfKyrfYglKxmBlKKSAPExW8l/xV526mM
 ZIRj6nNFfWMsyBMhEKDafiGOD+mTqbV97w==
X-Google-Smtp-Source: ABdhPJwXRhTMitWMmgcRq9X1g31SeQaLs2xl+AQ1FTt6Pr5GXExGhoOzJZoqJdSTbFYJ0PBhSQsd8A==
X-Received: by 2002:a62:7ad5:0:b029:1a3:d0a2:e49 with SMTP id
 v204-20020a627ad50000b02901a3d0a20e49mr12309685pfc.31.1610712382130; 
 Fri, 15 Jan 2021 04:06:22 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id a4sm8338161pgn.40.2021.01.15.04.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 04:06:21 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH 3/5] hw/block/nvme: add multi-controller param for mpath
Date: Fri, 15 Jan 2021 21:05:56 +0900
Message-Id: <20210115120558.29313-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x432.google.com
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

Added mpath.ctrl parameter to set multi-controller bit[1] in CMIC field
in Identify Controller data structure.  It will indicate that a NVM
subsystem can have two or more controllers in the subsystem.

To set up multi-controller in a NVM subsystem, user needs to give same
serial parameter to the controllers (-device), but different cntlid
parameter to each controllers (-device).

Example:

  -device nvme,ctrlid=0,serial=foo,...
  -device nvme,ctrlid=1,serial=foo,...

The example above prepares two different controllers in a NVM subsystem
with the same serial which leads to same subsystem NQN.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 10 ++++++++++
 hw/block/nvme.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 132e61c0ee7b..50b349cf9ea3 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -57,6 +57,11 @@
  *   This value will be reported through Identify Controller data structure
  *   with a field named CNTLID[79:78].
  *
+ * - `mpath.ctrl`
+ *   Multi-path I/O with multi-controller (default: false). A NVM subsystem
+ *   can hold two or more controllers.  This will be reflected to Identify
+ *   Controller data structure CMIC[76] field.
+ *
  * - `zoned.append_size_limit`
  *   The maximum I/O size in bytes that is allowed in Zone Append command.
  *   The default is 128KiB. Since internally this this value is maintained as
@@ -4284,6 +4289,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     n->bar.intmc = n->bar.intms = 0;
 
     id->cntlid = n->params.cntlid;
+
+    if (n->params.mpath_ctrl) {
+        id->cmic |= NVME_CMIC_MULTI_CTRL;
+    }
 }
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
@@ -4364,6 +4373,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
+    DEFINE_PROP_BOOL("mpath.ctrl", NvmeCtrl, params.mpath_ctrl, false),
     DEFINE_PROP_SIZE32("zoned.append_size_limit", NvmeCtrl, params.zasl_bs,
                        NVME_DEFAULT_MAX_ZA_SIZE),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 6aa9e89ac5a8..73c9c2cff247 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -21,6 +21,7 @@ typedef struct NvmeParams {
     uint8_t  mdts;
     bool     use_intel_id;
     uint32_t zasl_bs;
+    bool     mpath_ctrl;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
-- 
2.17.1


