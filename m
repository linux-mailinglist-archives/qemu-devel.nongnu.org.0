Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0BD50677E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:13:41 +0200 (CEST)
Received: from localhost ([::1]:54966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngjvX-0006fY-MU
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjr5-00048e-Gw
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:09:06 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjr2-0007s0-NP
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:09:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id j8so14917485pll.11
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ovHygBMPOfLfcmuDDEiWLW9vnyb/lzx3CqcZGXCXoQg=;
 b=T+yhVW/tffltTohALTEbL9yQbTluCCIJTvG8rcXKdt1Tn88BRgCrVV6niKKiNkSQcS
 nzLQwuYNnoYYBlwCsw3e63INxlSM4uXngtELGO5veAedGOARrrQTJPwzqkIJQr/wm+Iu
 UMVWQ6aiOU7ROfpAyQgM6lOKmmadTlS29t9aeXJI5O3otWBmY8R68Qnzg0VyOIsClO75
 UDz7jjWYPKYw7eMVQzFlBEytzOakzEQsEJQ57+qfeGnRM42AckERNyxFe2Usc968Hl0o
 UGewl58xrG3tf2187JsXX103d/06mu4LF7NGcTJ7WGSXmwhTIb+8aHI32Puohd7gMHi8
 5ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovHygBMPOfLfcmuDDEiWLW9vnyb/lzx3CqcZGXCXoQg=;
 b=MX2Q+pIvpx+31hdd53xqFyCxoRH6W9AKb1l6v9vm9NBlYnPriAz+v5/xdVnfhFzM65
 fiTfyPOxFDynh3dZGDLfA6fkjGmkNJUdqAz8pzLnrsK4PGRygC34WjFCJm1J7QDSS5to
 KDNPrlUGAkkSmz5IqAXAsSdKLwFpOZZAl8X9n40HdVif5l4lg08RIciLstE73XU2ZFL6
 EaArcbe7G45/wIfV70wvVs7xabn4cNxvnfkj0cqyUZPYT/0JHim03Ts6wh2CivP3/XMe
 pgKllFoPuydUTYQrugnvdCmra1ZT/S/oRbrfAFbbvIPnpxy/cCsfQjtpOM7sWbf0RlKI
 Y6wQ==
X-Gm-Message-State: AOAM533+JNr+7YDzCbxr3Qh6uAGmmUrSze1fZUbbe8xfUN2jSP8EGjHi
 +BzbdZtjwz+/1+nxr/bBgDr1lwbaWXn4X7yb
X-Google-Smtp-Source: ABdhPJy0vrB4owDZ5D11DFGMrQspVjjV75clJkrf8MSQ6lGgMyTrXAfQibnRP0//9LqIwYl40dct1g==
X-Received: by 2002:a17:90a:aa96:b0:1cb:c57f:9218 with SMTP id
 l22-20020a17090aaa9600b001cbc57f9218mr23102110pjq.227.1650359336990; 
 Tue, 19 Apr 2022 02:08:56 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 fv7-20020a17090b0e8700b001ce18c551dcsm14963381pjb.19.2022.04.19.02.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:08:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] hw/intc: Add .impl.[min|max]_access_size declaration
 in RISC-V ACLINT
Date: Tue, 19 Apr 2022 17:08:42 +0800
Message-Id: <20220419090848.9018-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419090848.9018-1-frank.chang@sifive.com>
References: <20220419090848.9018-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Jim Shu <jim.shu@sifive.com>,
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/riscv_aclint.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e43b050e92..37e9ace801 100644
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
2.35.1


