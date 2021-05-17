Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E6382BB4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:03:15 +0200 (CEST)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libxq-0006Oq-9V
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libr9-0004HK-N8
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libr7-00034q-LD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z17so6075903wrq.7
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=beAyqo4khbDHbaVb949CqGnk/6fQrvukzuYEC9WsMck=;
 b=JRY1NAieOPp/dBnMJEmPysFuZB3xGnjgVH61HrHtiElyqCVaqkrCDhfuBby3TNJ30R
 aABaFXwzjgXo/JqHYMrqkRTZQGkKuZatKVnl+QONCAKibQdodPTbnWlmBzWqmZadLT6l
 xSKZNWDU7dteRuftvnIw3jMjcjZNUy+fTthMJsm506PvWKH3+w0E51kIYmjr6r0Pn7uw
 RGAnKSG7INXM9ge6uwJDbAJY+G0Y12P6usKk8D/d5GCkLot7ZkMEw8jxskLwfZcl29vm
 sqWLsI5ZIfMbjl8mOxYvj+y5VH3iNRe79YcGbIIFt1CSAL3TJ6UUkD3YN9VUOglN7fPi
 qpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=beAyqo4khbDHbaVb949CqGnk/6fQrvukzuYEC9WsMck=;
 b=VRhFggHw9nJuct17fYdoQshtGmUo1c6y7fauMYOuZ80u5XyghaDnCuGg4BNZAfCB62
 bRoxAq9f0b2XKOoGmW5mrZOZuIvZ0fTQvhIN+EjJE0DtAo8X8a62gkkx9IPKIS+Ba602
 AU2/Z+Ca9T0Ko26bNZ5zIOjpLyIbA8A06bsTYNyXlsUOQAU1K1Ke9btdu4yYiVjaf8fB
 +ifKZ+/jatmpYlyKwEk7WIMK/fHY1Av8HGibm9+YQvVuX7NF7uBxVXdxQE3GKNdTQeS1
 s33OXDppp2fy8WFmpxajiGbDs+9icW8HndAasDLGmdzGG63+rgNkdejqPeLX3waBrzsj
 w3NA==
X-Gm-Message-State: AOAM532hHT/BEoapiHRx+t58ebLr18030cgDeGkWIn6BcgYdI3h1rj4B
 bnTh+UV+PY5FUVLlaJ8pf5+iSq0jwJBhGA==
X-Google-Smtp-Source: ABdhPJxqxc6ewOrse+3AEqCoD+AeX2NuUq3cDBb/DWs4OuBlHH1TxtZvjCJhwsX2WX2tpgaWUceYgg==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr765179wrj.175.1621252576149;
 Mon, 17 May 2021 04:56:16 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t18sm14339758wmq.19.2021.05.17.04.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:56:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/15] exec/gdbstub: Make gdb_exit() / gdb_set_stop_cpu()
 target agnostic
Date: Mon, 17 May 2021 13:55:20 +0200
Message-Id: <20210517115525.1088693-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gdb_exit() and gdb_set_stop_cpu() prototypes don't have to be
target specific. Remove this limitation to be able to build
softmmu/cpus.c and softmmu/runstate.c once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/gdbstub.h | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index a024a0350df..84b1f2ff2aa 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -45,17 +45,6 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
  */
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
-void gdb_set_stop_cpu(CPUState *cpu);
-
-/**
- * gdb_exit: exit gdb session, reporting inferior status
- * @code: exit code reported
- *
- * This closes the session and sends a final packet to GDB reporting
- * the exit status of the program. It also cleans up any connections
- * detritus before returning.
- */
-void gdb_exit(int code);
 
 #ifdef CONFIG_USER_ONLY
 /**
@@ -177,6 +166,18 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
  */
 int gdbserver_start(const char *port_or_device);
 
+/**
+ * gdb_exit: exit gdb session, reporting inferior status
+ * @code: exit code reported
+ *
+ * This closes the session and sends a final packet to GDB reporting
+ * the exit status of the program. It also cleans up any connections
+ * detritus before returning.
+ */
+void gdb_exit(int code);
+
+void gdb_set_stop_cpu(CPUState *cpu);
+
 /**
  * gdb_has_xml:
  * This is an ugly hack to cope with both new and old gdb.
-- 
2.26.3


