Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B578300294
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:11:16 +0100 (CET)
Received: from localhost ([::1]:50670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2vHX-0002DT-FR
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vEW-0008US-Rh; Fri, 22 Jan 2021 07:08:08 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vER-0001ur-3Y; Fri, 22 Jan 2021 07:08:08 -0500
Received: by mail-pg1-x52a.google.com with SMTP id z21so3562487pgj.4;
 Fri, 22 Jan 2021 04:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gq79wtNdkMEoBleQb6W3xZAzvk0xvFQyqyLanl+JX3c=;
 b=eB60VHeMgiayMqvcPMxVYb7zNXdNTCajrlM0JCGl8msaYM0HpTQHdYMRo3jPrqs142
 gy+Bpg0en0tqCckqNMmTDgEaUMEQruYi2J6FVZb0OJY+4wN+lcQzVHBFrXZGKkN+sn23
 PZLtUU9szttMUWuXx80Rv2Z2yxi5nyn6IG4Yne+kXjGjshbC+zIbY0QGcrrQOdHi6/uK
 /BJk+w7+HYBrDNYFyMlT362JCPIIq01wWUGse/+oSVF+rrKHDa0teK0HRssPtSDiVib6
 JIon8z9Z72OuMNBEOjP+GyEmlPHxNsh4mutVtxdWaM0Dru9M/G/nWBBbt9vOJZ6tVgr7
 TMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gq79wtNdkMEoBleQb6W3xZAzvk0xvFQyqyLanl+JX3c=;
 b=s1Xxcie3biZml4PQRC6eoLZMiIInfVUYXN45iLPl39JAHUq1AlUvgM7d5YjUvfsOHV
 3FLy2QSCSKczAt7GO+hrOiwJkA9cEgEcF9H3q293Sap28FXriPLa0atlH0wMLIJBJuuB
 0WbMPOK3WGddtRAAbhJrdjxXde4UoD5vQpysKdrfqiN65rSJrLq0nWHKdlBeZOlyhlwN
 2c2z/POI5Q2Qj3bnOzcrBgod5Yqe2bTz+HsaSm35oInSnYlKRRmajz7NtHx9j/W6BhqS
 UFlv+iOlYuO4Q5KZGT1vDFA0rqx7vPUY7LkwbFZcHBTwfPMDmZTKWr/niMrtFcwrLES0
 ihgg==
X-Gm-Message-State: AOAM532KepttqN4KR9Elv3HLFbM9SFFYFQ+ULRUN+GCkfcDnJoSDuMYz
 bUboES4Kfuqwn1XWWNHJr1mr6aGWXVhcog==
X-Google-Smtp-Source: ABdhPJwFiaY7EnsPSjcglCUlteONHKED7Jm3ZyZkomPFlw5Y345+w/sZR/NtTjCx/RrlcRKZMCk6Ig==
X-Received: by 2002:a62:794f:0:b029:1b4:59d1:df8d with SMTP id
 u76-20020a62794f0000b02901b459d1df8dmr4471583pfc.14.1611317279163; 
 Fri, 22 Jan 2021 04:07:59 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id mv17sm9104440pjb.17.2021.01.22.04.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:07:58 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V5 3/6] hw/block/nvme: add CMIC enum value for Identify
 Controller
Date: Fri, 22 Jan 2021 21:07:33 +0900
Message-Id: <20210122120736.5242-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
References: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52a.google.com
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

Added Controller Multi-path I/O and Namespace Sharing Capabilities
(CMIC) field to support multi-controller in the following patches.

This field is in Identify Controller data structure in [76].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e4b918064df9..d6415a869c1c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1034,6 +1034,10 @@ enum NvmeIdCtrlLpa {
     NVME_LPA_EXTENDED = 1 << 2,
 };
 
+enum NvmeIdCtrlCmic {
+    NVME_CMIC_MULTI_CTRL    = 1 << 1,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
-- 
2.17.1


