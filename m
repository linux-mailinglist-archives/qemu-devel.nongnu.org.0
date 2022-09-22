Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C200F5E6851
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:24:06 +0200 (CEST)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOzc-0005LX-Qz
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNf3-0001Kd-MI
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNex-0000wE-U1
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id n10so15930632wrw.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=z9o2xyA00hgdatFEtcmjPjjMM0wNvRNVxGVmWKD34T8=;
 b=tYIpNMvEPjH8GymyGLT7vp2pAfSalT2BUmseu6X/CHNP5Qj5CCgFTVGWyJ4ftMqieR
 t+rnE8NiPSwmggLzKwGlq3CFN9Js645Wj8tXPOs675maMKZUxNABZyEdCK568dEETbJz
 eONJ8lo2HX2czK8ipgWOSf8NfEaynBdYZG8wVhiuY0MPJPEzqta7FYsvaYEDpREvhH1Z
 kU2Sgyou1aZWvoVc3Q3J9wsGCBq//s5df3AqCrRe+N02B9PtqQtAXI+WqEMyFwLPiQK9
 GVXNwPVQAXgoN8CmaqOBBH7wRSQqA0sOX97tNVd3fo4OmXWt4ZWfzhA0RHgaCaR0/hed
 KwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=z9o2xyA00hgdatFEtcmjPjjMM0wNvRNVxGVmWKD34T8=;
 b=sYas17rPlpS7ecFEOf51UflbMHDR4QDHr7oHoO9wP9p8Tk974/4bTtAHqd96ivIITt
 9OLjmmRmBOSua/F6rslj9RsavZ1RsB7C4EP01zQVfkzQh7+tfo7Ol+mmrb3LI1F/MTKK
 BFRP7nsy/1wYAzcOejL8O++wY9JMWYVtypU3JY9mqThmapIWB9WVTf721Cz5AYnicNpR
 5Tjnc8b/cU+ZQwQchqQwNcnpx/z/erUq5zc0TReWuE19Gw7ehK3eCbRbuJdD+LsGs+Kh
 i8oa7sxbBFstBLQTJ9teil0dXNEQN2uKMqtV0lDnKFJIjy1HamvwOiS+IfKWmd2fFML+
 3zaA==
X-Gm-Message-State: ACrzQf3/duBRNVoPY1ML9mFpnMPoI/L/DvRmcyHJlVMhlFPyEyzBQUEm
 ObD4Bvw80ZO+x3t0kiI1PBysYv2vs78PRQ==
X-Google-Smtp-Source: AMsMyM6DwW77LquQEwS9jyy7TLyD0aniZVNOK/sF3vtbzyVoqrCTi6JCgIHu4J/fvB7aYng83ZsMfw==
X-Received: by 2002:a05:6000:124f:b0:228:8713:ced9 with SMTP id
 j15-20020a056000124f00b002288713ced9mr2401617wrx.198.1663858718263; 
 Thu, 22 Sep 2022 07:58:38 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a5d6250000000b0022ae59d472esm5161211wrv.112.2022.09.22.07.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 07:58:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC0431FFBE;
 Thu, 22 Sep 2022 15:58:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH  v1 6/9] gdbstub: move into its own sub directory
Date: Thu, 22 Sep 2022 15:58:29 +0100
Message-Id: <20220922145832.1934429-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922145832.1934429-1-alex.bennee@linaro.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


