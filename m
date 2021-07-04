Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788443BADF1
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 19:09:36 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05cd-000446-GY
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 13:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05ay-0001MF-0P
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:07:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05aw-00070H-Gr
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:07:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id i8so19125622wrc.0
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=34oogpA4jPcDPLlC0GkfhuqbOcedgJ2v07IEMWiHPY8=;
 b=DE/sh5MgzMVQJ0lWa+Ex6Ba7zyALdc+Qpd9b6VbCuKvoS96lnMtXIWx1qBrOJKIfvi
 pMyeOKPymj1PiAxlup1VYBDORd8HRLMGFp4TV23T8a02ZuEUquF+YZ9uP2vS20Eep6sj
 EO7d8hXhZzp7IrCmH4oieP2iTxRMST9wU9idVcC69g9T+tMXtAcx9R6rXfuUjJrJgV4m
 wGTn/ENrYLt/DaTP9r2nvdXo1mHYPOwiqICNsO4qDGCAfwmwZs2ex2Pj/hNMO87uJ+O1
 l/vfOy//JosS/2uejrWrp5kp7b6arzZXH/pEmny+sN7fM04B9B8GEiSKVxkoPpnDAFrn
 EXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=34oogpA4jPcDPLlC0GkfhuqbOcedgJ2v07IEMWiHPY8=;
 b=OKGv0aNedzqib4jFEPhp6LuAhdEFdzNnz3jadh0CtplnRTEbhyk/f3yfmgrI0gXa+v
 yzGWSV5Pg8b0Dn6nyvNCF1breEppvG1QzUAqU9uwTP+FRGJzlFof9PU+iz6I+Xi10TyG
 iXgRP+yoOFLS6MUI8u1Brm0O5K1YcBmnu1VNRGpyi5sAAgMlEFGpyJhF4AEfdCJ6n+Ee
 YLeh4WX0jVMwhSdzHuhZrE3gH9GmN2HzORawOBVNRbzOZ17OMG08a/6GJmBkIYY36JFr
 UW1DXFbB7pxDTSrvsILfxGYrKZTu4oixmKvFJM7upgJZqnrkPxVMgyXrkOeYas50cEMn
 mOAQ==
X-Gm-Message-State: AOAM531zFNXBXq+mOX6pjjk3Tsvj4LDG4VlrUjdTPrZctsHSEt/WewUu
 /2ToJlAoXx5B73l0S0b4iA8lQ3BOCaA=
X-Google-Smtp-Source: ABdhPJw8PxIpInAL0lVVm16VE4W8kEtRO8kVXFLMPDDxEefdBLhmje10YiJBDhtbWspLpcQHb8O0cQ==
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr11040316wro.346.1625418469060; 
 Sun, 04 Jul 2021 10:07:49 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z4sm8888216wrp.46.2021.07.04.10.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 10:07:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/mips: Rename UHI err -> host_errno
Date: Sun,  4 Jul 2021 19:07:34 +0200
Message-Id: <20210704170736.617895-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704170736.617895-1-f4bug@amsat.org>
References: <20210704170736.617895-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Zak <richard.j.zak@gmail.com>, Leon Alrae <leon.alrae@imgtec.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename 'err' as 'host_errno' to ease code review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 3b1939365c4..4c924273c1b 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -90,14 +90,14 @@ static const uint16_t host_to_mips_errno[] = {
 #endif
 };
 
-static int errno_mips(int err)
+static int errno_mips(int host_errno)
 {
-    if (err < 0 || err >= ARRAY_SIZE(host_to_mips_errno)) {
+    if (host_errno < 0 || host_errno >= ARRAY_SIZE(host_to_mips_errno)) {
         return EINVAL;
-    } else if (host_to_mips_errno[err]) {
-        return host_to_mips_errno[err];
+    } else if (host_to_mips_errno[host_errno]) {
+        return host_to_mips_errno[host_errno];
     } else {
-        return err;
+        return host_errno;
     }
 }
 
-- 
2.31.1


