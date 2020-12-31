Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C912E8289
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:53:46 +0100 (CET)
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6pF-0005xJ-6D
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lO-0001Pr-Ov
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:46 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lN-0006Q8-Ax
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:46 -0500
Received: by mail-wm1-x335.google.com with SMTP id a6so8153726wmc.2
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R2ny6HpRTTZsoN85CWHTkLlGTVWjBfb4+zResZwGkow=;
 b=NnjWKvwdz9HVKZBGLasiQOK/IfGhrqwfdjK/Tes09YRSX7klKa9SZ9F1C+KxN45SZD
 eklitOLa0xnRHqflhXoNjMkB2Zq1/fmhQ1azodt3t0q/Km48DZbZxINX+EeOx9v7yOIF
 nt0nyeb0hwkjMtDp+ThUtx1eOfLs7XNkAU1ePQoT5BvfR7CaEWCjcVl2Jmeb8NlMUNDp
 JPQp2rARm9WuxQ1loQSOf8Ko7Wd+j1UWF7u7dKg3auPALyRpmy5HkAuKlmnih/gRTlGw
 Tcq5O4bvc+RTysowX494aEJVv6JXmefLhxcJP5gPpS3XOiOGIgdmzl4t26mRDneh/mEn
 XfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R2ny6HpRTTZsoN85CWHTkLlGTVWjBfb4+zResZwGkow=;
 b=Um/iglxf2+UXxk3wlUBQd3BMTahuO56KkaPzgoBvbk16k0KwQ3mq+72TxeBBbX34nI
 xJKf1oCnvl7GUwTgSZPM4MkTgMAsH6r0dzJnMJkDh6lUXtKmLhp9L3jAUZBLn5RdhgKL
 BgA8Vw0v+4H+6Bju7iqqwLPJ5K9nm4QCujriTAQIXuhO3bDmoRzEBGuX/q7gEZ5FutkP
 yFkKOlOZgjsBKWWjunS8DoKXXUwG9QbeWCtXH5vjt2cqvE4kxMGQ9XZX+NPW8eb9AfOz
 Qj8nN+PCK4FngCfGDENWaNo4PCG5gWu99iJcJiIaXZpF+4YSpBzvE+A8PkmK1AumF0Ss
 wO7w==
X-Gm-Message-State: AOAM53364rjMU8SukVM+dWhqwO6Al5R0C/9epzVOIJBPRjPauU3J4GBW
 k8WjgkQoNaM6eaOX+g6ldKjbNLx4BKo=
X-Google-Smtp-Source: ABdhPJxv0B4TkMYvH4x+gzvwkOK2ksL5+Nb+1/B9VD6yiRyUkJ0ICD5DHlC7I7BaKdmFI+qGE7etAA==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr13370772wmr.162.1609454983822; 
 Thu, 31 Dec 2020 14:49:43 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id m11sm13850842wmi.16.2020.12.31.14.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/18] hw/pci-host/bonito: Do not allow big-endian targets
Date: Thu, 31 Dec 2020 23:48:59 +0100
Message-Id: <20201231224911.1467352-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This model is not complete for big-endian targets,
do not allow its use.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Yes I must improve that, I know =) However enough for now
to post the following patches.
---
 hw/pci-host/bonito.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 104c58331d0..93820f69e49 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -53,6 +53,7 @@
 #include "hw/misc/unimp.h"
 #include "hw/registerfields.h"
 #include "qom/object.h"
+#include "hw/core/cpu.h"
 
 /* #define DEBUG_BONITO */
 
@@ -354,7 +355,7 @@ static uint64_t bonito_pciconf_readl(void *opaque, hwaddr addr,
 static const MemoryRegionOps bonito_pciconf_ops = {
     .read = bonito_pciconf_readl,
     .write = bonito_pciconf_writel,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -648,6 +649,8 @@ static void bonito_realize(PCIDevice *dev, Error **errp)
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(s->pcihost);
     MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
 
+    assert(!target_words_bigendian()); /* FIXME not supported */
+
     /*
      * Bonito North Bridge, built on FPGA,
      * VENDOR_ID/DEVICE_ID are "undefined"
-- 
2.26.2


