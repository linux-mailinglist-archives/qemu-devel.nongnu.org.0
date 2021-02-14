Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9231B1C3
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:03:59 +0100 (CET)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLkU-0001Fm-5A
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgN-00073t-Ly
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:43 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgM-0004Eg-9Y
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id r5so972824wmp.1
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6CNX5Kr5ou+lQ+Lg6GCrWhdQH/cff3hYwGEFQXfNvI=;
 b=nK7n1LV4o5dnc6aV9bEfLTmWJmi9aMEJi0UmjXjoiD/wkazzyIni6SShSN+SBwYJKR
 JIKMN/nyUYtUI3EvolYX2dwLv1kgpUgVMjyhJRoINFvYGUZaRyhD2HOnhAfDJ6UUZxmy
 /H8lD240iw9XanU4frF8ejf3Kut0ccpyz25wx5F7zUMDwtQgqt2xEKPTUSk/ZJ1rmrSG
 cVAntk2kt6DQxW19P8txK7V1bTfWP8AvKAobKFgc4eLFBvXP+vdv8C8rQyaOcdqH2OrM
 rqORGZS8cjzZabMPqsFREakeFx2BDMxQtpNQh0uFGYfNjAMgX2T9ONUgOhD2xPiPAn7v
 7YkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q6CNX5Kr5ou+lQ+Lg6GCrWhdQH/cff3hYwGEFQXfNvI=;
 b=pSjV5/PKTaQ11ng4EU6ftD6scoJ4p6lRHHbZxIrtEFi+QCnpNHAXVXyHeMlBYP/Kgj
 4cRw8LVp5ST1UinV4+wnFl2xCm5iZR9ugs2cBy2p8q8qPO1fAEriDMtedbwvsPFCzIdH
 SmuI9xhADmUIvjeOMF8NVHZKoG7QAL1wfVoVv7FenQSWX5vmpvnOZqpgiqIHS0eFLKzH
 +8GAgvGRdl7slYOXV8E0o8l6KzkumAgtIKVGG2TMLiwIsi6apt2Rlgw6+udFNYEa7fnM
 pvVQ8TAZKgw7Pmsa4/JLVrmlpoRhlvHmxD1uv8YyeSS5cx1kmSnX8Q9i/4uC4u5E93K3
 /hrQ==
X-Gm-Message-State: AOAM5316ms9Ch58xkCuz7cv2ob39lj514AnpSt/WALhZT57PyMKfgfvF
 K9KFmC51v4i45/bf60qiPUQXW/B1yqg=
X-Google-Smtp-Source: ABdhPJzCq/Iylo8j8O/9rAR4Fz8/p1HWglFZgdnXrBkMMzZFq6Vu39S9adpEG0GJ22oWqrQ27xMbHw==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr11386933wmi.45.1613325580751; 
 Sun, 14 Feb 2021 09:59:40 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m13sm1444951wmc.22.2021.02.14.09.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:59:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/42] target/mips: Rename 128-bit upper halve GPR
 registers
Date: Sun, 14 Feb 2021 18:58:35 +0100
Message-Id: <20210214175912.732946-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG displays the upper halve registers with the same name
as their lower halves. Rename the upper halves with the
'[hi]' suffix.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index ab9b0999c93..9c034c934d5 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29289,10 +29289,12 @@ void mips_tcg_init(void)
     cpu_gpr_hi[0] = NULL;
 
     for (unsigned i = 1; i < 32; i++) {
+        g_autofree char *rname = g_strdup_printf("%s[hi]", regnames[i]);
+
         cpu_gpr_hi[i] = tcg_global_mem_new_i64(cpu_env,
                                                offsetof(CPUMIPSState,
                                                         active_tc.gpr_hi[i]),
-                                               regnames[i]);
+                                               rname);
     }
 #endif /* !TARGET_MIPS64 */
     for (i = 0; i < 32; i++) {
-- 
2.26.2


