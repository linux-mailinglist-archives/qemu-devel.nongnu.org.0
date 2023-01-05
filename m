Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C3865F160
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTLH-0007Au-Jv; Thu, 05 Jan 2023 11:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTL8-00075S-CR
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:43:38 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKw-0006yx-S4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:43:38 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1777088wms.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EerVrIzCjfEKyD8t5zQfya8CKSRP1ftyfpksI7gVAwM=;
 b=CxU5F4HjJ+2g0oQG+sF5FcV4SezpLQEE9xea3C4OjSkIjoctUdqXTkxRiSJt3hJq5O
 5LPhjmugtEYEMBt/hVNBB6EjDBDkBDonmuRlxL67Zn3sf0WGX4XmglPhwxgaVTpOTopr
 y8xQZO0hzRiSzEJgf7NMQH7sQLuBhoobKqA1QoRiDdzCOXn9fJEvZoJuJhd/RwBYZuND
 giaHlkx9qzC/xFzAI7mL6WfvJA4EhzOCjHtoQeuUSIytBlC4Ydzj0TauVNjIey5M32Az
 GEQ8u13b1GVPSu06SWg1Tdlh1rBy7GFMTpwXZe9S5pUXL+2c+r/eoAACtSfDOHrHdMfx
 NpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EerVrIzCjfEKyD8t5zQfya8CKSRP1ftyfpksI7gVAwM=;
 b=dJ6j5jeefOz9rBH5qPSTpHLQN/04KR003RcQL0yhG4JiPxa3DDK7XotY78EhvdkYN5
 yzUh/e/si+YyDKnxQh3sjMApmCFu0SZHvHIXHSu+8YGuXzYPkKO07LouS/Vn0wxsdIrB
 joywMPGZcBIRdI9a9ayHW1wkuQwDRnOveSChWOkdxRwg4DKn8CLRP3zNZpsNmA3HR5Bz
 iJBgMuGJYLpeDrFF4E3AC19zDrZhz4/lSu0cXND8kJ3rWRD3BJmg9w7vOAq6e3tcobZw
 MIAEC2KDoSby9Fn3BTx7OmOmTssgk43S5r0nrRuAzULeEfTM+ykZyio82eLdhCc15dT1
 7z6Q==
X-Gm-Message-State: AFqh2krL8195xjiyvy2no5J3r+Y8CSQyJ4jaPyrd3IG5K08zp4yQ2Ty2
 fqNWaaEqkK3FEhMId4yU3TzoFQ==
X-Google-Smtp-Source: AMrXdXu5GQDCs1bWMtTlFUIwDsLBYsYCXOLBriFth+j+29zcTa918VF3G3yJzwew37xJbfc8yOMkRg==
X-Received: by 2002:a05:600c:b4d:b0:3d3:5d69:7aa5 with SMTP id
 k13-20020a05600c0b4d00b003d35d697aa5mr35344276wmr.25.1672937005143; 
 Thu, 05 Jan 2023 08:43:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b003b49bd61b19sm3366476wms.15.2023.01.05.08.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D77B01FFC0;
 Thu,  5 Jan 2023 16:43:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 08/21] gdbstub: move fromhex/tohex routines to internals
Date: Thu,  5 Jan 2023 16:43:07 +0000
Message-Id: <20230105164320.2164095-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

These will be needed from multiple places in the code. They are
declared as inline so move to the header and fix up to modern coding
style.

The only other place that messes with hex stuff at the moment is the
URI handling in utils but that would be more code churn so leave for
now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 27 +++++++++++++++++++++++++++
 gdbstub/gdbstub.c   | 20 --------------------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 9784db2dc5..c8bb85cf34 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -74,6 +74,33 @@ typedef struct GDBState {
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
index 92b2f5c3db..d4ee23b51c 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -531,26 +531,6 @@ static void put_buffer(const uint8_t *buf, int len)
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


