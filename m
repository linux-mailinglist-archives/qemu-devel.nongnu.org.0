Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B75AC13C
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:50:20 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZ9n-0003Ma-UN
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuo-0006wQ-2w; Sat, 03 Sep 2022 15:34:50 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:43915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuk-0005Nc-J1; Sat, 03 Sep 2022 15:34:48 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 92-20020a9d0be5000000b0063946111607so3698983oth.10; 
 Sat, 03 Sep 2022 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NdbrEiqC2XXclgTnOkab3L871EZ9bSK5AzsRTBYhN1c=;
 b=HTe25KdS8t+J8zETXXfxvXTLyuoVlH5w0pz0XFRzV2tpx1xAh1nsEiojqYl+fbCO39
 22K7JPk3xbZAVOx70xeFycPmUxoBcLq2wZX6qlRpkwvRnnB37K0xd3G5+KR4J0AYfahD
 LYHf5P+Cg9hk5BHh35yfmQc7Y/uxgSrybiuLSVh8NgU9kFLzKVm3VI0b/ofN+cuagEAm
 drJ+Poe1NJqN1/IfeiNFePn/hAGh4bI5IFvO443J7cgCHP7OUjPBArDd7ceLWGSu394C
 uAaOqqlHtvtwBoupLN8ZnfEcmuLRDKm27hNYDyjmFsN6W/4ZIdtNTtRKsqwxFP54+Q1m
 sD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NdbrEiqC2XXclgTnOkab3L871EZ9bSK5AzsRTBYhN1c=;
 b=bbF4Og6A7TzksmtbMha3HAjcgRpvfaugc04sNbMN001TQpSx0MaIbbsl8HMXYAocov
 H9dpvrzgBP9BRcIy0oPbKVPABp/ksjD2a/SlFXZ8TMYc5ujnuUapoWvsgXh2Q+R1PCfX
 iNM8d/FRpTRgRpaM3LGReWw0YcukhkcxxBNz741GrTxRe5IfhnZSrgOj0KlSXhK5hWTz
 BjN2h43nQfHkIunPsikf2FOVViwU5e7vuSlbGM/lWuMqCOtWQs9TJK3UPexBV95Aaq2i
 D10zAPvouMKbOj3d5DqB2LfIc50lGfk9ds/Xns6WPL09XEw890OMhWh9hhIWs99TooKL
 O3ug==
X-Gm-Message-State: ACgBeo2/U3oqE6h7SWPT+TAFZpJCy5D3/lWLMgp2NKijI8U+Ihx5C9/R
 zZVWiq6cvIZ702jXmrR6xwOewZfBMhMxgw==
X-Google-Smtp-Source: AA6agR53pZycEfHRjyc/21uXrbUbIKn0YVM8f2ny74OyvjXTvpQpqQ8dtlmyJKBSyK3KYC8cnZ7O/Q==
X-Received: by 2002:a9d:2dc2:0:b0:637:3176:cf00 with SMTP id
 g60-20020a9d2dc2000000b006373176cf00mr16083317otb.296.1662233683977; 
 Sat, 03 Sep 2022 12:34:43 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 06/14] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
Date: Sat,  3 Sep 2022 16:34:12 -0300
Message-Id: <20220903193420.115986-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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

This will enable support for 'dumpdtb' QMP/HMP command for the sam460ex
machine.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/sam460ex.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 850bb3b817..fa6f125fda 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -137,6 +137,7 @@ static int sam460ex_load_device_tree(hwaddr addr,
                                      hwaddr initrd_size,
                                      const char *kernel_cmdline)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
     char *filename;
     int fdt_size;
@@ -208,7 +209,9 @@ static int sam460ex_load_device_tree(hwaddr addr,
                               EBC_FREQ);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
 
     return fdt_size;
 }
-- 
2.37.2


