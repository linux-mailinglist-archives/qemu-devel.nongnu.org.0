Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6B4AFFE4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:08:39 +0100 (CET)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHv8g-0002Kv-Ej
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:08:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuw4-0005LV-7s
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:36 -0500
Received: from [2607:f8b0:4864:20::62a] (port=34569
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuw2-00085V-Eo
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:35 -0500
Received: by mail-pl1-x62a.google.com with SMTP id 10so133587plj.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXmC/7uOm2q+QmBNl/8unlpjX1jF43Xoaw+p+258ipw=;
 b=PoB+pjZQ8latwLuAXV1m6wlk9YE2zWNIKxu3IbdtM0jsGCfxB6lQk8BrbSOZNRwxrz
 IsFGHQh/lvifpAfSkfj7eDq76rnS6PewX/UUmAC5GHHaxMefx9FQUp7OqDwb8F7egREg
 aTDzyLL0AfdedZY465BwnnGsqGbPNN22BUlBxM9VlxnW7Z+r0n9A7Ql3GnePA9Iz3JQe
 I00HKH7UG82i40QHSWNfreQnUOIsZDgKZ8YZcNXU3OF9q1zVYL7M9ChntLU+TnO67B1x
 u8dP1HlichYBZrCTzP4M2iY0P75SsZWWtyhWF7egGC5lBywudoyGKVUNqej/lckUiSmP
 Q2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZXmC/7uOm2q+QmBNl/8unlpjX1jF43Xoaw+p+258ipw=;
 b=YX9+fVoPnYrS+3Jxl1HqX4Po0nfy+2VaVB/sSJ+tK38zgqpOD7yuyB8fJrRvLT/GT8
 SCHQDUGO1Jv6HzLdKnO094i7JDVmIsfFMpfMWweUFHIDu5kHTXA5zNBxlIkDnXfPfuCq
 KefX2tCgMVPycoOey7orJSIWOTjROViqOL0MGBhttXK7sZWq6guqv7ZeB4P6HSo7A4kN
 is8oZXJpSAPt/9dZjZGKud6UtbE0oW1w6xjTndQ++J0wPOgIJ1QvrAEzULhl83RPj+i3
 pGVAqXNE07cEE9b0Qm6pxEPAPuS0ki7Jxyy+mwNVMsMabriCUb2+XXoKiIwiORrNK9fK
 gX9Q==
X-Gm-Message-State: AOAM5312Tszg4DE23N8HnkzGpeNMAm5rGTNxuFOgIfm2ZnxCJIE42dyf
 dkw7w08x8Z5PoGGiq18f3JA5LB1ZGaA=
X-Google-Smtp-Source: ABdhPJwsUO9JoFgGKDpWqafCpYxRouUsxkYOY5+gz78NOkChAJ9XcR66riVAfCwMot01Cj4/bFB4cQ==
X-Received: by 2002:a17:90b:1c01:: with SMTP id
 oc1mr1585263pjb.161.1644443733144; 
 Wed, 09 Feb 2022 13:55:33 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id k14sm21200538pff.25.2022.02.09.13.55.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:55:32 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 05/15] cpu: Add missing 'exec/exec-all.h' and 'qemu/accel.h'
 headers
Date: Wed,  9 Feb 2022 22:54:36 +0100
Message-Id: <20220209215446.58402-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

cpu.c requires "exec/exec-all.h" to call tlb_flush() and
"qemu/accel.h" to call accel_cpu_realizefn().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/cpu.c b/cpu.c
index 97d42b6b2a..6b4aa53775 100644
--- a/cpu.c
+++ b/cpu.c
@@ -35,10 +35,12 @@
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "sysemu/replay.h"
+#include "exec/exec-all.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
 #include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
+#include "qemu/accel.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
-- 
2.34.1


