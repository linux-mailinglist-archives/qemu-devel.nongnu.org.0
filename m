Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8862F932A
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 16:04:31 +0100 (CET)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19bS-0005ZU-CT
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 10:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RY-0004aY-Gj; Sun, 17 Jan 2021 09:54:16 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RT-00047n-AH; Sun, 17 Jan 2021 09:54:16 -0500
Received: by mail-pg1-x535.google.com with SMTP id z21so9325050pgj.4;
 Sun, 17 Jan 2021 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z7ODT9lj0kxOdBE+83aVpPvzwDiEUWaBf6IRt28xomQ=;
 b=VKDfQqQk1d8+CJp/HAfu/ofh74fG8iP/qLxI31yIr0jo3ydd/YDQKQ1I7MuPQ7LZIq
 WsZqUpzvk+1zX+cT3XjVkTzN5lIGlk3hREkzpOOKKpKadPIJWK/Iq6oScSdHwd1Q/qsC
 sGh6OQaNv4208QRhKov3wlxXkuwMfI2gJzcJzZuE5GkyMYIxABtcwWk3vfIWTuo/M9ei
 4XZfzZVCQgQ4FtQZ+eOkBHc8kFQ/U6RqhT1D6vloLrQ3oNpH0YSvohVaozlrDLvT8L5g
 mtQNTSnkce01pQjuvPyJSiN8mYB+IkFoTectNx1jdztDlhthFTvvFS6MKwgeChvm/YSL
 8Ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z7ODT9lj0kxOdBE+83aVpPvzwDiEUWaBf6IRt28xomQ=;
 b=fX1+L/K8l9mmcUST26i/Aax7GJZuz1Kqy9Q3WP9CkMhdnBnm2rQCt6gdNrKhgyUmEc
 n8mrL5mZ+yVw2oj4m9nhQa7rojln/BfIJEfhOmh5ViGIw400NaQ6pAFky/u1/aXFsItS
 BkX7t5GFWS02dOkjFPJjT4LWpAICpUmf8FZJtR3T1GC9LZ5elWYqdGYNwpNn1K959SxL
 nURQrKLtCGcHqIHwcBL8TfvNPXFS/aWgkozU6t77dq1KPVA0Y+zpBnjrwHy78FpPhT6Y
 4ubKYneYwhfAMFisEqWBO/sQFy+t7n6Tp16W+nk7LTxi59z+c8YUr8W/UjXsl4iWBxmr
 HB4Q==
X-Gm-Message-State: AOAM533QPq12y6l7G27MYtymVPqBHWHeC550nUOMEi2svYOKUgIh9Ri9
 SC9uFEJqo6dngxdjthQ97mxAzHTy1eGpFw==
X-Google-Smtp-Source: ABdhPJwsiCvEgt1NIF+OI+pKQyr6ZN1Vf2hBJn3uCIeLze+7ZrcHuEpSTnmzfI+p5T6YVnHrQBFSIQ==
X-Received: by 2002:a63:4559:: with SMTP id u25mr21740238pgk.306.1610895249199; 
 Sun, 17 Jan 2021 06:54:09 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:54:08 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 08/11] hw/block/nvme: add CMIC enum value for Identify
 Controller
Date: Sun, 17 Jan 2021 23:53:38 +0900
Message-Id: <20210117145341.23310-9-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x535.google.com
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
index 9494246f1f59..e83ec1e124c6 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -941,6 +941,10 @@ enum NvmeIdCtrlLpa {
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


