Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034052F785A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:11:34 +0100 (CET)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Nwz-00037p-3d
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Ns5-0007z2-98; Fri, 15 Jan 2021 07:06:29 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Nrx-0003Wy-E8; Fri, 15 Jan 2021 07:06:29 -0500
Received: by mail-pj1-x102c.google.com with SMTP id v1so4946356pjr.2;
 Fri, 15 Jan 2021 04:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z7ODT9lj0kxOdBE+83aVpPvzwDiEUWaBf6IRt28xomQ=;
 b=Q5ryL0UDo3P2AGIAUpr1YLGNR9AxWEK+AGuxvrf10/7UVK3FqFORLgteF0Tgd0SIPi
 3yhRpWREvPxJYo5gdnw8aC6WPju9ErHVen/XovEZP8lUBg9Z+zlNawimyQ5UzoPQcgUJ
 1eoIlNTxWr0lq9Y+Ep/ZRIEg3YUor4PVyHzgTdtWgasrnvxNl8nFDsNQfxPSiJMsXVpz
 FkmJZ5z1EgSGMNESc1xvHpYkNHf36p0ulXSo9oo410i6Nq6qIZWMsJKObehgrnYGCpor
 OvwokpenHd0RSO27zUNc+hrI0uAO1uWYEYicpJTXQvzjMMsLIhwoBv5UHqujaFmfbGaV
 MRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z7ODT9lj0kxOdBE+83aVpPvzwDiEUWaBf6IRt28xomQ=;
 b=Kk7QecQD6K5y+G/z9lLqhrMsc0NUSNpx8AztH8g87upEtBJxuRbizLIxxaVv2r85Hw
 xa67xYlMhSXnIzIMZWJXXB0CHcproMh5c5uaJodYfEGtKkl8wykqdX8pYq8us1IeWacT
 WUjHWAytPu4M3VtTYoNWTgtD+JZsaAWcyTcTZWwaYH/WT9BO6gWIsXUjAe35ry0/P3hI
 zuWgKT8eXdl/7lfIxMy5I/Ovf5RUuOm7300iPNN/RjGlrCSpwnEidJQFt8zkHQWyjC3I
 xUYM9LYgXVMmN8E5sr5Og3mUHY2RarbS/nEJYP1dhIvWsFNA0vy74C9IsktXXtZYuoCZ
 VkXQ==
X-Gm-Message-State: AOAM532l605Pc0AX6/0sfecbQOc0xVS6l22lTljSNgyKaeYqNtPYUAD8
 NmzOY6/0L2C2qRblGG9sEDtoA63he0Emqw==
X-Google-Smtp-Source: ABdhPJwo7eG0BzHYf9sZqNSt5fnNIAZ7XQXoegZlcajueApTmyduYSFWlGkeOXYjIz6+C0bzckH0NQ==
X-Received: by 2002:a17:90b:34f:: with SMTP id
 fh15mr10138464pjb.80.1610712379747; 
 Fri, 15 Jan 2021 04:06:19 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id a4sm8338161pgn.40.2021.01.15.04.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 04:06:19 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH 2/5] nvme: add CMIC enum value for Identify Controller
Date: Fri, 15 Jan 2021 21:05:55 +0900
Message-Id: <20210115120558.29313-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
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


