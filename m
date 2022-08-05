Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1D158A911
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:55:15 +0200 (CEST)
Received: from localhost ([::1]:56412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJu2z-0000AV-OF
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoT-0007Xd-0T
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:14 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:40866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoQ-0001RO-7Z
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:12 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id c22so994270vko.7
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zAZciue/fdUeJhydaxYtGuFu9V0rUc6qeoCvbFp8oUM=;
 b=Bc9udDU8vN4dxHOatvQWor6G1dRkCWUTvf4chwOkZhpIKYnC59INs68LrirMeruAsF
 EuKKWb8AaOrtixO5k4F8pzz4HyfJjgoaw0po26XnuBo09FX0mCcj0khPjbuQxSu+Ewa/
 CIMPO0zMbAw17FRlgtoj+p8ueg0/3z0g38QZT8776vni4D9lRqDJOiRR5TS74BriJgH1
 jQ1X69hGRpX/ZHv84NNUjsXD+a3DlbMyXvleXc/OCPYedv98hYFKoiGpMhW/U5G0iQzA
 Wh7WQO5S77d9CbCftRb2/uVtPwbQUmBDL+sbIRAQV1jykRC47Oo7Y6x07A4wOGRXBtI6
 m9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zAZciue/fdUeJhydaxYtGuFu9V0rUc6qeoCvbFp8oUM=;
 b=auwB8wOBbK+0Gow29KBd8idx+l5K3Xl12XiszNXKgW9hEu+3PgzrfUGhTuQFEy2m+H
 0WZd0mH6wKp9BPtBYXXvaOjVScbIB9EycX4AQ/0D9gVvIJ0Syv1TedRZ2+/+g3iydXcu
 RGKjinZF6E2CO+clOvDWkX2PQaxkPuvfIUWe6sCsc9IMk1vpZ/9R8r8LE1R6RXFn7ro2
 aIA3tTbRt9CxK3KM36/jlKgt9xOM9pXrxE1zlx25R0x17HxndoNI66Kbo9/+w9gsz+G1
 UyyYoMhce0BRR25mSg0XTzNtrBAFFqFW1DBqHqP6NDtLFx1ij9J4do1121GWYT1c+26D
 v/vg==
X-Gm-Message-State: ACgBeo2ajtlpnI6EzLSKwaPIoJ2D7cgTpLVnWQpp+zONZRQc03oisiNu
 7Hu+yUvwmO/i6qiU/oJ/mi6K1RQKN2U=
X-Google-Smtp-Source: AA6agR7sOf/4SawpMYB0yoXu91S6uL3cVkSVhQ0o7fsfGmWrM+htYGUjIL/rSV/0f+iuT4DjeAfmCg==
X-Received: by 2002:a1f:b60f:0:b0:377:4f57:fb19 with SMTP id
 g15-20020a1fb60f000000b003774f57fb19mr2676886vkf.26.1659692406463; 
 Fri, 05 Aug 2022 02:40:06 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH for-7.2 v2 06/20] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
Date: Fri,  5 Aug 2022 06:39:34 -0300
Message-Id: <20220805093948.82561-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2d.google.com
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
the sam460ex machine.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/sam460ex.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 7e8da657c2..fa20a3ff49 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -138,6 +138,7 @@ static int sam460ex_load_device_tree(hwaddr addr,
                                      hwaddr initrd_size,
                                      const char *kernel_cmdline)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
     char *filename;
     int fdt_size;
@@ -209,7 +210,14 @@ static int sam460ex_load_device_tree(hwaddr addr,
                               EBC_FREQ);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' commands. Use fdt_pack() to
+     * shrink the blob size we're going to store.
+     */
+    fdt_pack(fdt);
+    machine->fdt = fdt;
 
     return fdt_size;
 }
-- 
2.36.1


