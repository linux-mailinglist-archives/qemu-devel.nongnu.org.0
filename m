Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107F5AC13F
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:51:30 +0200 (CEST)
Received: from localhost ([::1]:34642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZAv-0004pw-9b
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYup-0006zP-Le; Sat, 03 Sep 2022 15:34:52 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:46606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYun-0005O5-QH; Sat, 03 Sep 2022 15:34:51 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11f4e634072so12796673fac.13; 
 Sat, 03 Sep 2022 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wcu8NnDjsEBMlgSuANlfln4lhGjabF4edEDSGqP1+cc=;
 b=jjb5fw8DS//AN0T1F36WLcaXMeBP8c3Uie072qKRyXkkR6SAQEM6OTZXGyaAXd/s8U
 2nPWFOawC6GxqO3a0lQVhE/HnFhK8GT40DOWOzDKk9MfOkp6KZOucIbKEjVIpiyiDqpH
 e0RNLCWN/KfeCdhoMXPhgAJkw2/nE3afrgA1lZqloxK8pk1lzCV8f3NO8MHPXuP17SaT
 0ZZ+FHTFSUUh1RmsezkRN04K+WMOinZMAyKV244h9htYJhE9AKpsiWB4tcVHw5vY/xpp
 5Cc7tX+8cd7hZKeWwuna0CfV3Z+qpVWxw/MgZ+wBs6vHtvXe/NfkSz/lnXU1Jf5e1/z5
 +LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wcu8NnDjsEBMlgSuANlfln4lhGjabF4edEDSGqP1+cc=;
 b=lenw/+jCzDdnF85adZwUYn3dKycBPPUp8j2QzBbprsGEtE+mR0feBt16Juej+ka+fT
 SOp2KFDfLPMF3+zPNei9DE83IJncovhR092e3FC3jtv5RK9ffkLyKFBVO5QLj48DKP2B
 O9aobyqqhYrAoS6C4Iy7cUR+PxU+XRnU6AuuDR2Kmb6fVgBkAwqpo3eb2yxXK36XkqfK
 1Y45R7KVn6cqj3QqYpJuHQd8g2+ULvTdrvZhkFOqPeYh0lZxy9ZLMqsWvuyVm/btjAMD
 6r6xNUQKARMH5To2jIYLGcfMU3TcadFGJW+2gyU3oCpSwiQUzjZgSxmk/hhHR1vSX3kL
 fEMQ==
X-Gm-Message-State: ACgBeo2msDg932Zn+wmtPXCIv8pCr87lsqEj55tIsR3l9i+LO6zbwgOt
 99ekT3X4FVTTOf6YFWLFywWKjrSEMNnOBg==
X-Google-Smtp-Source: AA6agR5W+POh1llsP1fkmQlAtMiXohCAjtpyCafAO3ljAyn1Q1qJ7Ml9gzxZbTF0Pbv/HaRHCv4uQA==
X-Received: by 2002:a05:6808:3093:b0:343:1ade:428b with SMTP id
 bl19-20020a056808309300b003431ade428bmr4278941oib.145.1662233686667; 
 Sat, 03 Sep 2022 12:34:46 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v5 07/14] hw/ppc: set machine->fdt in xilinx_load_device_tree()
Date: Sat,  3 Sep 2022 16:34:13 -0300
Message-Id: <20220903193420.115986-8-danielhb413@gmail.com>
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

This will enable support for 'dumpdtb' QMP/HMP command for the
virtex_ml507 machine.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/virtex_ml507.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 493ea0c19f..bb21b2a309 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -45,6 +45,8 @@
 #include "hw/qdev-properties.h"
 #include "ppc405.h"
 
+#include <libfdt.h>
+
 #define EPAPR_MAGIC    (0x45504150)
 #define FLASH_SIZE     (16 * MiB)
 
@@ -150,6 +152,7 @@ static int xilinx_load_device_tree(hwaddr addr,
                                       hwaddr initrd_size,
                                       const char *kernel_cmdline)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     char *path;
     int fdt_size;
     void *fdt = NULL;
@@ -194,7 +197,13 @@ static int xilinx_load_device_tree(hwaddr addr,
     if (r < 0)
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     cpu_physical_memory_write(addr, fdt, fdt_size);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb'QMP/HMP command.
+     */
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
-- 
2.37.2


