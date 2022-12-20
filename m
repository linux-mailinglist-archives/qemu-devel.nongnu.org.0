Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E56521E5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:02:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3d-0004J1-8G; Tue, 20 Dec 2022 08:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3X-0004Fh-LK; Tue, 20 Dec 2022 08:53:19 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3W-00012h-3b; Tue, 20 Dec 2022 08:53:19 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-14455716674so15426337fac.7; 
 Tue, 20 Dec 2022 05:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G4SPXsEIXY0CS0seSoT5oNuwNukYT1XRaSgA4LvShkM=;
 b=IriBOeyzQh+gc7CJrYrqJYzKz/ZwPF5IV4/W1M1SEc1JZvKcLJpU2CU/rQ71D5LkvB
 x4yESWh1RI+VdQLDgnM0jK7PhunH6xEXnzZK559bIbvGrXPuSUbRYSvY2UxGqV1Bwa7g
 z3fO0WC7m60rydHr0B4lEb9uHnAbmKyXdcWfy6suBPz77bbo1EhL/neB8O81TSS94Lhn
 Z3vrzaL7uVN+0uMCkJfZu7v7yXpeTSTDjk2zZnO3tvgzJVMEazSTOdnuDr5hj5XoDFff
 8p4Ee0Wp4rWsuwfmlw/Ew2gSQrDRqJHkfXP3+Rch2KAU5opS+gWC+73nsilhapwPlmUY
 96QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G4SPXsEIXY0CS0seSoT5oNuwNukYT1XRaSgA4LvShkM=;
 b=499ZZ0YJ5+duDqjjo/G92oLvJvCa0GyP9zWugcj2dGBxuXTb/als6sfL1bj352x1Zk
 YD9JUrzg1ucFYL3aJr28RvKPYY5i+ybOI3neWYvK4d191s1gGytUACY/8Z9X7jChsXUq
 eIsHWSRzjikZ35sKfZNx8eDVkevowRVaQNvHGopQReViusEZ5zk8z1pFlEOXfsWvwHA3
 P8VbTtaBlqDWp+hk9kNBzC9BmCRpAlvxgrbIlhiDeS+xcnBMM0e0iUX41+N9xZ/rA2hF
 mM5OgRqxpu1UaIA/yVSfgyS2oOti0NYzIkQLRTjwAI8O6gzE1G1+dsAMKogeKZa+NhMt
 FrMg==
X-Gm-Message-State: AFqh2koNu74+gYYSsfqoT5LzOW2SzLrM7Adae7TTcXPuNFTQEnU6rFp7
 gzej4Ni+Psuskcf4rqgAEnldaZe9PHk=
X-Google-Smtp-Source: AMrXdXsddvA5T4K1p8Jdy9XxctipH4P9BGHGi0FoytEXqnp68Xb0Sr+NdUM0JQ/MiGtpBWZWH7+eIw==
X-Received: by 2002:a05:6870:c5a8:b0:144:c2e7:3a98 with SMTP id
 ba40-20020a056870c5a800b00144c2e73a98mr8424227oab.31.1671544396235; 
 Tue, 20 Dec 2022 05:53:16 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:16 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/15] hw/ppc/spapr: Reduce "vof.h" inclusion
Date: Tue, 20 Dec 2022 10:52:43 -0300
Message-Id: <20221220135251.155176-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Currently objects including "hw/ppc/spapr.h" are forced to be
target specific due to the inclusion of "vof.h" in "spapr.h".

"spapr.h" only uses a Vof pointer, so doesn't require the structure
declaration. The only place where Vof structure is accessed is in
spapr.c, so include "vof.h" there, and forward declare the structure
in "spapr.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221213123550.39302-4-philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c         | 1 +
 include/hw/ppc/spapr.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dc850032ae..59641adaec 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -62,6 +62,7 @@
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
+#include "hw/ppc/vof.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci-host/spapr.h"
 #include "hw/pci/msi.h"
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 04a95669ab..5c8aabd444 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -12,7 +12,6 @@
 #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
 #include "hw/ppc/xics.h"        /* For ICSState */
 #include "hw/ppc/spapr_tpm_proxy.h"
-#include "hw/ppc/vof.h"
 
 struct SpaprVioBus;
 struct SpaprPhbState;
@@ -22,6 +21,8 @@ typedef struct SpaprEventLogEntry SpaprEventLogEntry;
 typedef struct SpaprEventSource SpaprEventSource;
 typedef struct SpaprPendingHpt SpaprPendingHpt;
 
+typedef struct Vof Vof;
+
 #define HPTE64_V_HPTE_DIRTY     0x0000000000000040ULL
 #define SPAPR_ENTRY_POINT       0x100
 
-- 
2.38.1


