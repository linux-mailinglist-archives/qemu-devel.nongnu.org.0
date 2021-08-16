Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812F43ECBE7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 02:11:56 +0200 (CEST)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFQEN-00029z-3P
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 20:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFQD8-0001QD-5O
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 20:10:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFQD5-0001DV-Sp
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 20:10:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k29so21167413wrd.7
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 17:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FPTVRGfv/5Gt0xO9I2A+cTjJdop6E6dcgtbP8apKopo=;
 b=ELHofGssg6QJra1UsLopprzzn2YfLy/vqyGhWLw0oeXsRcGjxt10BI4MSgjmWbqCq9
 J7p7cWxBIdq39bweVazS4X2kI5/nR0U+Ts/etPPckUkhZ8MFc1WXmm3yrWV8eNJ3sFED
 K866LMJqPUlkPjBL5knlGj2zOLG7L7PWv5OuNeyU9QGE6tP2+UXX6jPkfuX6LW6KEQ62
 1hsrF7WprT7XnWJ+VjpqZTUawAiaX6kD/sRse3P9qhAl9DitYQoVYEajvAcSP/M8O2xm
 8kLTJrOTcRcw4A//89IjrGTgMNO4I0XaF2IISoH6zcDNJYZ12gp/GB3KFe2KHdZKV+9i
 IX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FPTVRGfv/5Gt0xO9I2A+cTjJdop6E6dcgtbP8apKopo=;
 b=lCBbWchoE5hyqhayAF9dFc3QJKm9HDwg0zSuzKPkH1cT1K6SoocwdKC203yilQ/w+J
 w9qBYxMESmQfviEktRUexYo0ZsH3FsHuPUzIeE39yTDnm3bfQ1IPD8NbmX4eFyamaBjk
 mTuToPKsONWPXT9O1Xtqk/q0DvzKj48oHnIETa7JoYqU/rwX29zsP/1DaN1lAh9EPixv
 xeyQUY99Nf3QrVPidOcKEVfPd4pmr5zdehMdufLQIqY4lQ6PAGrzSqoXu6dqv6x9EAxw
 Bfei/d+TnImBvOnBBKkOpmA8bD86emAfcezpV5yG/4vAeiR+y5/xZSyCHtXlg/AGuuhb
 7QQA==
X-Gm-Message-State: AOAM530ZfM4c/BXEbM1pGv39s+ieYBjKf/VYsKt/jumDrv7We4NnI7nm
 /AjrvY5Jfxyjdwa/Vo8TGoJJ7CzxCgE=
X-Google-Smtp-Source: ABdhPJw8o7Fclv8KURb6CuYJrHENd35AFBsE0CJ4Sa1QeUzjpkUqO7Eb1wSupkVBalORtg1sRQPVEQ==
X-Received: by 2002:adf:f7c5:: with SMTP id a5mr15151203wrq.355.1629072633955; 
 Sun, 15 Aug 2021 17:10:33 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o14sm35092wms.2.2021.08.15.17.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 17:10:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Remove duplicated check_cp1_enabled() calls in
 Loongson EXT
Date: Mon, 16 Aug 2021 02:10:31 +0200
Message-Id: <20210816001031.1720432-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already call check_cp1_enabled() earlier in the "pre-conditions"
checks for GSLWXC1 and GSLDXC1 in gen_loongson_lsdc2() prologue.
Remove the duplicated calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5b03545f099..268460d63ee 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4777,7 +4777,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         break;
 #endif
     case OPC_GSLWXC1:
-        check_cp1_enabled(ctx);
         gen_base_offset_addr(ctx, t0, rs, offset);
         if (rd) {
             gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
@@ -4790,7 +4789,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         break;
 #if defined(TARGET_MIPS64)
     case OPC_GSLDXC1:
-        check_cp1_enabled(ctx);
         gen_base_offset_addr(ctx, t0, rs, offset);
         if (rd) {
             gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
-- 
2.31.1


