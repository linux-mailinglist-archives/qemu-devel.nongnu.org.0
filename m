Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B395F370DE4
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:24:25 +0200 (CEST)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEtM-0003v0-Qs
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElO-0005KG-Jf
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElL-0007O5-WB
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id s82so1919555wmf.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RPwNXgnYoOFEB/Syw7iOsyR0ocLEZVRgNHH2ttrTpk=;
 b=NEinPNeqgvyvdCVcS0of2RnYaQeOxPBrUYQW796BCL4diI+aWNWjltWc/AzIZkJjkx
 9tI6T+VheF5A1vXyuOqPKr/8HtgRR0fhjl+IybLYW8tJsBq7KxJL18pLf6ao6DWQN34/
 HloPtp9R1m5ODqwGWGjEimXileUgff+a9blZXsVY0heiyM6ziDFY5CEb6SONtL0V9zAa
 Qv1RO1+Xfn9HB7jXLP6S4bG80ZxkMvAozG3IqViVtDF/8Mb4QL/6lnZPr1Cv+GP44GiR
 z6eEjsA+sNs08e97A5kTTubCLrPEH74yKRIZrBcXYmOdLhdQM/3FjVVppaUkhur1W4Ej
 ta5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0RPwNXgnYoOFEB/Syw7iOsyR0ocLEZVRgNHH2ttrTpk=;
 b=WIM86NeJvaLxr0t4SQA12ZOwsjeXEB67NyP2LmipYNTGpFQih6aI9kGDmQr/A4qKWB
 zbnO7oJnfMBQHtXhFyFHR5H5JX4f/bMPkVCKwHmI6SajPNLkXoS+f/pAoKLNBF3wAUuB
 keEp0VmUm4wxDfI+m/kM1hvAP372yNiB3yqSEU+8fpRoNFLRhIt893PvNS2uZvJQvur5
 lMljHyNUkv6fc76lwtVqSWKYAbS8mf34Ii2ODJXLxFzsJ2B1B4pIXVY9fdug2q/bvG4y
 hXEmCrfATt0sHuxydAuu71/rOj6jwqBuMOaBGibagOfWMhhW39Rpu9If3joV56tbYhmj
 1qSg==
X-Gm-Message-State: AOAM530Ds8ytwLHvlAW5G/JSlrmYZqUgkriiwPmlNWPmUBFr2FzJP1xk
 YJfZiLNwyOMHRxnPionINO/3Ir+3f8ymXM0r
X-Google-Smtp-Source: ABdhPJytgoSdM47nI4MO9m9nIqmPLznZyPLFBwW6iRg+X8RytBK9alAb/EmSUj+POML1x9bCKAHmsw==
X-Received: by 2002:a1c:9897:: with SMTP id a145mr19387038wme.9.1619972166576; 
 Sun, 02 May 2021 09:16:06 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id v18sm10898604wro.18.2021.05.02.09.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/36] target/mips: Migrate missing CPU fields
Date: Sun,  2 May 2021 18:15:07 +0200
Message-Id: <20210502161538.534038-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add various missing fields to the CPU migration vmstate:

- CP0_VPControl & CP0_GlobalNumber      (01bc435b44b 2016-02-03)
- CMGCRBase                             (c870e3f52ca 2016-03-15)
- CP0_ErrCtl                            (0d74a222c27 2016-03-25)
- MXU GPR[] & CR                        (eb5559f67dc 2018-10-18)
- R5900 128-bit upper half              (a168a796e1c 2019-01-17)

This is a migration break.

Fixes: 01bc435b44b ("target-mips: implement R6 multi-threading")
Fixes: c870e3f52ca ("target-mips: add CMGCRBase register")
Fixes: 0d74a222c27 ("target-mips: make ITC Configuration Tags accessible to the CPU")
Fixes: eb5559f67dc ("target/mips: Introduce MXU registers")
Fixes: a168a796e1c ("target/mips: Introduce 32 R5900 multimedia registers")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210423220044.3004195-1-f4bug@amsat.org>
---
 target/mips/machine.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/mips/machine.c b/target/mips/machine.c
