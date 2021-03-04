Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34BE32D6A7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:29:13 +0100 (CET)
Received: from localhost ([::1]:53860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpua-0006FJ-Sr
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHprr-0004TX-1v
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:26:23 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHprp-0007sk-Ei
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:26:22 -0500
Received: by mail-wm1-x32b.google.com with SMTP id k66so10095569wmf.1
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dwFY6/nAJ0ZvzzLdKjxlnYisXjMm8PVxRfW0L/wwFHg=;
 b=JhmJh53r6CudbqtrwUfmO43N05X2fjVJ+YhelIWEsuveJMzB/kyuR6bebRpIXQw9oW
 9h210rD1gx2LVQFLjhoGULwNAZjKbiDLBXDfBC2GVYy8ZXcNVxAfxJ4B6hHvaQdKhORg
 Sx5uKxy/1rMOBdIt2YJAvuLazHIsEWCoTm/xsqf2lxC9vLTHp5nJAAjuLSzO7CWtluSb
 qlRzHf2plLwmCNEUTJ0Iv0w0zOQb0WfAenz13ZTZ4pqllXRszaXWCPFHDNZTIkaH1H6b
 zRmcC1kBQLfVgsuH+FjZZL1AikzsrzvJo2NmQYyHQsEWX9aq0WNHXb09w5AMPBAGNKKl
 T+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dwFY6/nAJ0ZvzzLdKjxlnYisXjMm8PVxRfW0L/wwFHg=;
 b=qi5QJugYPzOkYuRYdvjiE0mvBNT+jfeeLQjhSidi67ulJxfMYoNKC8GqEAAfP/WUC1
 deNQH3JyyrRCY2TqyOG8CUPdx2RHSXVPAJ9RheAg/vmlqWsHTz2JL8vrDvEh7LjHYBal
 Xn6ShlO0CmDV+7wLxWOXiopzkr0oX4N5U9VyorhcLWXr3AHYU0eW5zlkgIddhyDF+/o2
 ty6mpNgKty6GOYMaiMPxAoAgdJjvzBkE8sGN1oCgDL/27RybwE5K+4/5dj8APHHJXzZn
 /iwZLn3HgD+TLGstajvNbhwR0qPCaIUIKvfLZdqdoSHsHJSwCZsfJLTPZHiD2FqBU++J
 0qyw==
X-Gm-Message-State: AOAM532foUk3JmKTncdSAYC0c4c8UlMtSw9v6Ewa+o22g8ZpCqAL7Bf9
 E/auDeTuX1aOtn0VFCrVfFSb9WJVgJM=
X-Google-Smtp-Source: ABdhPJyaa5DSOzFOzRl1x3d9eAZt7ULWXFXYaib24BKwhAtpz4/Xut4VOr+xcl4RC7pe4zqAnt0aAA==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr4562094wmq.143.1614871579669; 
 Thu, 04 Mar 2021 07:26:19 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z3sm37644876wrw.96.2021.03.04.07.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 07:26:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/3] cpu: Forward-declare user-mode TaskState structure
Date: Thu,  4 Mar 2021 16:26:06 +0100
Message-Id: <20210304152607.1817648-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304152607.1817648-1-f4bug@amsat.org>
References: <20210304152607.1817648-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TaskState structure is only used by user emulation.
Currently it is hold in CPUState as a void pointer and
casted in user-specific code. In order to simplify by
- renaming this generic field
- remove the casts
in the next commit, forward-declare the type in "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/qemu.h       | 4 ++--
 include/hw/core/cpu.h | 7 +++++--
 linux-user/qemu.h     | 4 ++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 1ec14010216..00e76ad856e 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -83,7 +83,7 @@ struct emulated_sigtable {
 
 /* NOTE: we force a big alignment so that the stack stored after is
    aligned too */
-typedef struct TaskState {
+struct TaskState {
     pid_t ts_tid;     /* tid (or pid) of this task */
 
     struct TaskState *next;
@@ -96,7 +96,7 @@ typedef struct TaskState {
     int signal_pending; /* non zero if a signal may be pending */
 
     uint8_t stack[];
-} QEMU_ALIGNED(16) TaskState;
+} QEMU_ALIGNED(16);
 
 void init_task_state(TaskState *ts);
 extern const char *qemu_uname_release;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d8..f4d2169cc8e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -274,6 +274,9 @@ struct qemu_work_item;
 #define CPU_UNSET_NUMA_NODE_ID -1
 #define CPU_TRACE_DSTATE_MAX_EVENTS 32
 
+/* See bsd-user/qemu.h and linux-user/qemu.h */
+typedef struct TaskState TaskState;
+
 /**
  * CPUState:
  * @cpu_index: CPU index (informative).
@@ -310,7 +313,7 @@ struct qemu_work_item;
  * @gdb_num_regs: Number of total registers accessible to GDB.
  * @gdb_num_g_regs: Number of registers in GDB 'g' packets.
  * @next_cpu: Next CPU sharing TB cache.
- * @opaque: User data.
+ * @opaque: User task data.
  * @mem_io_pc: Host Program Counter at which the memory was accessed.
  * @kvm_fd: vCPU file descriptor for KVM.
  * @work_mutex: Lock to prevent multiple access to @work_list.
@@ -386,7 +389,7 @@ struct CPUState {
     QTAILQ_HEAD(, CPUWatchpoint) watchpoints;
     CPUWatchpoint *watchpoint_hit;
 
-    void *opaque;
+    TaskState *opaque;
 
     /* In order to avoid passing too many arguments to the MMIO helpers,
      * we store some rarely used information in the CPU context.
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index d7815bfb845..5394f726892 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -100,7 +100,7 @@ struct emulated_sigtable {
 
 /* NOTE: we force a big alignment so that the stack stored after is
    aligned too */
-typedef struct TaskState {
+struct TaskState {
     pid_t ts_tid;     /* tid (or pid) of this task */
 #ifdef TARGET_ARM
 # ifdef TARGET_ABI32
@@ -157,7 +157,7 @@ typedef struct TaskState {
 
     /* This thread's sigaltstack, if it has one */
     struct target_sigaltstack sigaltstack_used;
-} QEMU_ALIGNED(16) TaskState;
+} QEMU_ALIGNED(16);
 
 extern char *exec_path;
 void init_task_state(TaskState *ts);
-- 
2.26.2


