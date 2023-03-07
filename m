Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110876AF772
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:23:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekl-0001ZJ-PZ; Tue, 07 Mar 2023 16:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZeki-0001W3-Kv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:44 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekg-00081S-Rl
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:44 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j2so13491155wrh.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IhNsmP78RfjYnYiBJHY265fIGgQNOOilc9WuDCGmLpg=;
 b=fdHEtqIg/r5TUiPbw70VP/HmR6U2+o92bel5KgIeU8prOn0ZEDaQT/VIJv2Hw+LMoX
 LZzrMWAYxCP103W2ZeOUs+6UdOyuI7LdgmQcDNEjnjJ2/7aGk8wpE2WwdOWW+UJaaqZF
 ANv0Putt+hifBOt+SoXZggamxJeSSo46RVrGKB4NyLe08nB8QLEfzqq/fdmbl7Q1gxlc
 j2JeQFuwb0QN71Tt+BvYU0Oc60VTB7lKEnqcT2UWWkqYjHbAyjw9hr8tV0TmWiav9mDv
 rX6Q5kovepVcfOxWOzO4TLbo0XaeBKuf+/pBQFN1omsSjZCyOt3igEstWgZSzrwiafC4
 sJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IhNsmP78RfjYnYiBJHY265fIGgQNOOilc9WuDCGmLpg=;
 b=BOYBtpE1RnSkZx5WE1A/MX7zPW9j0fPk1ckkyw6EvuM8XA4hVv26cRstyYJcn0VDe/
 8unjgmWzvMAlgwPfqm26fe39ckK5lM6xofMncEUKyspyQQZvXjqy87qYwJTT7EvRxUY7
 n/QK+HEourv8ANEgLM64BE+unzB5iEfNeM1CdbiA32tmDvf/+dj+g4yUX9AyKK6NBCUr
 9qOGPN6E/h/v68zmkgqobtwvogfswGqNCm55XaGzrK9y3Y2v6akZik0g/plSZuJBf4AN
 /y17TzKMRv2xCI8+8rMs7A57+2lXfyNa3KIw4hrzElTJLPuyQaNMxre1N6HPa9bnb1hm
 v7GQ==
X-Gm-Message-State: AO0yUKUl8MXzkdtN0LY9jB5HcjUM0gqhRKrZFX6MoLTNLbYcz0MPEoTd
 6nxbTyxXXvKwvK7vzuP3vpJ5Og==
X-Google-Smtp-Source: AK7set+FYDRIfhrskyyPVnSXDOf6eDoccBL5TPb6XGwvxMw3nDt/kfmlact1jYQR/pmNROVPF6OMaA==
X-Received: by 2002:adf:f006:0:b0:2c7:1a96:63f2 with SMTP id
 j6-20020adff006000000b002c71a9663f2mr9707770wro.3.1678224101341; 
 Tue, 07 Mar 2023 13:21:41 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d610b000000b002c5a790e959sm13454074wrt.19.2023.03.07.13.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 96FCF1FFBC;
 Tue,  7 Mar 2023 21:21:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/30] gdbstub: clean-up indent on gdb_exit
Date: Tue,  7 Mar 2023 21:21:13 +0000
Message-Id: <20230307212139.883112-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Otherwise checkpatch will throw a hissy fit on the later patches that
split this function up.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230302190846.2593720-5-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-5-richard.henderson@linaro.org>

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index fb9c49e0fd..63b56f0027 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -3021,27 +3021,27 @@ static void gdb_read_byte(uint8_t ch)
 /* Tell the remote gdb that the process has exited.  */
 void gdb_exit(int code)
 {
-  char buf[4];
+    char buf[4];
 
-  if (!gdbserver_state.init) {
-      return;
-  }
+    if (!gdbserver_state.init) {
+        return;
+    }
 #ifdef CONFIG_USER_ONLY
-  if (gdbserver_state.socket_path) {
-      unlink(gdbserver_state.socket_path);
-  }
-  if (gdbserver_state.fd < 0) {
-      return;
-  }
+    if (gdbserver_state.socket_path) {
+        unlink(gdbserver_state.socket_path);
+    }
+    if (gdbserver_state.fd < 0) {
+        return;
+    }
 #endif
 
-  trace_gdbstub_op_exiting((uint8_t)code);
+    trace_gdbstub_op_exiting((uint8_t)code);
 
-  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-  put_packet(buf);
+    snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
+    put_packet(buf);
 
 #ifndef CONFIG_USER_ONLY
-  qemu_chr_fe_deinit(&gdbserver_state.chr, true);
+    qemu_chr_fe_deinit(&gdbserver_state.chr, true);
 #endif
 }
 
-- 
2.39.2


