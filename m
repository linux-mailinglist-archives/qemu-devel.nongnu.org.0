Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2756521F1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:03:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3d-0004JL-K6; Tue, 20 Dec 2022 08:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3Z-0004Go-TA; Tue, 20 Dec 2022 08:53:22 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3Y-000137-Cs; Tue, 20 Dec 2022 08:53:21 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1322d768ba7so15438632fac.5; 
 Tue, 20 Dec 2022 05:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+IR5HLmiOCztNIy21koqL5hnkPQKWK0yl/szVYQr7o=;
 b=E7Z/bh40O8V+Fkg8YwKn7+GAmeyc0hw5PkBn6PpCyPObskjOEDLJ1iQx3NWIrFas3B
 1sUN8KytDgmrzSGmIOzC6wTqGtoFbz6Rvj7FNhpGuhOxZxXxpzu8Yq3uxuYHlgVZwK+b
 Gh2oPy9Dv0pUQQ8RFFQISp/Dfk8oz7YyNHEOEhO0JAKNCcT9uK77qxMyV3oPkzleCpTF
 /uMiyn0UoaHuCwzhwDupQ+QB7J3n7Y3+la1JckOHLTqCheAZ3YCfBk/LFxyEx8koIm6T
 0ZJ22ZU+/KB/OkJMjxqHtIDh+YS33C+kXRpFkNt7nf2dP5kLvndTM/3JPjnKUEpz4Mxb
 mcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+IR5HLmiOCztNIy21koqL5hnkPQKWK0yl/szVYQr7o=;
 b=Rj/IRkU3WJ5UeCY5l7GokVWirKBvxI6qcTJHkKGQibH5DYvR1lbg/uAguGRIxOAGHj
 WtUFZGELqqFkJIBpvyZR6LokVWBSJeI9/VGMDGqr/XNuQ87F9/2rrW0gRacFneDAF4gG
 mUYPfhm7gnjbJRt6FXwFzL+ask+ocAjZdQW4HTCc1D4CoA+e1JYHY2E/ol72x528QbhU
 hQWKkEb3OmlIJezxuMkOONGHNU13UohAPKgY0DUP7CKwTxqpZOerbOeYJ2mzJIEZR7jR
 ltOiMEJH/e+ImuBYN7n3SU/iV5GfZ3OsSyfB86Jr1F8TEObphN/e+n/21qbqEXEGvlzA
 CsKg==
X-Gm-Message-State: AFqh2krc1zSoGb2tft9SG1pqLaC/eng7rlYBpoFTVHyiRW4Mcgxqt8GZ
 7UEgpqD1Qx4bx0GLDdaOFWeaSqlZQts=
X-Google-Smtp-Source: AMrXdXv1m6abus4gQxHCU2DbxQKbIqim1COXhpgxT80tqTMXb8xNIg77DqUVh+9vICqDD7ABlzy4gw==
X-Received: by 2002:a05:6870:e88f:b0:144:40d0:85a9 with SMTP id
 q15-20020a056870e88f00b0014440d085a9mr7045804oan.32.1671544398921; 
 Tue, 20 Dec 2022 05:53:18 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:18 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 08/15] target/ppc/mmu_common: Log which effective address had
 no TLB entry found
Date: Tue, 20 Dec 2022 10:52:44 -0300
Message-Id: <20221220135251.155176-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

Let's not leave developers in the dark where this log message comes
from.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221216145709.271940-2-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/mmu_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 89107a6af2..49067c05e6 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -811,7 +811,8 @@ static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
         }
     }
 
-     qemu_log_mask(CPU_LOG_MMU, "%s: TLB entry not found\n", __func__);
+    qemu_log_mask(CPU_LOG_MMU, "%s: No TLB entry found for effective address "
+                  "0x" TARGET_FMT_lx "\n", __func__, address);
     return -1;
 
 found_tlb:
-- 
2.38.1


