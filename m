Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369A5EC8BE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:56:12 +0200 (CEST)
Received: from localhost ([::1]:50210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCwN-0006xS-Cf
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMo-0005CN-05
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:22 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMl-000621-Ek
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id cc5so15228446wrb.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XZUpjPpadlAUHW/RreWII3CPwNzHzHCurB5FcarW70s=;
 b=H0UhZ3v1/NELxdrMprGbtIBN9ALoQgajIWFuuKgORwBvKYHa0wfoMMlWTIl7ZDhPn8
 DoH7fGM3wxEFV+OX3wvnwR1ufZjXFonXe65gHMOjjl0Q5V5mBsAJ4pdDQaqbvodlu2d+
 2ZM35EieJY6fjPF4IWHwG+cECtZm8sh2OC888RZEam2p2UJmbJNF5vFAN/nECoKNgw75
 6vfVSbm3mhFNNVzFKY5t3w/sS1LDeMEo2TLzYgQPtV83M2GGyve15Q6ZujbV3d4EXROJ
 Mh82EyaOTDTarizUQkhKVYr4tI/7KGEDj64zBYJ9BI4D31TkEjs1nv44U6Hqp61Nfx2W
 yqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XZUpjPpadlAUHW/RreWII3CPwNzHzHCurB5FcarW70s=;
 b=lDb4fSpgySfo6MSfqtoG0mBNFgHzb6txz4rFPW/zlxI6+8gMU2lN2WnLO34ZBm28f0
 FdAG3QpnO7P3EbgQeomr5lXshsMa+a/ElYXVvcQCidddbEO+5wabkClzSSB+tmkuGEaQ
 9b1ltC4fY3k+uBZRSdG1UqUpm45RSE2k1sOzLfKxq9pQ7VH88YlBMyyqGT4Kg9uM7FyI
 1GdECyxYZdp7x9eLErtK4z4Wr1bCf7GB9jceIjTrNFa9T43pqtrWqPhWllzlae/jaMh7
 adu2PZFR3iog3IhNg5vXk2Ah9UbVqJx4M5hks1//hTBrjvoCFlzbgF4fjN2ee0Jzitxq
 1WGw==
X-Gm-Message-State: ACrzQf0+DrE5YcYkPlJoeBZ+FOhjbADQiCOBt/kZGc0eVRpztJeBzuSN
 wDzyxa6czGkwP90vt2CJzFm6zA==
X-Google-Smtp-Source: AMsMyM4WGzq3QmsyFd8AFbEQV59xTqiRkOiLnFw6RS7pwC33541OxO1piJ76BwFCIoHAB1yZcL04rg==
X-Received: by 2002:a05:6000:144f:b0:22a:7098:6472 with SMTP id
 v15-20020a056000144f00b0022a70986472mr17397460wrx.685.1664288115117; 
 Tue, 27 Sep 2022 07:15:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x14-20020adfec0e000000b0022a297950cesm1973733wrn.23.2022.09.27.07.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A2C81FFC1;
 Tue, 27 Sep 2022 15:15:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH  v3 11/15] gdbstub: move into its own sub directory
Date: Tue, 27 Sep 2022 15:15:00 +0100
Message-Id: <20220927141504.3886314-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is in preparation of future refactoring as well as cleaning up
the source tree. Aside from the minor tweaks to meson and trace.h this
is pure code motion.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build                    |  4 +++-
 gdbstub/trace.h                |  1 +
 gdbstub.c => gdbstub/gdbstub.c |  2 +-
 MAINTAINERS                    |  2 +-
 gdbstub/meson.build            |  1 +
 gdbstub/trace-events           | 29 +++++++++++++++++++++++++++++
 trace-events                   | 28 ----------------------------
 7 files changed, 36 insertions(+), 31 deletions(-)
 create mode 100644 gdbstub/trace.h
 rename gdbstub.c => gdbstub/gdbstub.c (99%)
 create mode 100644 gdbstub/meson.build
 create mode 100644 gdbstub/trace-events

diff --git a/meson.build b/meson.build
index 3885fc1076..2c9209c2b8 100644
--- a/meson.build
+++ b/meson.build
@@ -2914,6 +2914,7 @@ trace_events_subdirs = [
   'qom',
   'monitor',
   'util',
+  'gdbstub',
 ]
 if have_linux_user
   trace_events_subdirs += [ 'linux-user' ]
@@ -3037,6 +3038,7 @@ subdir('authz')
 subdir('crypto')
 subdir('ui')
 subdir('hw')
+subdir('gdbstub')
 
 
 if enable_modules
@@ -3114,7 +3116,7 @@ common_ss.add(files('cpus-common.c'))
 subdir('softmmu')
 
 common_ss.add(capstone)
-specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
+specific_ss.add(files('cpu.c', 'disas.c'), capstone)
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
diff --git a/gdbstub/trace.h b/gdbstub/trace.h
new file mode 100644
index 0000000000..dee87b1238
--- /dev/null
+++ b/gdbstub/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-gdbstub.h"
diff --git a/gdbstub.c b/gdbstub/gdbstub.c
similarity index 99%
rename from gdbstub.c
rename to gdbstub/gdbstub.c
index cf869b10e3..7d8fe475b3 100644
--- a/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -29,7 +29,7 @@
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
-#include "trace/trace-root.h"
+#include "trace.h"
 #include "exec/gdbstub.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 738c4eb647..82575b2486 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2670,7 +2670,7 @@ GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 S: Maintained
