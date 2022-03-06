Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3234CEB9C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:03:52 +0100 (CET)
Received: from localhost ([::1]:37524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqYB-0003U3-ML
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:03:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUz-0000O0-Ub
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:36 -0500
Received: from [2a00:1450:4864:20::32e] (port=39918
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUx-0003qK-Mz
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o18-20020a05600c4fd200b003826701f847so9201859wmq.4
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cur85e8fjNdHGR2x3SpT7ZDFtyqnHC+TGOwb1mTbPeE=;
 b=gfO4ePThlPzQrHZE18vm4y9IcKwivTa2XHfY1DJAmXOIPv+ccvX/6zRLMNz+TM/Ybm
 BYgfWNqO312/6MGD5d3dHOGQ+yrhUcha4CP7B2s2draHaJMbSOUZzaEhak1DFEOztuAV
 vCDY+bCTvDodYs7o02rSqiwCEIYJahgfoK54IZkQg8plyYq1xr+ui30TAfPEqqp7VywV
 eZAjL1u65gXhMF97fg+5ZSR2X2DApKfGGCZuzfdUvB0zMpUgT+6bQZrs6J0mYHywjr7n
 tjCcHaIG0kpZoZ8U+QvXve2GG260LQ5DPrO4d+AWJy+AZ0ismXMewWFD1atv9Re2faWa
 k1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cur85e8fjNdHGR2x3SpT7ZDFtyqnHC+TGOwb1mTbPeE=;
 b=DNgdJ4HHeFtTCBBnJToFuqHd55U/G/0yJzV5VMpIIlnC9XfeZj2Cdjq2cjF2jPZIIc
 4+5lAXXBnCsAGL/7aZfCZue665rNJQrFY476DCB4F/5OV+wMUY58iso5gLDVGzNOFi3G
 ca6b6adkyQ8vGP3Vz9CAbpjwxAvJV/sQzy/48g02okhlUJOrgWgF5HDP+7yYc1wVBwtx
 VVJR7nh476JnVSNqGKusfYLyxlu65ya31+Hi707bK6VssUWy4SxLAfbGRaof1vn3S9cu
 Fy7BXc1UCnjaxb5AP8PM3Su1usvab5HQwCrmvdBkgAv8XtPZ0rT/rBRJWijnyzLqlTVE
 4mbA==
X-Gm-Message-State: AOAM531Q1tDjv82P5BQ1G8bjDBPX0ynP+iFoKO/gZwhhODUG+2npV/1j
 B/w9lm3FD7OcigmSSKcKTV2u+pHZ9fY=
X-Google-Smtp-Source: ABdhPJxeRDLXo1eKG6uywjg6/lknqPnXgnUjdsPTjZibAeqHQ5Tttlpde9nBMgQY3uet275NHN4wiA==
X-Received: by 2002:a05:600c:4f8f:b0:383:d0b:3706 with SMTP id
 n15-20020a05600c4f8f00b003830d0b3706mr5719522wmq.117.1646571630006; 
 Sun, 06 Mar 2022 05:00:30 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003899263bab1sm4258011wmi.20.2022.03.06.05.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/33] sysemu/memory_mapping: Become target-agnostic
Date: Sun,  6 Mar 2022 13:59:32 +0100
Message-Id: <20220306130000.8104-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

target_ulong is target-specific, while vaddr isn't.

Remove the unnecessary "exec/cpu-defs.h" target-speficic header
from "memory_mapping.h" and use the target-agnostic "hw/core/cpu.h"
locally in memory_mapping.c.

Remove "exec/memory.h" since MemoryRegion is forward-declared in
"qemu/typedefs.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-6-f4bug@amsat.org>
---
 include/sysemu/memory_mapping.h | 5 ++---
 softmmu/memory_mapping.c        | 1 +
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/memory_mapping.h b/include/sysemu/memory_mapping.h
index 4b20f1a639e..3bbeb1bcb41 100644
--- a/include/sysemu/memory_mapping.h
+++ b/include/sysemu/memory_mapping.h
@@ -15,8 +15,7 @@
 #define MEMORY_MAPPING_H
 
 #include "qemu/queue.h"
-#include "exec/cpu-defs.h"
-#include "exec/memory.h"
+#include "exec/cpu-common.h"
 
 typedef struct GuestPhysBlock {
     /* visible to guest, reflects PCI hole, etc */
@@ -43,7 +42,7 @@ typedef struct GuestPhysBlockList {
 /* The physical and virtual address in the memory mapping are contiguous. */
 typedef struct MemoryMapping {
     hwaddr phys_addr;
-    target_ulong virt_addr;
+    vaddr virt_addr;
     ram_addr_t length;
     QTAILQ_ENTRY(MemoryMapping) next;
 } MemoryMapping;
diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index a62eaa49ccb..8320165ea24 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -17,6 +17,7 @@
 #include "sysemu/memory_mapping.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
+#include "hw/core/cpu.h"
 
 //#define DEBUG_GUEST_PHYS_REGION_ADD
 
-- 
2.35.1


