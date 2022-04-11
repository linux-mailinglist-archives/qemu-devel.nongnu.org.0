Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684014FC53B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 21:41:14 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndzuS-00064B-Ml
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 15:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ndzrk-0005AB-Kd
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 15:38:24 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ndzrj-00052W-6U
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 15:38:24 -0400
Received: by mail-lf1-x132.google.com with SMTP id y32so28481855lfa.6
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 12:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hvzdUlbj+48GdV69G66J7WS+Lmukh1PxEZTtQIiH1Rc=;
 b=i69p1lZ7xdD/NLMf2xjXIHI3f1GatEdUMs4tAWq9CeVjj737HPTgPSUvmfdV9IIwuk
 gzLcWJO+u+xHKBt/C1POE+M751Hpv7YA8vlNcyL0AlZVW+bbHTle3UfMP1iD9j5XM3n+
 zLBpqfNoPQgQQtBbqTxvhPGp4ZcsiG/3k1uPHPfsGqfKwA6GNLjN3w2Zlhurpx7gR+ID
 tqbiEa523RKwklwFP6g9gULfafPKYsz5AehSusrVeDeVvEHyWWrxoEaIDA7pO6y0mWE0
 FPorH/svwGcNfXc7nA79RDO3hH7b59h13tS03GdSL9rqRamxXd5vHR+vfPPd7AqK4t5P
 l0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hvzdUlbj+48GdV69G66J7WS+Lmukh1PxEZTtQIiH1Rc=;
 b=cu8q8112+LCG9pBFM7U2i4IMptkTdlidPOtjTgLfQyGhqkdXOrj/X1+DJDh9AqBdNG
 AfFQA46/fpgs43MK1cT7s5/vj90wK7TH8oGSvA/+8rLof42kjYScD1/EZDNaISwcmT1d
 0DFxYv2Y6aVC7Ks2u5KApIjtu4+NJNoVxt5/Yqar9N/dcyxNdxQehd9MRftednxr8dmD
 nkuHjkPd+FuOVFSued7yhZz1YqKUpFY0bHH8Lj/rGDAyWeQCZ2TMKx/HwNcGsC3V0XIY
 CA4lmBtAvQttS6gsdYuVPJexQA1iHMB7A7JVj++LQ9OE2166sKl/0ID5BGHM1hsq5dM3
 x+cg==
X-Gm-Message-State: AOAM531jUxDUrkAa+JxfM17ou2WzmWt1rzs+/EczwGeHJ9QppYSCG5hP
 6xwR/xAPaTEjrSmw7e0HZx229VwoM9fHww==
X-Google-Smtp-Source: ABdhPJxvk8tQRPya5wuxRIY3rj2ZutpdERCt2zh7Qg4srsfmfx7JVd8E6X7B+9jr25JfSNm7GDFhJQ==
X-Received: by 2002:ac2:5091:0:b0:46b:b7e4:6c98 with SMTP id
 f17-20020ac25091000000b0046bb7e46c98mr275765lfm.63.1649705899967; 
 Mon, 11 Apr 2022 12:38:19 -0700 (PDT)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056512304a00b0044ac20061e9sm3401490lfb.104.2022.04.11.12.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 12:38:19 -0700 (PDT)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 1/1] include/hw/pci/pcie_host: Correct
 PCIE_MMCFG_BUS_MASK
Date: Mon, 11 Apr 2022 21:38:18 +0200
Message-Id: <20220411193818.8845-1-frasse.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x132.google.com
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
TLPs bus number field is 8 bits).

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


