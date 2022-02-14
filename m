Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDB54B5A41
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:56:29 +0100 (CET)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgWS-0005RT-6g
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:56:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9N-0008HK-7N
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:38 -0500
Received: from [2607:f8b0:4864:20::1031] (port=43739
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9K-0002c1-Pf
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:36 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so16670952pjm.2
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fYBWsAd0Vw+iWZTweg8E9H7Amn45LT5MAw5LsRvoW5U=;
 b=LwxL8ccYSehC8oc692MjxFbvHWi5Q34EVgRp54CdZKXspHGGrLuI+jxlbGlFmFqIj1
 hjsyf/k3oWUfjAReOngGf5XWpE6JzdamMyGpEJaXEOTFrlwSm3EhNxtkBNII1cJA+P1d
 ibaGLUdXmbVOO4qax69vGBLaceVZpXqM4tBBZ3om1iJn4JD824YS001YzGeR+whR2VEW
 OmquQ+4YLCiNZECbaTwNGnTHoy6spAsXQjzGwEn9F5RK2IPL1MXVrcG12lpshQT6fwbD
 48sjJCVUHdK+3D0NmGn47d+6y/2ZXUZj2NwXEDina1xJoYMSgdqiBAzIGx8EhzJTCHUO
 CMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fYBWsAd0Vw+iWZTweg8E9H7Amn45LT5MAw5LsRvoW5U=;
 b=GGrc3ekQL27nvgmT9b3Sp2oWBvHHi5NKWNDkAEAXLQcsoxuLoT6m7xArDSAluVngZ6
 w+U6ORv28G7brk19luXBo/H2U8VX2twJoN67NY8bykK8aRCHMkmOsgXxISR6aip/Nt0s
 vsUrnZtzcxp6ULY37hCEAcCJcFW38QRAG3cRUPEITkC0SU2CZSJ7jFE0Zae49ZC54Ykv
 4XdrRbN3CQGPXk14Hm9EFExOHsdJzKocTsU91xogkxTLRl9lJzRViqlpUOnMf+qtfv2V
 /FAYTf8fWmZB6xZ01vdjyzkhyQuRI/czafQ3NiEDr+9BG8Jh8pNAs6R8z9anD3v1ZyFo
 zFPA==
X-Gm-Message-State: AOAM5331Syy9eDU4tWo6wJT2Mxs4Xf99dSLpMLQpecCFvsadTI39Mq+Y
 l0cXUEpsd5HRojaTo6L++XdSSA87Kuc=
X-Google-Smtp-Source: ABdhPJxzjRCEKhiRuf5M+M3H5bHGcmdJkBEZUkctzObfDEpSV6FwgMVbRjMKifpL5alBGrlo36dUOg==
X-Received: by 2002:a17:902:b583:: with SMTP id a3mr287008pls.77.1644863553394; 
 Mon, 14 Feb 2022 10:32:33 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id 16sm38110303pfl.99.2022.02.14.10.32.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:32:33 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 05/14] cpu: Add missing 'exec/exec-all.h' and
 'qemu/accel.h' headers
Date: Mon, 14 Feb 2022 19:31:35 +0100
Message-Id: <20220214183144.27402-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
index d5d4cbf8cb..d564886149 100644
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


