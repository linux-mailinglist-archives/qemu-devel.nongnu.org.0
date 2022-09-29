Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AF95EF843
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:05:15 +0200 (CEST)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odv6A-0005Lv-2W
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCx-0007Qc-As
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:03 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCr-0004Ln-PM
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x15so1327097wrv.1
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=G08OEqnNdRDb3E4Rhzf01vHz7RaXGyc7OvATSXoN3oA=;
 b=BRalhmlRYTYBac17H3GGEILO7jy92rnNYKicJpjtXxYmXC3r7aYxHVpHf3Z+NlbxBa
 IwHgPO4t5HBqXle4yKIZqb2MzZZPoZd4+CXXb+TD0L20GK5phv8gNHzutVzFOONC0gvW
 xuq3v7BA3gZfDnYsLzA0X7qJ6SXr+7mNT9uphUXWowz/K+NN7FancxeXAgIyC1OXwzR9
 EksygtIJY2Oumel17HFzIM63U8eRDuFLlkVa95Lf3m/DKpS9luckm+jDlwLjKAzAXhiG
 smV3wQ6HnIbntGhuJbiiahEfBfTIiNRr60b4pf522LoXR5RqaXb9NHd9RJ2FdCeiP4E2
 bngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=G08OEqnNdRDb3E4Rhzf01vHz7RaXGyc7OvATSXoN3oA=;
 b=CrnfFB+kWPhF3hYdMEuBL/qJiuKlYy9TFo2LEfErrzCj7L/UVisNDVQddO+lTO899H
 6JRBNx/BcLtF0FaCb5E1gZFL3elo9eQX8ny5zfitV61GOHB6NhCMZqqwVHgyoc/y3ESD
 d+epf/VHAyo5+9C3j0oYenug7gJL3gjk7V/Q/MLgnkMK2uncKJd3DKQ7r9ZHDOsGToLI
 q9bCAxOzFQ0Ho0Jcso3D226u3FRrMAtMWeV6xubQPkOhohBUKUQAZagT4YATTef5Jbeo
 DEWRTXFLZxN5k9S8kRQLiIOs4du/nYZg8sAaaL+elgtSRHX7Ap/VlhjQ0BklstNpT9Yf
 itiA==
X-Gm-Message-State: ACrzQf0i5tJvzH1U5do/zGRz98gryu76FVrq4w6rSr57NuWW31KjT1so
 PzX4W8BEiVKXuB/A7KLOrp5s4A==
X-Google-Smtp-Source: AMsMyM6BTDkJ9pQAeppv80SYdrf0OcJyx+GEL31jMPYXM3sjAgTTAi6jOliCjWAQNOCmiWKnyPwF0Q==
X-Received: by 2002:a5d:5d89:0:b0:226:e5ca:4bc2 with SMTP id
 ci9-20020a5d5d89000000b00226e5ca4bc2mr1992231wrb.310.1664452792711; 
 Thu, 29 Sep 2022 04:59:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5227000000b0022abcc1e3cesm6937085wra.116.2022.09.29.04.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0FAD71FFDB;
 Thu, 29 Sep 2022 12:42:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v1 42/51] gdbstub: move into its own sub directory
Date: Thu, 29 Sep 2022 12:42:22 +0100
Message-Id: <20220929114231.583801-43-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-Id: <20220927141504.3886314-12-alex.bennee@linaro.org>
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


