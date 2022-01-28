Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6614A0474
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:46:39 +0100 (CET)
Received: from localhost ([::1]:34186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaww-0004vn-37
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:46:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafr-0000kd-JL
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:01 -0500
Received: from [2607:f8b0:4864:20::131] (port=38694
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafg-0001aR-Oe
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:59 -0500
Received: by mail-il1-x131.google.com with SMTP id i1so6770267ils.5
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1mpwYZNs4mJXgxPDyP8VAeZVM/ryFURuOJnVXj3MG+M=;
 b=u97vf602JKJV2/pGsxk/oR1Z8Gqp3y1lH95B6unSIh6MozQ17k//oMbo16XUEni2Mr
 /JQjMkSZ4qofbLlAKSQMtyHR7XK96uSPug4AkrCUR7+zOQhSQ1+yevH64AqBVksJLGOS
 gfDWtUN2ujR1GEgIUlnEFLTwpo1AjoH3hF6vn44rulNwgMwttgvYosXnn5cOYfWKhoCT
 LuU1dpMXfHqPoOF/04BUuIwsnDjyL1Jq/ZBGNrcDCo3KS+f6bg9adHX+C8qYm30xUEQx
 aBZ1Z39NfFK4SPunGN2R+WoqG96qMwPBF5oGDUdAtn4NHaS4OoVjR6ZEM6k39nvoS0/p
 JzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mpwYZNs4mJXgxPDyP8VAeZVM/ryFURuOJnVXj3MG+M=;
 b=tnY8/8zMlbsm297VUke036zbLIR8GAnoXnR8X5qiB9ImG+NzLpmKKRu41fMCihIMIl
 KhKyJF6FEUFYIV2szKHGEcijkqsfvJbqesRkOfpCdIj83bBIjtdT9E3C5iL6FWtN/kmv
 OAgt9+P+MVlUCt9OqXYo05/+VsBCKTIPOg4KQs+whYqaeYW1GWHRTsjCcvazUBYEB6++
 k/fPyQK+P2dSJfy8Fxuvbsyn0cRNNIjj1p+WNTTrXI2bswzsBf73iY3VGKJ0PNW8BapX
 HNPwmrgo+sD4BujGKJnIiEcC5+GG1w6eEoRrNYTXKi3IIZMcnlKb3Izotf788EzaNcq8
 xG3Q==
X-Gm-Message-State: AOAM5302OUA7MzL645SRPioQ1FC2WqeIvpT8+WRkeVpUVtr/6dSBKCyZ
 RSBJ8vzj7X/SRlIo5tu9cqFi8JdHKMQKQA==
X-Google-Smtp-Source: ABdhPJyh/6CaT1Tokts6vpUci1O/javSrhHMXSyclKXpjRP+OEIvHOEqUCnqAJBiugQTMAPSGqIrag==
X-Received: by 2002:a92:c685:: with SMTP id o5mr182660ilg.153.1643412502279;
 Fri, 28 Jan 2022 15:28:22 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:21 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/40] bsd-user/host/arm/host-signal.h: Implement
 host_signal_*
Date: Fri, 28 Jan 2022 16:27:44 -0700
Message-Id: <20220128232805.86191-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement host_signal_pc, host_signal_set_pc and host_signal_write for
arm.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/host/arm/host-signal.h | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 bsd-user/host/arm/host-signal.h

diff --git a/bsd-user/host/arm/host-signal.h b/bsd-user/host/arm/host-signal.h
new file mode 100644
index 00000000000..56679bd6993
--- /dev/null
+++ b/bsd-user/host/arm/host-signal.h
@@ -0,0 +1,35 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2021 Warner Losh
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ARM_HOST_SIGNAL_H
+#define ARM_HOST_SIGNAL_H
+
+#include <sys/ucontext.h>
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.__gregs[_REG_PC];
+}
+
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.__gregs[_REG_PC] = pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    /*
+     * In the FSR, bit 11 is WnR. FreeBSD returns this as part of the
+     * si_info.si_trapno.
+     */
+    uint32_t fsr = info->si_trapno;
+
+    return extract32(fsr, 11, 1);
+}
+
+#endif
-- 
2.33.1