-F: gdbstub*
+F: gdbstub/*
 F: include/exec/gdbstub.h
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
new file mode 100644
index 0000000000..6d4ae2d03c
--- /dev/null
+++ b/gdbstub/meson.build
@@ -0,0 +1 @@
+specific_ss.add(files('gdbstub.c'))
diff --git a/gdbstub/trace-events b/gdbstub/trace-events
new file mode 100644
index 0000000000..03f0c303bf
--- /dev/null
+++ b/gdbstub/trace-events
@@ -0,0 +1,29 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
+# gdbstub.c
+gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
+gdbstub_op_exiting(uint8_t code) "notifying exit with code=0x%02x"
+gdbstub_op_continue(void) "Continuing all CPUs"
+gdbstub_op_continue_cpu(int cpu_index) "Continuing CPU %d"
+gdbstub_op_stepping(int cpu_index) "Stepping CPU %d"
+gdbstub_op_extra_info(const char *info) "Thread extra info: %s"
+gdbstub_hit_watchpoint(const char *type, int cpu_gdb_index, uint64_t vaddr) "Watchpoint hit, type=\"%s\" cpu=%d, vaddr=0x%" PRIx64 ""
+gdbstub_hit_internal_error(void) "RUN_STATE_INTERNAL_ERROR"
+gdbstub_hit_break(void) "RUN_STATE_DEBUG"
+gdbstub_hit_paused(void) "RUN_STATE_PAUSED"
+gdbstub_hit_shutdown(void) "RUN_STATE_SHUTDOWN"
+gdbstub_hit_io_error(void) "RUN_STATE_IO_ERROR"
+gdbstub_hit_watchdog(void) "RUN_STATE_WATCHDOG"
+gdbstub_hit_unknown(int state) "Unknown run state=0x%x"
+gdbstub_io_reply(const char *message) "Sent: %s"
+gdbstub_io_binaryreply(size_t ofs, const char *line) "0x%04zx: %s"
+gdbstub_io_command(const char *command) "Received: %s"
+gdbstub_io_got_ack(void) "Got ACK"
+gdbstub_io_got_unexpected(uint8_t ch) "Got 0x%02x when expecting ACK/NACK"
+gdbstub_err_got_nack(void) "Got NACK, retransmitting"
+gdbstub_err_garbage(uint8_t ch) "received garbage between packets: 0x%02x"
+gdbstub_err_overrun(void) "command buffer overrun, dropping command"
+gdbstub_err_invalid_repeat(uint8_t ch) "got invalid RLE count: 0x%02x"
+gdbstub_err_invalid_rle(void) "got invalid RLE sequence"
+gdbstub_err_checksum_invalid(uint8_t ch) "got invalid command checksum digit: 0x%02x"
+gdbstub_err_checksum_incorrect(uint8_t expected, uint8_t got) "got command packet with incorrect checksum, expected=0x%02x, received=0x%02x"
diff --git a/trace-events b/trace-events
index bc71006675..035f3d570d 100644
--- a/trace-events
+++ b/trace-events
@@ -46,34 +46,6 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
 
-# gdbstub.c
-gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
-gdbstub_op_exiting(uint8_t code) "notifying exit with code=0x%02x"
-gdbstub_op_continue(void) "Continuing all CPUs"
-gdbstub_op_continue_cpu(int cpu_index) "Continuing CPU %d"
-gdbstub_op_stepping(int cpu_index) "Stepping CPU %d"
-gdbstub_op_extra_info(const char *info) "Thread extra info: %s"
-gdbstub_hit_watchpoint(const char *type, int cpu_gdb_index, uint64_t vaddr) "Watchpoint hit, type=\"%s\" cpu=%d, vaddr=0x%" PRIx64 ""
-gdbstub_hit_internal_error(void) "RUN_STATE_INTERNAL_ERROR"
-gdbstub_hit_break(void) "RUN_STATE_DEBUG"
-gdbstub_hit_paused(void) "RUN_STATE_PAUSED"
-gdbstub_hit_shutdown(void) "RUN_STATE_SHUTDOWN"
-gdbstub_hit_io_error(void) "RUN_STATE_IO_ERROR"
-gdbstub_hit_watchdog(void) "RUN_STATE_WATCHDOG"
-gdbstub_hit_unknown(int state) "Unknown run state=0x%x"
-gdbstub_io_reply(const char *message) "Sent: %s"
-gdbstub_io_binaryreply(size_t ofs, const char *line) "0x%04zx: %s"
-gdbstub_io_command(const char *command) "Received: %s"
-gdbstub_io_got_ack(void) "Got ACK"
-gdbstub_io_got_unexpected(uint8_t ch) "Got 0x%02x when expecting ACK/NACK"
-gdbstub_err_got_nack(void) "Got NACK, retransmitting"
-gdbstub_err_garbage(uint8_t ch) "received garbage between packets: 0x%02x"
-gdbstub_err_overrun(void) "command buffer overrun, dropping command"
-gdbstub_err_invalid_repeat(uint8_t ch) "got invalid RLE count: 0x%02x"
-gdbstub_err_invalid_rle(void) "got invalid RLE sequence"
-gdbstub_err_checksum_invalid(uint8_t ch) "got invalid command checksum digit: 0x%02x"
-gdbstub_err_checksum_incorrect(uint8_t expected, uint8_t got) "got command packet with incorrect checksum, expected=0x%02x, received=0x%02x"
-
 # job.c
 job_state_transition(void *job,  int ret, const char *legal, const char *s0, const char *s1) "job %p (ret: %d) attempting %s transition (%s-->%s)"
 job_apply_verb(void *job, const char *state, const char *verb, const char *legal) "job %p in state %s; applying verb %s (%s)"
-- 
2.34.1


