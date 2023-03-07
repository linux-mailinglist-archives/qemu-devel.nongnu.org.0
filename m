Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7615B6AF779
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:23:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekw-0001la-G1; Tue, 07 Mar 2023 16:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekn-0001gg-Q8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:50 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekl-00082z-1A
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l25so13529203wrb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9uK4DB/9AQ/WafaUijeMaeKXdnxqc/WLSOPO7lES7c=;
 b=bEX5EvQN/n/tCNul7fyazxvOEDcLkPethvwnYPrkPhsLs+GspPbZS+uL4ASe9T1dK+
 6YraEQ85P4EFzyCWnMY643z8PzQyTXauuqMI3z420K5fQi5PjzrtCybaq6dTzqbLo+cD
 12s90gcQPhQxUN478URW64UJ8FfOJmtP13QbK0MA1nmdQ6X2vaWn3i3LolIBs2xXorAm
 y5JKa8I68GZAEPKUwj9N6/+kpGD9A/mvqcqiSjbFaaTeiVVgouoOXII3CFrAVrazG5iK
 xwwB2hMJdGaQ6w3kIh+3xpni48VkddIOaPHv+4/xl+UsyBB6LPk4D1NmvBzIhiKHpmW1
 leyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9uK4DB/9AQ/WafaUijeMaeKXdnxqc/WLSOPO7lES7c=;
 b=2SKNthLChe6QvX1o3u0XVw1XDNfVZtnJt4+v9WgkttQ1reSlW/Arbdx8Gze06bfTl0
 QBVl/r95okumx7YCpEqp9YL8hJrv9CWA3tGj+LQ448kqr6PnQ5YZTVD2+JkCpCr0vYRR
 BB2dzYRlRzO0JjZocHDeRNrBbv19T4y8eU8hOmzQs9Pvqrho3EscfkAffEY18RGn177S
 L5FvOQ8GCSuJDB9bFuYaY+BxnLQB6gPUWk+47vvKyi8vQLUF5t5mldNthaPT4GptnGEa
 ST80rAL6HIctu58//XU3ZA0OXlt2bC8zmxh3ZgH+a7XgB7vs8oZ9H7CIOtWN89BLvrJX
 IjWg==
X-Gm-Message-State: AO0yUKVS75OduWyS/uIq0K5uy48qsvgXX1I2R8JKOjEyo4lPRrE2HLVU
 9yLuQDQ5TShLaCwTyTvX8zxQBw==
X-Google-Smtp-Source: AK7set8FW/lFF95kqjY4+ejEUhOfLGSDzCnafjpjAgXql4bzCuqxQEiIpebG5QK2d7GIL2XER8sgKw==
X-Received: by 2002:a5d:6689:0:b0:2c9:993a:ec2a with SMTP id
 l9-20020a5d6689000000b002c9993aec2amr10772901wru.40.1678224105362; 
 Tue, 07 Mar 2023 13:21:45 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a5d4f81000000b002c54e26bca5sm13400517wru.49.2023.03.07.13.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E16891FFC2;
 Tue,  7 Mar 2023 21:21:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 13/30] gdbstub: abstract target specific details from
 gdb_put_packet_binary
Date: Tue,  7 Mar 2023 21:21:22 +0000
Message-Id: <20230307212139.883112-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
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

We unfortunately handle the checking of packet acknowledgement
differently for user and softmmu modes. Abstract the user mode stuff
behind gdb_got_immediate_ack with a stub for softmmu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-14-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-14-richard.henderson@linaro.org>

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 6bd6a05657..6534e373cb 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -110,6 +110,21 @@ void gdb_memtohex(GString *buf, const uint8_t *mem, int len);
 void gdb_memtox(GString *buf, const char *mem, int len);
 void gdb_read_byte(uint8_t ch);
 
+/*
+ * Packet acknowledgement - we handle this slightly differently
+ * between user and softmmu mode, mainly to deal with the differences
+ * between the flexible chardev and the direct fd approaches.
+ *
+ * We currently don't support a negotiated QStartNoAckMode
+ */
+
+/**
+ * gdb_got_immediate_ack() - check ok to continue
+ *
+ * Returns true to continue, false to re-transmit for user only, the
+ * softmmu stub always returns true.
+ */
+bool gdb_got_immediate_ack(void);
 /* utility helpers */
 CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 6907bdc99c..0476ee7039 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -239,15 +239,9 @@ int gdb_put_packet_binary(const char *buf, int len, bool dump)
         gdb_put_buffer(gdbserver_state.last_packet->data,
                    gdbserver_state.last_packet->len);
 
-#ifdef CONFIG_USER_ONLY
-        i = gdb_get_char();
-        if (i < 0)
-            return -1;
-        if (i == '+')
+        if (gdb_got_immediate_ack()) {
             break;
-#else
-        break;
-#endif
+        }
     }
     return 0;
 }
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 6796761fd9..04e75449a2 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -55,6 +55,14 @@ int gdb_get_cpu_index(CPUState *cpu)
     return cpu->cpu_index + 1;
 }
 
+/*
+ * We check the status of the last message in the chardev receive code
+ */
+bool gdb_got_immediate_ack(void)
+{
+    return true;
+}
+
 /*
  * GDB Connection management. For system emulation we do all of this
  * via our existing Chardev infrastructure which allows us to support
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 23b2e726f6..0c8cd028b1 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -54,6 +54,25 @@ int gdb_get_char(void)
     return ch;
 }
 
+bool gdb_got_immediate_ack(void)
+{
+    int i;
+
+    i = gdb_get_char();
+    if (i < 0) {
+        /* no response, continue anyway */
+        return true;
+    }
+
+    if (i == '+') {
+        /* received correctly, continue */
+        return true;
+    }
+
+    /* anything else, including '-' then try again */
+    return false;
+}
+
 void gdb_put_buffer(const uint8_t *buf, int len)
 {
     int ret;
-- 
2.39.2


