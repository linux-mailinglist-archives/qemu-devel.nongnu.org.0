Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE5518EAB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:22:47 +0200 (CEST)
Received: from localhost ([::1]:59464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlz2k-00043C-Fw
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWL-00022D-Hq
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:19 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWH-0003bP-Jb
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:15 -0400
Received: by mail-pf1-x42a.google.com with SMTP id p12so15616324pfn.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vqBv2QVKsobJpocmgNSatxx08hnrv6y9/ePykNgKyQg=;
 b=YWJbCzWZlYhjajRmYRSdmX5daSLcNOj8DJ5lI5inURV8z2D4/2BfbiWwNR5zD5/m/U
 Hv0FO4JtgZkTVdaiwt9ySv5sCoZXSdkw2N8dQOPOUbIANoqMQb3gaapXBtAtP6u1O5X0
 Y3n9KhfRBgbkFxLXNAIoOXu1xG9fHAcD35GOyGXr0mHjchBBpkpEqaame3nI5zeVS5MG
 lEYYPe8utXWQ4Vyepz/1jhCFwb0IPeBJmse+rtHSmVYEnqd67XNSbx6P8YlGqHvuTfyH
 ciBpLbSfNKTMG4nvk1yTrXnyxG1+/pObfB0dZ0EPUlGK5/AZrSUkz/rSeGIro4MgZ9o/
 lR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqBv2QVKsobJpocmgNSatxx08hnrv6y9/ePykNgKyQg=;
 b=htTGoqY8pqtlqbPUe+H1bOucSlAbMFzc2xAISm/5yqozVJgspRCzkuFJ0qTeYIMnfy
 N27fTuPAm/U2Q91N/dGDj32wSNtiu3Xxn+XFqhFxtvsRyRUrNWxo4hHifYZmKd5jeeaV
 NMwcb08v57avBAUJsim0zhz3sLtyKQq7PGdJU3P79wwaVEIpSULzWaF0+H1q4nli24Oq
 6phk6c0vVAln5e+if7ZPzYLqzmdMCCoSlxClrShP2z4NdnVg5UVzRJemXJCPk1ZTE3p1
 SPNI93CYoxJkAlajGy8nuwDqu3lRvob1kfReqGppoFi4hw0FlecBUZYm2QgrV1EX8Hi4
 cX6g==
X-Gm-Message-State: AOAM533NO3RObNUGArjzm+2zmm/06JtOTBZVN2EWdVZGxEwosKLAj1CT
 MtPSPFCg/DmebXiQDaExU9zWri1kPsNGlA==
X-Google-Smtp-Source: ABdhPJx1s+bcf8K5zZPMm+LeypH/0FWWIWNF5xsI7Bxeh0mp9YU3cEjSFC8SFwm+1rzzrcWOThoUtQ==
X-Received: by 2002:a63:90ca:0:b0:3aa:fff3:6f76 with SMTP id
 a193-20020a6390ca000000b003aafff36f76mr14966943pge.206.1651607350643; 
 Tue, 03 May 2022 12:49:10 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/74] semihosting: Bound length for semihost_sys_{read,
 write}
Date: Tue,  3 May 2022 12:47:54 -0700
Message-Id: <20220503194843.1379101-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Fixes a minor bug in which a 64-bit guest on a 32-bit host could
truncate the length.  This would only ever cause a problem if
there were no bits set in the low 32, so that it truncates to 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/syscalls.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index db4561b798..a5623ebf0f 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -313,6 +313,14 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
 void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                           GuestFD *gf, target_ulong buf, target_ulong len)
 {
+    /*
+     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
+     * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
+     * idea to do this unconditionally.
+     */
+    if (len > INT32_MAX) {
+        len = INT32_MAX;
+    }
     switch (gf->type) {
     case GuestFDGDB:
         gdb_read(cs, complete, gf, buf, len);
@@ -343,6 +351,14 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                            GuestFD *gf, target_ulong buf, target_ulong len)
 {
+    /*
+     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
+     * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
+     * idea to do this unconditionally.
+     */
+    if (len > INT32_MAX) {
+        len = INT32_MAX;
+    }
     switch (gf->type) {
     case GuestFDGDB:
         gdb_write(cs, complete, gf, buf, len);
-- 
2.34.1


