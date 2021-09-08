Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711D040332B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 06:13:14 +0200 (CEST)
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNoxV-0002MO-2J
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 00:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNowP-0001fS-Rc
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:12:05 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNowO-000171-3o
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:12:05 -0400
Received: by mail-pf1-x433.google.com with SMTP id s29so925148pfw.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/1ggGu8Md7TTi+lLns9+IKriNjYPNKFjj/e93rjAnwc=;
 b=HYhr5eI2jjUaPpD1x0ObFsGMXNo5fMTlaXBqryAE72uC3DezxIv8YmsnENr3/GAPds
 VcPpIp8qLHTcP8Le40JHEZ8PLUq+20G0X0OehvRgSBM6p+tNLJWnJ5zYglBP/5WrTDuS
 qQbP9Oa8Wuk1wUqRgxInw+pTStB7KRxFLQVprvIUmIMnhgIE7h1smru/QP5qScR6tq3R
 S1K1AsVZ6cYj1BjrCLomSPh3gdYvpJp/Z8mdv5IdtFvPe91EbS+cmEkYby7m6ovp/H/0
 pWf4UZYPp4aTMNTQxwINAnncBE2a/SDefRZLORO9vbCp7KzwVe8cDqFEgn2DiPTuWHCM
 vUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/1ggGu8Md7TTi+lLns9+IKriNjYPNKFjj/e93rjAnwc=;
 b=MYcwZ/VHEvTABYtskhcit/72PWbJ5OE/xFmvIoBxXsuyEwbPHCg0b2jWyGBsVzbkpl
 xWojaViW79hY/AshUE2Jm1wSSNse6emLTCaJQ3uBMFQ2FoUtrJPloBh/xdsQ84Rjhi3G
 bwyT/DuSwynaFkDyBQ158Uk9mmdrj4LNPrmP65G3h0Z7k4y8/3K5Ehe4ejaVTFVuKmnn
 zbeJk10KwcgLGmyurl6pRX+nmd7ojglDX+0/rH/4gH0aveUhAvk+4P1PS9sPsITP1KKE
 zXPFWgkPT5SkYudfgwB8xmkSWsfTe7p0dri1nfPt2F/OP3DcsC9PIjUAdj8qmVbpZsZR
 bYDw==
X-Gm-Message-State: AOAM531cTcwGXDHig9XA6JwPrnLerxF8BGxeEQO34wrS4gAuQcO6TLps
 5xZHi05kDe9bPOrRPsxDg31wWop5cXp6sw==
X-Google-Smtp-Source: ABdhPJw/0WMP7sck7eJHClSjyVPXwoB5dOY1kgm0lA7PcIs9SfVpYXSR95I2bdOW204Mld8bhcXY9w==
X-Received: by 2002:a63:3c4d:: with SMTP id i13mr1790248pgn.54.1631074322233; 
 Tue, 07 Sep 2021 21:12:02 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.70])
 by smtp.googlemail.com with ESMTPSA id n185sm575282pfn.171.2021.09.07.21.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 21:12:01 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi pci
 hotplug
Date: Wed,  8 Sep 2021 09:41:39 +0530
Message-Id: <20210908041139.2219253-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
range was free and available. However, upon more testing, it seems this address
range to be not available for some latest versions of windows. Hence, this
change modifies the IO address range so that windows can allocate the address
range without any conflict. The new address range would start at 0x0dd4 and end
at address 0x0deb.

This change has been tested using a Windows Server 2019 guest VM.

Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/acpi/ich9.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index a329ce43ab..b68c5a2174 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -29,7 +29,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/tco.h"
 
-#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
+#define ACPI_PCIHP_ADDR_ICH9 0x0dd4
 
 typedef struct ICH9LPCPMRegs {
     /*
-- 
2.25.1


