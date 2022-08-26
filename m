Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07BC5A2943
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:21:32 +0200 (CEST)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaDD-0003p2-PA
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4G-0007oN-GZ; Fri, 26 Aug 2022 10:12:16 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:46768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4E-0003x2-Uc; Fri, 26 Aug 2022 10:12:16 -0400
Received: by mail-oi1-x230.google.com with SMTP id o184so2085385oif.13;
 Fri, 26 Aug 2022 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MnYaB9DJvwNH6aElOaN8rUTWZD25FX0c/ifXFFw+Ai4=;
 b=P1iTHxilagxISeKG9HP7MpOd8F5E/0ofxV34tuQvPrQRSp4DQG+KBjoawBrbo9eUm3
 eZiuwmKrD+OyRVsfvEVkstRhG1PoZk2lNIaVcQWnxdGArmUFVCSaeo12wJrewRZY4d+Z
 ETVeTekb3/0rjQlwVkqwkxrtA4SLFXEgmoyMOB3GVqR+4U9NcEAl0fGAJ78S9r6MqCmy
 7KIpGKLHDKtup0Frn5rN1k96YD8t0jZx9Jl2+eY1fqkDetKwjJpXB7+SYdevZ76YePdT
 OlKy0Zh5LfEKdGHC9O7r5Mzgj0OXsBxSq9MlK1+daqXIaW1RvDawlDgFRNHznVpSMeyG
 NQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MnYaB9DJvwNH6aElOaN8rUTWZD25FX0c/ifXFFw+Ai4=;
 b=VkRTR27e1Z0fxUZh9ibTBGyBodbnA+XMftbwDccYed/BM+lDhZg2tYmWtXqsKBUKfn
 x2pzAa5vlqKa7EnjX7hQIig1zI0YiV4eVwGQaAXT4rY5zgETdc/OKvXvDPZKsaWyBjjX
 u/m/DoZpE3gw5hn+C/R1rs5ZiXQGnluxOAbv4dxtJFb1dCrAaT2KAiW+KCiy62dT9E1u
 Uv53SJca1R0PMN0gh6rCxl8K+wnU1wIOGZYUnk27C+wFZz2nDImSScmm6LSccr0PCGtf
 89qP8EZTNXSu+QLKMco7ly9vWphN1g5G5hCU80gUy9LjX3QRW8CTOHHPhWyJQRx+7Xbt
 +fZQ==
X-Gm-Message-State: ACgBeo1IC5saAtJEgHbWsFzFzXeELdh9udu4K9XO0jDTZmwb6eYGX26J
 Xdv9SLufElRqQByjciMYf/ndpE+sCVM=
X-Google-Smtp-Source: AA6agR7sGWWa+ONKHtaJ9VUxAFkwxRv3IyO1GJv+yZKQjoX8g1vMZz8UDC9dT+pu7lCUZCPBITErWA==
X-Received: by 2002:a05:6808:1d9:b0:344:bb8d:588c with SMTP id
 x25-20020a05680801d900b00344bb8d588cmr1753175oic.87.1661523133145; 
 Fri, 26 Aug 2022 07:12:13 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH for-7.2 v4 06/21] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
Date: Fri, 26 Aug 2022 11:11:35 -0300
Message-Id: <20220826141150.7201-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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
 hw/ppc/sam460ex.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0357ee077f..413a425d37 100644
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
@@ -209,7 +210,12 @@ static int sam460ex_load_device_tree(hwaddr addr,
                               EBC_FREQ);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = fdt;
 
     return fdt_size;
 }
-- 
2.37.2


