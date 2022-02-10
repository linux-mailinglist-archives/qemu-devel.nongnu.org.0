Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE2F4B0641
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 07:24:46 +0100 (CET)
Received: from localhost ([::1]:54294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI2sn-0006Nj-EO
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 01:24:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2m7-0003aq-0y
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:17:51 -0500
Received: from [2607:f8b0:4864:20::634] (port=46764
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2m2-0001Po-PU
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:17:50 -0500
Received: by mail-pl1-x634.google.com with SMTP id u12so954493plf.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 22:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HGEC+Z5dXcbUYNLFj1FrAnBB1EbnT1YJPc/8W3V+BeU=;
 b=EtOkE188PbIwQIcWR7U7i5PiDjhHFFVdHTRlPENuY6RGuCCPr1EqEfBwQ2Wjy6Ae7s
 mOspRoOOImx5V1SmFZqGu+GHKkatDkEeoU5UWPgEHG2Acd13gw9ElPYtyvzeREyx+hf6
 mw2gZNc1mmDBbL8e1VsM40KXM/fVE/AVBxL3xmyhsOKkaiombbs2AwFvEYpZdV6AqeJi
 gmTUwHDkjHfEQTmT4kJ9nN5TdHdsr14Ua3Fwzw0GdiARu+vFwGfeKipdsEnVe6ZxhCFL
 av9Pxo7ZQ6Bf2BJ/IDEpkdVE2jATDDrQEu5nVUZNRTbo15ReOFCju+fcri+syjmfnVVH
 g2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGEC+Z5dXcbUYNLFj1FrAnBB1EbnT1YJPc/8W3V+BeU=;
 b=wyx978pmVgsYKq0hLC1+817mOmrFRU27Xprw/SWbZouZwwLNdlitr3mExZQaWk0YDI
 +a+rBWtMxVpJh6trvCNzg9p/vQGZCAzGn/Okl2KNbwlVsJw93usomGwNtvUwot2yZW6c
 fiekxog9LhwQg0fWe4IYjWCznNeTiOYYMNgEUt17w/M762GzYGs4WqhHce2ENpGVtMzw
 pKPoPRCAHpQfS1orHkOm8/LTRk1Nc0GeHkBKcglVv9uXMYjAy8ptIzDa7z45zXM5dwoT
 yZZonagoHruxK2srDxf/1yTztWjrvOC+PjUG62K2yM9rpeuaV//TNpD0cfrQHOSVHWgl
 NsYQ==
X-Gm-Message-State: AOAM531+j+ygE4V4HkTjmMKLJjwkXZpCOh89mGsuPIbn9oIj/lSb65k3
 TiKWdu/NmY0QYl/wawTbYh/9J5K4odCg3qPG
X-Google-Smtp-Source: ABdhPJz+QviRuD0sOPd57tBjjLdagB52DRNIjqb1vMWA8yxJDGuEytCob8/hXV+qja+xB8zXNNNNTg==
X-Received: by 2002:a17:902:e883:: with SMTP id
 w3mr5933304plg.33.1644473865272; 
 Wed, 09 Feb 2022 22:17:45 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id q2sm23110266pfj.94.2022.02.09.22.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:17:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/3] hw/intc: Add .impl.[min|max]_access_size
 declaration in RISC-V ACLINT
Date: Thu, 10 Feb 2022 14:17:33 +0800
Message-Id: <20220210061737.1171-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210061737.1171-1-frank.chang@sifive.com>
References: <20220210061737.1171-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Hoppenbrouwers <david@salt-inc.org>, qemu-riscv@nongnu.org,
 Frank Chang <frank.chang@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

If device's MemoryRegion doesn't have .impl.[min|max]_access_size
declaration, the default access_size_min would be 1 byte and
access_size_max would be 4 bytes (see: softmmu/memory.c).
This will cause a 64-bit memory access to ACLINT to be splitted into
two 32-bit memory accesses.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/riscv_aclint.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index f1a5d3d284..3b598d8a7e 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -208,6 +208,10 @@ static const MemoryRegionOps riscv_aclint_mtimer_ops = {
     .valid = {
         .min_access_size = 4,
         .max_access_size = 8
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
     }
 };
 
-- 
2.31.1


