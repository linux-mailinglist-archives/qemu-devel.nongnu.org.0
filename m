Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BC64BACF2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 23:56:42 +0100 (CET)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKphZ-0007Sx-GX
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 17:56:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpf4-0005KN-2w
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:54:06 -0500
Received: from [2a00:1450:4864:20::629] (port=46701
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpf1-0003x9-SS
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:54:05 -0500
Received: by mail-ej1-x629.google.com with SMTP id qx21so10614375ejb.13;
 Thu, 17 Feb 2022 14:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fRlSqQPzztWpXDOsBI/n8vm223cY5mt64tT7JGeMEVY=;
 b=WALMoUBa3GnbcoiVWR6ZatTUDmxBdfLzOUeSF5pAl3HzaVayj3BmRZ6cfchm4GTDIg
 uwZSPeG9f/5eSitBi5SBiqkBrsGiWG0CVz4ZOALChX3fY7u7M+QIfkL2EjYGtyf+QFu9
 vQ8FoOBxDie3xXrjU2CdMjSASzk4SRUtkCFt+3vekn/AMnspv1d0xRWSi9t6W8K43ZIp
 fhEAY5t2dp6qYGxuANLSaObbG99hqptSxh/pcKYvsrT4ELHiUg9vSB/cyonE4uGudXYz
 mt5OL6c1VFvapjZiom2fUNrJa+/iViEoQJ+Xv0sFa74AHnj+bBJ3xxDEgHmylx3rCUMC
 lxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fRlSqQPzztWpXDOsBI/n8vm223cY5mt64tT7JGeMEVY=;
 b=fzwhAg18cKixMPOHDWJ1AxdpA1JWw3ks9YW0n+jZIVg5tazh6ANRXJDY9CLKXKl84u
 uClZASfx0fq9wOzu/RWfBBVnWKTMHK+mOgcQLzQ6JcmdHtSFAnkgwhaEmct9ZoW2NAc9
 0FD1tyR57g4mMPIkS0+s7ahlZFC60TExC6CpUp0Hc6nO1Ovmr84J+vukZKzEFxV9Ym3O
 C6iWtoPDyhu/F5G4q3NPIKAuQE5Aj/j0aOrYq+ZtoeQzpIhvI5Qy630d3T39o7z5N2Mu
 A802S46Ak88PiVB9u1SIGIiskvfUW9YkLzAhcKfwvHkR3Tt5h4D8brwxjXr2tWJzsCjw
 GV1w==
X-Gm-Message-State: AOAM533s5CKTtfkuObrSkyOsyZFNPTWjhZ/zHRq1QmoMVL1ePpnlTR7A
 ZwrhLRgxGlFTFAnyj8aFU9Hx1nQpkOLQIg==
X-Google-Smtp-Source: ABdhPJxxQ/4h522NJRoTK1rfkAlGURA55n5+lJkFU1N6XIlBcI/cq1XSOodxfuPN8ryHvmyw3qNX4g==
X-Received: by 2002:a17:906:53c7:b0:6ce:6f32:ce53 with SMTP id
 p7-20020a17090653c700b006ce6f32ce53mr4156328ejo.352.1645138442275; 
 Thu, 17 Feb 2022 14:54:02 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id mb23sm1598871ejb.62.2022.02.17.14.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 14:54:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/riscv/sifive_u: Resolve redundant property accessors
Date: Thu, 17 Feb 2022 23:53:51 +0100
Message-Id: <20220217225351.140095-4-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217225351.140095-1-shentey@gmail.com>
References: <20220217225351.140095-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Bernhard Beschow <shentey@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QOM API already provides accessors for uint32 values, so reuse them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/riscv/sifive_u.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7fbc7dea42..747eb4ee89 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -713,36 +713,20 @@ static void sifive_u_machine_set_start_in_flash(Object *obj, bool value, Error *
     s->start_in_flash = value;
 }
 
-static void sifive_u_machine_get_uint32_prop(Object *obj, Visitor *v,
-                                             const char *name, void *opaque,
-                                             Error **errp)
-{
-    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
-}
-
-static void sifive_u_machine_set_uint32_prop(Object *obj, Visitor *v,
-                                             const char *name, void *opaque,
-                                             Error **errp)
-{
-    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
-}
-
 static void sifive_u_machine_instance_init(Object *obj)
 {
     SiFiveUState *s = RISCV_U_MACHINE(obj);
 
     s->start_in_flash = false;
     s->msel = 0;
-    object_property_add(obj, "msel", "uint32",
-                        sifive_u_machine_get_uint32_prop,
-                        sifive_u_machine_set_uint32_prop, NULL, &s->msel);
+    object_property_add_uint32_ptr(obj, "msel", &s->msel,
+                                   OBJ_PROP_FLAG_READWRITE);
     object_property_set_description(obj, "msel",
                                     "Mode Select (MSEL[3:0]) pin state");
 
     s->serial = OTP_SERIAL;
-    object_property_add(obj, "serial", "uint32",
-                        sifive_u_machine_get_uint32_prop,
-                        sifive_u_machine_set_uint32_prop, NULL, &s->serial);
+    object_property_add_uint32_ptr(obj, "serial", &s->serial,
+                                   OBJ_PROP_FLAG_READWRITE);
     object_property_set_description(obj, "serial", "Board serial number");
 }
 
-- 
2.35.1


