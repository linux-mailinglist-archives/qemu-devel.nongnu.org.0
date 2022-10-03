Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F77D5F379D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:22:49 +0200 (CEST)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofStk-0006vL-Eb
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7i-00022c-5L; Mon, 03 Oct 2022 16:33:16 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7g-00043D-CE; Mon, 03 Oct 2022 16:33:09 -0400
Received: by mail-ed1-x52e.google.com with SMTP id m3so16169014eda.12;
 Mon, 03 Oct 2022 13:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9BDo6mh0Ypv59IKCedv241IuVxVABk1e1ITR9NU9/Gg=;
 b=QAxP5li/P0y1lWm3xFOJQDC+N/kvQ9D65feHXgfpiRsXNjqgLm8zPbEx7xo4Ecmnke
 WtOsIsrcUpV/R6L1Op6WOCtne0BjL45VuAbLEGbrTH7sOYdFwb8JcwwKoFVrDZicbBVr
 /vWCVsSeP6e90xfi5uBkNatsRmTNX4YasBbvRt5s1wuos4xVYWfq17yxVlSwngj7qsAx
 vc/eUWYg9B2tQyXxYn12uTjTUWlgNGWHy5+z87StxbgRMTeYutkOR7t0MBiXKsrTYa6a
 pyGATMx8Sla9awg/HYfnVzq8Lu+u/ztjLRBNy7KNOjvNm10+FrE22fdsodFVaVoj5hZr
 lTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9BDo6mh0Ypv59IKCedv241IuVxVABk1e1ITR9NU9/Gg=;
 b=ccfy9AfoBMYWW1Ztwce3Uf61CKtva9OB/k1bau4sUBzEEYNTM3xXF+LdEeONgLqDtT
 Cmc4JfGFPd1q6MR8gZzQ1rJWIM053pXziU83ypnucr0qNr/XkN/KjUtdK1Hc758rUiXf
 NyG+BzRaTn85lUmEJK1Tb9EAP2fZVahI3e25pTmmCfLWRsnqotejJsOMv4uOJF9wtGhd
 t/6/+aLjr9zUkPhdB52r702LFAjpZC4IUX8ZtAJmQf6DLvesPyKv26C31n0H8SH8ziMn
 0bpKLmAp/EhS01hMz8H9QFPFFf6xZrTRoe+O68yF2ty9kZ6ViO2j9WrCyX6ydODtZedn
 he5A==
X-Gm-Message-State: ACrzQf3KwiSlvHnKnlhupf5jscP6zR3TVjRBlzZOFNC1Pyl+PNg5szG8
 Jb9dpT8ONYju9CtZb2/GEeTOEum2K40=
X-Google-Smtp-Source: AMsMyM70/TAgzTYPkt1R6QpAA1dr4akkNd5xeUX4qNhM8sTViVUsHvGF/1jd4ezqVwnnYjLbNxSxdw==
X-Received: by 2002:a05:6402:5189:b0:451:791e:f328 with SMTP id
 q9-20020a056402518900b00451791ef328mr20107794edd.282.1664829185965; 
 Mon, 03 Oct 2022 13:33:05 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:05 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 05/13] hw/ppc/mpc8544ds: Rename wrongly named method
Date: Mon,  3 Oct 2022 22:31:34 +0200
Message-Id: <20221003203142.24355-6-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/mpc8544ds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 81177505f0..8e674ad195 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -36,7 +36,7 @@ static void mpc8544ds_init(MachineState *machine)
     ppce500_init(machine);
 }
 
-static void e500plat_machine_class_init(ObjectClass *oc, void *data)
+static void mpc8544ds_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     PPCE500MachineClass *pmc = PPCE500_MACHINE_CLASS(oc);
@@ -63,7 +63,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
 static const TypeInfo mpc8544ds_info = {
     .name          = TYPE_MPC8544DS_MACHINE,
     .parent        = TYPE_PPCE500_MACHINE,
-    .class_init    = e500plat_machine_class_init,
+    .class_init    = mpc8544ds_machine_class_init,
 };
 
 static void mpc8544ds_register_types(void)
-- 
2.37.3


