Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D13C6931F2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 16:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQriJ-0004nO-Ca; Sat, 11 Feb 2023 10:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQriF-0004m3-EC
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 10:22:51 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQriD-00085p-Un
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 10:22:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so7970253wrz.12
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 07:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBVEmZrqr4evLXhyxNSwpcErgC+DGTQFF+QpIR9ORpA=;
 b=NnVpU2cUih7b5fx1AAlNeRR5XXSQhqwUjtyrebMbJzEP8+mNkmMczGroqiZoEEyJD0
 aELarYqgyZ7JWMeae88GWPu4sWGsIZdZeTyilhVbbUZZqWyWC8IX0Jk2MMMVwWEXdR1I
 xuCsbANIchG+Npt9l+gczGF3cFCP3m/ekaxgAL624b15R+aC7olXEDn2c17ddZI/BLZG
 FaL+34Eb8Iw/8SNzcFICigqjt1NHjRx73z+m/7nkxMqCN5BilWYFK/D28DI6dimPHSPn
 QW189+nwqum2/EruLkTORrwaPoCMB1Z+69M5BTSTBRh/wnDNCv4OLwL6f7RntaEd+QsR
 TZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBVEmZrqr4evLXhyxNSwpcErgC+DGTQFF+QpIR9ORpA=;
 b=2SQiZ8Rm10jbGlxAMaku/3lwWRTorlXRe9OeoWd174gAeFuHRqRZn5aB378dKNPiDl
 KnCUWEhV/A1rcpw86HI1he/MUdq1MjReyAkV3vOrgrVfPKv0d99ZOpNENAfmc4wOqqbm
 B3w5OEDb/1692tgMTLJ7LPrtk/bSrCy4y+tkVbTD0HjIGXcvzu+C/UU5Ki/zU/Vi94eN
 K4TVu/TaMwi6FeiufgxKTE6JxF3LExdGEvWZl1pkqXaKPOjetGTt9GYOm0mS+B/SDKY0
 LVG+njaNZDTYqozfUKtwVGkFEdFFyGvCoohDrbbGsI9Eowp2DUS98+T75bT5yGyY51OP
 BB9Q==
X-Gm-Message-State: AO0yUKWbglSw1VTGuoFlZN429OFrIJV0b3kYYEL27/wUqEJFPvOtlktS
 zoWeoqMTgCbflTGhDHv+Zb7TbgX/nE3HRT2i
X-Google-Smtp-Source: AK7set9htTGCe2Wban0FU1vU2vOOwyrYTwI5iw7+tau/N0EvBgur1cRBZdICzZsYvY3cTN6EzAMxVQ==
X-Received: by 2002:adf:e106:0:b0:2c3:e20b:82aa with SMTP id
 t6-20020adfe106000000b002c3e20b82aamr16394296wrz.22.1676128968289; 
 Sat, 11 Feb 2023 07:22:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b003e001afa274sm9048631wmo.2.2023.02.11.07.22.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Feb 2023 07:22:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] hw/pci: Fix a typo
Date: Sat, 11 Feb 2023 16:22:38 +0100
Message-Id: <20230211152239.88106-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230211152239.88106-1-philmd@linaro.org>
References: <20230211152239.88106-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Fix 'interrutp' typo.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 208c16f450..805e4b0c68 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1648,7 +1648,7 @@ void pci_device_set_intx_routing_notifier(PCIDevice *dev,
  * 9.1: Interrupt routing. Table 9-1
  *
  * the PCI Express Base Specification, Revision 2.1
- * 2.2.8.1: INTx interrutp signaling - Rules
+ * 2.2.8.1: INTx interrupt signaling - Rules
  *          the Implementation Note
  *          Table 2-20
  */
-- 
2.38.1


