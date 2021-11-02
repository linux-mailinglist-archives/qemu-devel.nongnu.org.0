Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7D443059
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:25:33 +0100 (CET)
Received: from localhost ([::1]:39688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhujE-0001tg-QY
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6Y-00055k-Sj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:35 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6X-0006RP-3r
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id c4so3435991wrd.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BdKVw9TlNp6lyAe8Rmmb2tz09x4lQMmwRPIlm3JD41A=;
 b=CK0+iMW32oYymqg2H3E6m+ZBfxpARWhRr2iKvOEZizQ5frHvFF9zc8OgAxxQsVeify
 kcYMYAWCI8RbrzUr4XCjEMb3Y8TT5FTxu7h72XPHnClRwUcK+GbGfURfYx6Xzc0JTpk3
 Y9KO0FGK4hiaz28uc5sfkWrD3dj39qeCEGETxe1el3kuXfapnzd7XD0rS6g7r8dkSBET
 Y/IXG7aO2cxt7MbnYwNDWpYF8A+82c7aLaMYgGulp8IQy76Y5HD1oaBXmY3S5EkrYKst
 JRIYvqBTWNq7GuZq29fLBw7csnOAx8VdjXYdc0jClRRllSJyUpNFCY+qOpbF7VHLYWzh
 /W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BdKVw9TlNp6lyAe8Rmmb2tz09x4lQMmwRPIlm3JD41A=;
 b=oAbsaSUHQIy0X8D6C0sYLzF1YlGQtemPJ1dkJC92Q9HygXbwoTnUvOBN+5GEgmXNkT
 3xzUXPHVrRcuGr8EJJfqc/C5L7x2+ILj8VKSQUkWALLlL1pOPmRyBlaXn8Ofny34GtXX
 JFXatF3/04qZpWbb10Zx9G9k/hgjoFbPbeEp1Vw8/Dw69ImmBuRBnP9FXW2cJO49QXvj
 XaSKx5g59TJFm754biT2kDY3Y/OpoVyjQ8Ekd8if8XNRlScaS29zYxAguX92ayXfXPbj
 PaQVlQtgjSpY694xyZtoO+SMnIHLxPe3j0fcdf2IWhmH+ghpj1zF+R8LL9NAmRKJr8aS
 eLAA==
X-Gm-Message-State: AOAM533hDcbWZmlSJb4jgXQkZjVriQk2hzXFOdm2sOseBiwzHuSzScg+
 VTMfMCd5YP9BK4pdJ8vQqctCz3TehJc=
X-Google-Smtp-Source: ABdhPJx2Viy0RIkjgWxwB6QSFJE1G+yJgbR6BuZp6JrjihqzMUL8UKyq6uyP7/os+/XxN7jxWy+fFA==
X-Received: by 2002:adf:fed0:: with SMTP id q16mr41688272wrs.276.1635860730818; 
 Tue, 02 Nov 2021 06:45:30 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z135sm3251061wmc.45.2021.11.02.06.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/41] target/mips: Fix Loongson-3A4000 MSAIR config register
Date: Tue,  2 Nov 2021 14:42:34 +0100
Message-Id: <20211102134240.3036524-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
Message-Id: <20211026180920.1085516-1-f4bug@amsat.org>
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


