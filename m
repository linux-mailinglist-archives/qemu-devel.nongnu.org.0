Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D83C5EA8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:58:44 +0200 (CEST)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xON-0002Jc-0o
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xMY-0008NX-2t
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xMW-00029Q-Kn
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626101807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIaOy0ZdtgupMLERyIJaVzlGSOfhe1UAB0sQ8IpslD4=;
 b=TP0txy6DfiHoCBs87aZR1vyVRmMM+xc5ufEIzvpkMsAQdDETWp6wLsQsjPf/P9ClzGz+u/
 D7IQwXYyqw8oI/rk5hB3OHoge68jk2RNFfD2icXc4dIeXrQFgg+34DtNk3Smm1ewG9fhmk
 MstCMKHhgTkanpm1yNXWa29UPpwtez4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-io-a1XxkOMabgd7p-2M7mg-1; Mon, 12 Jul 2021 10:56:46 -0400
X-MC-Unique: io-a1XxkOMabgd7p-2M7mg-1
Received: by mail-wm1-f72.google.com with SMTP id
 p3-20020a05600c3583b02901f55d71e34aso114151wmq.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EIaOy0ZdtgupMLERyIJaVzlGSOfhe1UAB0sQ8IpslD4=;
 b=SQ/ro7IVpqjjSP/n1tUNCRbGll0mfhusK+yHrkdtryAMxNQ/06jVsKK+3eAVTKCaIF
 Yr4xEEp+WOA539GiJCRxeqRq5lJATE/mxBOiUoUSslDYuQ80e7niaxKSRJMlwH0RaljP
 layxWLqYKASwCTQjm4elc/CbqxkWVzCX/dBeIYlc6xvIe8c/KofKzdQ8CMAKg4pLqYe1
 oqyclYsu4dJmM8h7E/MVMz2kxHyk1OCCHeeHwejJzy+bn842aGJ/ACj2weDWJcdU9+FH
 O56+5fKXlqfdfy8D0hyqwHR6ZSEal2GLOiruFEqdAG+N9ZLuEqH2YEbeBN3/iIJKD8di
 ydxw==
X-Gm-Message-State: AOAM533AJ/EpLeGFDGkyryK5AD/i8shG6YHgf2otVNMp0iek0kFoXfJr
 E/B+ACo7fYcGqiY+JiYUiajvVJuwFSV//PTnHC1zzy8FkjpuadZQv7RZZ6o/M8EYdK/sXUF4+CO
 RW9IHT7fbUaIqvcufqfM1JSAZDZZ9mW3KcQIw3M4BQN6pA5DRa/VgKWYQa1WuPljy
X-Received: by 2002:a05:600c:3b93:: with SMTP id
 n19mr14956839wms.3.1626101805204; 
 Mon, 12 Jul 2021 07:56:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi/ZG6O39+ENzV+E2ipkgPLlZJ2Jew33iiI+3+poXf57nJCbioIgAKvYxi90tgmuuAwtJDPw==
X-Received: by 2002:a05:600c:3b93:: with SMTP id
 n19mr14956814wms.3.1626101804978; 
 Mon, 12 Jul 2021 07:56:44 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id i2sm20007477wmq.43.2021.07.12.07.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:56:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] hw/i386/pc: pc_system_ovmf_table_find: Assert that flash
 was parsed
Date: Mon, 12 Jul 2021 16:56:27 +0200
Message-Id: <20210712145630.2857814-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 Tom Lendacky <thomas.lendacky@amd.com>, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Add assertion in pc_system_ovmf_table_find that verifies that the flash
was indeed previously parsed (looking for the OVMF table) by
pc_system_parse_ovmf_flash.

Now pc_system_ovmf_table_find distinguishes between "no one called
pc_system_parse_ovmf_flash" (which will abort due to assertion failure)
and "the flash was parsed but no OVMF table was found, or it is invalid"
(which will return false).

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210701052749.934744-2-dovmurik@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/pc_sysfw.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 6ce37a2b052..e353f2a4e9b 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -126,6 +126,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
 
 #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
 
+static bool ovmf_flash_parsed;
 static uint8_t *ovmf_table;
 static int ovmf_table_len;
 
@@ -136,10 +137,12 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
     int tot_len;
 
     /* should only be called once */
-    if (ovmf_table) {
+    if (ovmf_flash_parsed) {
         return;
     }
 
+    ovmf_flash_parsed = true;
+
     if (flash_size < TARGET_PAGE_SIZE) {
         return;
     }
@@ -183,6 +186,8 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
     int tot_len = ovmf_table_len;
     QemuUUID entry_guid;
 
+    assert(ovmf_flash_parsed);
+
     if (qemu_uuid_parse(entry, &entry_guid) < 0) {
         return false;
     }
-- 
2.31.1


