Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DC064B58D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:58:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54lv-00006M-Vg; Tue, 13 Dec 2022 07:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54lt-000060-Oe
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:52:33 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54ls-0002yb-6r
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:52:33 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so7890876wms.2
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9K2qPGrTReTYlsl4YSIfP//FNBSyIjWF7QnWmXpGYsA=;
 b=yl5BCsoEDuxmjJkMLGADIVk+7r8BSL7oepnDFby7GNPpQfmQ5Bn+smmkNWKP7MY7nj
 CiCsBjoLiYR2B5BR/DQ2D2ziVZtoDFyQDJw5CcT9HrbV3cVjwevAC9DQYJtNxpBJWmDW
 qgw/WVDJhEt7ZK3FKPs6rJfcBSJbjP6N01bCBm56P3ru704eGUG02glHV194chqOhpoQ
 gtTSzLFX+XRxlAnO25y+QbyX/hw6j4SFRiQowJug01p5XQkGSuFCWlrRYfJ/cRy8saYc
 H3dTMZMz38AM4xGAXMO+0EGrukQLrdKiDssA0IIA02sd3JUpknCLHzUzpDcBe/ivAt3v
 vJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9K2qPGrTReTYlsl4YSIfP//FNBSyIjWF7QnWmXpGYsA=;
 b=1sHjKEkFfIDi6B7wMJe/EzmLm9wWMNbT7uyhV6RBHYU5hFQfbFzhk7YnqALi8MmxOL
 O8zQZxKmS7vbJwca0H8ylnErdf9cKY6FzQ02No7pCv43acV8uzdRi455t9dLiFcMWfmy
 dTDp+epTCz+Msl6EWEyzH5RaJREk3ub9xKZFpSSsVK+OdM1lT5gv+ror+/mz0BRHN3Cg
 fRYWm6FPx56DBWLCf1wKvlxZG5gy0BmEVYywj/p4/wC8lgElo1EUpVqIHfLL8K62CTx+
 0O1eM7dQyDSJ8UGId7+jiMi0yLFGMwdmi9JIU2ffm8lq+DdkUCUbRu/UKtcQxBplpjIb
 0jVA==
X-Gm-Message-State: ANoB5pmjRE+N/ppvZq/1abYr7hQ6raGu5x+wRjTSrPCz2aWmOOFjbasa
 vPNsr2gl9tQi/hSNy21hEXc+7Q9cHUQIaX28/rU=
X-Google-Smtp-Source: AA0mqf5i7uzOLLsF0oM44lU5HBiiTzazh0C7ReGXX9LYbBi9XR+7AIoiqtUfeiCSfZTn0pRfqmQj/Q==
X-Received: by 2002:a05:600c:1e25:b0:3cf:9ac8:c4eb with SMTP id
 ay37-20020a05600c1e2500b003cf9ac8c4ebmr14901967wmb.24.1670935951219; 
 Tue, 13 Dec 2022 04:52:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003c71358a42dsm17603605wmq.18.2022.12.13.04.52.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 04:52:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
Date: Tue, 13 Dec 2022 13:52:17 +0100
Message-Id: <20221213125218.39868-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213125218.39868-1-philmd@linaro.org>
References: <20221213125218.39868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The tswap64() calls introduced in commit 4be21d561d ("pseries:
savevm support for pseries machine") are used to store the HTAB
in the migration stream (see savevm_htab_handlers) and are in
big-endian format.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 66b414d2e9..8b1d5689d2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -39,6 +39,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "qemu/log.h"
+#include "qemu/bswap.h"
 #include "hw/fw-path-provider.h"
 #include "elf.h"
 #include "net/net.h"
@@ -1357,10 +1358,10 @@ static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
 }
 
 #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) * 2))
-#define HPTE_VALID(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_VALID)
-#define HPTE_DIRTY(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_HPTE_DIRTY)
-#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &= tswap64(~HPTE64_V_HPTE_DIRTY))
-#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= tswap64(HPTE64_V_HPTE_DIRTY))
+#define HPTE_VALID(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64_V_VALID)
+#define HPTE_DIRTY(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64_V_HPTE_DIRTY)
+#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &= cpu_to_be64(~HPTE64_V_HPTE_DIRTY))
+#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= cpu_to_be64(HPTE64_V_HPTE_DIRTY))
 
 /*
  * Get the fd to access the kernel htab, re-opening it if necessary
-- 
2.38.1


