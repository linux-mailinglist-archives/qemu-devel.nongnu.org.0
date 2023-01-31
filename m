Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08333682BF4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:55:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDJ-0006xY-L8; Tue, 31 Jan 2023 06:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDH-0006q1-FR; Tue, 31 Jan 2023 06:54:11 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDG-0002QT-1s; Tue, 31 Jan 2023 06:54:11 -0500
Received: by mail-ed1-x530.google.com with SMTP id be12so2874389edb.4;
 Tue, 31 Jan 2023 03:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnvu4fyAcGdKKQ5z10VgUCBohnACidYbKqIze/VgDBY=;
 b=Pf1PV0Yd/U3xaYDvFOlytVW3dMzllsmsuRhj07aYnEL2BK5pusN9LDPQQewqTaMIWC
 loIbQW4BcEGOBHYX5NXodUJY7C5DjZjCePKXQmTlKzFOQIt3OwG483mP23M6wUq0UcVL
 58pKSCs8Ux36jUOg79vh9qPyTH6nUu7mpiVpRfI8L1yNpOLqn5TCVXKOsPY+RY1ZG35Z
 9vC5BHAVHMX4RzX/fJS7gcNXfSlxqh6I9WHjYpsZtHbutEsW5EhqTQu+/UEGQJqgy0eb
 xLtGkIUk9xLOBwEXbe/2v3hTkoCKIx9k2ulgr41Aoj171nHrT5Q0gbcqqGII7YIRsm1v
 yvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lnvu4fyAcGdKKQ5z10VgUCBohnACidYbKqIze/VgDBY=;
 b=mCcBpbnwRTRb6jVqMECOnnx6sgZwx8GACICD49Noneee+o9rbZrR7gkckYSPh6Gq3S
 HkdhGIiTA2yFPJr9zjyYZT4Y9znGdwQo4DBrTBIxbkgWKBJUXAMM9Tm5YH3ezbv1PuTr
 vdnRIyvJ7gRAY16frim4s5RS6jkPQPiiB8bwncyOzD/V/JOksjuY8G9Fulj9gA3QNMpg
 SixXrrALloq/6Giiws3MM9CpomzYnz3FqL+jvV7jk0T2W03jGaa1vwwPuC/3cJMO32ne
 em1OI7+rmZTV67AyxbyH34rQBB+T0OScaSeYKECJl8qNpBgtqKyRTGmapbN1WZ/K7DjH
 BltA==
X-Gm-Message-State: AO0yUKXphpcgJiHw39DdImFTuiqZYxbNUnR7/zDFJRy0sKh80/x5fPz9
 GJUnXUzel4tgQjYyOWQ0ob17lqf0+VM=
X-Google-Smtp-Source: AK7set+yXMa8t7tRMZ45QcNmBAHODOr77ylxzIKNBqew0CpRQXP/ZHsuwBmYFsDMvElLN9XUS8TCUQ==
X-Received: by 2002:aa7:cd48:0:b0:4a2:2e33:35fd with SMTP id
 v8-20020aa7cd48000000b004a22e3335fdmr14224473edw.15.1675166047461; 
 Tue, 31 Jan 2023 03:54:07 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:54:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 16/20] hw/isa/lpc_ich9: Remove redundant ich9_lpc_reset()
 invocation
Date: Tue, 31 Jan 2023 12:53:22 +0100
Message-Id: <20230131115326.12454-17-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

ich9_lpc_reset() is the dc->reset callback which is called
automatically. No need to call it explicitly during k->realize.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/lpc_ich9.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 7d21857d53..b2842f2743 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -57,8 +57,6 @@
 /*****************************************************************************/
 /* ICH9 LPC PCI to ISA bridge */
 
-static void ich9_lpc_reset(DeviceState *qdev);
-
 /* chipset configuration register
  * to access chipset configuration registers, pci_[sg]et_{byte, word, long}
  * are used.
@@ -439,8 +437,6 @@ static void ich9_lpc_pm_init(ICH9LPCState *lpc)
                                  sizeof lpc->smi_features_ok,
                                  true);
     }
-
-    ich9_lpc_reset(DEVICE(lpc));
 }
 
 /* APM */
-- 
2.39.1


