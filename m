Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B423B4FC7A5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 00:23:00 +0200 (CEST)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne2R1-000086-Ol
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 18:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ne2Mt-0003qA-Ec
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:18:43 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:45049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ne2Mr-0006r8-Tx
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:18:43 -0400
Received: by mail-lj1-x233.google.com with SMTP id u19so12268755ljd.11
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 15:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1UIucD+H7zVkiUrL9j+hlx06ir6lOyP2goZsk3QxdQ=;
 b=PJROW4abegxRYmRvisVqJXnOkgnp2W+CDJMUz3nOOAU0xVQhJJPG2kkXoQECPtKlBy
 vFeroyjxuwVvboehkTagAFWxsM/L8Tnid51utlty/XMpPQQbLl+UvPXCZD3p508FxCYB
 T7ret7ngBnbjyFiblsqAq/QaoCSrq+ucIIJ8eeCythyykTTaYOr+EUvJu3AGr9ZPUhNQ
 NDS+ODi6bTDDGb0Zs3fQrDOPlNMNX7SAHUcrXJ9rkmvQRYr7nR9D8Wt4AL5PMZKGlJUN
 Mc6Xnud6sLpAP0AxbPVRPRtPKCknd2Gt1LKlMhj549ewUAsdLfkWqlYJ0HoDl5EonfI8
 AgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1UIucD+H7zVkiUrL9j+hlx06ir6lOyP2goZsk3QxdQ=;
 b=58gciDY8YOMqCUS0Sr07sGSvodjKSPf89e1PXlRgOewsX0ChpTcvkBTGqVZh1D5CFA
 mBeGSNbwPNYU59Wwu8E2bQrjJVJGey2HKiQzr3JnUhIAPQSVR7ebmFjwT2f5AebaG42e
 +t7DSS5fQ6qTXQYjYgm6WCFJhs2uJ29GDLFnVSnsZTexG6zunssjG4AZCBXcbSe3nUwL
 l4NTg5XMxJIYKf3wA9/JGBNZkdXqqbGWdUaHbuBrakKeExUs7NWsFk3SmkCKvowy5uDt
 sPsiwETE1EJdHSHLDmkmY1hPJl2LQDb86nJzl9zX+YubzrmJkpDHPaqxs9V0ZsJ+ofvl
 B2nA==
X-Gm-Message-State: AOAM532qxSMt6AVPlAhhrGHy35N+/3hOgVmBlUa35kGDVbUHuzafHs7S
 2NN8dr/dKZE4uNa6wbqTyYCmzuAv+dQkgw==
X-Google-Smtp-Source: ABdhPJy353NSFQDwDX0hFJ2YVgmnQdfHCuLml4n1TSfuU7ZYANh3ZeYohDdjQlLbDtCMXv4ymCR01A==
X-Received: by 2002:a2e:9851:0:b0:24b:4b18:5e70 with SMTP id
 e17-20020a2e9851000000b0024b4b185e70mr13412978ljj.485.1649715519793; 
 Mon, 11 Apr 2022 15:18:39 -0700 (PDT)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151]) by smtp.gmail.com with ESMTPSA id
 w22-20020a197b16000000b0046b89a0232esm1112829lfc.105.2022.04.11.15.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 15:18:39 -0700 (PDT)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX
Date: Tue, 12 Apr 2022 00:18:36 +0200
Message-Id: <20220411221836.17699-3-frasse.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220411221836.17699-1-frasse.iglesias@gmail.com>
References: <20220411221836.17699-1-frasse.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: frasse.iglesias@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to 7.2.2 in [1] bit 27 is the last bit that can be part of the
bus number, this makes the ECAM max size equal to '1 << 28'. This patch
restores back this value into the PCIE_MMCFG_SIZE_MAX define (which was
changed in commit 58d5b22bbd5 ("ppc4xx: Add device models found in PPC440
core SoCs")).

[1] PCI Express® Base Specification Revision 5.0 Version 1.0

Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
---
 include/hw/pci/pcie_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index b3c8ce973c..82d92177da 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -65,7 +65,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
  * bit 12 - 14: function number
  * bit  0 - 11: offset in configuration space of a given device
  */
-#define PCIE_MMCFG_SIZE_MAX             (1ULL << 29)
+#define PCIE_MMCFG_SIZE_MAX             (1ULL << 28)
 #define PCIE_MMCFG_SIZE_MIN             (1ULL << 20)
 #define PCIE_MMCFG_BUS_BIT              20
 #define PCIE_MMCFG_BUS_MASK             0xff
-- 
2.20.1


