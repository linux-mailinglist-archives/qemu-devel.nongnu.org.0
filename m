Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE09316AE7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:15:52 +0100 (CET)
Received: from localhost ([::1]:43002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9s9f-0004KI-V9
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s3v-0007j6-VN; Wed, 10 Feb 2021 11:09:55 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s3t-0000Cj-7Q; Wed, 10 Feb 2021 11:09:55 -0500
Received: by mail-pj1-x102c.google.com with SMTP id q72so1361684pjq.2;
 Wed, 10 Feb 2021 08:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Tba0cycsltwUC73PsTkrnovi7914K2kfDYRvppj6aFo=;
 b=qTwnMTZPHJQe2QernPOWkjFtfyotb8BCPGUEz7yIsNBCbofjum2oC4NR7wBIVEbyF/
 /haS4dXT6BWfTBiOQGOnphe0uwLVsfrbppQAUzQmY8yRpiNrDiSbmAVE8G6Dx2RACCh6
 x5AILiAha9KcEXo6xSCe43Sg0qDfcIb2HflWCDXrqkpqjQO8zgvnOAl2V0iUp+7DWvgs
 IjA4PQnKDnut2DuFNikKOWO+FTpI+3NMdzhMXKCaxJsqtOE9NGCukmiUXWUL+jDwcIqj
 V1WSnL2+AoFl4lITmMev+nEuHQNwqWQPlvaMbhbk2uoyfRCLR635TPB4R2Ds8XiJZkDW
 yBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Tba0cycsltwUC73PsTkrnovi7914K2kfDYRvppj6aFo=;
 b=kirnn2lmerlpijqHy5pO4d92wnUhNmaeokt36aR4NOo4Io7HmyvsephArlha3rfSs/
 JHz60UJPf4xteH/weVIvaSEtxHiGgVKTt/uvrfebmoo+5cfGciZAHc+T6BT6ajKnFavc
 Uad6qQPCPbE+ft+S9M5w6WERVx0zayvNRJwOr3SKKPWjVBLlGYx/xs5oQNGADCB7WL07
 GpRpx9xcenyDtEHUqjuFW5bo8QC9Xp/EOp8IP/Q/EzhPvis1ol3+wS/Lwu2BVUvVG1R3
 EpziBgrjIksE+XmfQlAIpPO8bWRkOCXqIxhQwZXyRuj6ESD5lomu11GIWGiO6HohmJtj
 z0Hw==
X-Gm-Message-State: AOAM531M1bWv8daFyGWw+O5ehH9ZM+wNYRbvbBHoD1lMRv4o5xAwD6rX
 lpRqRlVTLdX/vQ0T14wuxS+b2TlourhNRA==
X-Google-Smtp-Source: ABdhPJxH58bk0PrGMsbKd2lrFjSdUo/WEePsKrBACdqUz7DOHiAZzmz7/U2RbNgfF5Zrzbt9k0hWQg==
X-Received: by 2002:a17:902:6a83:b029:dc:2a2c:6b91 with SMTP id
 n3-20020a1709026a83b02900dc2a2c6b91mr3846947plk.8.1612973391402; 
 Wed, 10 Feb 2021 08:09:51 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 25sm2761195pfj.120.2021.02.10.08.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:09:51 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V2 2/7] hw/block/nvme: fix namespaces array to 1-based
Date: Thu, 11 Feb 2021 01:09:32 +0900
Message-Id: <20210210160937.1100-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102c.google.com
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

subsys->namespaces array used to be sized to NVME_SUBSYS_MAX_NAMESPACES.
But subsys->namespaces are being accessed with 1-based namespace id
which means the very first array entry will always be empty(NULL).

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-subsys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 890d118117dc..574774390c4c 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -24,7 +24,7 @@ typedef struct NvmeSubsystem {
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
     /* Allocated namespaces for this subsystem */
-    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
+    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES + 1];
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
-- 
2.17.1


