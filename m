Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E4320B15
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:49:30 +0100 (CET)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq37-0006Ff-N2
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpr5-0007xr-OX
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:04 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqi-0003Cn-1R
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:02 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n8so16292344wrm.10
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zTn6ZsmcejvoOra5WBCUDClHszjsj5qnjYAoZR3mMug=;
 b=SB+duIMhI8kp3GZZgLxWKsJ2wUAI/JeZ1P1+hBC+q+FPJSNgSJrYhsnow7p713ch6+
 QOV/5F+1ooKGSsXSwE2TTixNPEvBEpR/tM8e0vmrIVEiLb6J5+K3DR6SSmWaHJJBI/8p
 4O2RP+Xtz2+wlweEXa6iOft1Lw3/UwtKWbzvoZSxbomcTaVr2TDm13lgfVdUP6QS+MwK
 oi8lm3ciV+/X6hRU7479cnUdB3NeI+ZuV0se1gadjn4CsRBkU2KlG+IglYuGgLYdXk5R
 wr6hNVJ3s6M/0/d3Cj52vY7XMlsxiQDr2qDwrkczKeS7Z91ZyXJ/xk/f/kxlF3PmHKzi
 6fWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zTn6ZsmcejvoOra5WBCUDClHszjsj5qnjYAoZR3mMug=;
 b=e8VIEM8viu0W9X48zpUi/1ASTtCv24VSR4nxPf4nkGUsP3fbApilbCpzElpsd8CD9i
 6YpZsRcSJKxlx8QBHEUiU+pJunI2mfA7gdBgsMSr2Li5VoM80frYvVvhQyhEGDaBotmS
 cuvG93S4e6M0uW1CMBcL1UXb5M6Fts+GhOAwI/2IGMBYRR7lDJmDNrpelg9OMfXhhgwe
 4FankkQ4foNsYXGtkNOdyVjInyNqat0FPVFILp05uk98dzqeIKxOni380yyDYW7HwAlr
 o42yg7z6FdI5j95H/U5vNm9rXFuVrs+pH/MIlOEReRbg++m47chHSWCoT3q4oI88zMPm
 wTBA==
X-Gm-Message-State: AOAM5324Z2de0t/rCScyFHDaGPeNpY4nPZVKxmgCXdTgiw+39AiiS/ma
 6RozMuhcv+LbX2ardLrzpYSW1K0wyDg=
X-Google-Smtp-Source: ABdhPJx42H5YpZv8dDL7sl7m+Y5nKw1vCpkYRGmrX8ErcrNqgGYf/FDWMv/o092WUWVvXl1y8yxRrg==
X-Received: by 2002:a5d:460f:: with SMTP id t15mr17219235wrq.417.1613918198539; 
 Sun, 21 Feb 2021 06:36:38 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p16sm1195271wmj.8.2021.02.21.06.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/43] target/mips: Rename 128-bit upper halve GPR registers
Date: Sun, 21 Feb 2021 15:34:14 +0100
Message-Id: <20210221143432.2468220-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG displays the upper halve registers with the same name
as their lower halves. Rename the upper halves with the
'[hi]' suffix.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-6-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 2df76592470..5228e040842 100644
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


