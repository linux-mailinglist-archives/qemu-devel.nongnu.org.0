Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868E4FC792
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 00:20:53 +0200 (CEST)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne2Oy-0005E7-78
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 18:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ne2Ms-0003pC-Vz
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:18:43 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ne2Mr-0006r1-29
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:18:42 -0400
Received: by mail-lj1-x232.google.com with SMTP id u19so12268728ljd.11
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 15:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PWxVcgWtF5yftZ3xNxI/dFnyzKGWUC6teiJKJXxkb8c=;
 b=d8eWvLkGjr1bfrXQxtoF+n8pNOqlPnTAExPvlZRGT56PyH0UkTp2g9MVRfVb2yMUC9
 eFiPovn3KDdm5LTA8vZop9knc314OC1kyfS+wlQppLkZCFAVsc0VTd3dVehy4ikRDA3z
 YS41+JOWXLdBJrQT2qnnlDSEBmDzlsokritW7fUYfp6bHbtOmroWnI4h2sZK0Ys0k9n8
 5TpgCuZaw/wmKgc8NTvrby53JfoU/I9bj801ET2q30nCTliW3ZY7dAD4qYAB7Mgyl446
 Jj6jB30TOKXizIswBdOIjlOmpHP05AgXbnAMnKmmD0ontzq4wSJJLRKJs0S0HiAKS+Gc
 +GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PWxVcgWtF5yftZ3xNxI/dFnyzKGWUC6teiJKJXxkb8c=;
 b=YtgFLhLjxuB5bO8Dxchs+ANTWEZHLc0tZlJXKYL5wwCAtZhHlvkuimcotx0fm1F+up
 cPibvu51xMKEL0G5lQdMdZGEOMJYwirp1xFeirr6674r2U/YPC1w4XUBNebk9EnjItvP
 8YY0OWkMCtjMgehG/REPJhWHUJ+z0frRuLNkY6a2AllZixKs/g9MQckgQLLiSBHp3dPS
 HEkwI/4csfHYvfnBe48F1T7kGti8ssR8O2SPngFZzrAzo8m/lrJittN4cu2F93ds2eD7
 MXe+mlhU1lstov0bWkdtlWLPY0rkmOTBqbU+wQIF+mJm9E4fEKNLSPoitT7diHSCK2c1
 mP1w==
X-Gm-Message-State: AOAM5338ul102mPEdAk6bkNQvu51n45xn7VVzFQ2+ao/9AhA1qZroOnG
 0gzyQHbt0rQXp4OpE0XrkDnlKl90Pt31mA==
X-Google-Smtp-Source: ABdhPJwd8p0/knxPtft1RelggqHXCvj6eSN7pcElPj1E9z0Sk9sLvGjlsTlmC43jg3SzowwrlZaOaA==
X-Received: by 2002:a2e:82c5:0:b0:247:e81f:8b02 with SMTP id
 n5-20020a2e82c5000000b00247e81f8b02mr21573578ljh.90.1649715518900; 
 Mon, 11 Apr 2022 15:18:38 -0700 (PDT)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151]) by smtp.gmail.com with ESMTPSA id
 w22-20020a197b16000000b0046b89a0232esm1112829lfc.105.2022.04.11.15.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 15:18:38 -0700 (PDT)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] include/hw/pci/pcie_host: Correct PCIE_MMCFG_BUS_MASK
Date: Tue, 12 Apr 2022 00:18:35 +0200
Message-Id: <20220411221836.17699-2-frasse.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220411221836.17699-1-frasse.iglesias@gmail.com>
References: <20220411221836.17699-1-frasse.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x232.google.com
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

According to [1] address bits 27 - 20 are mapped to the bus number (the
TLPs bus number field is 8 bits). Below is the formula taken from Table
7-1 in [1].

"
Memory Address | PCI Express Configuration Space
A[(20+n-1):20] | Bus Number, 1 ≤ n ≤ 8
"

[1] PCI Express® Base Specification Revision 5.0 Version 1.0

Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
---
 include/hw/pci/pcie_host.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index 076457b270..b3c8ce973c 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -60,7 +60,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
 /*
  * PCI express ECAM (Enhanced Configuration Address Mapping) format.
  * AKA mmcfg address
- * bit 20 - 28: bus number
+ * bit 20 - 27: bus number
  * bit 15 - 19: device number
  * bit 12 - 14: function number
  * bit  0 - 11: offset in configuration space of a given device
@@ -68,7 +68,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
 #define PCIE_MMCFG_SIZE_MAX             (1ULL << 29)
 #define PCIE_MMCFG_SIZE_MIN             (1ULL << 20)
 #define PCIE_MMCFG_BUS_BIT              20
-#define PCIE_MMCFG_BUS_MASK             0x1ff
+#define PCIE_MMCFG_BUS_MASK             0xff
 #define PCIE_MMCFG_DEVFN_BIT            12
 #define PCIE_MMCFG_DEVFN_MASK           0xff
 #define PCIE_MMCFG_CONFOFFSET_MASK      0xfff
-- 
2.20.1


