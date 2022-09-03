Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E25AC12C
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:39:04 +0200 (CEST)
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUYyt-0005eM-Fj
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYur-00070b-Jn; Sat, 03 Sep 2022 15:34:54 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:37680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYup-0005OK-NK; Sat, 03 Sep 2022 15:34:53 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11e7e0a63e2so12914094fac.4; 
 Sat, 03 Sep 2022 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TbC7OXNGaPRLfVBMKv3PiK63ZCziWYgCmU/Wi2I5iMc=;
 b=SssYj4Stb9zyWjchxCdQ2uxcwP6XSD/Atfci9SItIAio4yv9po2GrB02lczsWyHGyO
 dTqP6kJqZyH7g1mO2StDaLCkUJbnCTD43xeGIcBXpTahlapbi9TgZmVVnLXZxavNU+by
 mt8b9HGz8939EYXgVstubjtU9JzglWQNb/EcsiffW2Z1aVta1BRoyeBIF7JCwTsEY7/E
 qP5uOmVnIBD5TDs4chVGVu842cb4urxKXi+kPXawjmxVrMDxHjVHKAZCNPwXFMbo45Hx
 JD1L7thxR0h887rEqmPuUdtHtzq4XTGZypHCE01UDCmaJqKXsfZhBijQm9mk7btKANOt
 0HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TbC7OXNGaPRLfVBMKv3PiK63ZCziWYgCmU/Wi2I5iMc=;
 b=S/cAD7O4Q6epdOu7d1p54KetkNc1Mjt0YgU6jX39DiJq3qUsxuveQnV16mNP6+6Ffz
 W+IN12L5qb+IXJR3PxZJvuUTob8IdmexerjNczJ0Iye5+RY4ycb4g/e2C4zkq60KXU/i
 ioRMbrk+hJSvaWFy+p6ZAzpoxyR3zk7hfVNFfMQSP79VwPVaKCgOLa6gHunGurtEPiCk
 5SJ1+rbg5N6LmK4qF6kkzbuTIH/6SDupHwGMGLqkOEacPJ78NY2Tu9F/j4EHXA1ysptA
 uIigu0ahmnvXhayObiKNTbJoaVgrQx/12pbWAxPpWYSvHSAZsDBRhTqyolD/uFjvETmj
 6rkg==
X-Gm-Message-State: ACgBeo0Y3fWU/7GC+eG73HxU4u7gJIiBGJIzR+K5TyxHjQ5qUH7A5rjy
 UwXFGIs5QZSOIgQC35GQwHKX0sT0XvxgkQ==
X-Google-Smtp-Source: AA6agR7/fW3MoWmliQ2/5FFD4iCXfU8z2WQJrxno9oFejPELInroSSIw9FM282a508o8TpCLVK8nRQ==
X-Received: by 2002:a05:6808:17a3:b0:343:300a:6a96 with SMTP id
 bg35-20020a05680817a300b00343300a6a96mr4251068oib.169.1662233689260; 
 Sat, 03 Sep 2022 12:34:49 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 08/14] hw/ppc: set machine->fdt in pegasos2_machine_reset()
Date: Sat,  3 Sep 2022 16:34:14 -0300
Message-Id: <20220903193420.115986-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

We'll introduce a QMP/HMP command that requires machine->fdt to be set
properly.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..d7ea139ff4 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -331,6 +331,13 @@ static void pegasos2_machine_reset(MachineState *machine)
 
     vof_build_dt(fdt, pm->vof);
     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
+
+    /*
+     * Set the common machine->fdt pointer to enable support
+     * for 'dumpdtb' QMP/HMP command.
+     */
+    machine->fdt = fdt;
+
     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
 }
 
-- 
2.37.2


