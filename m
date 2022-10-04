Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2B55F44DE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:55:32 +0200 (CEST)
Received: from localhost ([::1]:55048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiOR-0005VG-QF
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgU-0007iY-UM
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:07 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgS-0000B6-OD
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id bk15so21238181wrb.13
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IiROcdgqykUU3sm/aV8gw0RCaDZ8buQu6BrAfYeGbsk=;
 b=RiA8jllboB5tecWk9tBvjWpZE+uVEdSc0XJdpzFIKOWCc3lS6lDaxeQOy6uPsYyieG
 5tEyqHCci7umC0KcKC/UIbHlRrpLkqA+AtKYzVkYR+I7W11pBbcR+lpDMlfgUNuaBnus
 942yg+Oca1MEP+aeE4595MqpTB9cbyBRGzR8lQ1tqXFcq2/gtsCrwJh3AK4ncjsFcNZh
 XbZy3N/rmKsJSSph9m++DRIb+Z2rA6ZqmNREHlZIXNbvNNvMIv9Yr01ic5vImwmsGpmW
 /GsHYfqUAITKqaGAYhMaQkbBCpKk/zXiExjZy0660O+hwiwO7lxrUWu8+rBo19kC3qTp
 YgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IiROcdgqykUU3sm/aV8gw0RCaDZ8buQu6BrAfYeGbsk=;
 b=kv209SI7FIVmiRQMxFC9o9CiMwQXb0S4pRWNfarSTNvM6I76RrxeG1JZB/3+r5JuXJ
 F6Zz0wkxJ0oL9DBm7cK1fPJQ10ivmSQ98C/aX4E2QlLUibbSxACqatMc+xn5zKNWldjX
 fxMhsIf4ixOjuWI+EjG1/CqJgUQLIs7uZ1jaiR2cuwf7JR1WtkrdZQiFuKGmkwpp+vEu
 cJ0oWrZbM5rWJmX2ElJhEJ7fv98MfJXeLh7Wtdc71+geB+Wzb54HOMJYuzYDbHQROmXW
 eb0xnjyGiMIUulNdoLmFzBvQ/NnVNHxiJsNXmD2E2k4yd4nhlJ+o2yw358gh1nPQ+4Sg
 iB3w==
X-Gm-Message-State: ACrzQf34IcCUkZpDXSAdnVPAS+iu/CIke4iKHpKIcvNfKGMQLt15yicx
 lNhvxOOL6KQ5MvhqPrZgrcSAJNYOxNMTOQ==
X-Google-Smtp-Source: AMsMyM4gOtwfN0PeGNmMrSGOug3SrfdAjHTznV50fhNgNrFvHuLmw67rhIp9tluAv80FpObOK27OsQ==
X-Received: by 2002:a05:6000:18c7:b0:22e:5503:9c46 with SMTP id
 w7-20020a05600018c700b0022e55039c46mr1344062wrq.668.1664889002881; 
 Tue, 04 Oct 2022 06:10:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay26-20020a05600c1e1a00b003b4868eb6bbsm19282333wmb.23.2022.10.04.06.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:10:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B38A1FFDD;
 Tue,  4 Oct 2022 14:01:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 42/54] gdbstub: move into its own sub directory
Date: Tue,  4 Oct 2022 14:01:26 +0100
Message-Id: <20221004130138.2299307-43-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Message-Id: <20220929114231.583801-43-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index ac5ef05c21..73646558db 100644
--- a/meson.build
+++ b/meson.build
@@ -2837,6 +2837,7 @@ trace_events_subdirs = [
   'qom',
   'monitor',
   'util',
+  'gdbstub',
 ]
 if have_linux_user
   trace_events_subdirs += [ 'linux-user' ]
@@ -2960,6 +2961,7 @@ subdir('authz')
 subdir('crypto')
 subdir('ui')
 subdir('hw')
+subdir('gdbstub')
 
 
 if enable_modules
@@ -3037,7 +3039,7 @@ common_ss.add(files('cpus-common.c'))
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
index 789172b2a8..e1530b51a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2677,7 +2677,7 @@ GDB stub
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


