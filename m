Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA71651C546
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:43:28 +0200 (CEST)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeZb-0006NK-KO
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBP-00023H-Dm; Thu, 05 May 2022 12:18:27 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBN-0005jF-OG; Thu, 05 May 2022 12:18:27 -0400
Received: by mail-ed1-x534.google.com with SMTP id g20so5792667edw.6;
 Thu, 05 May 2022 09:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsMzqxxFgcsYDTbmG5oH5cAAX9q04Igy6hB+pLUCwIg=;
 b=jTz3dPVutTAIAOQp8siWGrXdqlikyh42Q3AU9pId8WGxycIC0WFIRZuqQVW9F5ejCP
 1NjGltRaySoCsKyH/NAx2IViW54M63Pl95v8Wu22Kgi5KEVBLw65TSJmqDF3Z26N+Cny
 VJ5C/jNSsT7k99X4LjpE1O73awM7G7OKn5rhPD94Y/j8zbzEWGs9N4YokF+esYhh/WaV
 nTEO9b9kMVicSS8UgPGkxoHvPd+dvE66cIGd68U5t+x6M478Zy4mdbYHMVxW7NS40oeJ
 7G+2obwAaannxsEWHKVKUbLlrSSxDDiG4UNf4FUZoJT+u6U3Xb3EgVquX8v/yTaiJ7FQ
 p70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsMzqxxFgcsYDTbmG5oH5cAAX9q04Igy6hB+pLUCwIg=;
 b=LfWssNv3w5csaEdv99dpVY6Y1GCDYSekmNppgZjBAWW0bmsdQLZZnnUccKkc7w1bUj
 CR77JCOjC87AfldZf5tP3qBuloXfakmOOmu7AmWW7pCXslj826ShHYx/xoOE4Y5Q9dQh
 j8PBMqnvtyJAC3xqyoZXQAiDSSGxdCnCcZdwgEXJK0IAF4abKEcrkKzitaUL9vxIPMJq
 1uwvSwWoRkvjtn2fQNC92fdCzo6HraimliiPKWeAt9Ur4+ZIT3xVUI+tqiQD7u6lAq6q
 k3VzQqs9uKlNByXijz/YD4TILgEy7xIxiHpQBp+l8mkEdVD8TZ+4IxG1+0o+ULt6rRvk
 oX/g==
X-Gm-Message-State: AOAM532Brl1UxTWlk5sggjzfCC5WEi8YgU4HxaALsaRxZqn/ONWNStoj
 CWxyMLVXWa3Z4A6FznPwelHDQpvqpy8=
X-Google-Smtp-Source: ABdhPJx0HLlzS39qLSKJSDNT/l1g96G3g+U6aVGATT8HnUyIIZPb1qYhR/whsSCrQRMauep5SmHNTA==
X-Received: by 2002:a50:fb83:0:b0:425:cb1f:dc57 with SMTP id
 e3-20020a50fb83000000b00425cb1fdc57mr30949021edq.150.1651767503662; 
 Thu, 05 May 2022 09:18:23 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:23 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 05/11] hw/i386/pc: Unexport functions used only internally
Date: Thu,  5 May 2022 18:17:59 +0200
Message-Id: <20220505161805.11116-6-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 hw/i386/pc.c         | 4 ++--
 include/hw/i386/pc.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2975d7de5..789fe9afdc 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -569,7 +569,7 @@ static const char * const fdc_container_path[] = {
  * Locate the FDC at IO address 0x3f0, in order to configure the CMOS registers
  * and ACPI objects.
  */
-ISADevice *pc_find_fdc0(void)
+static ISADevice *pc_find_fdc0(void)
 {
     int i;
     Object *container;
@@ -713,7 +713,7 @@ static const int ne2000_io[NE2000_NB_MAX] = { 0x300, 0x320, 0x340, 0x360,
                                               0x280, 0x380 };
 static const int ne2000_irq[NE2000_NB_MAX] = { 9, 10, 11, 3, 4, 5 };
 
-void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
+static void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
 {
     static int nb_ne2k = 0;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b34c664ff5..a087ea7598 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -168,7 +168,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                           ISADevice **rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs);
-void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd);
 void pc_cmos_init(PCMachineState *pcms,
                   BusState *ide0, BusState *ide1,
                   ISADevice *s);
@@ -179,8 +178,6 @@ typedef void (*cpu_set_smm_t)(int smm, void *arg);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
-ISADevice *pc_find_fdc0(void);
-
 /* port92.c */
 #define PORT92_A20_LINE "a20"
 
-- 
2.36.0


