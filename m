Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B8364EA40
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:23:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68n9-000238-Iq; Fri, 16 Dec 2022 06:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n6-00021f-Qj
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:12 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n5-00067f-4i
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:12 -0500
Received: by mail-wr1-x434.google.com with SMTP id i7so2153263wrv.8
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gy0/zYZetKWbyUE6WFREVjvsOrbcepCm3I2qjMJQWPs=;
 b=ppDJiOmHgtESgFUqdzTRWldALcCqZlXjSutua5UJYvMdt4LZC7wrjHwKle2ZVY8kIa
 NsuQxq1S+82jUQVvnusSgy6Wx4qVPSPzJHY8nUg9sD4AhWVrJlDadmAce4cOPjZnyuVT
 YkzZXmgigjR5zmsKcWn2kLSq11Y74bX5upZCYvNat8gEzCXClqNrKeEL/bV+bWoXNi2n
 bo9HUJRSE4xUWktOw3VRpickVKmQdxPWqk8axKTZJRMBxxFRzo+k8cgCBzIpVaF3mWNk
 JZCZdawRhWhPZ6ZIv0kiz1MOYdQGgh2cY+Uid80iaNZevutLoTBuVz7jmkaflVarP0Ie
 dADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gy0/zYZetKWbyUE6WFREVjvsOrbcepCm3I2qjMJQWPs=;
 b=V1z1+2gA2gGyCN5X1jNIMLMKw6csE1hb5J+4p/FQwvPAVUPPW1W6ywnGouqN8+pqW+
 O1hHsHflstvckGPC0RK2n8vXFuOS5LwecxNK4tx9CuFvK11WNAueNOclMVcGk8fzrqHK
 Www1OuSx1GD8UaQzEUZ90KWrwoWvXS3h2BJu81LF2Bth5KcidKylOlbNz0QwQxpKNcJi
 N7XvquVVO2wYlHqt64noivG5COmekRIhs90KCJY82wZRR2s88HWUNNoMwdwbtd8br2AB
 C9rZnrASzA9ZEYpScoKHUIURaEhM3zi4/eqgQXDO/Srzn2PAGYCtaLjCrk0jzdxzuHOd
 GqPA==
X-Gm-Message-State: ANoB5plLugirq4or/XVLKT/JgbUmoVHpx0vqKOB76vvxh7CrUQ0H9Iba
 GfsOzSETGLnhcnnxiqFYuu5EnA==
X-Google-Smtp-Source: AA0mqf50XgXvLyy+h4zImsHg3777kCyxFTqyeXkr2pEfa9sNx+apByCNAKg3N1aruotyxLPul91X5g==
X-Received: by 2002:a5d:68c8:0:b0:242:15e1:5805 with SMTP id
 p8-20020a5d68c8000000b0024215e15805mr20414440wrw.55.1671189729617; 
 Fri, 16 Dec 2022 03:22:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bh10-20020a05600005ca00b00242442c8ebdsm2014931wrb.111.2022.12.16.03.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D4B41FFBB;
 Fri, 16 Dec 2022 11:22:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 03/10] gdbstub: Make syscall_complete/[gs]et_reg
 target-agnostic typedefs
Date: Fri, 16 Dec 2022 11:21:59 +0000
Message-Id: <20221216112206.3171578-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216112206.3171578-1-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Prototypes using gdb_syscall_complete_cb() or gdb_?et_reg_cb()
don't depend on "cpu.h", thus are not target-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221214143659.62133-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index f667014888..1636fb3841 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -71,9 +71,6 @@ struct gdb_timeval {
   uint64_t tv_usec;   /* microsecond */
 } QEMU_PACKED;
 
-#ifdef NEED_CPU_H
-#include "cpu.h"
-
 typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);
 
 /**
@@ -126,6 +123,7 @@ int gdb_handlesig(CPUState *, int);
 void gdb_signalled(CPUArchState *, int);
 void gdbserver_fork(CPUState *);
 #endif
+
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
 typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
@@ -133,6 +131,9 @@ void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos);
 
+#ifdef NEED_CPU_H
+#include "cpu.h"
+
 /*
  * The GDB remote protocol transfers values in target byte order. As
  * the gdbstub may be batching up several register values we always
-- 
2.34.1


