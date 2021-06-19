Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09803AD77D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:47:32 +0200 (CEST)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRxE-0007wm-0m
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtW-00008S-J8
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:42 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtN-00081L-QD
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:42 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x22so4133218pll.11
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6XhZDg9Govvz9gc3VGnWdnVC8clvh9XH69vOvHyBLl0=;
 b=B7DgDyNsPlzK/y/kHNSUjiAzoQ+BvbREj7iI3LOJH8DD5nkMFIa3ehRtPeedKUMFjH
 Iigd7J7UxHGzekuObvChgosi/3s7KeLKnPYmpP+F1+SlnIbIe+USHiKhGvN2nh4qTnHH
 0fa8kNUf5r3Ib3QjcYj8w3FPmLsuL1zRZhwQLXibnXRDkvc8p1DUfZGKiq0xhqTZ7BDV
 UjlXAlBTF657xmCpupqVrnzuW1Gl/Ai4aM+coDhwuIY0aT60S9eRtbyQ/DcDc/aUIoD5
 nBWe0NJ7G5onuyx36v6v57MVme+2dRzbQilWaLHpggWxhRzmJGvvgAB6I+KAP3Wq+02U
 US1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XhZDg9Govvz9gc3VGnWdnVC8clvh9XH69vOvHyBLl0=;
 b=enxD4EweCsRrlzL4U/nzG/vB63CaBoY0n10C2rT6Rq8unowXNvl3uuW+u9kTCl+bGC
 Y51YE9BiXnhczCrdfJkfyfdo1AbLMDQOOdABdmdBP9SdVG1NklBvNsi7fXJ26m0EkEAX
 kelKT7Am4FK1KXIbmR0ANmfsIAv3kOCet8N0OKyb0DO1QB1XueoygMp/Ot4KQjsDKMdp
 pqlxtvGmNkJn6k8YhqZwuVEODMS5A684Yg1fxAiPX5YHAs5AVaWGx09VIoke8UH8Igvr
 AXMJAJ8802JFIZzd2sMklEySuKHM3u5AnZIXRTopsPBjYCov3LkxdpXwESgU2jAOqPrZ
 tvBQ==
X-Gm-Message-State: AOAM530pex/2BnZM5w+h44VgW9YMLAjgugzJBmM1R2qv3SH/u8tcmXRt
 kCNbXu8/EWLSIUyBH+u9HrevpwA8SmhHcA==
X-Google-Smtp-Source: ABdhPJw5gDlKAm5dULQ843UV5fA6SudcFsr7BiNXQMlasLu/RgSXJrc+7jfMYV7sh2qh9tbSt99eVQ==
X-Received: by 2002:a17:90a:31c4:: with SMTP id
 j4mr25823220pjf.105.1624074212535; 
 Fri, 18 Jun 2021 20:43:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/12] linux-user: Tidy loader_exec
Date: Fri, 18 Jun 2021 20:43:20 -0700
Message-Id: <20210619034329.532318-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorg the if cases to reduce indentation.
Test for 4 bytes in the file before checking the signatures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/linuxload.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 3b0bafc490..8b93b9704c 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -143,31 +143,31 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
 
     retval = prepare_binprm(bprm);
 
-    if (retval >= 0) {
-        if (bprm->buf[0] == 0x7f
-                && bprm->buf[1] == 'E'
-                && bprm->buf[2] == 'L'
-                && bprm->buf[3] == 'F') {
-            retval = load_elf_binary(bprm, infop);
-#if defined(TARGET_HAS_BFLT)
-        } else if (bprm->buf[0] == 'b'
-                && bprm->buf[1] == 'F'
-                && bprm->buf[2] == 'L'
-                && bprm->buf[3] == 'T') {
-            retval = load_flt_binary(bprm, infop);
-#endif
-        } else {
-            return -ENOEXEC;
-        }
+    if (retval < 4) {
+        return -ENOEXEC;
     }
-
-    if (retval >= 0) {
-        /* success.  Initialize important registers */
-        do_init_thread(regs, infop);
+    if (bprm->buf[0] == 0x7f
+        && bprm->buf[1] == 'E'
+        && bprm->buf[2] == 'L'
+        && bprm->buf[3] == 'F') {
+        retval = load_elf_binary(bprm, infop);
+#if defined(TARGET_HAS_BFLT)
+    } else if (bprm->buf[0] == 'b'
+               && bprm->buf[1] == 'F'
+               && bprm->buf[2] == 'L'
+               && bprm->buf[3] == 'T') {
+        retval = load_flt_binary(bprm, infop);
+#endif
+    } else {
+        return -ENOEXEC;
+    }
+    if (retval < 0) {
         return retval;
     }
 
-    return retval;
+    /* Success.  Initialize important registers. */
+    do_init_thread(regs, infop);
+    return 0;
 }
 
 bool imgsrc_read(void *dst, off_t offset, size_t len,
-- 
2.25.1


