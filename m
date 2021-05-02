Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB63370EB1
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 21:01:22 +0200 (CEST)
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHLF-0004aU-Ay
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 15:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHF0-0008Ce-BU
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:54:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHEw-0008CR-Ci
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:54:52 -0400
Received: by mail-wm1-x32f.google.com with SMTP id i128so76238wma.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXUfDRBGkEm7Eeg8Ae9VRIkdlxsH9cTC3rfTZ8DpocY=;
 b=Cv6odMyp4NRQSBd5/rf0deD6azayFPHQA18ycKAazlPJHchzLYKyCdN84xbGnAMc9Y
 HrlNApfiVwSZU29uExZ3IwpIaK/ziGgILHTl3xKDjeLNIZ8SbRQw8VChnvy9DMtLJVq5
 1T36CIVmUnqaYhPs+MSMiW2WVdss/4f/MoeBHxR0P9JF2dEbjh9UiTySjKu0cKPmzrGU
 0e0DgPRa0niNQfsAJ4qWqomHP5yLRJqqqVRVoNPhfdinX38n0nXcLUCsQxIr/KlJsxD5
 Ep9QDoYUhfVHvI2MxlFbnjOOS2aqNeupwyeCqqthe8vZ7ZTpPqgOUvW/8JTicAzolx1h
 rjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tXUfDRBGkEm7Eeg8Ae9VRIkdlxsH9cTC3rfTZ8DpocY=;
 b=pa3vK0dbkh089QIzqbGvZQLUfFxdQG57pTC3kBe25IyWMRJ0rtsDLxjhDJTf58UF31
 wBiCkAY2Yk8G3LKrkFmXRUCs9eyU0PWAYF55c/G1ogtdJ78z1G1v/t8MZ55VYL/C0xT4
 P4qYRszv6GMne9ubC7mOSjiEo3nKC9h/xHfbn1VgIp/D+J0UUj1q1adMH39WNaPV0CLc
 zekw8co4LOaIwmAQF7E3Q2SMmVPAXPHYAQO7sOOfQ0198u9qewD2gfMulnUAg693QOJH
 o9qNY1ypXq5DyrOR/F2WhPwXxxuVEfjmdCJHj/xv25OBm+RQTBa+cmRtDzfjTor8lLuW
 axqw==
X-Gm-Message-State: AOAM5314jcrPxiCx0PCxMSNmn+Q3EFh408gSuAmexYBQ4e0HRhJEXVUi
 VWrKfQPs4CIB17Nfuuwb29jmm4EJCtcNrtiG
X-Google-Smtp-Source: ABdhPJzzHeWsRNNzLmD7CBN9FIQvRcQkK5yVOr3DOitD9yqOoagnGNADlvvE/hWVXRCCAyczcHQe9Q==
X-Received: by 2002:a1c:35c6:: with SMTP id
 c189mr27692421wma.127.1619981688764; 
 Sun, 02 May 2021 11:54:48 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id t17sm8792487wmq.12.2021.05.02.11.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 11:54:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] hw/sparc/sun4m: Have sun4m machines inherit new
 TYPE_SUN4M_MACHINE
Date: Sun,  2 May 2021 20:54:36 +0200
Message-Id: <20210502185441.599980-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502185441.599980-1-f4bug@amsat.org>
References: <20210502185441.599980-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the TYPE_SUN4M_MACHINE and have all sun4m
machines inherit it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 1a00816d9a8..9d07fa43d6a 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -107,6 +107,8 @@ struct sun4m_hwdef {
     uint8_t nvram_machine_id;
 };
 
+#define TYPE_SUN4M_MACHINE MACHINE_TYPE_NAME("sun4m-common")
+
 const char *fw_cfg_arch_key_name(uint16_t key)
 {
     static const struct {
@@ -1433,7 +1435,7 @@ static void ss5_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss5_type = {
     .name = MACHINE_TYPE_NAME("SS-5"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss5_class_init,
 };
 
@@ -1453,7 +1455,7 @@ static void ss10_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss10_type = {
     .name = MACHINE_TYPE_NAME("SS-10"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss10_class_init,
 };
 
@@ -1473,7 +1475,7 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss600mp_type = {
     .name = MACHINE_TYPE_NAME("SS-600MP"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss600mp_class_init,
 };
 
@@ -1493,7 +1495,7 @@ static void ss20_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss20_type = {
     .name = MACHINE_TYPE_NAME("SS-20"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss20_class_init,
 };
 
@@ -1512,7 +1514,7 @@ static void voyager_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo voyager_type = {
     .name = MACHINE_TYPE_NAME("Voyager"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = voyager_class_init,
 };
 
@@ -1531,7 +1533,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss_lx_type = {
     .name = MACHINE_TYPE_NAME("LX"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss_lx_class_init,
 };
 
@@ -1550,7 +1552,7 @@ static void ss4_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss4_type = {
     .name = MACHINE_TYPE_NAME("SS-4"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss4_class_init,
 };
 
@@ -1569,7 +1571,7 @@ static void scls_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo scls_type = {
     .name = MACHINE_TYPE_NAME("SPARCClassic"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = scls_class_init,
 };
 
@@ -1588,10 +1590,20 @@ static void sbook_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo sbook_type = {
     .name = MACHINE_TYPE_NAME("SPARCbook"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = sbook_class_init,
 };
 
+static const TypeInfo sun4m_machine_types[] = {
+    {
+        .name           = TYPE_SUN4M_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .abstract       = true,
+    }
+};
+
+DEFINE_TYPES(sun4m_machine_types)
+
 static void sun4m_register_types(void)
 {
     type_register_static(&idreg_info);
-- 
2.26.3


