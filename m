Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18944ADFCC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:39:03 +0100 (CET)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUSE-0007b2-EC
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:39:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLP-00015E-06
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:51 -0500
Received: from [2607:f8b0:4864:20::42d] (port=42804
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLD-0000MJ-Ea
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:50 -0500
Received: by mail-pf1-x42d.google.com with SMTP id c10so548231pfi.9
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0jtvvYgmoY/nnkFak831H0YOxV9O4s5jsQ7IDO3Dzr0=;
 b=n/Mujt1nd3MLujLMEy0TZfWmAdY+CLQkn6aurf9gvrjpN/Ufq60dxF10EzLU0CSyP+
 2FvE7t/nlcCXYlwQhasROo46M4aESsZXYIb6nTcdYCcWQhy134RbtLDleX4sqrHFdTJt
 ifOIQ6KwjuFID3Ahqf3rc6mMS4FD7M6KPrHTVs1FA5CF6TNUHQRTaQPiXqnlXST9IFAz
 +YA+jVBU+6a5uwNVC1atRAvI5R3Lc3RxRQRbCMAqRo3o5cJ8QnTZhwhT995BxSDU5siE
 kKeidNnEiNPSqwhomHg3qFQoZsaoSOp4Fi0zCWzGZgWnnDdlt1i7c6eOj2rfuFz2xWbd
 11BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0jtvvYgmoY/nnkFak831H0YOxV9O4s5jsQ7IDO3Dzr0=;
 b=hsq9LBVDP5hHMOQZ7sMmUUlCaSFdaOwbvnUyTzRGWovzOjdLzPlYL1VE6K1zTVi8Ar
 XI3+dNYnQLdGFk7RMNNl5XZLm34QjpuRs7MfISNUnm/oDkdVIUWzrvgxZQbMzfczCkmd
 5zAB7DYIuk+NzJlHfHX88LKOLemsUBkIqoIOga4kK8BCUKFmMYo0ASxecjrFWQ8X3Zr8
 qdZw27/TMwuo6lDARn8FRtXTP5OCG1n2hozbf1Lh4gqiYqbJolOhmj1v46szHvMhlRdp
 QYuKAo9OSKEoQNvWxQ9kBx23tu6KzoUa7tfLmvgeTjphOXMar7PnQzxav98XoU4Y84NT
 wlKA==
X-Gm-Message-State: AOAM530wK5ALfsjyRUX9bHXLs+h4u0xwcdMtgMNk/t9nCfyE8dEhL28Y
 GCxduDSGbSuJtLEn9pK28byQGwEUpv8=
X-Google-Smtp-Source: ABdhPJwJbJMby61JErPdGiD91jVPfeup5ElShowlhoe5iDjOxzcciQ8T/OzmxholSU3xyPPqC7srYA==
X-Received: by 2002:a63:e643:: with SMTP id p3mr3824631pgj.7.1644333818067;
 Tue, 08 Feb 2022 07:23:38 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i8sm6609410pgf.94.2022.02.08.07.23.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:23:37 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 06/13] cpu: Add missing 'exec/exec-all.h' and
 ''exec/exec-all.h'' headers
Date: Tue,  8 Feb 2022 16:22:36 +0100
Message-Id: <20220208152243.16452-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/cpu.c b/cpu.c
index 834e2b4cdb..a728f3e762 100644
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


