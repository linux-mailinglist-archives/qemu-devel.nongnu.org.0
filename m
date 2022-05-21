Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD5652F741
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 03:08:21 +0200 (CEST)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDbQ-0002Dt-Ep
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 21:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCet-0002zY-Np
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:52 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCer-0004Yn-In
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id bh5so8564145plb.6
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U2oK2ipOEqoaAfOulrRTtOQB2zK3TVTPXCClS/WGFgs=;
 b=TOTLMS4zCbkvyd9ZhNeJcXRZ+qsrMM8wOqFKLDIFC9e4cUwLzap9VudMeBYoAMOk/B
 Xw2D8Y+14AtYWZ9PP+CBLkAWI0p/ZVh+NMb5n6VFbv4WeJCe1fNd4pyrbZjhA/LtwXAD
 1Vc+TKXcSaeDW8qYzjtwPUfBlXiZqR13+afLiaAG8UfCjhn6v6Wg7xUP5x6MGzT9iKT8
 a+fAGkjYr5pz84Vn717XayKZevHn1v3kpTNi2DYUFwr/TSIDlu/GRkEw600xFARv1C/f
 q6mdT45E5NCySaxT07gLk3TcE2pVvGtKsjV4GCS8hz+ODzuVXPtm5T61TpmYh7RAreOn
 wHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2oK2ipOEqoaAfOulrRTtOQB2zK3TVTPXCClS/WGFgs=;
 b=Ieq0aMnO0rbpywfNHMTTb7BsMJCItxvmykHvwBj7e4Q8wGkQTcw6KPmuM1ikmLS4Jo
 fUeEnRnunwUyBMOllcnaNz7aJ290QOKEjFGVCMVL4poyjlk55tIy+0RCVXzBl6L4rnB+
 Y7SN9ZMYcmcKCLAGymttD8ZyOheBVf/TtzmxPDoGJ+/Ehig3Kl5ENM3GdDdD+N1maHCB
 NRAkoVXdC7SfV4qvGcI0RfDEtF3w0yBVP73C9dYL39v+8f9JFnWjWJ/ufxo5crIpHKMr
 Tu2A4TvjIVKAF/4s+aXCRGNb/T43c0FDikQEmu6C+seP4iQV9BymaY54op0chjru58SB
 yL+Q==
X-Gm-Message-State: AOAM530KWb13CSsVmvu/9te8fuKiSWa9qq535DSAyXt87b2T0DsdpzpA
 Oqn/Ok7qh1JpVkBM/O0QzC205JeIMoVl0g==
X-Google-Smtp-Source: ABdhPJwpmpwRAF9RTCu3EpkTAGHHP5SyeLkfm+BO0W65yZl0xcSXksrsIWlHxUa2XFr2YMapnXAvnA==
X-Received: by 2002:a17:903:208:b0:162:284:3396 with SMTP id
 r8-20020a170903020800b0016202843396mr1651710plh.121.1653091668104; 
 Fri, 20 May 2022 17:07:48 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 41/49] semihosting: Create qemu_semihosting_console_write
Date: Fri, 20 May 2022 17:03:52 -0700
Message-Id: <20220521000400.454525-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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


