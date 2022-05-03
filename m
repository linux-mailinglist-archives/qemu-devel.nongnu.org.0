Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41245518EED
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:37:12 +0200 (CEST)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzGh-0003li-2f
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWY-0002NN-1v
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:30 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWU-0003dI-RY
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:29 -0400
Received: by mail-pj1-x1034.google.com with SMTP id e24so16250405pjt.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=U2oK2ipOEqoaAfOulrRTtOQB2zK3TVTPXCClS/WGFgs=;
 b=am4G/MPvBfaGx4cDAOFyEwqqXcKc6dzYNglM1D6b9dwH/PFw0amtqe/c9TTT3GVXYm
 agB86Bf4TNjVY5iBwZOLeCIuPL+lnVlYvHx/9P0SCpwAJmxnyj9cb2CsJf0CDeUrjMop
 5IMAY3mvnERzDv3zsoGuW0EDgRqatjBFRuSe4U50vY3kJ+GROMBNDEJuRB46VEKSl3+2
 kM81i4N9qcN10osIl9evCD4k4Gx62UAjw2gP5JMKRz2mdKLLFDukawwrzwwrCsNNnn7a
 p4RDY1NdF+ElJ+AlMGw/CXwIzkNly9/dtPb3ZveqGCxng/hChGKs7EcsyG8IIplJd9rO
 r89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2oK2ipOEqoaAfOulrRTtOQB2zK3TVTPXCClS/WGFgs=;
 b=3RZJisB/RNwCrys3dIWGVKaEptUkrImBvoAuiYBEP9XWR+7KHrmKgd1Gvt18QbDB/e
 c4zr4GPweR5qd0jsrt0yXcBQm7eLRUXAwAsSlnwh0CtnPoqLeslA7cQPx/2SRzxg/G6N
 q/U1dTGjF1HChM3pTU7YMkyiDtrgyZD3XNJKxPDBjQhw5w0dYka9OKUPiiyZwWZrovhj
 0riS+njP2h4jCCfhVzYHWDdATn3A6EespH5ODxHe+whhz/PUvIRoEU+j/sG+pFTYZvu1
 D1Pjwe/RbHha0Z8jWbHmkZkDQ8r+iZTIQGYBV+uj0pGGeJRYfrEC6kgH5epkv06PeV5G
 mh7w==
X-Gm-Message-State: AOAM530mxbjE2pkTCtHKk27ZjiSnJJF0g085mt4V0wxZLFO63c1lqWbJ
 1+zmNqAq9pKu5HeRKXIVxW0tkT8ZCxf/mA==
X-Google-Smtp-Source: ABdhPJypQDtTIvsmATA2+EVS8GpZ8aO4i1/3juV7PTRVZSJrdZzvruRDQSlEj/VY4v+7UJk9S8CDag==
X-Received: by 2002:a17:90a:8b91:b0:1be:db25:eecd with SMTP id
 z17-20020a17090a8b9100b001bedb25eecdmr6459833pjn.10.1651607364013; 
 Tue, 03 May 2022 12:49:24 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/74] semihosting: Create qemu_semihosting_console_write
Date: Tue,  3 May 2022 12:48:08 -0700
Message-Id: <20220503194843.1379101-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Will replace qemu_semihosting_console_{outs,outc},
but we need more plumbing first.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 12 ++++++++++++
 linux-user/semihost.c         |  5 +++++
 semihosting/console.c         |  9 +++++++++
 3 files changed, 26 insertions(+)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 39dbf1b062..6994f23c82 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -54,6 +54,18 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
  */
 int qemu_semihosting_console_read(CPUState *cs, void *buf, int len);
 
+/**
+ * qemu_semihosting_console_write:
+ * @buf: host buffer
+ * @len: buffer size
+ *
+ * Write len bytes from buf to the debug console.
+ *
+ * Returns: number of bytes written -- this should only ever be short
+ * on some sort of i/o error.
+ */
+int qemu_semihosting_console_write(void *buf, int len);
+
 /**
  * qemu_semihosting_log_out:
  * @s: pointer to string
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index 2029fb674c..871edf993a 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -76,3 +76,8 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
 
     return ret;
 }
+
+int qemu_semihosting_console_write(void *buf, int len)
+{
+    return fwrite(buf, 1, len, stderr);
+}
diff --git a/semihosting/console.c b/semihosting/console.c
index 4088192842..b6a342744d 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -169,6 +169,15 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
     return ret;
 }
 
+int qemu_semihosting_console_write(void *buf, int len)
+{
+    if (console.chr) {
+        return qemu_chr_write_all(console.chr, (uint8_t *)buf, len);
+    } else {
+        return fwrite(buf, 1, len, stderr);
+    }
+}
+
 void qemu_semihosting_console_init(Chardev *chr)
 {
     console.chr = chr;
-- 
2.34.1


