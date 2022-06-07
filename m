Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8069E541F2F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:46:13 +0200 (CEST)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhxh-0002WW-1u
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg95-0005hI-U5
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:47 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg90-0001ou-5o
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:45 -0400
Received: by mail-pg1-x535.google.com with SMTP id 123so6623311pgb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=U2oK2ipOEqoaAfOulrRTtOQB2zK3TVTPXCClS/WGFgs=;
 b=F0BOKFecdt+2QKnW2z307Udrhov0h9WFL3JJonmPhgnMa4lhU8tFTKBmUr2t2b0UIp
 ePi4F2pFvomjCLLkYd91SS9zaQUI3+GgLIUqYuNbofcmkldbKKhcvQ22fPRChOGtiMWd
 usZM+OKDhLMQ2S3d3wEu7B/6Rp7mvsW8sTSd/TY8JtkOp8tjZWrvgvsXC10jPS4hFlj9
 Y+xxoaa53bHEGaFqFXUDx4RJNt8qO98N4Alpy9dXllHb341f4Z2zKQHd/EsCQ62D2gK2
 Ysui85VtVnMi0oE8E/nTJe52NZUOQ3OqW3lsqhoseGwlVTmsUq8+2YZkB8p2kRYEqgzP
 Pw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2oK2ipOEqoaAfOulrRTtOQB2zK3TVTPXCClS/WGFgs=;
 b=UTCYwMpCLuGxRqE0XslEcWXj6bIKLx3rGpu47O1IUFgTpvgm4MSQDHjyK5M94g5mSd
 ZYyEvnfN7FJXY+1JyNmOQZTAk3vG+zxYkkeMr394qpR2J2+RCbtnkfWk2AnYLi/lpPSQ
 BDKxqdBCYot5BXD7vqFeRhHXILt0f0XB98VD23XNpMoijvoIcTSVZRwoCMPqmsdCW73t
 jJeGeSovGbpU8kstrqDTvKN23rIxMwxVWVcA6ra/OFNgv9d8VqLRsrua4jpnvMnu/yFC
 /5K8VGIhFw+d5tYNVHqBbyrsbSrMCjKbie2bTdqEz9twvFUbBRTvTs1hy/w7pQqeF8he
 EUBg==
X-Gm-Message-State: AOAM532RnEF7NV/w5uv/6fjVtn6lKURRwnHxxwltT1/Y3FGRzl/peTdP
 ECZ4YGqrsA0cICGr6q5jtEJWR8tooHKTlg==
X-Google-Smtp-Source: ABdhPJx1N1ZeCf2pSpG9hDVm83wCJH1zcyXyzHiJ0vymAEYum/DhS2anQNbuMPhWQ06i/3FIJsI+/g==
X-Received: by 2002:a62:e116:0:b0:51b:c452:47e6 with SMTP id
 q22-20020a62e116000000b0051bc45247e6mr30680011pfh.25.1654634979605; 
 Tue, 07 Jun 2022 13:49:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 45/53] semihosting: Create qemu_semihosting_console_write
Date: Tue,  7 Jun 2022 13:45:49 -0700
Message-Id: <20220607204557.658541-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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


