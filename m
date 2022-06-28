Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8698C55BEF9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:09:33 +0200 (CEST)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65Lo-0007i9-2C
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JZ-00020r-T1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:07 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JX-0000WW-FF
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:04 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so14692524pjr.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8zCLnXZDBM5u3PUfLQVmMkwLgGIxJ2JdOpBGrHPDBM=;
 b=gBtaAg4InhTyedzc7vVXTU0QokhJc3tFnjZNrofUuePwZysa0t3Bzr7nEDqE7lw7TK
 eKxDRRg0GzX8vbHRgotFQUMinGaUI0lt+oi5X7Hjo0VUvOW+GkbNh05+aRLy+W0LYY0u
 8RKY8wmoqY7HeJ4mPwd2le4OVwP1kN+OmNLTLlqpn+jJzGtk2Jn13M+hheisgUpsgGIv
 +LlTDrfrHIkmM0NZ0AxqKI9Lt5rQqz/86Gqz/pFaT8wmutb1ypCFoYkH5pckUu8PHW4d
 u8rTA9IQg3piHTh6YQap5SI0/IdNm1xfFDlWMF+mCin0HjVfT/g0wKGKfz+7sg5FLcud
 ZHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K8zCLnXZDBM5u3PUfLQVmMkwLgGIxJ2JdOpBGrHPDBM=;
 b=3w2h0uGjWKNP9oeBtNui7+IXUvlfTLG3dh1pRkJAnvcJAxlv1zfes0mTNHwfxqe+7P
 LJt28+Yn/8CeE8wxnWv5RgAVZ9Cw1EH14ndyLFpFkKOGuKjSZ39dH+HWMBEnEbIYGwZH
 o5wi7TPwWHnvxr+tMKGZkn6k1Wq/SkAeNAVJzrQ0L5V1yVYp2rYXjdkwKwFNbnI0HX/k
 z6GwXHW0jRLyYZuF7eBaLyyPj3YfY3PegpHqUsjVbhV1Bs9rK3h5hG7Qn2TJy1Ds3Lwi
 TcM5hzphdQmDXihUlG13HTh2ve+ePiCd7CnHdXBiVG4/pvbpmEoiw70tR1jdl39UXA7p
 C1Zw==
X-Gm-Message-State: AJIora9m7npam5LYPwx78/zweZYfuhhNts0BPDKW1IbIl0q83plN3a3x
 OCOaJf2lMY6SXho5JXdWQgOCUzfKYDrhrA==
X-Google-Smtp-Source: AGRyM1v2L8EZqOwNcD1BZ19mgnXgOuR4j7EwxX9deC0PC/z26p3gdQofu+qfH6aMDoETfeddemOn1Q==
X-Received: by 2002:a17:902:d4ce:b0:16a:7696:9700 with SMTP id
 o14-20020a170902d4ce00b0016a76969700mr1820322plg.66.1656392341812; 
 Mon, 27 Jun 2022 21:59:01 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 45/60] semihosting: Create qemu_semihosting_console_write
Date: Tue, 28 Jun 2022 10:23:48 +0530
Message-Id: <20220628045403.508716-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
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
index 1d16a290c4..540aa0cd4b 100644
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


