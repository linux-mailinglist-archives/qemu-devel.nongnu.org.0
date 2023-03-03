Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E736A8F79
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvck-0007T7-3z; Thu, 02 Mar 2023 21:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvch-0007Rn-Lu
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:19 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvce-0001mZ-Bf
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:19 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so4851598pjh.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ml/lxlPsGZ237YP0vQijC9mH3S52wrxh+gLuRleZguY=;
 b=NUnIy20LGnEP/1vY3HMnYooszgnMBv2svb75F64iQhCevUdpJc+szWcujV3BgNfMKV
 E7ieC0VjgVljadSCgf8Q6Ne/mJE8E4kdo7jAdv+vxmIs17BF+e0UVnegC9ohwoCMW+8z
 A54S27MJpCPkd2g1Irc33pIZ99HbMBVUFofaqQKUIrKg5OM+XzoV4dbZLY1bsWhbLKlL
 JoANFIe4+UANDC/q5Xe4im8CmmigxbKIY9Ss9GhyKE4YmzMXs0yDMYzblQESfDGhRnEF
 MTGmEUZW7Tv4e9A+5rClanHWtw+JhpzAXiA5rlRdCIwNzVtXJuHUWx7BF8Aa5FqQvgiM
 RMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ml/lxlPsGZ237YP0vQijC9mH3S52wrxh+gLuRleZguY=;
 b=NOsG8qnL+RnJZagE8XyqJT1n/tYfAsGLMoNwDI6hYQU5UubeITaKEbogS3xcuAYjJE
 vEkwgHFDsKbylKavEJxfi26z2FWCixGVc5MexqbiwKetYjqFe/Yf/MVAixFVlo44ad/N
 45pvLnNIMVx6jXQcx9k73MJYKmFwNMT84xj8hxvy4cgzhDUp+hQtaVvFze1wwq3o+WRv
 BYcpJQYCSdhKE+gDAOxCLb/+2V8blZChvMKe3Uh5+uYKcO7TZhfB+eP0WohIWJ1YZIAE
 pz/GbjdoTSaPVxXJikE/YMIsdn1Z00G0k7RDmiPiQeqCV7PaGgJBGxcT7Mz6B6GJ/d9U
 vAtw==
X-Gm-Message-State: AO0yUKVQUMTn/6m7X1Vvgt1xGZ3impyTXIy+UxkqIVNRK5KJ4Do737+W
 dmyFJeQJuGAtzkdpwA02x0o9m69zP/8NsDAj5XM=
X-Google-Smtp-Source: AK7set9HwVmWyOFKFfWtMXFe27MetJgf00FDTLwbWxl1oEI5D6TBGZ5x/NwY8avnQLwBg1gy+D9yhQ==
X-Received: by 2002:a17:902:c40b:b0:19e:8bfe:7d68 with SMTP id
 k11-20020a170902c40b00b0019e8bfe7d68mr711206plk.11.1677812294264; 
 Thu, 02 Mar 2023 18:58:14 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 08/29] gdbstub: move fromhex/tohex routines to internals
Date: Thu,  2 Mar 2023 18:57:44 -0800
Message-Id: <20230303025805.625589-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

These will be needed from multiple places in the code. They are
declared as inline so move to the header and fix up to modern coding
style.

The only other place that messes with hex stuff at the moment is the
URI handling in utils but that would be more code churn so leave for
now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-9-alex.bennee@linaro.org>
---
 gdbstub/internals.h | 27 +++++++++++++++++++++++++++
 gdbstub/gdbstub.c   | 20 --------------------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 32daaf73a3..b4620f99c4 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -57,6 +57,33 @@ typedef struct GDBState {
     int supported_sstep_flags;
 } GDBState;
 
+
+/*
+ * Inline utility function, convert from int to hex and back
+ */
+
+static inline int fromhex(int v)
+{
+    if (v >= '0' && v <= '9') {
+        return v - '0';
+    } else if (v >= 'A' && v <= 'F') {
+        return v - 'A' + 10;
+    } else if (v >= 'a' && v <= 'f') {
+        return v - 'a' + 10;
+    } else {
+        return 0;
+    }
+}
+
+static inline int tohex(int v)
+{
+    if (v < 10) {
+        return v + '0';
+    } else {
+        return v - 10 + 'a';
+    }
+}
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index abb1777e73..ba46ed73b3 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -546,26 +546,6 @@ static void put_buffer(const uint8_t *buf, int len)
 #endif
 }
 
-static inline int fromhex(int v)
-{
-    if (v >= '0' && v <= '9')
-        return v - '0';
-    else if (v >= 'A' && v <= 'F')
-        return v - 'A' + 10;
-    else if (v >= 'a' && v <= 'f')
-        return v - 'a' + 10;
-    else
-        return 0;
-}
-
-static inline int tohex(int v)
-{
-    if (v < 10)
-        return v + '0';
-    else
-        return v - 10 + 'a';
-}
-
 /* writes 2*len+1 bytes in buf */
 static void memtohex(GString *buf, const uint8_t *mem, int len)
 {
-- 
2.34.1


