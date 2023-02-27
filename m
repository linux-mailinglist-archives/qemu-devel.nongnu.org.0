Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326E6A43FC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:15:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCC-0004mj-6N; Mon, 27 Feb 2023 09:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBf-0004Xe-8E
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:19 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBd-0000Vp-6t
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id k37so4359214wms.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Hni7zBNlkddwjECNQ+BvGF3daVF+v0wRLZ0wdOeOPwo=;
 b=zldNe8jiTn0v2x34rJYGE/s//9QSFgzoUZ2GXbTbyj6CduDbfRNgocEYm6FsArUp/m
 vLacpRiZHifNK/H+waV3radbN5ejOuClVWKOl8ObcxoAAy3YwPrzQUst/mPzRkBNwb7S
 OVLrEdqHW1SDcjGsc4N9rhWJIj6X7XJjLbSFgd+fSsiVTA1ZCxgo6TzjB12nvfg2RSLm
 jqvJx9YHTyyP5mA1rzxgj2b8bTKmSKf5Gvdm+YUI9KvnfthaC5229E/q50OD1s+gK7SL
 GCGIBDkHHpzA4pOMM5aV9qM/Md2oAuLBy57ofM7wKdaZH/ACG3gbESWXr/lmWE5pOKP/
 btYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hni7zBNlkddwjECNQ+BvGF3daVF+v0wRLZ0wdOeOPwo=;
 b=wYl8/RwWhm19Yg604IAaq6yZ0qcGyANvg2xcTuhLM1Ea0EnuZUC+iBwM/tnTjvi/2f
 XsfJ9cTe4TVAXrpWid45UDQXV5r131E8XICKfetUeJOz+3reBfINDN/FYFMrusRNx6WQ
 swwPs+TnZlH19KWHg1TBQ9bj4TqOrFMv22sb1NJR1asGt6FzJzT1Mu774vMhuwkqRDwE
 39eOf4ksd+BS6TcmkeQPD+KgX8TR1jlFFW/syTutQesjb40T0UtjtNKGVzeuYww+N+Ua
 gCA99xKgeTl3wv7o4csbN4LOYb4PQOwEFVuu4/xWirAJHzQFlpx6JHku/LYnCkwPB0hf
 oIeA==
X-Gm-Message-State: AO0yUKXanSxbgTvoQLiOtB5TwubXmUcv7Rd5ex/QZhdBjHSz4tCbCGHR
 kW1UPhpYvvxeDpj7dCYWMkYshjY3dV6yRHDj
X-Google-Smtp-Source: AK7set/b2yX1O4RaVwVfJ4s9TjFCjdgfm8VHdWsSRd8l/48lArhzwYhDU4pZcEw7x6PNA7PGZZVPUA==
X-Received: by 2002:a05:600c:44d2:b0:3ea:4af0:3475 with SMTP id
 f18-20020a05600c44d200b003ea4af03475mr12045680wmo.1.1677506942604; 
 Mon, 27 Feb 2023 06:09:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b002c5d3f0f737sm7172938wri.30.2023.02.27.06.09.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 084/126] hw/usb/ohci: Fix typo
Date: Mon, 27 Feb 2023 15:01:31 +0100
Message-Id: <20230227140213.35084-75-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <03599fd4db313ac4f651cceb43340109ad6a14b8.1676916640.git.balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 35a1a55145..6f8b543243 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -58,7 +58,7 @@ struct ohci_hcca {
 #define ED_WBACK_OFFSET offsetof(struct ohci_ed, head)
 #define ED_WBACK_SIZE   4
 
-/* Bitfields for the first word of an Endpoint Desciptor. */
+/* Bitfields for the first word of an Endpoint Descriptor. */
 #define OHCI_ED_FA_SHIFT  0
 #define OHCI_ED_FA_MASK   (0x7f << OHCI_ED_FA_SHIFT)
 #define OHCI_ED_EN_SHIFT  7
@@ -71,11 +71,11 @@ struct ohci_hcca {
 #define OHCI_ED_MPS_SHIFT 16
 #define OHCI_ED_MPS_MASK  (0x7ff << OHCI_ED_MPS_SHIFT)
 
-/* Flags in the head field of an Endpoint Desciptor. */
+/* Flags in the head field of an Endpoint Descriptor. */
 #define OHCI_ED_H         1
 #define OHCI_ED_C         2
 
-/* Bitfields for the first word of a Transfer Desciptor. */
+/* Bitfields for the first word of a Transfer Descriptor. */
 #define OHCI_TD_R         (1 << 18)
 #define OHCI_TD_DP_SHIFT  19
 #define OHCI_TD_DP_MASK   (3 << OHCI_TD_DP_SHIFT)
@@ -88,14 +88,14 @@ struct ohci_hcca {
 #define OHCI_TD_CC_SHIFT  28
 #define OHCI_TD_CC_MASK   (0xf << OHCI_TD_CC_SHIFT)
 
-/* Bitfields for the first word of an Isochronous Transfer Desciptor. */
-/* CC & DI - same as in the General Transfer Desciptor */
+/* Bitfields for the first word of an Isochronous Transfer Descriptor. */
+/* CC & DI - same as in the General Transfer Descriptor */
 #define OHCI_TD_SF_SHIFT  0
 #define OHCI_TD_SF_MASK   (0xffff << OHCI_TD_SF_SHIFT)
 #define OHCI_TD_FC_SHIFT  24
 #define OHCI_TD_FC_MASK   (7 << OHCI_TD_FC_SHIFT)
 
-/* Isochronous Transfer Desciptor - Offset / PacketStatusWord */
+/* Isochronous Transfer Descriptor - Offset / PacketStatusWord */
 #define OHCI_TD_PSW_CC_SHIFT 12
 #define OHCI_TD_PSW_CC_MASK  (0xf << OHCI_TD_PSW_CC_SHIFT)
 #define OHCI_TD_PSW_SIZE_SHIFT 0
-- 
2.38.1


