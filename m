Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83104A8D8F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:31:52 +0100 (CET)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFilk-0000HG-1D
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwk-0004Qx-FV
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:10 -0500
Received: from [2607:f8b0:4864:20::636] (port=35573
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwh-00064p-G0
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:10 -0500
Received: by mail-pl1-x636.google.com with SMTP id d18so3095367plg.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mUpk1kUVw4Sit7UxLG6xWVu5xIspqJAXOOp8GSbkN4s=;
 b=qyektJI1JbnBGQI6n8Kzs8E2Kop8k2SZ05Y3Raors8LzT2ISyakTXMCF+K9Q/AqfN9
 8pRmqW/JD8zoY+rpq8bbXmRZ/92ccjNa3ObLoc2iu3ghEAg4Q9cYeE7jkLGMmpqmMDRU
 VlD0WI3F0RpnfDILScF4iyTJrbWwsPxHOq7YIXyRPyDcS4iXxM/+VxSE2PuPmfzH52c9
 BD6kiOQB0ECYAMtIzZBZTOiKri3odoGNsFMiPfCzFuvd7EO/riKl9BbQnqI+RfBp7vOI
 O4/i3qvAkRFq2rrCwDZjcPpJhKINbsxZkA+P9sS/HwyqYEJsIDwV6CKNOs9i3zKLtaFD
 fIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mUpk1kUVw4Sit7UxLG6xWVu5xIspqJAXOOp8GSbkN4s=;
 b=d1JHo/oPykjm7GUTdSqwEMavg9ZN8rWeCv7fX1uFpT7laORAYH6cB4YnBiNW6KbU7+
 wkpe5+VGfEHCWeuO+wYAlMEcLni7jebNif2nrJP/sNj+h/JG4+Nn3NpHCy4QQdMHdsmt
 lRXjcoBtUtGgxvzfaTcZdzyK5ZRDbKSbZvE0CgaRTm6HvGucRXHpvPn/JH55G0mJFZ/1
 udbYw9So+IzuFji4zEob8EiyG1jTn7V2Q3ngZLPJHvZncogUFVPL6lydBMbRfjV4e4Ii
 KthrLh2FLNLfE29N+9cV6tmpvdWmTl8L0+9AWXDT4GYUVsr4xdZzzHjjQXKJ6PBZ8q46
 qeRg==
X-Gm-Message-State: AOAM530m32RVC3fwTcOT1BaTn2Q0nWUbBItxauMJdV6+/ImYC0eRz3/p
 hE10DpQzZ3+Qcy2fppSOgfHj1SufEW8=
X-Google-Smtp-Source: ABdhPJyKegArEvmV/PMhjzF60i/zzvqzDDef9UG7wX6GV/C9o4M+ejTS23qcv3I/+bVb/cs1tr1ZQA==
X-Received: by 2002:a17:902:8641:: with SMTP id
 y1mr16625281plt.115.1643917144626; 
 Thu, 03 Feb 2022 11:39:04 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id ga21sm3730754pjb.2.2022.02.03.11.39.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:39:04 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 07/10] core/ptimers: Remove unnecessary 'sysemu/cpus.h' include
Date: Thu,  3 Feb 2022 20:38:00 +0100
Message-Id: <20220203193803.45671-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/ptimer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 6ba19fd965..eb5ba1aff7 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -14,7 +14,6 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/qtest.h"
 #include "block/aio.h"
-#include "sysemu/cpus.h"
 #include "hw/clock.h"
 
 #define DELTA_ADJUST     1
-- 
2.34.1


