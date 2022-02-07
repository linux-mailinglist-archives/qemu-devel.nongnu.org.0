Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C857C4AB844
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:07:26 +0100 (CET)
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0vc-0000KF-RC
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNf-0006Bd-In
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:16 -0500
Received: from [2a00:1450:4864:20::433] (port=42942
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNd-0007BZ-EI
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:14 -0500
Received: by mail-wr1-x433.google.com with SMTP id h6so4549927wrb.9
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iMxDSLcIMRCqxW/J17NZXJa6nSKoI/uNXTB9CakcY7c=;
 b=gamCkvDlirEH/OZBvbyAjLFnvo34tsKfBJZotuD8Ox2YlTjrFN6BuR3J6nyllgqyxO
 fR4gsut5fHvGEMJmvYhl+YZx4/09P2m7vNNlZL37+kZwBSxfo1m/u5eUfnTpNFIxTzE/
 riIt8tTHZt56jzubSv2GImbmH9G3xSFCwmZBjbthzU00Az1j57470rDB0EvL7Qtg2cqP
 igWPiJCPSG6RdOxq+ejiwJDMJMwWBnSx3FRkuflF/RUfMsVnjGFQZq+8A02goh083Nm2
 J4UFrMuQ1sju6HCMBGXb66IOFz6jzjORooBh2KGVVerRQACnpHfnZnwaKLHecB+AMc+e
 yWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iMxDSLcIMRCqxW/J17NZXJa6nSKoI/uNXTB9CakcY7c=;
 b=WVAmPrsZNCsVWqmwUAcxV9Td0S7aw53FD1Xrbqy2r9hE09pSoG1G/lt08c7iPGsj7U
 DdvixK8j5AtDV3Dg4udy0M7Nh+5mSozDtttURctO6SDCV6g+Byhjv5cMJ6A19ipB8ZQK
 um7KGt4fPynFxwxzAYv1xHSoviAaFGUYQUw8WLIrvThWjjSftiDlfDMmmZ56z0fSmwfI
 ibkiuiaj0lDy5MR8aaHoFvCOO1G9bWuXqUtlOLN9yE71xIO384Ccw2HPDm5+GWNrBsm8
 Vc6xOsZjft0geyierliCsKynee/MnsavvXLma0Ah3b55DQWy2ndygx3cZutj+mBERWv8
 I7OA==
X-Gm-Message-State: AOAM533ppb+Ef+NsIrI9KxN2BkPedvTpeWyGzH0/hCAkuC2j0fHAgym4
 smjkVA8zr4cAuXjk5xwAhgtMmsk1mDc=
X-Google-Smtp-Source: ABdhPJwHPT0cf6Y2JfDQao1OJ7PTAH5X5+Fit+XlRYbeGfp98r7zEnoXwo4WlPfFioP5xrxSf0iQjw==
X-Received: by 2002:adf:d23c:: with SMTP id k28mr5304475wrh.114.1644222492018; 
 Mon, 07 Feb 2022 00:28:12 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n8sm18178005wmq.42.2022.02.07.00.28.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 00:28:11 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 3/9] hw/acpi/memory_hotplug: Remove unused
 'hw/acpi/pc-hotplug.h' header
Date: Mon,  7 Feb 2022 09:27:50 +0100
Message-Id: <20220207082756.82600-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082756.82600-1-f4bug@amsat.org>
References: <20220207082756.82600-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_SPACE_RATIO=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/memory_hotplug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index a581a2183b..0a7e89a13e 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -1,6 +1,5 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/memory_hotplug.h"
-#include "hw/acpi/pc-hotplug.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/qdev-core.h"
 #include "migration/vmstate.h"
-- 
2.34.1


