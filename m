Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C453C5EAC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:58:51 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xOU-0002qf-2C
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xMe-0000AU-Oz
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xMd-0002Nd-7R
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626101814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iw02K1L+VUod/nKvZ2OojnOEeKCkig7F0T7jxDyikog=;
 b=KHe+ljyWFSCWV6b25wAk3W2HxCXEzHbk62BTcjdE1ssetQT0kAxSwnywiZBWd3zrNV7GH1
 NeYVg0S0oAOsGgZ6Dp+zEBuv7m8jmhaSS+So1LWYJllD6IMSOBAx6ILRvIetL96Ek4vh8h
 Drx/yEbLqdl2LgKvutprsrjrhD6IKak=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-vIKOr-fvPAyfK3Hov-6XDQ-1; Mon, 12 Jul 2021 10:56:51 -0400
X-MC-Unique: vIKOr-fvPAyfK3Hov-6XDQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m40-20020a05600c3b28b02901f42375a73fso110484wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iw02K1L+VUod/nKvZ2OojnOEeKCkig7F0T7jxDyikog=;
 b=Vl7O/8sWeUrzgwjvMcTxlsDHAfAsp7h1X88yqShlRsMEapx8fvJ5gYvSLVQehZhtvh
 tNShWGaI2onJ/LCP/Rw0yun0ru0tOKuiOQQa6q5fJG4cHnt3Cpt4ouw0PPOJDJann1PT
 U13VgdDPjd2z3PyMSW7JIjJKSNo1aeeTk9yRDfATVV0x4TCYUlNArlb4+bnKN20TrMyd
 Z9ZQVmzYMFJyANqkImpVrZgHq1IPt/c4HgaW7PJtBjikW6urS4+4MHoHuNI3TyqcKQYq
 ipr+mj7nIxSUKAFOSAHcEw9YaGYhxrF70i9M26wXOMX11ZDcYbsivVME2afjGv/PFQvX
 UWeQ==
X-Gm-Message-State: AOAM530ZysvAviWc5n09lIcPaXyN/yugOtPVizb3IBZgnREEcuHJA0lS
 WL2Gl9Yw8HxPEf6KhkdgPRCjOcDTN/NDAQ73Y+jKISevfnl0a22UGZxhaPDkMIfnFqnqir7WhGM
 BtnuDquuIblbfR9RoHhx4/FGxAqcQc5OWeLpkvaunWmdCza0H653FeWxUhKgfSBje
X-Received: by 2002:adf:aacb:: with SMTP id i11mr58542766wrc.371.1626101810048; 
 Mon, 12 Jul 2021 07:56:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV8Y+KX/73R7Fpd6n9aSGuVGF6J8exisvnOy93DyI4wwLe2RGstju9wd5UixcxB++ZgvzQsg==
X-Received: by 2002:adf:aacb:: with SMTP id i11mr58542740wrc.371.1626101809853; 
 Mon, 12 Jul 2021 07:56:49 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id x17sm14976630wru.6.2021.07.12.07.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:56:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] hw/i386/pc: Document pc_system_ovmf_table_find
Date: Mon, 12 Jul 2021 16:56:28 +0200
Message-Id: <20210712145630.2857814-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712145630.2857814-1-philmd@redhat.com>
References: <20210712145630.2857814-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210701052749.934744-3-dovmurik@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/pc_sysfw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index e353f2a4e9b..6ddce92a861 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -179,6 +179,17 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
     ovmf_table += tot_len;
 }
 
+/**
+ * pc_system_ovmf_table_find - Find the data associated with an entry in OVMF's
+ * reset vector GUIDed table.
+ *
+ * @entry: GUID string of the entry to lookup
+ * @data: Filled with a pointer to the entry's value (if not NULL)
+ * @data_len: Filled with the length of the entry's value (if not NULL). Pass
+ *            NULL here if the length of data is known.
+ *
+ * Return: true if the entry was found in the OVMF table; false otherwise.
+ */
 bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len)
 {
-- 
2.31.1


