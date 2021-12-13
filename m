Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEB472B33
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:21:19 +0100 (CET)
Received: from localhost ([::1]:38432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjOQ-0005bc-JI
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:21:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJV-0008WF-VO
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:15 -0500
Received: from [2a00:1450:4864:20::531] (port=43549
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJT-0007Fz-Gd
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:13 -0500
Received: by mail-ed1-x531.google.com with SMTP id o20so51234304eds.10
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ahhw9F7FEinJ7VZiCiD3/+4+Y4DOuDMMwasuLCf6UN0=;
 b=YqCKeXmmTy8qs3Wv2aSbGTmUGiyPPwEk2J0Zyiv5jBA0czawUgt2KGcfQefhG2mvwc
 z/62GytR5kWw03mVQE1Ynmlc30WPh9QCpjqUT5Oy5FY/bWDfl3qaJ2akRP2DEqLa7EFk
 yFs27pZPhwr0Liurndf81F89HyLAT0WVz/STnuBwkMpzyPIWosaX9xkuOKtkqRRg3oTt
 /wQWgIsmaZ7mB/omZumM8+7iKcMM0NwuKLDmvoes8Sx4tAR9VGlztE1PSax6INqzWZp9
 DENXFHdKvYmaZ1ufKy7dOC4Ya2wo5I1SJXQCv7V+xMT5UAskRj9v5N6MZaS9Jw8S9ivG
 6LAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahhw9F7FEinJ7VZiCiD3/+4+Y4DOuDMMwasuLCf6UN0=;
 b=oPjTJzAfbgv/abRytc3UuXOuOvhOtfPGSXmemuLwz6qDHKK1igcGP9i+Ey6dOWbgky
 Az1+eBaCpNS9p75zPtRggzo7jY4y47QXcOvh93fuRpJzvVKvpqPd3N4yWrM7BlvAKsjj
 /qGtHprfoCn1JbGEBpWO79NdiSXqt5xuAffR7sauzLM8E8ns5/93tHtotp8va75qR4U8
 6xmGnhDt0v2O3F7ocYkCzDp9beOwvbxYhsXL5ILNIkLCG6UZcafnYAh06TsQ5klsQ7bt
 qp5Zfs3fVRyU481R/QmCZ8o54MT6LFMbRylLGCGm1/z9dvd13rAUMdlTTO24pgJwh+Ci
 U1UA==
X-Gm-Message-State: AOAM533afP/go1wk253vFU6TTM1Jnide3m+dqIwZwxMdXqhk9g9yeiNz
 eEW+LEKZA38LYtBFBc3K8Rb6qh/ybQZCFw==
X-Google-Smtp-Source: ABdhPJwLJ9XPvD/vgZyDGkiARsmNhVaYIQFvJ7wQBvfFsXg6SIUpEnPY9galYbuMO5nSXJpzHh3SAg==
X-Received: by 2002:a50:da48:: with SMTP id a8mr63232311edk.155.1639394170115; 
 Mon, 13 Dec 2021 03:16:10 -0800 (PST)
Received: from kostyanf14nb.Dlink ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id a13sm6139384edk.29.2021.12.13.03.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:16:09 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 5/5] gqa-win: get_pci_info: Add g_autofree for few variables
Date: Mon, 13 Dec 2021 13:15:54 +0200
Message-Id: <20211213111554.62394-6-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213111554.62394-1-konstantin@daynix.com>
References: <20211213111554.62394-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 6bde5260e8..96737f33e1 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -541,9 +541,9 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
     dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
     dev_iface_data.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
     for (i = 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i++) {
-        PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
+        g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
         STORAGE_DEVICE_NUMBER sdn;
-        char *parent_dev_id = NULL;
+        g_autofree char *parent_dev_id = NULL;
         SP_DEVINFO_DATA parent_dev_info_data;
         DWORD j;
         DWORD size = 0;
@@ -580,7 +580,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
             dev_file = CreateFile(pdev_iface_detail_data->DevicePath, 0,
                                   FILE_SHARE_READ, NULL, OPEN_EXISTING, 0,
                                   NULL);
-            g_free(pdev_iface_detail_data);

             if (!DeviceIoControl(dev_file, IOCTL_STORAGE_GET_DEVICE_NUMBER,
                                  NULL, 0, &sdn, sizeof(sdn), &size, NULL)) {
@@ -675,7 +674,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         parent_dev_info =
             SetupDiGetClassDevs(&GUID_DEVINTERFACE_STORAGEPORT, parent_dev_id,
                                 NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
-        g_free(parent_dev_id);

         if (parent_dev_info == INVALID_HANDLE_VALUE) {
             error_setg_win32(errp, GetLastError(),
--
2.25.1

