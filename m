Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A180231B1CC
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:08:56 +0100 (CET)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLpG-0007r2-9v
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgD-0006pS-HK
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:33 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgC-0004B9-9d
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:33 -0500
Received: by mail-wr1-x435.google.com with SMTP id v1so6102040wrd.6
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u+P4R7wX8AF+OGlD477IP+Y2yPBUc7P8DSYLD639hCU=;
 b=C9WDa3+3bo8STg8qP3QPPL1lTN/AiKQvXfwivEx22TCWccwjEGofl3SOFcTV6Fi7py
 BMYBvx219SlRBDx1aGKsAJyeOppFB4fVCJDqqACOQmy/nD1mGLkkFV9zIH1bHQAjEJnc
 8p3Mnb/WCEP5n3Ia0UZnpnLwzfciqG56gd82+zYDqjxPHn4OIJ++Kg1aZeA/ojR/GZuh
 bYX/1msuRAsTZP4lRt26unZgMVGCkH4ypE1LmV/QZERiFOxGCbJ3cLTg94BuYE43ZsDt
 mONlCJUgeSwBJrcKq0nSMyseVxQbXXk1WlOIebs1LwA/LxLA8dc3bCwl1NQ8gQnL1d14
 zCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u+P4R7wX8AF+OGlD477IP+Y2yPBUc7P8DSYLD639hCU=;
 b=qmrEd40IX77R7mhMA9JAJX0KdFTDKBz6czkUrPalABzVW30oW+mCP0jaOixMwx3NVb
 i3AjWSJ1NA8ZxzaGpmr56R2HsqeLb+rj/ef28iN57g/s8jOdxjuTszQy8ZgILpgPJb/S
 NAyjJVkI4KmneiUvhZg2kF1AQjJNOzYGMap1c2zqolHaOt4/8vD4n5+Prj2TVth27imS
 oX8ep3zYKdBVwE/5R4yjjZc+iXDPxGTA8UC+YFnOzOtbrgb51urIcFYt3v+Xyz6slHQD
 kgwCZ95QX7XDCC0iKIN3G8KdKJxZkDuS5M0pqv8EJmaaWaYPq9GfrqIq3ycD36bHl5dL
 8qfQ==
X-Gm-Message-State: AOAM533UTkX5ytj7Zws8noVBxAZcHC2cC6F/tvFCaLCc8XlXC6E5HkQ1
 lBdSDV7eswZyXht4ukAF16emHsDttAA=
X-Google-Smtp-Source: ABdhPJx4IiSJEthYHKZHTptQtxkWV3xmqNPSeizXe61bQLHeRPmDrVxioGjL9qJRatW6dFfqw0HgWw==
X-Received: by 2002:a5d:51d0:: with SMTP id n16mr15428256wrv.382.1613325570755; 
 Sun, 14 Feb 2021 09:59:30 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o18sm20584458wmp.19.2021.02.14.09.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:59:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/42] target/mips/translate: Make cpu_HI/LO registers
 public
Date: Sun, 14 Feb 2021 18:58:33 +0100
Message-Id: <20210214175912.732946-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

We will access the cpu_HI/LO registers outside of translate.c.
Make them publicly accessible.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 1 +
 target/mips/translate.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index f47b5f2c8d0..2a1d8f570bb 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -145,6 +145,7 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 
 extern TCGv cpu_gpr[32], cpu_PC;
+extern TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 extern TCGv_i32 fpu_fcr0, fpu_fcr31;
 extern TCGv_i64 fpu_f64[32];
 extern TCGv bcond;
diff --git a/target/mips/translate.c b/target/mips/translate.c
index a5cf1742a8b..be40f79229f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2179,7 +2179,7 @@ enum {
 
 /* global register indices */
 TCGv cpu_gpr[32], cpu_PC;
-static TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
+TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 static TCGv cpu_dspctrl, btarget;
 TCGv bcond;
 static TCGv cpu_lladdr, cpu_llval;
-- 
2.26.2


