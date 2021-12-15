Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CCE4757B5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:24:48 +0100 (CET)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSOt-0007PA-TL
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:24:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRif-0007DI-QO
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:09 -0500
Received: from [2a00:1450:4864:20::42f] (port=37637
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRia-0008Ta-Ln
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t26so1057000wrb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=itrbLItJypKD95cQZggGEzOjT12l1+m/EwZ7pOTkiIQ=;
 b=rol+mb1Ri2JQWDPm9cl65OuDDw66ZxREOcpcIhIIEzNwVm0zWW3DtWEaebnRDr2IRT
 LiqyyEQyxA/KupfugArM8VwTmbL9PcMx1ODXENO701+NZE5oGfskpf9YbsNMrNvxApKA
 lkkPxDVRcEZemSmqHbeTEHSquxfLPvAzMEUtSc5+L/jU+Pv+tJ9wDzkcTShzvh3N7q5V
 qwAI3QyHIQqK3Kj5KIOFPfssgElWGPYT0TXBzDDb2K6GFTid86/k6KdrRktBeeFD3T5w
 ZMy6RwMdPuSvR7vkVrlnOg5jvFt7903UXOVd8p9omIB8XSPojA+28wbl0U3MO44AOm0g
 lsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itrbLItJypKD95cQZggGEzOjT12l1+m/EwZ7pOTkiIQ=;
 b=owfUKpPXm3jzBeDMDp0gtMGBNFNW7g+12DpreGdzxTeZgMeM8Z8OThxVpmi60XwdGg
 QupJMHNDnmlY431N2NWSv+Eg/7078ZetltXt+NHmGSEWgyBvkiacz4xQndqSAbd5A4Xh
 FPtVwjBxOOr/BgoFcaa+rYYtfH2Nu0b7kwbTcwGeyrkJJRb1rCChE4JTkBj34bZmbU9x
 QszEXVP2yRE2MFT3fxjviZ8ik5pVe91CjtgmzIAwr+Hrm4nijB+kjLaCJ9M3lXZSPJI0
 WZ9GPM0pPD+moJ99e8SqqV14ENsUuLOZ67K3bz2I63s6UFT3Lapp6/fz0qCWgMi1XaB0
 hdNg==
X-Gm-Message-State: AOAM532nr7q+odaUOv1KgX9oLML5hRIYD4m5Zg4slVF9iRtpk90kwm4J
 +I+VKg2EZDmLcZqwE6TqgP1ueme65bq4IA==
X-Google-Smtp-Source: ABdhPJzNft4IBnBq8QwPj4U5rE39fMxmgSgHOMhn3+64+A659YBWz1AZmMw33f1GeQbMXWn00wzmJg==
X-Received: by 2002:adf:b1cc:: with SMTP id r12mr2746162wra.385.1639564863278; 
 Wed, 15 Dec 2021 02:41:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/33] target/rx/cpu.h: Don't include qemu-common.h
Date: Wed, 15 Dec 2021 10:40:38 +0000
Message-Id: <20211215104049.2030475-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The qemu-common.h header is not supposed to be included from any
other header files, only from .c files (as documented in a comment at
the start of it).

Nothing actually relies on target/rx/cpu.h including it, so we can
just drop the include.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-id: 20211129200510.1233037-4-peter.maydell@linaro.org
---
 target/rx/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 4ac71aec370..657db84ef0a 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -20,7 +20,6 @@
 #define RX_CPU_H
 
 #include "qemu/bitops.h"
-#include "qemu-common.h"
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 
-- 
2.25.1


