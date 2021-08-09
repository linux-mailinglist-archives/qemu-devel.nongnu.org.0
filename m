Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA13E4339
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:50:29 +0200 (CEST)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1vR-0007XC-01
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mD1tu-0005O3-H2
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:54 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:34790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mD1ts-000243-80
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:54 -0400
Received: by mail-lj1-x230.google.com with SMTP id m18so11462344ljo.1
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aKDh2Pfz9WYAi8UXtHOjegiva+s1ZUtl0NaOopyyCU4=;
 b=cFV+wF02/qwBtBxgTQrWAGCFAdt2RWZgvM2X9id1OaTlncUe0NN4ZJTmIUOZcdDrQe
 aCmdV3gqInr77S4o/imdsEoDuEPaGFy5FJ0QAPCoMOr4u2dPaMVWaRwXW/zsxYA7xo3O
 mo/kee5CeHvCxzIRQt6GVavhoY+FVMPYF3rsBnpaLT6er0oPLEp3QVvwzBYdkF24GfLE
 boWbxZ6EVK2ybTvG0HrFmTHV8QUMGGU5aY9J8sPEXXynxkii5AxeUTcaNvK+wv3lVBUW
 oo3wHO/Jyxp1tQeVuR3KVrAOx3Sgd4X6fIDK8aozQL3lo3z7QmHWyct1+yI0VvI2wlli
 ZnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aKDh2Pfz9WYAi8UXtHOjegiva+s1ZUtl0NaOopyyCU4=;
 b=qOHi7ldPVDngL+6hZiZVMCanq6nmw7/iBvWROK6vg9PVK1gySnCBg/zLeoYpB1pz2m
 0Dyu1BulbOo7DCwo9Z6huCoKbMD4nLnAX6r336UTEOMCpJIMEFWmp2zZKDveEv9e6tUG
 gJLeZKjjcRIUr3V01D9a9M+5LiKOnm8aZ3pgA2o2oRInIBve0MrUJZ9UE24cznFTvyq8
 2Os6gMIYvOjFFodeYozt5JrNXAIuZ1VqIo3lQdrOgMO+UYsrCwLHnLnRMy8EebGmAxj3
 Tv25lRtSOYxsyIjOgKAqT0entZxkkaAsvXhgD04upa/4ig8BEgzI1s1jgmICyS18tAA+
 opLw==
X-Gm-Message-State: AOAM530Q+h9Ph5tOIPRlfHKzvOGgB5YxmvwRR2yiT/Apt6SyoMTsk8Us
 UmoPMm4cBtEVU8Tw2kY4UL8Ionp7w2xpS0vA8Xo=
X-Google-Smtp-Source: ABdhPJyDlQPFsvLBwwqOCz0lTJYLqVq9QUITqqgXNtGXZ4cHxkpNoM5ZZHhw/+fA0Fw0s7kZ0ugn9w==
X-Received: by 2002:a2e:8e68:: with SMTP id t8mr15410137ljk.353.1628502530513; 
 Mon, 09 Aug 2021 02:48:50 -0700 (PDT)
Received: from kostyanf14nb.Dlink (93-77-45-80.vin.volia.net. [93.77.45.80])
 by smtp.gmail.com with ESMTPSA id q20sm1681506lfo.19.2021.08.09.02.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 02:48:50 -0700 (PDT)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org
Subject: [RFC 3/4] gqa-win: get_pci_info: Add g_autofree for few variables
Date: Mon,  9 Aug 2021 12:48:38 +0300
Message-Id: <20210809094839.52312-3-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809094839.52312-1-konstantin@daynix.com>
References: <20210809094839.52312-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::230;
 envelope-from=konstantin@daynix.com; helo=mail-lj1-x230.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, Matt Hines <mhines@scalecomputing.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 724ce76a0e..a8a601776d 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -539,9 +539,9 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
     dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
     dev_iface_data.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
     for (i = 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i++) {
-        PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
+        g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
         STORAGE_DEVICE_NUMBER sdn;
-        char *parent_dev_id = NULL;
+        g_autofree char *parent_dev_id = NULL;
         HDEVINFO parent_dev_info;
         SP_DEVINFO_DATA parent_dev_info_data;
         DWORD j;
-- 
2.25.1


