Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F748DC54
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:59:50 +0100 (CET)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83S1-00064I-PH
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:59:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n83OJ-00015J-Ii
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:55:59 -0500
Received: from [2a00:1450:4864:20::42f] (port=41868
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n83OH-0004qD-TH
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:55:59 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v6so11232860wra.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 08:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cn2FHmuKCe4MNexTKI7QIgWiqc4HTiH38slyXhZB5N4=;
 b=FBs8Zi2SlNxZb5A9DQoAvhyRkqnkKZyBwo/qtUaFwAvjGbGEqhN2xzuZZg86F8ASOY
 TtWruN45UmFgPV20D4TetnizySPi8qBkNZ8SiHvVxN+idU9rNlOLnLQAJhnaHlRSVqDh
 XKyh+I8+NIyFhXfHIBHgibGmZoA8DDDVLXBRmVEJfASFsnKk5/lt33PMd0zBIrl9DzgC
 qka8FkbfNHNltaFNc1nRmocRf7ePITLCBB0+QxS0ihEvXoyCblvVuLCXhVMYzkV0/R8x
 WWetJGWPYu+kDCM5P3tw1Xq8ZKDcBBkQIwHAzir3R0xtILDBd5KVdEY8xhh5uC4/c+pO
 y+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cn2FHmuKCe4MNexTKI7QIgWiqc4HTiH38slyXhZB5N4=;
 b=lhUoAct8wyACgkSLMSvvQO6KpTIhw7ipICmb9vk//JGbcq4mSUrDJrdWxhQLNN8c4A
 WfFaSzAfTxnprboBOqBJlhlJv3QNqg4c2zutXisEj5c1qwoIpI7NUZZcjKiN27bKt77p
 pxZK3qLJcNIXXKvCeT/ZEYRNN3qHEpodvD1x6JRtWmzw97xazZSUzps/nIdLxdkbOI0K
 bFFGNTcsYY72ddVHG3cEBaNLvoXiAA+ohbvP4Hz6otYEX1GGikzycDHfGivGBzaq7Xs7
 XSgA2dqTljsDCyzP5XCZRsByakCACRp5cYhAmgEXF9pB6+chJlkkRnW4yu9h9V+eIJXa
 CjKg==
X-Gm-Message-State: AOAM532M8ci/sxPuC83RsDFqjJJqXkwiX0mMAJap7r6bWDW7RE1rFf6f
 BDKdLaUsvuP5J7D8PzEDzf/piQ==
X-Google-Smtp-Source: ABdhPJww9ktuMquOOqe0sc/md7qKLrnLPVCfxwdyOL9dG0PnpZ5/NQ1g8c0YRCmvMlNZnZ+G6DfcfA==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr4733894wri.576.1642092955622; 
 Thu, 13 Jan 2022 08:55:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 1sm3912700wrb.13.2022.01.13.08.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 08:55:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B35C1FFB7;
 Thu, 13 Jan 2022 16:55:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] linux-user: expand reserved brk space for 64bit guests
Date: Thu, 13 Jan 2022 16:55:50 +0000
Message-Id: <20220113165550.4184455-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A recent change to fix commpage allocation issues on 32bit hosts
revealed another intermittent issue on s390x. The root cause was the
headroom we give for the brk space wasn't enough causing the guest to
attempt to map something on top of QEMUs own pages. We do not
currently do anything to protect from this (see #555).

By inspection the brk mmap moves around and top of the address range
has been measured as far as 19Mb away from the top of the binary. As
we chose a smallish number to keep 32bit on 32 bit feasible we only
increase the gap for 64 bit guests. This does mean that 64-on-32
static binaries are more likely to fail to find a hole in the address
space but that is hopefully a fairly rare situation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/elfload.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 64b87d37e8..9628a38361 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2800,11 +2800,17 @@ static void load_elf_image(const char *image_name, int image_fd,
          * and the stack, lest they be placed immediately after
          * the data segment and block allocation from the brk.
          *
-         * 16MB is chosen as "large enough" without being so large
-         * as to allow the result to not fit with a 32-bit guest on
-         * a 32-bit host.
+         * 16MB is chosen as "large enough" without being so large as
+         * to allow the result to not fit with a 32-bit guest on a
+         * 32-bit host. However some 64 bit guests (e.g. s390x)
+         * attempt to place their heap further ahead and currently
+         * nothing stops them smashing into QEMUs address space.
          */
+#if TARGET_LONG_BITS == 64
+        info->reserve_brk = 32 * MiB;
+#else
         info->reserve_brk = 16 * MiB;
+#endif
         hiaddr += info->reserve_brk;
 
         if (ehdr->e_type == ET_EXEC) {
-- 
2.30.2


