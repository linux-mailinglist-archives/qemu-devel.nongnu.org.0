Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0AA437C48
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:53:59 +0200 (CEST)
Received: from localhost ([::1]:52398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyju-000531-Ou
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdycO-0004gb-0k
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:46:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdycL-0002bo-2n
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:46:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id o20so530906wro.3
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9jfi6V3ZggWbRfP1dtoRvCwxf46pdyiI8ewC4QVCUpA=;
 b=P2g7D2VLs5cFVed5N8vMkE/RGQYg7rthLHOq04ITbvpB20G74LMdv+H7TeL+vNBQug
 hwa4lkKkgT0LHDVbYhBPm68H85HYcxR6zYZa2kSko+0/h0ILPJIObCRM/ou9+Mx8oLo1
 efcIvvBJJO4vK6t1x1145cdLlUUDpyuovtyMJlTrD3ymTGO+MDO6vrwtFrfjFfRUXjHi
 D2T0KKiHPOcdBJpXC4OnImox1pzGbfYqieULvHDsz3bgg0aCvNnioUIBGKrVk+99UK+J
 LhpKd4MieGDHlggmIzZKnGu29dOnHZAQXBC+MdiC7n5FQHvfxE67WzilQ8f/h50Yt+QL
 NQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9jfi6V3ZggWbRfP1dtoRvCwxf46pdyiI8ewC4QVCUpA=;
 b=nIM6g6FXG1iMQr0EBXn/C9bVUMmevBg1rS3Rj8lOL70aEiMKYFIJePtI8jDqbRC6US
 VVQJ7bzmuMMxJDuOc0LuIXKPzVTYSF5z3dREMXQwGB09jXp6l11WA0l7vmEY/GQ9aAJG
 OqVlspKUcYTeSo6ePSTNjJBicevdhY3tasgw5bQfMF0DK8ELUf04uwZi/Gdmj2B5h6uL
 mMQugJ4CB5NH9FqExGqsO6TkCeuvqa0xJjyyCRmocEEcfHDueFdiPsLj/rlo7uVvuvSx
 lbch9cOHOg/QU/w+ou/mLndxjkiiFK2IO2XOQMQXNaMg27WkiiY9R+KFHqlvm+AgAT1V
 6r/Q==
X-Gm-Message-State: AOAM531Hh9i96Ws+xEqjRR3H1a74NokReWA45V6HOLCsBbQiOINqXVOA
 HRw7BWfsR2Fqd7gJwSrfSKbfUXweHSc=
X-Google-Smtp-Source: ABdhPJz2QD82D5XQKhtWrqwrMCqoI5D6CXqXIhxpTmM47JzVurNdshNsAsg11A2/GNIeg3eMl9ImEQ==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr1629474wrd.24.1634924766457; 
 Fri, 22 Oct 2021 10:46:06 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 g8sm8341147wrx.26.2021.10.22.10.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 10:46:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/mips: Fix Loongson-3A4000 MSAIR config register
Date: Fri, 22 Oct 2021 19:45:50 +0200
Message-Id: <20211022174550.36937-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022174550.36937-1-f4bug@amsat.org>
References: <20211022174550.36937-1-f4bug@amsat.org>
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

So set MSAIR=0x60140 for the Loongson-3A4000 CPU model added in
commit af868995e1b ("target/mips: Add Loongson-3 CPU definition").

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu-defs.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index cbc45fcb0e8..f43a8e7c9d9 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -886,6 +886,7 @@ const mips_def_t mips_defs[] =
                     (0x1 << FCR0_D) | (0x1 << FCR0_S),
         .CP1_fcr31 = 0,
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
+        .MSAIR = (0x601 << MSAIR_ProcID) | (0x40 << MSAIR_Rev),
         .SEGBITS = 48,
         .PABITS = 48,
         .insn_flags = CPU_MIPS64R2 | INSN_LOONGSON3A |
-- 
2.31.1


