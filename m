Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26624A8D3A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:29:32 +0100 (CET)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFijT-0006Lh-PB
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:29:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwO-0004Gx-CQ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:52 -0500
Received: from [2607:f8b0:4864:20::633] (port=33672
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwM-0005zd-Df
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id k17so3127004plk.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JX7GM0LgHysT8Yf41piT5uOA6NfosJcHXGrxxDMG6iI=;
 b=BQLbLearPjO7iYTW/PMaZtNGWObR86p2XpdymMZ7fW1n7OzmGa8X4l9LFV8ZRCySXm
 ySJrcAxeQZgQrt6r8nwW108WoJZNnxU1RMoyQ3qPFY+8ANCJYsbqZwRQuxvqSJg57XBF
 LN35yZdaydtLo2AZ5Ljerp0jD/tPRFl/5TcJZMNJFkBKusblSSZ+sXj/S7pjnEamUbLR
 hiHs64iABSG8JUJmzG4OLcGvMFVUwZJqtL4HLgXWK6ksk3iRR2RpCWTku3vmy0PfvwMN
 d210I0p7K3BQ9oJCJE7lcizzXEnWP+zE8jzJrvjxGIurZ3h/cyopqf3tonpaePCBClpF
 6a7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JX7GM0LgHysT8Yf41piT5uOA6NfosJcHXGrxxDMG6iI=;
 b=PTS94AJvqhnSsmOMujnGDmvL5016dR20iwvs0X2zeQubs7vLzx4Cta5O3ojgT21Tls
 dp/QnhSX5r7w7fV9IyRbBxZbI5Bo1UWpGIvq+Rldx0TjJS2l+asi7vFuunsYcYEXL7mR
 ayGCK1l2ZMuUu7X0lHbAEn5P7mhSyw33QGeYuQ21UxZEHfiFQ/rWG2i3qNiGmnNzhFtY
 kMplsrDJLkRBRsF2KJ4o5PP3SXnEjlqXVKp/XZ4ZC4sVsQ2X5arx/Q+zdSat683ccH8Q
 vzTDmOc3FYkAgZxy9uGnR1qK2ld9/MYawJZa1+4Kov9WzHFqMN4NS3nwK7v5qUq/XCBO
 RXKg==
X-Gm-Message-State: AOAM532NPiuW546VBhySD6PfveBY3r1PJ18XXIryKkfK77Sr+zkAGKOZ
 NabLYza5SiuADeEX1CGYAoHerHH+7tk=
X-Google-Smtp-Source: ABdhPJwRq2GHlwifz7DWa8UTXRl+usrxPBbU0bCbapQI4TuBEsTyc1Hgl0VlWPejpVut9WLXZ/HplQ==
X-Received: by 2002:a17:902:b586:: with SMTP id
 a6mr13367580pls.150.1643917121104; 
 Thu, 03 Feb 2022 11:38:41 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l14sm3359056pjf.1.2022.02.03.11.38.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:38:40 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 04/10] hw/acpi/memory_hotplug: Remove unused
 'hw/acpi/pc-hotplug.h' header
Date: Thu,  3 Feb 2022 20:37:57 +0100
Message-Id: <20220203193803.45671-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


