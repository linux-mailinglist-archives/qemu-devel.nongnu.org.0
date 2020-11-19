Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B52B97A3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:21:57 +0100 (CET)
Received: from localhost ([::1]:53926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmh2-0004GY-CF
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmcb-0007df-EW
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:21 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmcZ-0006Ra-Sf
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:21 -0500
Received: by mail-wm1-x341.google.com with SMTP id 10so7736260wml.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgO3tcHedPydaPsxFO6dG6qOvzXCjuA0Kh6wwHmDQo4=;
 b=uDcAQUR7Lo/M3Vos5gqKcwXL59TQMZAs46aJBYaEpetkeStPXVNmf2jGIa5yIp93mm
 oDKysxKpk3PGVLcTKJR12Vuq2p4+RPxCu/3XKqQT1MeFHlyEJiFFqESJr5ROkE+jYDkX
 do8XRLJKje7+f2G11lPYjpAilXcomnMcQY6VwK//uJZSoKqUYGpBZnMBsENGdAj5+nGv
 gYDWeZMTzNLeln1POkceA9miGCaW5umi5I5igZh2DX50BAe1qQEYxl3mo3fBsiOs2LAj
 mAGTc6nHekzRbRXzzqEuWfWYknRHMShZRAzzyOzKiDtL0eQ4zm+n+MwaULN6WrN+CxrR
 mqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NgO3tcHedPydaPsxFO6dG6qOvzXCjuA0Kh6wwHmDQo4=;
 b=neHbnvrBQoUuuGdEFDZvVLZFpJ6Vu6j3axGU+ffq9OytdHq/GsYLtBZd3JOz5Sudfb
 zAuVii6CWYZlH8Gp8Nd6UE7WTr0yRNzvKJ+OWhx3WQ7QkOpAgSqW3wXO0gXfGTILjBFh
 4Cc4UxfnVzTHwuc9QYXenFoEC5VlFeIEw0MBjvhsnZIR0vS1OjBCerjdTM5wu6rTGmrn
 InAJTYHVh+dTcXx0941kx6O/yl6xaHYFrYxercrkCUpy1kVLefdPZzEBVStOAURNCmJH
 w4vK43XTroRKTmNjUohFn6e3WhRNomW5eYeAIfCNdXKAdLmrOWT/apTVfIlYe79kTLFR
 5mSg==
X-Gm-Message-State: AOAM532EsQ7NEaLotreNp5DCzOewPlFNu7DXRtlXxYDk7iMeWU0lf9np
 3oL3IPUSmgtcqHJMuYBF/VwzmL0KL+s=
X-Google-Smtp-Source: ABdhPJwlAr3gwe9bT6mS7xMBvI+Yg3zMJw8l1teNKgveQE14WPGlUCHouNtKWx4n+reD+NBxKKdatw==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr5331852wmm.89.1605802638149; 
 Thu, 19 Nov 2020 08:17:18 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id e6sm533999wme.27.2020.11.19.08.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:17:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] linux-user/mips64: Restore setup_frame() for o32 ABI
Date: Thu, 19 Nov 2020 17:17:07 +0100
Message-Id: <20201119161710.1985083-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119161710.1985083-1-f4bug@amsat.org>
References: <20201119161710.1985083-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

64-bit MIPS targets lost setup_frame() during the refactor in commit
8949bef18b9. Restore it declaring TARGET_ARCH_HAS_SETUP_FRAME, to be
able to build the o32 ABI target.

Fixes: 8949bef18b9 ("linux-user: move mips/mips64 signal.c parts to mips directory")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/mips64/target_signal.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index 799f7a668cd..f1f0ed7f706 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -67,4 +67,8 @@ typedef struct target_sigaltstack {
 #define TARGET_MINSIGSTKSZ    2048
 #define TARGET_SIGSTKSZ       8192
 
+#if defined(TARGET_ABI_MIPSO32)
+/* compare linux/arch/mips/kernel/signal.c:setup_frame() */
+#define TARGET_ARCH_HAS_SETUP_FRAME
+#endif
 #endif /* MIPS64_TARGET_SIGNAL_H */
-- 
2.26.2


