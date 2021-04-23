Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E5E369C5B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 00:02:16 +0200 (CEST)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3sN-00049X-48
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 18:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la3r1-0003jM-C0
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:00:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la3qz-0006M0-CH
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:00:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id h4so40675075wrt.12
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fyn3KNII6Egm37YRmwnOsVfd4X2acBHqZaOhuueFACk=;
 b=ikTqYjmHMxm7gmt3WfSIDkvwl04c00jVYf/niOG0i55mjKnQhQNhhqyImPqdeJZGHs
 fokYZBHI93JSnEJlFU6AW4HxCJbuwc2LWhRKpcWH710kKQUxQvwNn2R12ZsUIv6MrvyL
 dyCisGUw7KT5DWqqsMfSSwHLmnvh8s4jY2NU4wafcYEPDdn3XHrSV17W3ZR8eSwjssD1
 C7yFunO0sdbrknevUuS8Z7HN08XM5wdC8ToNO1zmQQSvQfCA+5gE2duphJ3NhG0ncjXC
 CtJh5oSlM2Zo8k2yjtRGo+YKiQHbAAsI271WF4KFJn3uc5l7dNd51IMrBMoeoWm07JS1
 +n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Fyn3KNII6Egm37YRmwnOsVfd4X2acBHqZaOhuueFACk=;
 b=ZtHcFRfuZQfD/XqdUDlFGJePnsKo5qhcHTUPiMsEAge5wLsCuVhmDzfkWI8NgU1+tj
 YAGqBvlJnDOIwvnTK1JOiN2lmJaN94S2kVgDuGqAw4h0y0QqbP3/v+zKl9CHXkEy56OE
 89yG0U3EEB5Ic69TIl/jSLo2/2vnE7BYxcW2FWd3/txfgf6jzd3Qg65DREr22ObmOVCU
 jqCvjyR+yH2YrRI73iKpNgWCZXtx6/1HPf9xyfd6rDeg+AlPH1VQb2mSuN+4+kQEir5w
 8nLSiq/zAYE8pNhnyLnCc+ZtG/f/SRXWe8bOn9OZySTJv+QYnLM4qnWyNisc1UtAThf+
 l52g==
X-Gm-Message-State: AOAM531s8l/oQnWZHT5Jhx0peuJPvIlGjkUH7Qv/veOi9C6GGZjitlFR
 V1xegCCkvcDSGXzJ7afGUWvpV04m19KWmA==
X-Google-Smtp-Source: ABdhPJz8hj2C2f7tZK9Y5Zg6GJBAVTXqdpOJAIza7AJ8eDVaFl4fTu7ZxobV5DsFp3bWukaljkzS8g==
X-Received: by 2002:adf:a119:: with SMTP id o25mr7058888wro.36.1619215247430; 
 Fri, 23 Apr 2021 15:00:47 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q18sm10491667wrs.25.2021.04.23.15.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 15:00:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Migrate missing CPU fields
Date: Sat, 24 Apr 2021 00:00:44 +0200
Message-Id: <20210423220044.3004195-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
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


