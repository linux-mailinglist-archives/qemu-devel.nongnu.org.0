Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AF3669A0C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:27:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnH-0001Tf-7W; Fri, 13 Jan 2023 09:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-00010W-MC
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:56 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmT-0003ef-UU
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so17449441wms.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p5wUjZHNEX4wvPYtRpYJpyJdLoIbuRacZePj/0c5n/s=;
 b=skDG2nMakcCjDePVX6rNJFWF6KgeLqZgGWDYIvI+b9sWdottF6GUl21KOJ7kC/9ASJ
 pO4UNcKjffqrlVu4hWKEAhHc9yLLQaQ649CH/oyb9NnTP8fv08H0soZ20QsUA8sECjyD
 5rlzp8ZvPsU4dw9nuY7QIKlMe9sO0yo+6oUxjAn81Bjlb6Ift3GSoaqLFo2jOZqEQBYL
 UVIhUWunYlqhpbIvdFr2cv0z1d7ZetlobmrTvf2DBb0amQ28miv+OJYL3eJvwiLmyLwG
 29c8eDcOgQ1qzDGcDskIkYoHc4uvKSc8DqMZdWvBMKkaoY7CPYj2qeDHK3u31XQ1mQA3
 cLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p5wUjZHNEX4wvPYtRpYJpyJdLoIbuRacZePj/0c5n/s=;
 b=fIDE7wQlmNcaSaU0pOc+HjNKAcg2giMPNxw6WKEmtrvnStjb3HctadTGuLGFLoKpZO
 JnTE/qKRe+bXPUeFSLzKxFBeH+TKch3S43TPmRpNdWeOg3s0em8fqW0chvtblP77vRJ3
 GFRdKHXo8YthAicpX4lL3VITutLcJFClFAbzLt8flqfnHQD4Hf1LpU+N2hjqEEL5DDFq
 kDWEtoMBn+XMR3NNbALB9ukx3DovAY8z0gHJP4piFKkSnZA/fRUd7zHgf+W1orCaI2Sa
 Unm9py44n20Dca1CcBTJvCLNwbTiOBfXUExSO0riSMvboKqTQY/uIL50iXMlTCmj8Pz0
 d/9A==
X-Gm-Message-State: AFqh2koGi0WMjy1Zu+yDw6lWs2Akpg7yoI8AxBknPzgW1ioIrC7jaDA3
 ucbgZhFqTREi9K+VerAtKZcZcQmKzo3BFMBb
X-Google-Smtp-Source: AMrXdXtGeJEi7WYbfi3CXTX66BARSUciGQnBHR2ZyLQzWbzTecnDb9HyB94nAsgpl70q3gnPHhQBvw==
X-Received: by 2002:a05:600c:3d0e:b0:3d3:4aa6:4fd0 with SMTP id
 bh14-20020a05600c3d0e00b003d34aa64fd0mr58858177wmb.6.1673619100253; 
 Fri, 13 Jan 2023 06:11:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/38] hw/arm/collie: Simplify flash creation using for() loop
Date: Fri, 13 Jan 2023 14:11:02 +0000
Message-Id: <20230113141126.535646-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-5-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/collie.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index d59c376e601..9edff593708 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -40,7 +40,6 @@ static struct arm_boot_info collie_binfo = {
 
 static void collie_init(MachineState *machine)
 {
-    DriveInfo *dinfo;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     CollieMachineState *cms = COLLIE_MACHINE(machine);
 
@@ -55,15 +54,13 @@ static void collie_init(MachineState *machine)
 
     memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine->ram);
 
-    dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(SA_CS0, "collie.fl1", FLASH_SIZE,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
-
-    dinfo = drive_get(IF_PFLASH, 0, 1);
-    pflash_cfi01_register(SA_CS1, "collie.fl2", FLASH_SIZE,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                    FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    for (unsigned i = 0; i < 2; i++) {
+        DriveInfo *dinfo = drive_get(IF_PFLASH, 0, i);
+        pflash_cfi01_register(i ? SA_CS1 : SA_CS0,
+                              i ? "collie.fl2" : "collie.fl1", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              FLASH_SECTOR_SIZE, 4, 0x00, 0x00, 0x00, 0x00, 0);
+    }
 
     sysbus_create_simple("scoop", 0x40800000, NULL);
 
-- 
2.34.1


