Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8612FBDB9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:34:30 +0100 (CET)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uti-0001vP-0I
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOO-00089q-BY; Tue, 19 Jan 2021 12:02:08 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOM-0003Gd-EQ; Tue, 19 Jan 2021 12:02:07 -0500
Received: by mail-pj1-x102c.google.com with SMTP id u4so260568pjn.4;
 Tue, 19 Jan 2021 09:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pDYjh3MxzTIm767EI250LyEyPJQDq9462r40k98qFJw=;
 b=h5ihCQPRZcZO98DJa57MJuJXbG1kk9TaiMXpHTj3UpTRQfRO6uSloIePMos/U5l2+s
 nx/s51XyjcqKuhQehbVjRIIgwePwwXtEXI5yPMUHTaSlY0+/mpheLuPW59Ojmag6EuRs
 SlgIq5zcbRcle4joohVb0KZs6nwyyPYleqBTW1y/frtMv7XFlmGC2O+L+AxzsGvK6EvN
 HEtexWZxhVIB/WyIzRW6GdUHLCrZjNGuQY9HSYOwJfT2sqQRWBLRipTAHgYg6gSH27Lq
 x/wT6F7v2lvfjX0gPXftbqzeT4x6tBCdB0FZSDVDH8+bZfBa4lD5N7onNsNGrYAVdNsG
 /bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pDYjh3MxzTIm767EI250LyEyPJQDq9462r40k98qFJw=;
 b=QMa9kWFkky05FidvacxSpdNOCrg7nqYfE6PeZ0Ey1dLSyGQkDSudnYBrdVRSiDOjO7
 5k8090Ls3LKbSZFX49oObGiiRaDXcyRMV+t4+BJ5IiBw4qF2O5ZDajcnk4aLtVIKlwvF
 Bv3ptBjZQhiBjlCHd49J/EcMWory6sYmzzMflHAEVFj4cABK/UtCe1eO4BYp/LmOsGzV
 XpRT66k53jQvhc5zUlrsMhoP8zpAOdGWj7CCHyqAdHf2WrxVRnRjAZifWJAkLGSrjH0S
 nglc204nhZtvdbeYwjrpv1J4e0tYuJLs+vxa4mm514UIqLbmwgZsUjRtegeOzONy+Lc3
 OIzw==
X-Gm-Message-State: AOAM531QEgzfjymC78788LzBWIjozCfXybhW98AZZ03HrkW7dpBbJbMt
 +GEIhPa19NNwtXrUGXX9luFjHzhIDLJ/wg==
X-Google-Smtp-Source: ABdhPJxBXHpLwxEewiUjWudnyhkH2v7+XAwzg+aNAr4LBrZBbBXXRR5w+puQkUWFjMxHXYUS4e9OmA==
X-Received: by 2002:a17:902:ac93:b029:db:c725:e321 with SMTP id
 h19-20020a170902ac93b02900dbc725e321mr5781561plr.41.1611075723030; 
 Tue, 19 Jan 2021 09:02:03 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m4sm19396001pgv.16.2021.01.19.09.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:02:02 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V3 3/8] hw/block/nvme: add CMIC enum value for Identify
 Controller
Date: Wed, 20 Jan 2021 02:01:42 +0900
Message-Id: <20210119170147.19657-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
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
index 45b2678db1f0..733fb35fedde 100644
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


