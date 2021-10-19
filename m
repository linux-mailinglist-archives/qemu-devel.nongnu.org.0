Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F51433CCF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:54:11 +0200 (CEST)
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsNO-0006b9-Tf
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEw-0000Dl-6U
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:26 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:34688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEm-0000Jg-71
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:25 -0400
Received: by mail-io1-xd30.google.com with SMTP id i189so21175202ioa.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vaJwXu/eD2iCjrLKVnfYufKTq6BQat7mctIUm7bBXz8=;
 b=UeINsJ9nReGtA0Qe8jARdFi8nHLVNZo1YLmzpj5NRD75uYex0ET7wDwJlnVsNv+Qcp
 FNQrKWCfAn1svhwF4bCxOdU/RkJtO2MGGoqbMqYfKvFzi2k+SkRAHMPQF542I2eKO0u+
 yaL5luZIjTz0NHcDA4OX0hB4nw5HhIL8QC7mgNsFEYCxsxLXDjeGROTrIX/PRFEXpi7f
 lKQj3XBg8W2uoUAZVe1LTPydJnI1yomDnHc4xNNdzMg4Ahyf1Hwi/Ynw7KF3BVij1Yic
 NhE9LVpDmjVRtz9AZV3pWvDk1h4aum4nsYNBmvPw47pgJIGpvweRB9uHjK6A0cLCcC+N
 E5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vaJwXu/eD2iCjrLKVnfYufKTq6BQat7mctIUm7bBXz8=;
 b=6CrqlVAGR8SW1B0oPjBB3p1Z0Xw83zxJs97DGNjDa0yKt54KJJTXNCYkCD7j0J3C0e
 gDnFVlETuRSPqQiDErgpnqMwCOsk1O1O3zzxBguTyT+J9OhIoAyjgLoisGWEpISO5d5n
 PpO5KTeMsZU//u79ODdkVrMjjTmnkUlYFsgZOWtr+hF1uQpa6vwdyeaqG9HHgKuYzuMk
 tqpE9RccpzdHmu1+SaMdJOOpcKofLM24f6832m/XYoZHqgBqPi7Ra8dcpNJqVsK6kkky
 EV15bwrc+IBNjD3iqrjmft3hV+1N3d4c2VCxUa5kCZCcPtuPUkArd/MDSGMHmVokjKSa
 KU2g==
X-Gm-Message-State: AOAM5315ed2+JNvM5WcEy+t7z9PcMQuROd/FM4mY6E+zGwUY281exopd
 IfN7nWZqXqm5FtS+YGVDV6ExTW64/3pF1Q==
X-Google-Smtp-Source: ABdhPJyBWWv4SOzibyK3ygfTOqCr+PekuUQ0FqWKHKj5zv1IzNx0+pjAx6/ZJDxQpG2I8Y7v3WVPKg==
X-Received: by 2002:a05:6602:1504:: with SMTP id
 g4mr19278479iow.133.1634661914968; 
 Tue, 19 Oct 2021 09:45:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:14 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/24] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Tue, 19 Oct 2021 10:44:31 -0600
Message-Id: <20211019164447.16359-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Olivier Houchard <cognet@ci0.org>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data
exceptions cause a SIGSEGV.

Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index f22384676a..62d6ee89b6 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -60,6 +60,17 @@ static inline void target_cpu_loop(CPUARMState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+        case EXCP_PREFETCH_ABORT:
+            /* See arm/arm/trap.c prefetch_abort_handler() */
+        case EXCP_DATA_ABORT:
+            /* See arm/arm/trap.c data_abort_handler() */
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            /* XXX: check env->error_code */
+            info.si_code = 0;
+            info.si_addr = env->exception.vaddress;
+            queue_signal(env, info.si_signo, &info);
+            break;
         case EXCP_DEBUG:
             {
 
-- 
2.32.0


