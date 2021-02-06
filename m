Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF1E311A44
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 04:39:02 +0100 (CET)
Received: from localhost ([::1]:56020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ER3-0007as-IF
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 22:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOt-0005qO-Ik; Fri, 05 Feb 2021 22:36:47 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOr-0003ha-8R; Fri, 05 Feb 2021 22:36:47 -0500
Received: by mail-pj1-x102a.google.com with SMTP id q72so4667327pjq.2;
 Fri, 05 Feb 2021 19:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Tba0cycsltwUC73PsTkrnovi7914K2kfDYRvppj6aFo=;
 b=XPlsnorcMY8zpRVO5amxQIQ7usNTwiTabNgXr6YXkAmd4xZZwP9hihFseqg11VylCQ
 l6V0HqTGKNqS4vOXtJgHUijNBwqVxsMcet6V6+gzCdJzAybkcv3/jhywpAjZ0OqUyv3Y
 MVGgrmm8smadRpnM9E2XwYxjV7EwJPSqlllRCzHURZPPUqSW1mdsIIdBeSjE+THj+hX2
 G44kJKwVlv6lEySxc6JRxuMIEIHGYaS6hdzovGxKEXcwPugdKlt3cxgYTWIfgtMSbf+T
 roxB7dPZJO16Y/g+nul9K5mJwYnqzG3Hb+YEI7wdjD8gCOTkej3aCV4t6Ri9ZGCR6MTq
 PzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Tba0cycsltwUC73PsTkrnovi7914K2kfDYRvppj6aFo=;
 b=T2HMG637obRpGJsHu//9sQtzN+gfA7pJnCaUgWyPP2EksYmaXnN+uzO3Sc9TiD65YW
 CyxAJFgPoHyQez5g2Tu+geyy8vOZDnB6v97hVCHShZ6XQmEbi4/i/tZ6C9h5JYHnOSfR
 9ei745Yk85HkElQ9FnpC3sX7kfAxW+8E0AQc7iCkF1Sy4iS12YjkrAUgPpkgklCxiZPZ
 Z8YF6/8zZydnprdWa63AbOYPPzm194kUqbxgGoxsRKeL8f4f+KOZcXebL8gSVXQ3kop9
 Ig6zMhBwaqXd9k2rZ0/2HGlgbUjm8M4F535rDL13twAtZxX0s4YhxcgwTj9fPrfCiOyG
 /ehw==
X-Gm-Message-State: AOAM531q4m9h9b4SoMR6AgGO8DuHVaUJVFuB/QNw28E7Tl/BBwEjzZl5
 rR4tE3q530T4zCBVHM7WnBDat1t4U5uqKg==
X-Google-Smtp-Source: ABdhPJyAUvFqCTusu6uEQNoAADYvptL2FfzD837Gji0pkkKaN2kpN0ag8wlqGt0T4PWl+6peY5SLow==
X-Received: by 2002:a17:90a:4a0e:: with SMTP id
 e14mr7119834pjh.200.1612582603441; 
 Fri, 05 Feb 2021 19:36:43 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id j17sm10862375pfh.183.2021.02.05.19.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 19:36:43 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 2/6] hw/block/nvme: fix namespaces array to 1-based
Date: Sat,  6 Feb 2021 12:36:25 +0900
Message-Id: <20210206033629.4278-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210206033629.4278-1-minwoo.im.dev@gmail.com>
References: <20210206033629.4278-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102a.google.com
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


