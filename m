Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524D5800AE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:25:51 +0200 (CEST)
Received: from localhost ([::1]:42458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFz1q-0007Uq-CC
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiP-00017m-Dq
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiN-0000JJ-Ni
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d13so8460888wrn.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yHj/q18KkSPTGRmybHT7bSovMuqm3TPdWZ5l7N31L9s=;
 b=gG8Kcz88Zic0aKKiiAknyouQzz1cTge1VjkglG/cQD4wZWHd/JMZF5uv+wqjSDgMlg
 0EXu+JzncUS8iPBQbXPdekTCEXCkZ633iyecjxv9ro3/IeBvgfJwG17zt5SO6jMs8+eS
 PEwNAMiBz9FJkO7j+t2VC12nH+VQl643GZbyehtIBK7D7lo9LS9isVcyWJycd59U1UtQ
 CyG2rQhzkayi1Ipqyg5x13cBGFauis3bp/KWpFz1rR64bEW3etQrhHcozEGNR5x8w1ey
 nosIEi7AaAhMUpj7yDh7oSOkSoHxGzDjr3Ac0xXtl2ENjnwfFxxFUXTVlbUHxpvM2jUz
 IBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yHj/q18KkSPTGRmybHT7bSovMuqm3TPdWZ5l7N31L9s=;
 b=czBeUGRAk2M1C1gt6ThFiVR3RF5GhZbn47wKHoWfluDwhyNIoQbTAGF5T1SkhCtLQq
 QJjzty2kd0jItRHmR69Cb8Fqb9VUQ2VNG4AMKTfJvO8WYoya/OmAv3Non5rEp5FfwN5t
 FB4TTtpLJoUQrz7QszHLdqG274lvYMESJBe3tI3/B1xeuR9W0gRcd/7OEeaEc04USah6
 OI2LlPvzsBbyXKE3BJoOekLSrSwAAp4H4OFhCfUFRYclg5zXytnRKLrN/FiMfTEiX+V+
 thJyQeaWbH1TGxI3rwqtr1gsqa3f+Hkd4ZMdx41TS1W+5YA1vGn4HnEXboc2hQr7z8G+
 VP8g==
X-Gm-Message-State: AJIora9n3gfgku6S3A44xAeV2oL44Z6EtSHM0Zo00xK3+5rd0m7fqgFQ
 N/Bhu9W1GSlsw32RksGQdi01jw==
X-Google-Smtp-Source: AGRyM1s6CaOcSsWRqiNi715p28XIHIuSnPk3R6vlt+e1QyF+QYJgN+1lqxCGNuZMAv31O69FtBbwKA==
X-Received: by 2002:a5d:5250:0:b0:21e:526c:d4ad with SMTP id
 k16-20020a5d5250000000b0021e526cd4admr7297062wrc.103.1658757942481; 
 Mon, 25 Jul 2022 07:05:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a5d5256000000b0021d6a520ce9sm12377002wrc.47.2022.07.25.07.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C0031FFC1;
 Mon, 25 Jul 2022 15:05:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 09/13] semihosting: Fix handling of buffer in
 TARGET_SYS_TMPNAM
Date: Mon, 25 Jul 2022 15:05:16 +0100
Message-Id: <20220725140520.515340-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
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

From: Peter Maydell <peter.maydell@linaro.org>

The TARGET_SYS_TMPNAM implementation has two bugs spotted by
Coverity:
 * confusion about whether 'len' has the length of the string
   including or excluding the terminating NUL means we
   lock_user() len bytes of memory but memcpy() len + 1 bytes
 * In the error-exit cases we forget to free() the buffer
   that asprintf() returned to us

Resolves: Coverity CID 1490285, 1490289
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220719121110.225657-5-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index d12288fc80..e741674238 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -504,16 +504,25 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(1);
         GET_ARG(2);
         len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        if (len < 0) {
+            common_semi_set_ret(cs, -1);
+            break;
+        }
+
+        /* Allow for trailing NUL */
+        len++;
         /* Make sure there's enough space in the buffer */
-        if (len < 0 || len >= arg2) {
+        if (len > arg2) {
+            free(s);
             common_semi_set_ret(cs, -1);
             break;
         }
         p = lock_user(VERIFY_WRITE, arg0, len, 0);
         if (!p) {
+            free(s);
             goto do_fault;
         }
-        memcpy(p, s, len + 1);
+        memcpy(p, s, len);
         unlock_user(p, arg0, len);
         free(s);
         common_semi_set_ret(cs, 0);
-- 
2.30.2


