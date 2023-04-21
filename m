Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3D56EAFE8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:59:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu5n-0002ne-8n; Fri, 21 Apr 2023 12:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu5V-0002RK-1m
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu5T-0005fc-MI
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:20 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f4214b430aso1252767f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096298; x=1684688298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvLkaVzFusVnxZhQiF95CZklHYin0PSxcJej3FYG+yY=;
 b=Xr9cPcRalK1l6Ljvgu0EU55Oi60LAqy2mAg5UjUBgg7/PCbE3D0tw8jVdSBCue+SwH
 2Gd+yUvtCBKiK4dBfzX4AgFEhCA3DJsAFCuk39LweuOOqGhLdHzPMY2BK4DE/sFIyvjq
 kCXK4CHw9bQDjXDwiQZelOciQLEC6yAqcL4DnsWhbhTa0MdaJ/SZnjkj8oDyCiOFtXoI
 AV49AZt8XU1EeD40sxrAA/ONFy/NCDI54DDUOxHeGiDqos7s+AZwssJdyvIXG5wkc40m
 qEiD6Ru9QXXSmOorpBpC+btq5jFUTsJVfgLEUy7jabOAWfV1pcIsglh5C02zmcFtpjnW
 Y6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096298; x=1684688298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BvLkaVzFusVnxZhQiF95CZklHYin0PSxcJej3FYG+yY=;
 b=iZsGvMbcGweDDzFXkGR0b2JcKaWhCyLwYSYEbRec9/EJrVM046Z0MAjWunOzKjlYnY
 cR4cDp69ovLmDuVNlScacpc3FK7Tg1N6VDZWsjxlkMhmwq0Q90rJuDEbyprG0KLZcCRU
 WkiRZfG08eO8piH0W1rSX6L/gjjxvzPslcyeAr/tXGxMymPCmWUbv57lePkRRCd7INyI
 Tsi59DO96u/yQTBiEHGBp0tAt3st96TeJIpzTuUTtgFm9yTQnF/+UEWedJiz4d6Y/O8G
 3PNaF0X1OPbXC3BrBwauVpkCZoyIrfTOxL9BPRJzDKh0Jp4S79W+9IFuR8QhcFOyGZeF
 RNJA==
X-Gm-Message-State: AAQBX9c9iKcZm4R0APd4YuI/3+f3TrAIWusQBJByotiyserMX1OjGsAC
 Bi3b90qvpfXxEmDEOUFLwTCzeGv2mbA=
X-Google-Smtp-Source: AKy350bH7Dr+1cY/D7h3LxBjEUyPRsJy/QYlVAm0Lty3rFy9XDCbvLO2ViRA6+E3WyCr9gGB9A6y4w==
X-Received: by 2002:adf:d091:0:b0:2f9:338:743d with SMTP id
 y17-20020adfd091000000b002f90338743dmr3825386wrh.23.1682096298409; 
 Fri, 21 Apr 2023 09:58:18 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:58:18 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 11/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:51 +0200
Message-Id: <20230421165351.3177-12-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Warner Losh <imp@bsdimp.com>

Add the dispatching code of bind(2),connect(2), accpet(2), getpeername(2).

Add the bind(2), connect(2), accept(2), getpeername(2) syscalls case
statements to freebsd_syscall function defined in bsd-user/freebsd/os-syscall.c

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/freebsd/os-syscall.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c8f998ecec..7f29196a05 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -44,6 +44,8 @@
 #include "signal-common.h"
 #include "user/syscall-trace.h"
 
+/* BSD independent syscall shims */
+#include "bsd-socket.h"
 #include "bsd-file.h"
 #include "bsd-proc.h"
 
@@ -508,6 +510,25 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
         break;
 
+        /*
+         * socket related system calls
+         */
+    case TARGET_FREEBSD_NR_accept: /* accept(2) */
+        ret = do_bsd_accept(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_bind: /* bind(2) */
+        ret = do_bsd_bind(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_connect: /* connect(2) */
+        ret = do_bsd_connect(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_getpeername: /* getpeername(2) */
+        ret = do_bsd_getpeername(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.40.0


