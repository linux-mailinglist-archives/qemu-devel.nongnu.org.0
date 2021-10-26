Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FE643B92E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:13:24 +0200 (CEST)
Received: from localhost ([::1]:34840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQwu-0005Rw-1h
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfQt5-0002bG-1B
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:09:28 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfQt2-0006cM-Pc
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:09:26 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m22so17466399wrb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CSLYgRhQjvLCdk922IFAeRHe+vBdRQ4LaRqWHB0w8Y=;
 b=ALZjHamvVo7BP/jc5WEDZg2L7lO/3Dnri63+i9i9b8bfEJ4WGQ31/bW2hB6oxzAr7R
 n15UHq5Kn85x94UV2BRJEHho4qkORqHEEM8r/sUNsWuP2Du9VBXsmBAehOMaFhI7X+io
 9lLPe25vVol6JwELzNTGHtrmNDAmRWSuLMXlt264mT5sJmhKRztDiiq2oP2SSBK3Lmv9
 JjO45dFy4pgmxkCaIC+rit4cMx/NihpzCY0OxfopSI9BEzyeVC58WshOim4q2Nl85n7l
 egcCr1/pk874teUu/O0R8augDMMAoMzIKh0Lz5NnIseLe2YFfqefs17PNrCYAlLCMmU/
 DGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6CSLYgRhQjvLCdk922IFAeRHe+vBdRQ4LaRqWHB0w8Y=;
 b=xFYgtfLPhQVA796Q3mCqHgmAWJSugmXvs8BKHMgbfgxLjaB0JcPGqB4tAnZd6jmyn3
 /WbGFgtR2I6xsKM/4mU2Ffa5+stGlqsQZE/aNBECppX2ln5TDstM+wlvy17tlaWKn8cg
 JlvnMTHuQyY0UzwfcNlgbcPa63Ml3haDEHfgNKFvo+Fpd3E8auqgasKT4GkKKCDJOO3k
 7Uf/gvludvSBwXtxMMe708hZPWLAhbFQKN9Hl1oQrpMkT6zojIU61lObuRS4GrCArNQK
 xie8m3G5exbTCx8mn4CgMePDa5Byr2SlK8aleOd/eF72OiOYU2ZPLWBQxK5qTcBfXIo2
 IYeA==
X-Gm-Message-State: AOAM5300usCXsK03Gv+hVarh34je6FqzzvrDaswr4L7p+6QHOT9znGAz
 gxfs7VDpq9wDyLWqq8u0BTaOQUFSSbk=
X-Google-Smtp-Source: ABdhPJxLP6DbDIi3mVcgPiRnoet/OgAgSi/sO4qYC81Wn1KeL4Pzp5uUfCE0+6EGiXCPECWW4rOI7g==
X-Received: by 2002:adf:9c11:: with SMTP id f17mr34498175wrc.147.1635271763092; 
 Tue, 26 Oct 2021 11:09:23 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z6sm1676990wmp.1.2021.10.26.11.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:09:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/mips: Fix Loongson-3A4000 MSAIR config register
Date: Tue, 26 Oct 2021 20:09:20 +0200
Message-Id: <20211026180920.1085516-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the Loongson-3A4000 CPU, the MSAIR is returned with a
zero value (because unimplemented). Checking on real hardware,
this value appears incorrect:

  $ cat /proc/cpuinfo
  system type     : generic-loongson-machine
  machine         : loongson,generic
  cpu model       : Loongson-3 V0.4  FPU V0.1
  model name      : Loongson-3A R4 (Loongson-3A4000) @ 1800MHz
  isa             : mips1 mips2 mips3 mips4 mips5 mips32r1 mips32r2 mips64r1 mips64r2
  ASEs implemented        : vz msa loongson-mmi loongson-cam loongson-ext loongson-ext2
  ...

Checking the CFCMSA opcode result with gdb we get 0x60140:

  Breakpoint 1, 0x00000001200037c4 in main ()
  1: x/i $pc
  => 0x1200037c4 <main+52>:  cfcmsa       v0,msa_ir
  (gdb) si
  0x00000001200037c8 in main ()
  (gdb) i r v0
  v0: 0x60140

MSAIR bits 17 and 18 are "reserved" per the spec revision 1.12,
so mask them out, and set MSAIR=0x0140 for the Loongson-3A4000
CPU model added in commit af868995e1b.

Cc: Huacai Chen <chenhuacai@kernel.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Mask out bits 17/18
---
 target/mips/cpu-defs.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index cbc45fcb0e8..ee8b322a564 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -886,6 +886,7 @@ const mips_def_t mips_defs[] =
                     (0x1 << FCR0_D) | (0x1 << FCR0_S),
         .CP1_fcr31 = 0,
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
+        .MSAIR = (0x01 << MSAIR_ProcID) | (0x40 << MSAIR_Rev),
         .SEGBITS = 48,
         .PABITS = 48,
         .insn_flags = CPU_MIPS64R2 | INSN_LOONGSON3A |
-- 
2.31.1


