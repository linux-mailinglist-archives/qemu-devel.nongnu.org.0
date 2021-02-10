Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3A3315B1D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:29:10 +0100 (CET)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dNV-00037x-4x
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyq-00042Q-NM
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:40 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyG-00088n-H2
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:36 -0500
Received: by mail-pf1-x433.google.com with SMTP id w18so93776pfu.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EwcrKH1NrGFZArzgiK/QBy4uHtN2oVX1PxAv1FeIOOw=;
 b=gZDPwoDBqmqxWPhhzzDMGxcgiNyHP0ZlOnRLq0lHQP/Sd0my4y5U+j8A3JBBjKBu5t
 iUbJ7l+CdbIKPD37JmhJP7WuRcNgCez6BT0w/10Fz7b/1K6KCaQ5ZChgzQv7+haS3kQg
 vrdBPiCeYoG6w8sSPV3HdQc5aBgQC/cMlit75BxDYWo5JtO1zLu9EB2A57Ei2Rhu3MHa
 w2swW8xm3f/O0sGCFEdO9WJJTu5uwf4QNvDkgTeZzazbCkZhDe7XBaveul1Y7Ayi51RM
 BOKbaCT5ZS/+ygCsJRXp0j7klRFhut18bcM7Ycl9BOkgtdzOV0eWf0QabQlnro4SQO/w
 mS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EwcrKH1NrGFZArzgiK/QBy4uHtN2oVX1PxAv1FeIOOw=;
 b=ECI+Xql5tLlzj22pxulpv1EhqxGeVAoHe3lys7imYNskKb8vezETR++fFuO28XNKAz
 AWmqyvPuc79DPpFdLljDk5L6fVSt/F2s7mHPLuKlTHLhEV3yMVKGN3V7I0pYwodocI+4
 U0Y4ZKaIZejUCfoeW+dfo/mwHqhiGg0rktti70baCXEq0+VAGW+SdmoiUVYaRG9nx5lW
 ar6Pt934qslOtuyumHCsYt8b3MwfDYKrSSlCPGaMqkzG6RortA8BL6BzdqfPxYG8m3U9
 aDKnmWlrktX50ZW1rev2CyG0tGVN02F9BuY1DtJM2DzZBhnehiOx/+Ocs14rAQjq3AVW
 TQ3A==
X-Gm-Message-State: AOAM533yyV8r/dI5aQIEKm2YqBdFbrR2qsxfzlNZCzkJc30wGaQ81s3E
 BOPKfoXXqsR7enUPbdsxhoyRyj/0bG31MA==
X-Google-Smtp-Source: ABdhPJxdJVuCOeeai/rp0D2CjojQqwhSUYMSuJEBrDvWOsa5hKhP7C5hYDxvi+Q37Vw4+YU/vxcdDg==
X-Received: by 2002:a63:4082:: with SMTP id n124mr443820pga.340.1612915378321; 
 Tue, 09 Feb 2021 16:02:58 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 27/31] linux-user/aarch64: Signal SEGV_MTESERR for sync tag
 check fault
Date: Tue,  9 Feb 2021 16:02:19 -0800
Message-Id: <20210210000223.884088-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h | 2 ++
 linux-user/aarch64/cpu_loop.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index ddd73169f0..777fb667fe 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 4e43906e66..b6a2e65593 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -134,6 +134,9 @@ void cpu_loop(CPUARMState *env)
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
                 info.si_code = TARGET_SEGV_ACCERR;
                 break;
+            case 0x11: /* Synchronous Tag Check Fault */
+                info.si_code = TARGET_SEGV_MTESERR;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.25.1


