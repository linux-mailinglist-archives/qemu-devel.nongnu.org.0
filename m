Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B6A4C757A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:54:56 +0100 (CET)
Received: from localhost ([::1]:43114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkEZ-000299-Pt
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:54:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAG-00025F-84; Mon, 28 Feb 2022 12:50:28 -0500
Received: from [2607:f8b0:4864:20::336] (port=46027
 helo=mail-ot1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAD-0007q9-Av; Mon, 28 Feb 2022 12:50:26 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so10091335otl.12; 
 Mon, 28 Feb 2022 09:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9mxy1cshybqQSvMZopsk6bW7FYYsX3Wy2RNzLNjGm4I=;
 b=k1O7CVYKVXVqivDeDQkTSh9xEecimui/OIwv5R1zC0cHd6iK1o3xBH5ZAfNVvk/mAj
 EPuO0MV9E5uBvbz5YjLjqg0qeCikAzzLQxjDbmJF9nR47+SD/+oKDQv+aDYdJ7tHw5Vv
 bJPZBGtaWDEZRRxhzPfUjFk8JQ0OOi3kiF58SL3tMgd8PN1uXdiPDIcg+KYChJ/w6C8b
 VWGBckmUeuyxDq2vPPUYR8NgWlovn8xjztRU9rDzbBPJMgqcIbvjaHKfHdTB8HyMzumc
 v98gADhjNg6s1MxFhCE5X1nYslMrRit0uPfQQZqO4enQZqkdhRA6aH07GpfsNtv2+UEH
 Osyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9mxy1cshybqQSvMZopsk6bW7FYYsX3Wy2RNzLNjGm4I=;
 b=OlAaAbf/QVV7SP8ilHYfqR3PO5qvVY5bXcQ1WjUUo3MlOSb14BoE3U1kxwQXD6aomm
 SQy8Gi+ygSercU58AEY5wNEoeRB8udvGWXpvfMPl+Q7SQAnx0WQzLslPtvio6d4fuvki
 lIS3Dn8q/4DchoincKbbdMw/3mPix/EMac+aNrXqDt2VP1lG+ZnqpXaK958D3/LGe4wv
 PZg3jIs+uwB00MAGOZQOkAfJ1unGaTauoms5s77iwEyNEALOLXn5zFzK7kbWh6CJ8P+l
 eHREpTOOESUjSPgWkrKtK9KO+H1nqQHylvbhYgy9+YoFpqZixinSNvmdV8Oj2al9h7rN
 3+Zg==
X-Gm-Message-State: AOAM531k82M+dRfgCnKyc3qoSfDUPeu5oYb7aSoqtN2z8Px7zATWOHgV
 uhIpIPngTF8dw6T3+Z1UuknUpQC433c=
X-Google-Smtp-Source: ABdhPJw4/kfNfzj5qumFkmCE1SxN+OkCgec6zzV95OrK4mgC5aeusEnsZGnVYFxGRk56E0dS7gdUkQ==
X-Received: by 2002:a9d:22c8:0:b0:599:bcf4:1b57 with SMTP id
 y66-20020a9d22c8000000b00599bcf41b57mr9671173ota.247.1646070623211; 
 Mon, 28 Feb 2022 09:50:23 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:23 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/14] hw/ppc/spapr.c: fail early if no firmware found in
 machine_init()
Date: Mon, 28 Feb 2022 14:49:52 -0300
Message-Id: <20220228175004.8862-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::336
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The firmware check consists on a file search (qemu_find_file) and load
it via load_imag_targphys(). This validation is not dependent on any
other machine state but it currently being done at the end of
spapr_machine_init(). This means that we can do a lot of stuff and end
up failing at the end for something that we can verify right out of the
gate.

Move this validation to the start of spapr_machine_init() to fail
earlier.  While we're at it, use g_autofree in the 'filename' pointer.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c74543ace3..4cc204f90d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2707,15 +2707,25 @@ static void spapr_machine_init(MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *bios_default = spapr->vof ? FW_FILE_NAME_VOF : FW_FILE_NAME;
     const char *bios_name = machine->firmware ?: bios_default;
+    g_autofree char *filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     PCIHostState *phb;
     int i;
     MemoryRegion *sysmem = get_system_memory();
     long load_limit, fw_size;
-    char *filename;
     Error *resize_hpt_err = NULL;
 
+    if (!filename) {
+        error_report("Could not find LPAR firmware '%s'", bios_name);
+        exit(1);
+    }
+    fw_size = load_image_targphys(filename, 0, FW_MAX_SIZE);
+    if (fw_size <= 0) {
+        error_report("Could not load LPAR firmware '%s'", filename);
+        exit(1);
+    }
+
     /*
      * if Secure VM (PEF) support is configured, then initialize it
      */
@@ -2996,18 +3006,6 @@ static void spapr_machine_init(MachineState *machine)
         }
     }
 
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-    if (!filename) {
-        error_report("Could not find LPAR firmware '%s'", bios_name);
-        exit(1);
-    }
-    fw_size = load_image_targphys(filename, 0, FW_MAX_SIZE);
-    if (fw_size <= 0) {
-        error_report("Could not load LPAR firmware '%s'", filename);
-        exit(1);
-    }
-    g_free(filename);
-
     /* FIXME: Should register things through the MachineState's qdev
      * interface, this is a legacy from the sPAPREnvironment structure
      * which predated MachineState but had a similar function */
-- 
2.35.1


