Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D044AB692
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:35:17 +0100 (CET)
Received: from localhost ([::1]:35256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzUS-0005hM-9W
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:35:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrU-0005pL-Vv
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:02 -0500
Received: from [2a00:1450:4864:20::42c] (port=40842
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrR-0001tU-Gq
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:59 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s18so23108983wrv.7
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYjwyfitziA4anQcTsi+t6OEWder0Bqu4Wc+T6xItkY=;
 b=pwbsIvtxdJqlz8VeLntJlLJmOwuzRGfXnLyGL47iOL61zAkFmzvHru8HSpxZY5Semg
 AH1Ep6yOoWocD7UtNZcKG/d7FdlAZItnDIkJchLH7yZ4Xada997LnLogO9OH7ou7rYTx
 UuXQVT4MIx1ikAtuEhXta2KzS5m4EbPvY8Zf6gwFDYLXZ/P3nV4qW+gh7VYF06heG+CC
 hOdvIWvyFITaueis57joOm0VTkR7OP9/Q7mAoMSJUxu2qqF8V4UGkMh6XejYUyV4Sx3u
 ct4UWlQN2dxLGRox3E0CxEHABpIH+7akToPtlh61Qfhl1CnTW/j4/MTKF/RzJtYRNKVz
 bQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FYjwyfitziA4anQcTsi+t6OEWder0Bqu4Wc+T6xItkY=;
 b=DoqAhfBmzLQVND6vb4ay/+ICWeGdnx7Mq9cJJcWzdYoC8F4ntVHkjQTdqrvcHZxAVs
 tXf4TEDrsaPnYIElzHE3XJBngc+2Cjw7aBcNf3XJqduaP9zwmDTs3Zrz0onzsh+TXQwP
 m/wpdl4UdvPu0sKSTirrFj3/3ySVWHUeTT/qBZPvF9TFv/Do1pHHdMrGDTyMBlTdO7gW
 pN/ZzEVVZPYttU22Bi0ixVYaNm77I1m8MYx8xP+ce/a7wFB4bmlXS3cS3SdboVHcM0TY
 Zh35IUcAJsN623TPpkCDoxpJKyBkw+j7cS3YyOHng1ftpEVPmy4gnZYVIIU97dAawM0F
 dIiA==
X-Gm-Message-State: AOAM533K6p+GpKBJndXD33i4VCFB7yL3NbV1Mpyg8IjN5thQsl+xtKTx
 Ytimp3G0T6B1Mu4g14NX7rLc2QRpSdc=
X-Google-Smtp-Source: ABdhPJwqfGATsOFe5M57foDf4uCUaBiPMSpW+MEtakDgyVtMRV+n+JkJceRR7hVH8SPlBYnQq4ZBfA==
X-Received: by 2002:adf:802a:: with SMTP id 39mr8632955wrk.533.1644220491037; 
 Sun, 06 Feb 2022 23:54:51 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r2sm12331310wrz.99.2022.02.06.23.54.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:54:50 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 05/21] sysemu/memory_mapping: Become target-agnostic
Date: Mon,  7 Feb 2022 08:54:10 +0100
Message-Id: <20220207075426.81934-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

target_ulong is target-specific, while vaddr isn't.

Remove the unnecessary "exec/cpu-defs.h" target-speficic header
from "memory_mapping.h" and use the target-agnostic "hw/core/cpu.h"
locally in memory_mapping.c.

Remove "exec/memory.h" since MemoryRegion is forward-declared in
"qemu/typedefs.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/memory_mapping.h | 5 ++---
 softmmu/memory_mapping.c        | 1 +
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/memory_mapping.h b/include/sysemu/memory_mapping.h
index 4b20f1a639..3bbeb1bcb4 100644
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
index a62eaa49cc..8320165ea2 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -17,6 +17,7 @@
 #include "sysemu/memory_mapping.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
+#include "hw/core/cpu.h"
 
 //#define DEBUG_GUEST_PHYS_REGION_ADD
 
-- 
2.34.1


