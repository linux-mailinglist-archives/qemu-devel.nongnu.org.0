Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B163449E93
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:08:00 +0100 (CET)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkCo2-0006Hu-N5
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:07:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3l52JYQcKCgw7qz563qs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--venture.bounces.google.com>)
 id 1mkCmM-0005DU-Ch
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 17:06:14 -0500
Received: from [2607:f8b0:4864:20::a49] (port=52917
 helo=mail-vk1-xa49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3l52JYQcKCgw7qz563qs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--venture.bounces.google.com>)
 id 1mkCmJ-0001yT-UF
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 17:06:13 -0500
Received: by mail-vk1-xa49.google.com with SMTP id
 k19-20020a05612212f300b002f9b9e6a997so1696004vkp.19
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 14:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=lS+5dY0vABAf9ytyvQaMm0iXm118bFgbByQxEckQLe4=;
 b=gp5JySE5hvHPY0HoWcTAKvRwIz0T9/0X311bCjZaw1uQUsV9bKoM7Ess+stJaU647J
 8MHspm0NAxr/U8Zth8OONWgYHUi6TpTYsIi9FQVDfwz3wmc574LITwQ37hocADw0/Wng
 MEV0uBKk7bEIRrAr6811alhWnZ3jDPCV2J9VaPcE5RyhF8uxdtirILRZ10wJZ/elQjnr
 FYphHLvUU03vGLPuFO1hBpiXrSaMo5GmF1CR7tLrOau3v+0lCWNkMraZ0TuHmMreR77+
 NGQHTiDwxj1QZCi+QoGycm5PrzT7mdJ8/upLpIx7ijY1hjdQz6uksI+vzceoSng4+j67
 jDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=lS+5dY0vABAf9ytyvQaMm0iXm118bFgbByQxEckQLe4=;
 b=7No7036d5zuHOpYWduBvmEVA7HfrwGDs6ggXUBT/wpG1lw9CF4+8TKU6qOVMa3RYux
 sp8iDzurXXMdZxvjJ6HoTN+ezIyVnbvM1oyD16ymHCph9+/pxoXMpjHWb+cpH1DnDvtQ
 O1qcRptYNj/48EaTEg9CaXkqR1pKi7MZZkXS2FozRjmaJcoXuf/UCD5Xntk3/Pszh3jD
 Edmm4HpNS/tAsjJG+4Z/AU9CctYwNHmhcWovYYzGY9vhWeSPBEbXvr6b+M4ayumXj8XP
 1LY1Uq5qlsf6Wj3h2M2nAEYh96NA0ksnlRqMctf4CM6FDomeY8WWOxsL6lyTKnLPfyh1
 QRLQ==
X-Gm-Message-State: AOAM53122DELsDz/jzWwy3p2mPzDFEeikV7xdOGWKkW7/OKKAS++sgtT
 CFzywfnOv6Xv54h0+82zqHaC+sDlQG0i
X-Google-Smtp-Source: ABdhPJzpbv558LjeS7In5qwCiIZM0WUdKGAp2iqQ93WoXPMBiHdx21kxBmowvIDzOXx6D4yCUD+CvyRfdX7W
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:68c1:eb69:1a8:1fba])
 (user=venture job=sendgmr) by 2002:a25:b809:: with SMTP id
 v9mr2634542ybj.56.1636408727113; Mon, 08 Nov 2021 13:58:47 -0800 (PST)
Date: Mon,  8 Nov 2021 13:58:31 -0800
Message-Id: <20211108215831.2162883-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH] hw/i2c: add pca9543 support to mux
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=3l52JYQcKCgw7qz563qs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--venture.bounces.google.com;
 helo=mail-vk1-xa49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Adds support for the 2 channel pca9543 i2c switch.

Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/i2c/i2c_mux_pca954x.c         | 12 ++++++++++++
 include/hw/i2c/i2c_mux_pca954x.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 847c59921c..36a5c8cb31 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -29,6 +29,7 @@
 
 #define PCA9548_CHANNEL_COUNT 8
 #define PCA9546_CHANNEL_COUNT 4
+#define PCA9543_CHANNEL_COUNT 2
 
 /*
  * struct Pca954xChannel - The i2c mux device will have N of these states
@@ -203,6 +204,12 @@ static void pca954x_channel_class_init(ObjectClass *klass, void *data)
     dc->desc = "Pca954x Channel";
 }
 
+static void pca9543_class_init(ObjectClass *klass, void *data)
+{
+    Pca954xClass *s = PCA954X_CLASS(klass);
+    s->nchans = PCA9543_CHANNEL_COUNT;
+}
+
 static void pca9546_class_init(ObjectClass *klass, void *data)
 {
     Pca954xClass *s = PCA954X_CLASS(klass);
@@ -268,6 +275,11 @@ static const TypeInfo pca954x_info[] = {
         .class_init    = pca954x_class_init,
         .abstract      = true,
     },
+    {
+        .name          = TYPE_PCA9543,
+        .parent        = TYPE_PCA954X,
+        .class_init    = pca9543_class_init,
+    },
     {
         .name          = TYPE_PCA9546,
         .parent        = TYPE_PCA954X,
diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
index 8aaf9bbc39..91e2ffd0a2 100644
--- a/include/hw/i2c/i2c_mux_pca954x.h
+++ b/include/hw/i2c/i2c_mux_pca954x.h
@@ -3,6 +3,7 @@
 
 #include "hw/i2c/i2c.h"
 
+#define TYPE_PCA9543 "pca9543"
 #define TYPE_PCA9546 "pca9546"
 #define TYPE_PCA9548 "pca9548"
 
-- 
2.34.0.rc0.344.g81b53c2807-goog


