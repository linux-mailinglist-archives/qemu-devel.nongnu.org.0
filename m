Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2634345E7C3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 07:15:30 +0100 (CET)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqUW8-0008Ob-NM
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 01:15:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniellalee111@gmail.com>)
 id 1mqUUH-0007cb-0X
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 01:13:33 -0500
Received: from [2607:f8b0:4864:20::42c] (port=33786
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daniellalee111@gmail.com>)
 id 1mqUUF-0001wu-7p
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 01:13:32 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x5so7969939pfr.0
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 22:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvcnpOJ0Nh7LZoeqZf395ut1xmfr/mZ35GZQBM+RIJA=;
 b=ljXpZFabpPig26CCl+pob6oT1HWmSCS/2b2gJ1ci6DyHkf02GeCjpKCb9FUIoLAFDx
 Wvo/FK4IY1ryjnuwPrG/N7/xPcaiP2xp9fLVy+kSTSzvPVcUiOL2dciXs7/1kF3yompV
 BXuKVZ1c1Pl2IRDx3SZMCZBeJAB5l7z1wjodUbK8EYg3EddRsu0tR7f8cGMbfNFobSfr
 p5cNJOS6oXNfzmTgCbTKuo9NXQrEPw9yf4lo6DE8PUEuDg3loHWYGaSbQTISjhI+anzV
 zjn/MTWnMckyvuj7mXuWb/DPMGmSVxplGvXHoLBtjNR11/YI3TFkFvvZ581ckjOU2doP
 rdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvcnpOJ0Nh7LZoeqZf395ut1xmfr/mZ35GZQBM+RIJA=;
 b=tnr4CknhCtH1MPoD8Eo8G5GdOUvDfLPumZ37ZcO7OUhtLZ86nGY6FQjezNIlQwBacQ
 GbDpD5QWpkn+ruyliIkpO0AE34D3fQ+eWGfALMcCLomtlGC74clLdhLg9YQqERBq4nrj
 4Q6QjS//5rylvqoFLUVFWGR73OAXOrkmTbh2WQAsgXLpiOYomelS9CNby2nap8wSHBkc
 gIIIuQcEKiLktH2GHhcT4Yw2YPVc0c5aZ21ZUD9SfFq2rJbmlblpB83UziIMfUYkiZP1
 k+M/dhKKeu6ayzv0Gkp38Y/dWw2ahRRkqjAenGkoC1O1qtqAxl2M2EhfzNi3MvOHbN0S
 hfdg==
X-Gm-Message-State: AOAM533AXDlXeBPNYfLHWQGdRdOfNqi8WkKhOu4LR7mxheXg6pSO8NZJ
 4dD3wRxp0Gu+11atkMgLSmo=
X-Google-Smtp-Source: ABdhPJyfVEyuASfmPOVOvLJZ1PksenUUHPgW/2GhPOEJnSA5mY1B78twn4f7b24R7WZJRbT2iI4VTw==
X-Received: by 2002:a05:6a00:b8a:b0:49f:ed97:16be with SMTP id
 g10-20020a056a000b8a00b0049fed9716bemr19453080pfj.16.1637907209498; 
 Thu, 25 Nov 2021 22:13:29 -0800 (PST)
Received: from localhost.localdomain ([106.52.23.176])
 by smtp.googlemail.com with ESMTPSA id a18sm5127576pfn.185.2021.11.25.22.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 22:13:29 -0800 (PST)
From: Daniella Lee <daniellalee111@gmail.com>
To: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	qemu-devel@nongnu.org
Subject: [PATCH] Fix bad overflow check in hw/pci/pcie.c
Date: Fri, 26 Nov 2021 14:13:24 +0800
Message-Id: <20211126061324.47331-1-daniellalee111@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=daniellalee111@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniella Lee <daniellalee111@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Orginal qemu commit hash:14d02cfbe4adaeebe7cb833a8cc71191352cf03b 

In function pcie_add_capability, an assert contains the 
"offset < offset + size" expression. 
Both variable offset and variable size are uint16_t, 
the comparison is always true due to type promotion. 
The next expression may be the same.

It might be like this:
Thread 1 "qemu-system-x86" hit Breakpoint 1, pcie_add_capability (
    dev=0x555557ce5f10, cap_id=1, cap_ver=2 '\002', offset=256, size=72)
    at ../hw/pci/pcie.c:930
930	{
(gdb) n
931	    assert(offset >= PCI_CONFIG_SPACE_SIZE);
(gdb) n
932	    assert(offset < offset + size);
(gdb) p offset
$1 = 256
(gdb) p offset < offset + size
$2 = 1
(gdb) set offset=65533
(gdb) p offset < offset + size
$3 = 1
(gdb) p offset < (uint16_t)(offset + size)
$4 = 0


Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
---
 hw/pci/pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index c5ed266337..d7d73a31e4 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -929,8 +929,8 @@ void pcie_add_capability(PCIDevice *dev,
                          uint16_t offset, uint16_t size)
 {
     assert(offset >= PCI_CONFIG_SPACE_SIZE);
-    assert(offset < offset + size);
-    assert(offset + size <= PCIE_CONFIG_SPACE_SIZE);
+    assert(offset < (uint16_t)(offset + size));
+    assert((uint16_t)(offset + size) <= PCIE_CONFIG_SPACE_SIZE);
     assert(size >= 8);
     assert(pci_is_express(dev));
 
-- 
2.27.0


