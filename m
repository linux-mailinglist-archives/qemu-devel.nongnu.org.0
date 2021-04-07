Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232563573AA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:55:07 +0200 (CEST)
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCOQ-0001lL-4K
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUCMg-00009C-2n
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:53:18 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUCMc-0004xz-Dt
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:53:17 -0400
Received: by mail-ed1-x534.google.com with SMTP id f8so17905585edd.11
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 10:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xckbXOAUz4gEWTqUWQhhtwYLH97HX8wVamKgf16jiqI=;
 b=ggZyGL6UYGt9XCFFhigw2XFxzz54RtGMesmQTO7s3QrzQizfM/+yleec64u3RMN7vA
 UQEvh+364DsdDsMcvIGpwtRX7g4cSH0j9Qi/22i3QUpLJZvC1xLMFt0OEuGWp6kVzSZJ
 VTBhARUPOQ5E63pYqO4YmusdTskEk9MQF775FVSr5vddFd4gtSwx38mLKoE6uIpULIh4
 ODnKLsbqqfULv/TueRV7bGPROqioZH66oj51nm5/OxumrHvhByRF5DcqgNqkw6+Kd3JR
 ZjOW5ZvN0sQKmv75FM4zK5gf2tgv3vFbc6Sg3GBAGaFfC+3E86iaRLoEhDYNM5e6ML/A
 x0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xckbXOAUz4gEWTqUWQhhtwYLH97HX8wVamKgf16jiqI=;
 b=kVNIvVfYIEGeIqxgns55a710IF5GLnUBvu52/hrXyDPqv1vaOcIv4rrnf4FVBXOsXM
 25gVQ4MYVv5dtYmeEXwBg1zXLF+bPilXl5B3WSQRttNOtEjByUUFnoPQVNETmwEMlFs2
 5rjxa5iVI/c1js6A+QdQneS3vqJpdaQWraxx7FaKzAUF6IHzrHqOL1QzwYKCoXu52+0w
 SLo+30VUhx2f/6sFC1jNAugY9aOLON5i1SgLj4Gqe6rkNPMcT83RntVBM72BGaesqMhc
 y0UVdj2x7Ww0opVAQNDH521kT/dA9rO+gitDpa3Bgb/nSc2ntwaarCL9weTXd2dQySUy
 w+Vw==
X-Gm-Message-State: AOAM533Ly8bDuke/b2yvqv0m3OQZF+tZL8Ajo/miAZ5twMwTUWe52YD9
 //slhD4Uog+PBzN0Q2a16Yc1xvY+awua4w==
X-Google-Smtp-Source: ABdhPJz3QPeCXZovw/QFaH+4jnkmKVnUXw1rxjewj5gYcIk1vgsWzVxz1ywLfboNEAZzuKgXwcN3+g==
X-Received: by 2002:a05:6402:42d1:: with SMTP id
 i17mr5717278edc.131.1617817992555; 
 Wed, 07 Apr 2021 10:53:12 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r17sm16492760edx.1.2021.04.07.10.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 10:53:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 1/3] hw/sparc/sun4m: Introduce TYPE_SUN4M_MACHINE and
 Sun4mMachineClass
Date: Wed,  7 Apr 2021 19:53:03 +0200
Message-Id: <20210407175305.1771069-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407175305.1771069-1-f4bug@amsat.org>
References: <20210407175305.1771069-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

All sun4m machines use a const sun4m_hwdef structure entry.
We want to have the common machine code to access this const
entry. The QOM way is to have it in the MachineClass.

Introduce the Sun4mMachineClass which expands MachineClass.
All sun4m machines inherit the TYPE_SUN4M_MACHINE.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 1a00816d9a8..543a52a8fc8 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -107,6 +107,16 @@ struct sun4m_hwdef {
     uint8_t nvram_machine_id;
 };
 
+struct Sun4mMachineClass {
+    /*< private >*/
+    MachineClass parent_obj;
+    /*< public >*/
+};
+typedef struct Sun4mMachineClass Sun4mMachineClass;
+
+#define TYPE_SUN4M_MACHINE MACHINE_TYPE_NAME("sun4m-common")
+DECLARE_CLASS_CHECKERS(Sun4mMachineClass, SUN4M_MACHINE, TYPE_SUN4M_MACHINE)
+
 const char *fw_cfg_arch_key_name(uint16_t key)
 {
     static const struct {
@@ -1433,7 +1443,7 @@ static void ss5_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss5_type = {
     .name = MACHINE_TYPE_NAME("SS-5"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss5_class_init,
 };
 
@@ -1453,7 +1463,7 @@ static void ss10_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss10_type = {
     .name = MACHINE_TYPE_NAME("SS-10"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss10_class_init,
 };
 
@@ -1473,7 +1483,7 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss600mp_type = {
     .name = MACHINE_TYPE_NAME("SS-600MP"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss600mp_class_init,
 };
 
@@ -1493,7 +1503,7 @@ static void ss20_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss20_type = {
     .name = MACHINE_TYPE_NAME("SS-20"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss20_class_init,
 };
 
@@ -1512,7 +1522,7 @@ static void voyager_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo voyager_type = {
     .name = MACHINE_TYPE_NAME("Voyager"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = voyager_class_init,
 };
 
@@ -1531,7 +1541,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss_lx_type = {
     .name = MACHINE_TYPE_NAME("LX"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss_lx_class_init,
 };
 
@@ -1550,7 +1560,7 @@ static void ss4_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss4_type = {
     .name = MACHINE_TYPE_NAME("SS-4"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss4_class_init,
 };
 
@@ -1569,7 +1579,7 @@ static void scls_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo scls_type = {
     .name = MACHINE_TYPE_NAME("SPARCClassic"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = scls_class_init,
 };
 
@@ -1588,12 +1598,21 @@ static void sbook_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo sbook_type = {
     .name = MACHINE_TYPE_NAME("SPARCbook"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = sbook_class_init,
 };
 
+static const TypeInfo sun4m_typeinfo = {
+    .name = TYPE_SUN4M_MACHINE,
+    .parent = TYPE_MACHINE,
+    .class_size     = sizeof(Sun4mMachineClass),
+    .abstract       = true,
+};
+
 static void sun4m_register_types(void)
 {
+    type_register_static(&sun4m_typeinfo);
+
     type_register_static(&idreg_info);
     type_register_static(&afx_info);
     type_register_static(&prom_info);
-- 
2.26.3


