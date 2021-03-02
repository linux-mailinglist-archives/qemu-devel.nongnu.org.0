Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF732A0E0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:29:32 +0100 (CET)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH55f-0003aY-2W
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52r-0001hz-5z; Tue, 02 Mar 2021 08:26:37 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52p-0001bG-Ii; Tue, 02 Mar 2021 08:26:36 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d8so1614015plg.10;
 Tue, 02 Mar 2021 05:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0jcyFk/i/Huu0o8b2yWuUb8P4dKbG9cu75HLZDA4x9s=;
 b=WqqUA4KbaJF24AmCor1pZHfdbaVrgExCyZR51jE7NPIuMjLJAH+CH8NSdxNc/O0sda
 WYZDp9It8nttjvFZD3jLXI/fCYh/O+JQW9zBiHBl2H2etaGFEHJ6tJAj5MLIb9Puwn4Y
 9KctJul7Yd5G1L6uZagLTA/87ruD51dDNEvYAh7JXgRRrhgVA4lTZm4HfeKJMIrroyV8
 m9gKEMSW8EPHgFpPzG9V39NVt1htLRGdYyKt8/K87jtY7JxOpZhzQj18Ey73lwt1nG45
 N+2UpR+oOe//jIqFi5Pe0G2KHz5889NrCBzQbMmjgxL5S+1AuazCUOBfx/kWzDTR3XO4
 +7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0jcyFk/i/Huu0o8b2yWuUb8P4dKbG9cu75HLZDA4x9s=;
 b=ouOsRWVlH7PZ2sgjQ6RNnp3d+ANA0RP8JRHvyy/GGDISEfMBuuEIvdH1mLeC/ReYQQ
 tF08kguxXAj6f3I++JwEogbMVgeD3GXo3SNYb7Kt1GW8AvZZpqPA5K5taq//5FidFI7/
 8eVlMtbsPizn0CdFTHn0t+hMWRktTdN310FD/jwZrfkYd5izZKDYYk1r82NHPDS/rsYb
 HEVxWijTShVjmXQ9RKEFXvK0iYsKX7F3OZ+WsfZcorhaktwl1lcbeaQoClzj+PfwwFwj
 QAB/JKIT7TtNaGcVi5kzu1GKbSvBNWJZFZlFl1r5zQnhdlvqlzd+tIAQnExsuxhApsCF
 4pPQ==
X-Gm-Message-State: AOAM531QhXKomfqSld0yLqihKEcEVfnhuPCFSDRSjPqKvfT7Xjh/T/dX
 /vDBHU9sNEBgeRfy3d7VU4pt4OiiPaHgqw==
X-Google-Smtp-Source: ABdhPJwyFBjVs3cfrpPHkfafx6aETfC8ANJTn87AGfXFjDblBazasofTXGBEywF38GfjpghEUP0IVw==
X-Received: by 2002:a17:902:e8d3:b029:e3:cb77:2dde with SMTP id
 v19-20020a170902e8d3b02900e3cb772ddemr3632445plg.78.1614691590388; 
 Tue, 02 Mar 2021 05:26:30 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u7sm20166956pfh.150.2021.03.02.05.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:26:30 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 2/8] hw/block/nvme: fix namespaces array to 1-based
Date: Tue,  2 Mar 2021 22:26:11 +0900
Message-Id: <20210302132617.18495-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
References: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62b.google.com
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

subsys->namespaces array used to be sized to NVME_SUBSYS_MAX_NAMESPACES.
But subsys->namespaces are being accessed with 1-based namespace id
which means the very first array entry will always be empty(NULL).

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
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
2.27.0


