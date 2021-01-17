Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8582F933A
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 16:07:39 +0100 (CET)
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19eU-0000TB-SB
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 10:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RZ-0004dq-JE; Sun, 17 Jan 2021 09:54:17 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RY-0004A9-1N; Sun, 17 Jan 2021 09:54:17 -0500
Received: by mail-pg1-x52c.google.com with SMTP id c132so9331093pga.3;
 Sun, 17 Jan 2021 06:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZuENl38Uj1XXvlGTRP6SwNgsA5uXW6rACpRQwgn9cKc=;
 b=LPHq9b3ntPwr2s3QXirNh98Yn+z9E0brZR+0LHdTZUIKeLDJiS8zZ7q/xYATev+TaZ
 Ej0rF7DGYt1YTYmHppg0enXgc7ymvOUz/MKo7JF+BhK8SEweEYW3R5PZotIJVjLXU1Iv
 mP+9s3qc5BmLBLZUM2pg6USpf9L7FVqRy+Uce5MMX1SuVrq7N7zj1DZXAGO5B2m1JWzx
 7UX3vozSuWpi63J6Ot7G+m14HAPNH+D4VqceK+tbpw8N2Lip6OFJyUMbrsSX1q0Gxh3d
 IKzLhbx1hlFikydBizyNGsl57azdtunDHZAz+6yUTDSNLnB0npIEKX7nqE16qhmoj6pA
 39Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZuENl38Uj1XXvlGTRP6SwNgsA5uXW6rACpRQwgn9cKc=;
 b=BlVWWEHWsBh897C82e9QRAXdo9lFifxPS8O+nryCEygc0/Vw+YwcXCPZGjQLgvBBv6
 YdBu3hpVxDPMGRW1c3zFyDVPF47B0pCJytkw5Zmv1xwl3DjBsMQ/xdAG7IB7PX4jpP9o
 Rhfiz9KNYlIfUb1Zy53RS2q68IuLnqNBsMLbZmDPNBzSOQlP439tIfmBXn8I/buuB/DA
 +I4ynKtVsneq+ZiWQ4RqdkpZEHifMDMqXWtvVytDI1f9eHiz0be+Lcs1/DyJ4TY2Qega
 SATFYyQFBeXv/+kqn8jivAPzy9cK3yW+ANicyTd3r9uRi5JO0uGB7U4hGRhqQTJ0tdDz
 DdSA==
X-Gm-Message-State: AOAM533GgTTcT7dMKjcSQtoZGyxu7FjlzN9EH8Q0RSTD94BAoVBxB18G
 w5Tioki0mpD9ot9BEsJsMPWzj6OIjZjJbg==
X-Google-Smtp-Source: ABdhPJyqrWp7jxMi9P0v8scUxfQKszMCLgdr/fIo6jRM4HbV9qKT40k8f56SHZ5aq+YKmlh/PAzZ2A==
X-Received: by 2002:a63:4346:: with SMTP id q67mr21852626pga.223.1610895253999; 
 Sun, 17 Jan 2021 06:54:13 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:54:13 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 10/11] hw/block/nvme: add NMIC enum value for Identify
 Namespace
Date: Sun, 17 Jan 2021 23:53:40 +0900
Message-Id: <20210117145341.23310-11-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52c.google.com
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

Added Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC)
field to support shared namespace from controller(s).

This field is in Identify Namespace data structure in [30].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e83ec1e124c6..dd7b5ba9ef4c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1110,6 +1110,10 @@ enum NvmeNsIdentifierType {
     NVME_NIDT_CSI               = 0x04,
 };
 
+enum NvmeNsNmic {
+    NVME_NMIC_NS_SHARED         = 1 << 0,
+};
+
 enum NvmeCsi {
     NVME_CSI_NVM                = 0x00,
     NVME_CSI_ZONED              = 0x02,
-- 
2.17.1


