Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553CF47592F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:55:31 +0100 (CET)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTog-0005db-72
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:55:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxTcr-0004xm-Jg
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:43:17 -0500
Received: from [2a00:1450:4864:20::42e] (port=37745
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxTcq-0005sg-3j
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:43:17 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t26so1660409wrb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 04:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jes0jaV8C77XuOtNCTS3+rbsCAYxOxrMGO2HrSlqP54=;
 b=F158Kijv53dICKGtMp9TVkpQPVqXDRmOjoG/ciETNaR6lN9DpHdA8BuAtnnhWQbkL+
 aC14od+XUdHffUbDxmh8YOvHt17+xTApjk4Pm3BaHgfcjDqD7Q4xvpgoT9FD999qLUEh
 gQKog25BhwpZbpthZ+LFB0oWdeP2liBm8vmoV+4vjV23z+9jU97xzajK42JLLA974auW
 QRlKRdJ05n4gCdzLyzZAQZQCPJ2mjWc5w0/oUo5G07ADysnepiqDJ/tG5y68wKxGsItM
 1fe/cl8x7rid4xP+/kBSEPou2XOTGv5kXZ32GJeveD7UnjVsFMYmu/TO7TOp41JXZ8Bx
 /oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jes0jaV8C77XuOtNCTS3+rbsCAYxOxrMGO2HrSlqP54=;
 b=EmPSqynAG9/+BJdh4CB5NuPWbWlni6MztN+ZK27k+2wkxEB+HeAbQe42slWKURMsm7
 xYwpMF+okHIrfRcKxgOqlQI49Y2b3gfSzKeIDifILc7dcO7962ihAATMz5uPbOi559ig
 R9eGkVGNbZuoRchPaIw9p9ViYNTYvpl7p+Jeqk9VP1b89gcuc8B79fkSQERK6fOjGjKC
 99qYIa6sr16IY8kfO1OdIZYvLGe3+fJBICsBfTE5i99HosHMoqoq6A1yScT+h4TOZXgk
 Ah+wnq8iuKStKU6ic7VTPl5bX02zvATIVyPrl512nSI/ETCDnWg6LyeB4Ptd/ilD6oH9
 1/fQ==
X-Gm-Message-State: AOAM531m+d0ZvsCWRah7U/seMHF4ByPBR6BUAkUlId5Ur2iS0X8Z+ptb
 oQ21JFmeqI5c8gp0zWXQ4fsXtq3CeZM=
X-Google-Smtp-Source: ABdhPJyhxTBgLqY/3WXlIc9EReBxaEZoQQgtf5z9BbO8J/w5pp83NX1W/RFnHCiamqXsfWEFRa36SA==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr4149517wrn.294.1639572194322; 
 Wed, 15 Dec 2021 04:43:14 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id j85sm4443864wmj.3.2021.12.15.04.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 04:43:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/rx: Correctly set Error Summary bit in set_fpsw()
 helper
Date: Wed, 15 Dec 2021 13:43:12 +0100
Message-Id: <20211215124312.254042-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FIELD_DP32() does not update its first argument, so the Floating-Point
Error Summary Flag (FS, summary of FV/FO/FZ/FU bits) is never updated
to the Floating-Point Status Word (FPSW). Fix by assigning FIELD_DP32()
returned value to env->fpsw.

Fixes: 075d047e2bd ("target/rx: TCG helpers")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/op_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 11f952d3409..431d4ecf707 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -130,8 +130,7 @@ void helper_set_fpsw(CPURXState *env, uint32_t val)
     fpsw |= 0x7fffff03;
     val &= ~0x80000000;
     fpsw &= val;
-    FIELD_DP32(fpsw, FPSW, FS, FIELD_EX32(fpsw, FPSW, FLAGS) != 0);
-    env->fpsw = fpsw;
+    env->fpsw = FIELD_DP32(fpsw, FPSW, FS, FIELD_EX32(fpsw, FPSW, FLAGS) != 0);
     set_float_rounding_mode(roundmode[FIELD_EX32(env->fpsw, FPSW, RM)],
                             &env->fp_status);
 }
-- 
2.33.1


