Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41C541D69
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:14:33 +0200 (CEST)
Received: from localhost ([::1]:50966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhT3-00031c-JY
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5t-0007VD-V4
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:29 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5s-0001Mg-6y
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:29 -0400
Received: by mail-pg1-x533.google.com with SMTP id r71so17015993pgr.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aBrl+ytbZVErgWrNLoalp3tVxQVgRG0j/fJKDA/VkdQ=;
 b=cSxRTCXl+SWRUws1CpeT2W1ErcHDYkmVZMc9QB8W30nmAM1cKxs1Dp1FfOnJag9Rh7
 JgkLlVJW7Y46OBTK6Xt3stZCHkUzZPhMXAVnpyNE9eh/05zqpNgmvJyBT+iD1jPt21hD
 +N510fzQufntPm5cY//R9cvSwsiJ/pomQH060SA1UXDMTy5bj6tff3xnbMeU/j/C/2fq
 NUEMLxbiNzwxqvO5HfzNRW9VRVwY0dtKiiZeHJ/rgYDfhSOLr5yvkWwk/h+WFPI4XWXW
 MM9pDD/U5P8uTONV+8pb5XAviqYDVd+Gr757icWb8UTeHznAYVuW1qa4bewKUAMyq0jZ
 7srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aBrl+ytbZVErgWrNLoalp3tVxQVgRG0j/fJKDA/VkdQ=;
 b=dcSJgVS5TaSWPDBzEqLd7T1mR+pSfKYAqOei2IKRiERUnTHpKK8hbXL4LHKXIJOsw/
 qG2ajNOjXU9/NNP4TfIQfWKF8VqHNnkxgu4pTyg6uJRTHWiUpWDP5Zicm/eq00e4GsdM
 OaXtT5ol/15L5ftZOO2E2899g7NxQn+w0VdOih4TJCHWIL0nQF18NFSoASTJesWGQlSB
 y0UylrA/GKTctzv4SPg1A5OYaVPO6VPSeb18wBCEv7/JzRhRIsiRaAmwvenq/BY6BAHR
 XgmCvVQ4HlnuLDj4evc9xVc8NEqqybwmN67OFXwNCjBExjO/wN6xsW/l8rs+NM0buOdj
 jQVQ==
X-Gm-Message-State: AOAM531heAKvkt/CEmpiZ0LjwRRxpEGf0b3Z9IhuszLAcc9jZawoI+99
 d09nYEzNJc1YxdJ0Vo1OpHQDSFZecA37Fw==
X-Google-Smtp-Source: ABdhPJwIc0APEIeoXaKrE0f/Xd2Bk+w8HctzT77hqekaLWTRfxtwjT/odlUH9UOgsfqqd6UJTd2w+Q==
X-Received: by 2002:a63:d013:0:b0:3fc:e50f:8e2a with SMTP id
 z19-20020a63d013000000b003fce50f8e2amr25171067pgf.283.1654634787409; 
 Tue, 07 Jun 2022 13:46:27 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/53] semihosting: Bound length for semihost_sys_{read,
 write}
Date: Tue,  7 Jun 2022 13:45:35 -0700
Message-Id: <20220607204557.658541-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
index 5cb12d6adc..eefbae74f1 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -283,6 +283,14 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
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
@@ -313,6 +321,14 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
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


