Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80D68AF40
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObuA-0001SZ-I9; Sun, 05 Feb 2023 05:05:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtm-00016n-62; Sun, 05 Feb 2023 05:05:34 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtk-00057T-K9; Sun, 05 Feb 2023 05:05:25 -0500
Received: by mail-oi1-x236.google.com with SMTP id t5so87463oiw.1;
 Sun, 05 Feb 2023 02:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZn7pB0RqnoyOz/E+AIEjOi8jAKEYAUvIieETqATAJU=;
 b=e2dzG9GzecEjuaIO3chmFukBUSB6sVxEPB5YwXSDffEvT2449JUnwuWSwFzzURFc2L
 LXguCmHZ7Ff7JyjE9+66ZoY08i6GrpEUeyRXcbIYHFVNe34z16+iXgFkTfrM27gPQhBl
 EsJSBnDv0yKXl8X9uKyE1B8tBzmqYmJfDI0PVioOneaffngTMJo2ErukBWej7iQ9QDsa
 mO/LLhSBsGZQTcagD843YKYaRy8SgJZOc9QGc8t6hFMx7rt5cVlTjiuwax9OF8jz6ZTk
 aR62Ol0RN0Oq+BaHck1vdUFz5cyZUKAzSokn+JzCjOoSWCBuHjIvy6S0C2eioiHKnFDq
 LBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xZn7pB0RqnoyOz/E+AIEjOi8jAKEYAUvIieETqATAJU=;
 b=Bkrm1koMHbxESAbJ7P0Qaoctme2lNmsza5zU2GkzPwzkLVHGEysf36pFJ/VYv2M5sl
 nZ0mcM6e4ztoBYMYxkNmb++61wvjTqiFyW+bdI9VeJO/OicGwAd/FtCwAyuPe4h/a8Ev
 rpp+DEd4hNFXZaqZwlGN0GrehSIL0VWTmsHNrGBNh6J47tWp4Z+h94hI6dC+DPYpIE59
 Lz2caMY+o2e43dA3BhOrjr/l6c8GI5jrDuM2H90Wkj69OC8OOPgWeez8Dw98MDJbZ/hB
 YqBFW2topnzUAOywIWLv3JEDhHqnOXF/3d9HCK35B+wvyZ1uN+xMepWYwl3Za+y1t9iR
 ehRw==
X-Gm-Message-State: AO0yUKU0dytJk7ATKXyS/Fv+AlrH59ggDh/R1YEfc2NtU3GBdUEy2g0U
 f90lHN7GiKBgIxOgl6M7+w5cGmWgiN4=
X-Google-Smtp-Source: AK7set89NqzsEekf6XpGGvlVfGDA0Usl2tHP7DNxsZeTT4rKfgPdyqiZdvuVGDmnEgM75D/vx0GBfg==
X-Received: by 2002:a05:6808:19a4:b0:378:3c84:9db2 with SMTP id
 bj36-20020a05680819a400b003783c849db2mr9914829oib.13.1675591522402; 
 Sun, 05 Feb 2023 02:05:22 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:22 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 13/16] hw/ppc/pegasos2: Fix a typo in a comment
Date: Sun,  5 Feb 2023 07:04:46 -0300
Message-Id: <20230205100449.2352781-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230203194312.33834745712@zero.eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 1a13632ba6..a9563f4fb2 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -564,7 +564,7 @@ static void dt_isa(PCIBus *bus, PCIDevice *d, FDTInfo *fi)
     qemu_fdt_setprop_string(fi->fdt, fi->path, "device_type", "isa");
     qemu_fdt_setprop_string(fi->fdt, fi->path, "name", "isa");
 
-    /* addional devices */
+    /* additional devices */
     g_string_printf(name, "%s/lpt@i3bc", fi->path);
     qemu_fdt_add_subnode(fi->fdt, name->str);
     qemu_fdt_setprop_cell(fi->fdt, name->str, "clock-frequency", 0);
-- 
2.39.1


