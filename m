Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1464CCDA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 16:09:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Sss-00081Z-Uo; Wed, 14 Dec 2022 09:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5Ssc-0007zX-3C
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:37:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5SsZ-0005wR-HI
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 09:37:05 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so10749087wma.1
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 06:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YIcurVs+8wS1im41pBmnVSuxZrkSMUiPco+Xx7dzfFw=;
 b=aQjPqdboHgzJC0lsiJJ1GKBfntzi4O81+qny/iARtL2RYz5SXrQN3VVP+IEsHFEZcj
 PFOQ4TB4irHjzJ6XF3GhyD5seps273qqFZ6s6aVCR/aoDJBPS7XfX3NGjOI4rMQ6edqI
 pNjrelwRVqGZKr5gw8W+yzFILMsRuOno6md+0M5LFd3TYrulbCgC+zC+6MhxtoqX26Oa
 YmH0isSO63ZwO5aqOZUzTK5wI6wqmQ/bI1lNcWUeeKAwFZGzCCi5p+T2tUrKspTfgQmo
 Jv6iiH/hp76KziGqGVh+A751DXWLkeIbgG+4LgcAOQ1Stu9PVtygT7UJCFBhpZwUEP+p
 TC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YIcurVs+8wS1im41pBmnVSuxZrkSMUiPco+Xx7dzfFw=;
 b=GljBAOO6g/Jp8tHV3weFuz2G6FvT8jchdCSRmL7rv3MSFtL5WHswmAifDJhlOPgQ3u
 sjRsRHHthNcUmf9I9UwwxTBncTZRDWbRgaXKsMWPneoGKn2A1+XQ4C12I+BbGzmvF94v
 ZSdSuVO7HFD2e8Ox77ukuvB7tJhBFsxBxLJ1U0qXzpE4KxOTC7aC9NzU5CNeHM846J8d
 lQHfpvSMzEleoncFc+G6fkv26PICAcgf6yjupbqgEPCWou4ZnY37JcRgL5F0euUlKKpN
 O+DrpCv0tYRIBWveWpbYC7QjAZPjs7kXq6iz1mdOLGybcHNZvnWuMavDBZjhkc6sA84m
 E26g==
X-Gm-Message-State: ANoB5pkQVzHdwodX06Gz++p5qz3zYF3bOG3g712gp1d8iJAkfHQDDo+h
 2sw/R00LETpvfzngG+JzgMG0Y99TZeAG+49h4SM=
X-Google-Smtp-Source: AA0mqf7Gd3W5JxYM14egikf7x30wOw2E3VeZJSbizZf/PI3FP3exTrH1WtbJsoNK5HjH2k8A42k7pg==
X-Received: by 2002:a1c:4b16:0:b0:3c6:e61e:ae74 with SMTP id
 y22-20020a1c4b16000000b003c6e61eae74mr22941668wma.4.1671028621764; 
 Wed, 14 Dec 2022 06:37:01 -0800 (PST)
Received: from localhost.localdomain ([84.76.199.78])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c445100b003cff309807esm3166012wmn.23.2022.12.14.06.37.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 14 Dec 2022 06:37:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] gdbstub: Have syscall_complete/[gs]et_reg to target agnostic
 typedefs
Date: Wed, 14 Dec 2022 15:36:59 +0100
Message-Id: <20221214143659.62133-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Prototypes using gdb_syscall_complete_cb() or gdb_?et_reg_cb()
don't depend on "cpu.h", thus are not target-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.38.1


