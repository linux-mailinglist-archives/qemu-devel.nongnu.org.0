Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D86A8943
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 20:13:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXoIa-0007Rt-Fg; Thu, 02 Mar 2023 14:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIY-0007Qq-ID
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:09:02 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIN-0004WA-Qf
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:09:02 -0500
Received: by mail-wr1-x42e.google.com with SMTP id g3so132682wri.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 11:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffhXR90TVSQnNHTvhKRNefIM4mYQZlD8n+lh28Il+5U=;
 b=JfTTt2YCfJVrPhi7siSMIrk9/oCHPtVzmIfNVnF2IKJ8ahWHpRsGUoaBwl7kBHskWy
 ZBhVBc49Zrfxr4MxIFZ/OjBJk52s7AkdqTyyyzmyVYh75Y8DyxcsiXmyw87UlsRxHXBn
 ppuVfhF+k+oR2X9HsQjWeLR/EF9ROr9KmOpYZ3OAWOynwlakrimJT4Kj9EqpqbUtLzAq
 YqywemGGb1zVogr2CjiVSxiPOfE7Pgi6fEXKGGq6tzy09zWYrTNH11f9pVDWscdu8WTo
 tuJKh+x+AcB2LZOmV3hBDTY/CDqtlSxyaX8LhcLwvqL1wC9zssntvu+95Vf9EdFte8Yw
 b7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffhXR90TVSQnNHTvhKRNefIM4mYQZlD8n+lh28Il+5U=;
 b=QeLI1zYO7mNxj0xltUt2ammK8jBjl6qMfTsZ4KFZIxrcj6lLbT+AEG3ZPpbsLO+XLG
 X/TP0PhWIJhz0uvUu+5s1FiNuK3a0ICAIMhgdMLAO78yBmAf0EOV+zwocJoNMNwGButQ
 cD8WbmIriYHhXVkDuRPxzex5k55kFWMkSWv+YNaT2Q9uH/zn8alghkgMtyl8mHf3P8NV
 iIsxlZMOwmf8L9oui7tFhceL1PJHRoEJpEkYMgjRoFCX+YwvbS4DYpwgRDhuRwkBv7Eo
 6ZivZ2Hb8PRJ61JIU8Km931idR+PHS+iTugAFPeOh6vD4eEJHxcFKeSmF2v2loypeQLv
 /6Gw==
X-Gm-Message-State: AO0yUKVATA8bUIf+SDnMHf1Gqdd9lLrl4Z9CmM/jmBHDVAqWDsRdidle
 H4p8XtBMRHW9YXaVIwask+hDTA==
X-Google-Smtp-Source: AK7set+zt5nNBDnpxALDca4/tHaihplVbBGjp2gAIRRccOGPEVHSHVyfgHbc6nz6I5XxJoxKe8LvkQ==
X-Received: by 2002:adf:e98e:0:b0:2c5:9c7a:866 with SMTP id
 h14-20020adfe98e000000b002c59c7a0866mr7862710wrm.51.1677784129988; 
 Thu, 02 Mar 2023 11:08:49 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f9-20020adfdb49000000b002c59c6abc10sm115801wrj.115.2023.03.02.11.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:08:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E7901FFBE;
 Thu,  2 Mar 2023 19:08:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 nicolas.eder@lauterbach.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Marek Vasut <marex@denx.de>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 mads@ynddal.dk, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 06/26] gdbstub: move GDBState to shared internals header
Date: Thu,  2 Mar 2023 19:08:26 +0000
Message-Id: <20230302190846.2593720-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

We are about to split softmmu and user mode helpers into different
files. To facilitate this we will need to share access to the GDBState
between those files.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - as we split user/system state earlier we can remove the #define hack
---
 gdbstub/internals.h | 50 +++++++++++++++++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c   | 42 -------------------------------------
 2 files changed, 50 insertions(+), 42 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 7df0e11c47..32daaf73a3 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -11,6 +11,56 @@
 
 #include "exec/cpu-common.h"
 
+#define MAX_PACKET_LENGTH 4096
+
+/*
+ * Shared structures and definitions
+ */
+
+typedef struct GDBProcess {
+    uint32_t pid;
+    bool attached;
+
+    char target_xml[1024];
+} GDBProcess;
+
+enum RSState {
+    RS_INACTIVE,
+    RS_IDLE,
+    RS_GETLINE,
+    RS_GETLINE_ESC,
+    RS_GETLINE_RLE,
+    RS_CHKSUM1,
+    RS_CHKSUM2,
+};
+
+typedef struct GDBState {
+    bool init;       /* have we been initialised? */
+    CPUState *c_cpu; /* current CPU for step/continue ops */
+    CPUState *g_cpu; /* current CPU for other ops */
+    CPUState *query_cpu; /* for q{f|s}ThreadInfo */
+    enum RSState state; /* parsing state */
+    char line_buf[MAX_PACKET_LENGTH];
+    int line_buf_index;
+    int line_sum; /* running checksum */
+    int line_csum; /* checksum at the end of the packet */
+    GByteArray *last_packet;
+    int signal;
+    bool multiprocess;
+    GDBProcess *processes;
+    int process_num;
+    char syscall_buf[256];
+    gdb_syscall_complete_cb current_syscall_cb;
+    GString *str_buf;
+    GByteArray *mem_buf;
+    int sstep_flags;
+    int supported_sstep_flags;
+} GDBState;
+
+/*
+ * Break/Watch point support - there is an implementation for softmmu
+ * and user mode.
+ */
 bool gdb_supports_guest_debug(void);
 int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 1e6f8978b5..ef506faa8e 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -41,8 +41,6 @@
 #include "hw/boards.h"
 #endif
 
-#define MAX_PACKET_LENGTH 4096
-
 #include "qemu/sockets.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
@@ -325,23 +323,6 @@ typedef struct GDBRegisterState {
     struct GDBRegisterState *next;
 } GDBRegisterState;
 
-typedef struct GDBProcess {
-    uint32_t pid;
-    bool attached;
-
-    char target_xml[1024];
-} GDBProcess;
-
-enum RSState {
-    RS_INACTIVE,
-    RS_IDLE,
-    RS_GETLINE,
-    RS_GETLINE_ESC,
-    RS_GETLINE_RLE,
-    RS_CHKSUM1,
-    RS_CHKSUM2,
-};
-
 #ifdef CONFIG_USER_ONLY
 typedef struct {
     int fd;
@@ -357,29 +338,6 @@ typedef struct {
 static GDBSystemState gdbserver_system_state;
 #endif
 
-typedef struct GDBState {
-    bool init;       /* have we been initialised? */
-    CPUState *c_cpu; /* current CPU for step/continue ops */
-    CPUState *g_cpu; /* current CPU for other ops */
-    CPUState *query_cpu; /* for q{f|s}ThreadInfo */
-    enum RSState state; /* parsing state */
-    char line_buf[MAX_PACKET_LENGTH];
-    int line_buf_index;
-    int line_sum; /* running checksum */
-    int line_csum; /* checksum at the end of the packet */
-    GByteArray *last_packet;
-    int signal;
-    bool multiprocess;
-    GDBProcess *processes;
-    int process_num;
-    char syscall_buf[256];
-    gdb_syscall_complete_cb current_syscall_cb;
-    GString *str_buf;
-    GByteArray *mem_buf;
-    int sstep_flags;
-    int supported_sstep_flags;
-} GDBState;
-
 static GDBState gdbserver_state;
 
 static void init_gdbserver_state(void)
-- 
2.39.2


