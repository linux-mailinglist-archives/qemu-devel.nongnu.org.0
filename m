Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77813CFDCB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:43:52 +0200 (CEST)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ruR-0001eG-NP
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsc-0007MS-Fi
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsb-0004jy-1Q
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Sv/EUp4kMQE+EqA7VY37QPylkfosAwbv1NFxb3Vclk=;
 b=I40U+ig7Xkzt88dSi46HJoZCJ7sS/dme0sxLqR2wJ3qhBbgocWPFfIjIlIoOo6S830GBlJ
 cQvFFn6EcA8SWTJrhV1lTzx9dZGhopcbG7kuTYba/dTgEvAq5812XSfBtdLJkVRIMxeX2h
 SRd7aO6fNacW2vsCOuChYtJs4wuKP4w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-Enz9flnjMZK7gJvA2kA3-w-1; Tue, 20 Jul 2021 11:41:53 -0400
X-MC-Unique: Enz9flnjMZK7gJvA2kA3-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 b26-20020a7bc25a0000b0290218757e2783so1378841wmj.7
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Sv/EUp4kMQE+EqA7VY37QPylkfosAwbv1NFxb3Vclk=;
 b=hr1z3pJmgqLAXYfS47mNpU011IdCGjb0zbtpkM3gwxZcW3nWxEJnzoy8BaUIsijq+T
 qbN8yamXWgCgr9LzapMvHjEbI+ohkQjTXgM4YAVN4pLPRlGX3XF+ZjKx12pQ4DnaBv2G
 /s97yoCcgw0Z1hsFod1qE+zXgZ+FhPPTfliuifsPk/LSKNp3G7LCo9XqW61bfqZ2LKjc
 x9IKB0QsB0nKe0l/MyNik9Xao9O2v/bcR48f9tokWnkat9J8wC4vAitmXKID2jSk84zT
 /gtJA3zf9X/cDAe16887zmJi51rqEEjpCcRIuxzLRYWCJM1sWmxFhne1r4UX5HbIm1g3
 //5A==
X-Gm-Message-State: AOAM5334rBV8UW1cLqyZjzLvd3Jrkh31jHJy3yzxTGkam/QrOlSFJt0+
 oGMMiI1s9qoXIEk2csSVO1C57Ix9VVPKD5bgfKd6hvajCa7HsW9fiJDC/lgOIu3zrSiO20jit/K
 UJ208JIcOGE71k+0IDUNeDpAfdELGqvLMekY9YVLKqX0vzH0+76kiGoEPYWMbq6bX
X-Received: by 2002:a1c:9d16:: with SMTP id g22mr32227908wme.152.1626795712009; 
 Tue, 20 Jul 2021 08:41:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRg9M3zR9NF/Xf/gwykEi5C3SPsvAGcBE2S1SL+S4ctbYqJZHvWSN4SX7o5Q9gNTeYTTwDRA==
X-Received: by 2002:a1c:9d16:: with SMTP id g22mr32227889wme.152.1626795711855; 
 Tue, 20 Jul 2021 08:41:51 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 p5sm26332572wrd.25.2021.07.20.08.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:41:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/17] hw/mips: Express dependencies of the Boston machine with
 Kconfig
Date: Tue, 20 Jul 2021 17:41:26 +0200
Message-Id: <20210720154141.3919817-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paul Burton <pburton@wavecomp.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Boston is built around a Xilinx FPGA, which includes a PCIe root port
and an UART. An Intel EG20T PCH connects the I/O peripherals, but only
the SATA bus is emulated.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Paul Burton <pburton@wavecomp.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190311005618.19007-6-philmd@redhat.com>
---
 configs/devices/mips64el-softmmu/default.mak | 4 ----
 hw/mips/Kconfig                              | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
index c511a061bae..c610749ac13 100644
--- a/configs/devices/mips64el-softmmu/default.mak
+++ b/configs/devices/mips64el-softmmu/default.mak
@@ -8,8 +8,4 @@ CONFIG_ATI_VGA=y
 CONFIG_RTL8139_PCI=y
 CONFIG_JAZZ=y
 CONFIG_VT82C686=y
-CONFIG_AHCI=y
 CONFIG_MIPS_BOSTON=y
-CONFIG_FITLOADER=y
-CONFIG_PCI_EXPRESS=y
-CONFIG_PCI_EXPRESS_XILINX=y
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 1d4051fcf07..b4c5549ce84 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -51,6 +51,11 @@ config MIPS_CPS
 
 config MIPS_BOSTON
     bool
+    select FITLOADER
+    select MIPS_CPS
+    select PCI_EXPRESS_XILINX
+    select AHCI_ICH9
+    select SERIAL
 
 config FW_CFG_MIPS
     bool
-- 
2.31.1