index b5fda6a2786..80d37f9c2fc 100644
--- a/target/mips/machine.c
+++ b/target/mips/machine.c
@@ -81,6 +81,9 @@ const VMStateDescription vmstate_inactive_fpu = {
 
 static VMStateField vmstate_tc_fields[] = {
     VMSTATE_UINTTL_ARRAY(gpr, TCState, 32),
+#if defined(TARGET_MIPS64)
+    VMSTATE_UINT64_ARRAY(gpr_hi, TCState, 32),
+#endif /* TARGET_MIPS64 */
     VMSTATE_UINTTL(PC, TCState),
     VMSTATE_UINTTL_ARRAY(HI, TCState, MIPS_DSP_ACC),
     VMSTATE_UINTTL_ARRAY(LO, TCState, MIPS_DSP_ACC),
@@ -95,20 +98,22 @@ static VMStateField vmstate_tc_fields[] = {
     VMSTATE_INT32(CP0_Debug_tcstatus, TCState),
     VMSTATE_UINTTL(CP0_UserLocal, TCState),
     VMSTATE_INT32(msacsr, TCState),
+    VMSTATE_UINTTL_ARRAY(mxu_gpr, TCState, NUMBER_OF_MXU_REGISTERS - 1),
+    VMSTATE_UINTTL(mxu_cr, TCState),
     VMSTATE_END_OF_LIST()
 };
 
 const VMStateDescription vmstate_tc = {
     .name = "cpu/tc",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = vmstate_tc_fields
 };
 
 const VMStateDescription vmstate_inactive_tc = {
     .name = "cpu/inactive_tc",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = vmstate_tc_fields
 };
 
@@ -213,8 +218,8 @@ const VMStateDescription vmstate_tlb = {
 
 const VMStateDescription vmstate_mips_cpu = {
     .name = "cpu",
-    .version_id = 20,
-    .minimum_version_id = 20,
+    .version_id = 21,
+    .minimum_version_id = 21,
     .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
         /* Active TC */
@@ -241,6 +246,7 @@ const VMStateDescription vmstate_mips_cpu = {
 
         /* Remaining CP0 registers */
         VMSTATE_INT32(env.CP0_Index, MIPSCPU),
+        VMSTATE_INT32(env.CP0_VPControl, MIPSCPU),
         VMSTATE_INT32(env.CP0_Random, MIPSCPU),
         VMSTATE_INT32(env.CP0_VPEControl, MIPSCPU),
         VMSTATE_INT32(env.CP0_VPEConf0, MIPSCPU),
@@ -251,6 +257,7 @@ const VMStateDescription vmstate_mips_cpu = {
         VMSTATE_INT32(env.CP0_VPEOpt, MIPSCPU),
         VMSTATE_UINT64(env.CP0_EntryLo0, MIPSCPU),
         VMSTATE_UINT64(env.CP0_EntryLo1, MIPSCPU),
+        VMSTATE_INT32(env.CP0_GlobalNumber, MIPSCPU),
         VMSTATE_UINTTL(env.CP0_Context, MIPSCPU),
         VMSTATE_INT32(env.CP0_MemoryMapID, MIPSCPU),
         VMSTATE_INT32(env.CP0_PageMask, MIPSCPU),
@@ -286,6 +293,7 @@ const VMStateDescription vmstate_mips_cpu = {
         VMSTATE_UINTTL(env.CP0_EPC, MIPSCPU),
         VMSTATE_INT32(env.CP0_PRid, MIPSCPU),
         VMSTATE_UINTTL(env.CP0_EBase, MIPSCPU),
+        VMSTATE_UINTTL(env.CP0_CMGCRBase, MIPSCPU),
         VMSTATE_INT32(env.CP0_Config0, MIPSCPU),
         VMSTATE_INT32(env.CP0_Config1, MIPSCPU),
         VMSTATE_INT32(env.CP0_Config2, MIPSCPU),
@@ -305,6 +313,7 @@ const VMStateDescription vmstate_mips_cpu = {
         VMSTATE_INT32(env.CP0_Debug, MIPSCPU),
         VMSTATE_UINTTL(env.CP0_DEPC, MIPSCPU),
         VMSTATE_INT32(env.CP0_Performance0, MIPSCPU),
+        VMSTATE_INT32(env.CP0_ErrCtl, MIPSCPU),
         VMSTATE_UINT64(env.CP0_TagLo, MIPSCPU),
         VMSTATE_INT32(env.CP0_DataLo, MIPSCPU),
         VMSTATE_INT32(env.CP0_TagHi, MIPSCPU),
-- 
2.26.3


