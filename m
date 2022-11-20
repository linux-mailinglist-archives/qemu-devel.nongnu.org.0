Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E457631499
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 15:10:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owl0a-0004Hi-82; Sun, 20 Nov 2022 09:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1owl0P-0004EY-LK
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 09:09:11 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1owl0E-0005Hq-LG
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 09:08:59 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d1so4188196wrs.12
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 06:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YhAHnmrx+CQ/2ALBHE3+4B+wBTEvTWuybDYJSaad6Is=;
 b=tELvGH2HJ6DKs+lS9o6H6w8+DiH4i1HbWoyCz2K+MFkeLkGoqJwVj3+JxuFLCITzqp
 WcKyEy5Qy7noOtjtl0jzyJwCc3RC6M3miaV92YBG4A5xkfnQ2aLrS9HkupR5xiGZDRfk
 aiSUwrEER31IqoBh3pe19hhr47F5/0XsY6Eo2qYe+Uy7xq1uVnGjdusZxsOOR/Wx572j
 sZ8RQP4TWDopb+ifPcsw9ef4ZdYQA2KsG35m3YMCIKZPdkRxHJQkGXrZDuCRrXRWWx8c
 YBhoUgpc6JEkLpGBI/UElX9whEoV+uPqqRcLuORQ+C/W8VLkqYhciSJAei0FPHnftJO4
 eFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YhAHnmrx+CQ/2ALBHE3+4B+wBTEvTWuybDYJSaad6Is=;
 b=FEOXE7W6vzZHRt2rdm4SufMkpoKild6+Sjji2ph3mjx5a0L1VS2tEqJYt4P9BfD1ZB
 oFMdIVEWWReuZvmny+HZHh3BF3+vbEyzm52Ei/86PcBJEfn9jEqMCTk682qfamveHEj5
 izVZB/hbddgcFR4LmtuLXL6wUwmK5MWBO22MmwdeaqvIGlpt8bnhbEXn+yEXbRot1Rvi
 Z+oO8RLx0jobHVypqnMCI6+2Tv/Ak59evvetZxqropdfxXw+vmiYALv94KyvCItNkReE
 LtFNNe3LLvSiqXmQrLVlIq1Y2OPfgV8UQN8/7efPnk1MqMPL45nxyoif1QAcHmvKuiy2
 iE+g==
X-Gm-Message-State: ANoB5pmxtULBzzOftopoSK7kXn4Fw/TdD5saVDIpG64/mqUVwHhJv9lN
 AMRxLgYGWnz4y74GEd2hSrHWCIMFtHyA1w==
X-Google-Smtp-Source: AA0mqf5ySVMy2NiSjaGQ5f+gVecl2380WFfs/Bn32ukWisAla/HiTZSnvQnvjDPadm5XSMfENUy/sQ==
X-Received: by 2002:adf:e88e:0:b0:22e:68a1:ddab with SMTP id
 d14-20020adfe88e000000b0022e68a1ddabmr8611027wrm.496.1668952853206; 
 Sun, 20 Nov 2022 06:00:53 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adffbc5000000b002417e7f0685sm10432310wrs.9.2022.11.20.06.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 06:00:52 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH 1/2] qga:/qga-win: adding a empty PCI address creation function
Date: Sun, 20 Nov 2022 16:00:43 +0200
Message-Id: <20221120140044.752503-2-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221120140044.752503-1-kfir@daynix.com>
References: <20221120140044.752503-1-kfir@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::42d;
 envelope-from=kfir@daynix.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Refactoring code to avoid duplication of creating an empty PCI address code.

Signed-off-by: Kfir Manor <kfir@daynix.com>
---
 qga/commands-win32.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index ec9f55b453..a645480496 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -599,6 +599,18 @@ static void get_pci_address_for_device(GuestPCIAddress *pci,
     }
 }
 
+static GuestPCIAddress *get_empty_pci_address(void)
+{
+    GuestPCIAddress *pci = NULL;
+
+    pci = g_malloc0(sizeof(*pci));
+    pci->domain = -1;
+    pci->slot = -1;
+    pci->function = -1;
+    pci->bus = -1;
+    return pci;
+}
+
 static GuestPCIAddress *get_pci_info(int number, Error **errp)
 {
     HDEVINFO dev_info = INVALID_HANDLE_VALUE;
@@ -608,13 +620,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
     SP_DEVICE_INTERFACE_DATA dev_iface_data;
     HANDLE dev_file;
     int i;
-    GuestPCIAddress *pci = NULL;
-
-    pci = g_malloc0(sizeof(*pci));
-    pci->domain = -1;
-    pci->slot = -1;
-    pci->function = -1;
-    pci->bus = -1;
+    GuestPCIAddress *pci = get_empty_pci_address();
 
     dev_info = SetupDiGetClassDevs(&GUID_DEVINTERFACE_DISK, 0, 0,
                                    DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
-- 
2.38.1


