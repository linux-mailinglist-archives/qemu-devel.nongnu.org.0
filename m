Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B495C4C7539
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:52:44 +0100 (CET)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkCR-0004sY-CE
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:52:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAB-00020R-MC; Mon, 28 Feb 2022 12:50:23 -0500
Received: from [2607:f8b0:4864:20::332] (port=46594
 helo=mail-ot1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAA-0007pi-7l; Mon, 28 Feb 2022 12:50:23 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 p12-20020a05683019cc00b005af1442c9e9so10086690otp.13; 
 Mon, 28 Feb 2022 09:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xrwLekCaz1dVcDl6Q8AHFt/pNZ/bdVatNhyZ7TCu4uQ=;
 b=VsVhuZACDTigZYeYOSLyHNHmO8s4OKClBHZNvL2YEZXHdB30IaiSkY3fnarpcazrgJ
 nQ+pqBIh9EjwTghu5BYMQdm3qoIXADvwDWyf87Gn5uN5oR/d9Mbsfk0yrTFSqQmPbcYl
 yVtQ6Q39zRMFLDdG2FZzxwWSQpFDkdlYgMJ+MU5wcogiCeIv/7q0MLZTaF8bque9lOpi
 Cz9fAYk4mkvxOAzXyo8S0TpqvpnHd19Yh8cfkVhbZVRwivhTF9c/spMTDzLp1DeF9Ihq
 chTuDvbHawl7+hn5re02bltlyV3zaYge90OKQCmJcmRAve4vGZ/L0LM2qB7pAXjkyGsI
 gxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xrwLekCaz1dVcDl6Q8AHFt/pNZ/bdVatNhyZ7TCu4uQ=;
 b=zrk02wvLClHTIDAAxmLK/bgeTbdAvAnvx7xR5qE20hVMCq+8dJkdx9scEdRGFXqc8c
 EKjI9hd8wAcwJGx5/4Czj9EvQYXU+l2TFP08qwP8QaZaVJ7mae0N25RbbQpgtidUZ4A9
 37UfGUQ6WTKmyxfJsU+bQ6k7/1b8xZh1duWpCyfac3y5FtyD67oCtG38cdwWQrgyq3L+
 T5oTEmWryvWm65rtaubOi1qI42ftm3MY53sCscxLkIrZVjeW0xferJrBTp/5QALrJ19i
 8PqRYkzjndHb4hTKcIsGwFMBV43s76sG/+1NIVhhZOjDGkLF0hT8FOD17yRyKvovGhJS
 NMRQ==
X-Gm-Message-State: AOAM532bcvXQPT3QG7luKN7KGBojsu8lcM08daVwRBkAOQjhEGQufWQJ
 on8RdgHD737fdpyO2eUdGPb/3IhWT5o=
X-Google-Smtp-Source: ABdhPJwlxJt//BA5s95xAAbl7qOPSqpU3ly7PwpPjfRUtoTAE7y3ba9gAM3ZCUyuU4dalEWmzikjPg==
X-Received: by 2002:a9d:8b5:0:b0:5a4:9db6:92b4 with SMTP id
 50-20020a9d08b5000000b005a49db692b4mr9764289otf.14.1646070620618; 
 Mon, 28 Feb 2022 09:50:20 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:20 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/14] hw/ppc/spapr.c: use g_autofree in spapr_dt_chosen()
Date: Mon, 28 Feb 2022 14:49:51 -0300
Message-Id: <20220228175004.8862-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::332
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f0b75b22bb..c74543ace3 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1018,9 +1018,9 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
 
     if (reset) {
         const char *boot_device = spapr->boot_device;
-        char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
+        g_autofree char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
         size_t cb = 0;
-        char *bootlist = get_boot_devices_list(&cb);
+        g_autofree char *bootlist = get_boot_devices_list(&cb);
 
         if (machine->kernel_cmdline && machine->kernel_cmdline[0]) {
             _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
@@ -1087,9 +1087,6 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
         }
 
         spapr_dt_ov5_platform_support(spapr, fdt, chosen);
-
-        g_free(stdout_path);
-        g_free(bootlist);
     }
 
     _FDT(spapr_dt_ovec(fdt, chosen, spapr->ov5_cas, "ibm,architecture-vec-5"));
-- 
2.35.1


