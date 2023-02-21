Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3787A69EA7E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:56:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbV5-0007LO-6e; Tue, 21 Feb 2023 17:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbV0-0007HN-Gl
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:52:38 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUt-000445-8v
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:52:37 -0500
Received: by mail-wm1-x329.google.com with SMTP id p16so2170979wmq.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RtWA42U2CW9MkCZPpjCduULXRT6epTC7Pw4Xhbyp8Mg=;
 b=mAgjocz+7UapUfQDQq2QJraqMURPi3rbmoDyZc7bl9DsA16mydZfEqbhEq94o3x8F1
 WJ8Yw2c6dMfRf0Moyj5scq+T2IJVk+qkBvXLEUFauXWH9MYF/iOxJejXRpV4k2KTRDVL
 A+3ti5u5htw8o4E+FUg/t2tPurQIBEVfVk3Ko0uvNv0NrOQk2IIrvTJx6lzmRXfqgnRJ
 wdTVXDgE/bVGWANSeP0HEoUNkjIAQDtc2zGhIJoYEJ7set0UiXJjxCybkKYLdi0PMCVH
 q6ixSlefdhXnbwXXdllDSB6kn43M9OQwwLZCgGwWbPddSaMrSmrSgM04tlu2bKCJieNZ
 S1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RtWA42U2CW9MkCZPpjCduULXRT6epTC7Pw4Xhbyp8Mg=;
 b=O4ogjO1IP9BTfUCgxrCcZ1ByumDMLZR+4Kl6G0s2G/IA+J8CbkYmM3Y4hV5BE9zu+1
 7H3YoGlcANvJXq6qohQTY6UUuXyBtqp6T7N7dB28c8tKbxVE2lV+g1JoRhUGJO2gtuUk
 Pz+3SksEYYohVC/zFzNCd6lx61cd9PXF3E1thnrj3pY7LiG+6CBGZ7f7zVrwKw+we37O
 xtl9x9h/Hhfzi2g4n2MJprO/EXAGJx3fz+dY1r6PZLoslNdIawxsD9FpUzT/WcHnhIQR
 H/f8+LuU5E8+3dq4Ai/XBUFsmlv+zACKSKs02582vGTgk2kcezFfPy4SWs49vW52vr2y
 3Asw==
X-Gm-Message-State: AO0yUKXK83U3lyYGZMKzEH8XBn0JdJNkInQB0MmjMEJ8Mq4AehVeVXL6
 IYxOre8yIWUFowKczGdpC05KLg==
X-Google-Smtp-Source: AK7set9EMIJf6xHciIGOet5ufWwb8BBmTFVKu0QqXBdzBe+p7xCvpbhg2/D7DmVvpiD2EAyPnevjXg==
X-Received: by 2002:a05:600c:4a90:b0:3e2:66b:e90e with SMTP id
 b16-20020a05600c4a9000b003e2066be90emr10554222wmp.10.1677019949542; 
 Tue, 21 Feb 2023 14:52:29 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003e01493b136sm5841907wml.43.2023.02.21.14.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 95AE81FFBB;
 Tue, 21 Feb 2023 22:52:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 03/24] gdbstub: Make syscall_complete/[gs]et_reg
 target-agnostic typedefs
Date: Tue, 21 Feb 2023 22:52:06 +0000
Message-Id: <20230221225227.3735319-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
2.39.1


