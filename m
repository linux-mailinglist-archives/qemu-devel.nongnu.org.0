Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB959361E23
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 12:41:53 +0200 (CEST)
Received: from localhost ([::1]:41732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXLv5-0002zj-NJ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 06:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXLtY-0002E0-Og
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 06:40:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXLtW-0004Uh-O6
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 06:40:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id u20so9496257wmj.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 03:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e28W/IGA/Y8IVqH2SaQEZoIYXu2fwPxJICFBKtCl8wM=;
 b=Xgelfsyq0l+ME78+ANIsj6Tw1EbOIQ7oAnGefQxGrvlEJQ+dQA9pfT7TU6nT58VxfD
 7FWTRnVW9ppvoFZXeOa8TZsZE2uPYiAEnRb1iRHWWtXmI2j3LwyQeR0bf4z3iuUUtx7E
 EWzca3ZGuRiyO2GPXcrGVwu4xmPLFF03z++13aoZkOj8fW6kiqMytA4ZVFqumlqCJfoN
 XxWpmvilpdihVFFNTWL8v9KgYtYwyw0KLiZNPrb2PSKR79PF2N76HnVYhi84eE8uItF5
 S64wmlwkg4uYwL6hEy2KEx7Oqep27co29iOkUXYIfmNnWdR666udeubEC6rPlQSgChtu
 gKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e28W/IGA/Y8IVqH2SaQEZoIYXu2fwPxJICFBKtCl8wM=;
 b=FtNZN8JY/1zoC3uy3UU0XBghBZhp6dOt2rm0OugyKC3FpWiqnrQiCw3Rs/4rdN0ElH
 6FLw/pShtZhgCIktGJJ4P5XnAp1PM14L3s/sk0yf9WmB5O+Nf7/sSLYq4zATzwdzDpE3
 OwwysJahl0iOgB+KvL5sve2SvAClpmQGbF1fKJ6qYolPnogtMqJkZz2x62AiY3unthPZ
 Bmg7ifdVUnBeKaqVOdhsUb5I+XHpWKx3945o3FbP4/Fph71F+XTbr0e2x3lBiI3InzLG
 z8k1mCrk50kO+CVr/BfKsccXAu0a10wBmuDnF6nLE6xLIMLBI1ZrexuQF7CPIsm/fkNK
 ANew==
X-Gm-Message-State: AOAM533xEyUibPA8Gpd/lw52KyJ9UUAjaaDjS0nqwCiCalAMYzPvLqFg
 TvqdS5b59hPzeZdvdAws1GDwqA==
X-Google-Smtp-Source: ABdhPJzWvSm1gM0uKG+OTK18ha2CepKh/CmmcnUsI591BcJA10n4IoGjRSOsijMNkkIqgISU1mS/rw==
X-Received: by 2002:a1c:1bd0:: with SMTP id b199mr7330048wmb.127.1618569612631; 
 Fri, 16 Apr 2021 03:40:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k11sm6033876wrx.88.2021.04.16.03.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 03:40:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0?] hw/arm/armsse: Make SSE-300 use Cortex-M55
Date: Fri, 16 Apr 2021 11:40:10 +0100
Message-Id: <20210416104010.13228-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SSE-300 has a Cortex-M55 (which was the whole reason for us
modelling it), but we forgot to actually update the code to let it
have a different CPU type from the IoTKit and SSE-200.  Add CPU type
as a field for ARMSSEInfo instead of hardcoding it to always use a
Cortex-M33.

Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a rather embarrassing bug. None of the test code I ran
on the a547 model actually cared about the CPU specifically being
an M55... Another one for the "maybe in rc4" bucket.

 hw/arm/armsse.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 170dea8632d..2e5d0679e7b 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -56,6 +56,7 @@ typedef struct ARMSSEDeviceInfo {
 
 struct ARMSSEInfo {
     const char *name;
+    const char *cpu_type;
     uint32_t sse_version;
     int sram_banks;
     int num_cpus;
@@ -501,6 +502,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
         .sse_version = ARMSSE_IOTKIT,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 1,
         .num_cpus = 1,
         .sys_version = 0x41743,
@@ -519,6 +521,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_SSE200,
         .sse_version = ARMSSE_SSE200,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 4,
         .num_cpus = 2,
         .sys_version = 0x22041743,
@@ -537,6 +540,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_SSE300,
         .sse_version = ARMSSE_SSE300,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m55"),
         .sram_banks = 2,
         .num_cpus = 1,
         .sys_version = 0x7e00043b,
@@ -719,8 +723,7 @@ static void armsse_init(Object *obj)
         name = g_strdup_printf("armv7m%d", i);
         object_initialize_child(OBJECT(&s->cluster[i]), name, &s->armv7m[i],
                                 TYPE_ARMV7M);
-        qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type",
-                             ARM_CPU_TYPE_NAME("cortex-m33"));
+        qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type", info->cpu_type);
         g_free(name);
         name = g_strdup_printf("arm-sse-cpu-container%d", i);
         memory_region_init(&s->cpu_container[i], obj, name, UINT64_MAX);
-- 
2.20.1


