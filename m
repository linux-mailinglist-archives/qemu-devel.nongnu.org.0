Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E164ED35
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:58:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6C9v-0003p8-3a; Fri, 16 Dec 2022 09:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9p-0003kN-2o; Fri, 16 Dec 2022 09:57:53 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9h-0001zv-No; Fri, 16 Dec 2022 09:57:51 -0500
Received: by mail-ed1-x52c.google.com with SMTP id m19so3948919edj.8;
 Fri, 16 Dec 2022 06:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QrgXciOmyiSTsdYt3UoXwdRH/orhMrXOFwHsg7Kr3Q=;
 b=jQx6X7rVROm4EVAdOibxLcSY4YMTjtzVPoweri7PUkNnEzKHnL4aG5KmlEK+7/ovfk
 v9Q8WmTUyIZp7TJ8au9IGdXpYsQmPNwM0MVJ5OA/uh9O/5Kuq4IOxFoaHWpCpGpLAzqB
 QxPY1qrR6mnMaQb+kO7efKgb0lxQe9R+XybUQ2oy8sjulI5nacJVJmkmc7qAEiI/+gOI
 20jX04wMK6AAekSlCtbDeCwBJz2GfUiN5O/8l6Ox31JlyXEd8VpRIC6Hcv1f71wZ9RUH
 5tPcOFwqOMjuaaH3fRbk5q/Fj4Jjippt6UlYwpOESfU+AJQqOsWB6O1/E5wx+/W8Vxzt
 m4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7QrgXciOmyiSTsdYt3UoXwdRH/orhMrXOFwHsg7Kr3Q=;
 b=GEjMaSXL+FDwIHih/gWUATBjM4TPzr9kJRtvBqTHGeT3ReewSTqaC611jKrUR9oltb
 3IatdExnBOgUdna/2R+q6ttsVqWGbSm6X1DQVIOanRRbAEnHOQoEYlJaEdiLoyn7dPep
 B4hSjSO4661khvRkDSaYcS0FIrGxHoQpBN8DmVoaJ6Fi6inHpfuSIiQPUP90luSeBsxU
 tvwudP4ITyxThntaHJByChtuxuGP2B1Rn6Uo+426D7KtNH70UwJuI113/bsW5H8v0PEQ
 kTHBIuWtQvQUjlUJaTrxFNA1uakmtQB0Z4DqKSMGq0Isccpl6xMsxW94+x6Ih+kwyB9F
 XBKw==
X-Gm-Message-State: AFqh2kpwn84AGjfMCCOO5G9tOvvZkVidMmrXpBjIG8+z8SZquv4u/K7A
 vZONzNTtkGxPwcnm4DCu6HyfWsdLS7Y=
X-Google-Smtp-Source: AMrXdXu8zlWvJ8K1eWq8BInUXFcv/FhaCRNeWFodNxqRZfoZNUJUddglteFHinEsKz7mvEKbZWl/7Q==
X-Received: by 2002:aa7:d6da:0:b0:474:c69:9af5 with SMTP id
 x26-20020aa7d6da000000b004740c699af5mr5697743edr.22.1671202662714; 
 Fri, 16 Dec 2022 06:57:42 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa7c852000000b00467c3cbab6fsm942225edt.77.2022.12.16.06.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 06:57:42 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/6] target/ppc/mmu_common: Log which effective address had no
 TLB entry found
Date: Fri, 16 Dec 2022 15:57:04 +0100
Message-Id: <20221216145709.271940-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216145709.271940-1-shentey@gmail.com>
References: <20221216145709.271940-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Let's not leave developers in the dark where this log message comes
from.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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
2.39.0


