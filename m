Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5D2B979D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:19:31 +0100 (CET)
Received: from localhost ([::1]:46476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmeg-0000y1-MQ
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmcg-0007fn-5M
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:26 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmce-0006Su-O5
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:25 -0500
Received: by mail-wr1-x431.google.com with SMTP id d12so6966822wrr.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WI9FhYkhmV3H0Q4oY0sfeWzV/m4iQyNuvlsEXmPQcZI=;
 b=Y0VUGr/cCtmiSQo8N+dQldZ1qh7flz5sDCV3kNspf7a40ah08/HC3GxiDCNNxEsYDN
 IdqgTec/4PVId4HZ6nxaIIKxF5aBYdDpDdqM6BgYdEFzzsk6z/crP2IV63xIB7JOPIeF
 K5BPz3wYrr7lsbxg28j5TswEVD96AlZ8yrnL4lno6Tj6WO/0/2FIfoUUml6tGUmM4Zvh
 yup3IYsZfUTTRPcjupJ7d6bpWnnHCwdsGzG/Jr1+2+vxW0zk32R5Ei7M8s1N1ri3UzMY
 0TnortewlE8sHVld3VQNGNs8VDIXCYzRBaibhPIOE4sXx0ysOh8t8RqnbN003ul8orAi
 IIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WI9FhYkhmV3H0Q4oY0sfeWzV/m4iQyNuvlsEXmPQcZI=;
 b=URYrDw0fbJAaXrmu0lrvz5SQAsT/RzmyNDh76VIiCFID6sggZaBOpZ9DcJxo8Tee0D
 Mhc+kqW2xGdGHcvSXfWVQz+qcDgiQo/phc+Sv/hYt8KUr5SoEuPVeeKbPxOVye1H9oj8
 kdD9W3NUptxCWpLw2sobUNEQyNNzeCqqJ9f45h/lPRWk3+UqhKFOgpLLrKFKrLYhOfsZ
 Miu+OMi/A0I7Eln91Uaa3A0IKCkWHfG2eJuwojESRDVW7GAFKkTWU83YBWPeasp4z04i
 OOrbni9JyeGQutovKwVqfoJekYykK0u+N5oyqIjuSZS88NqubWHPQj//5YOQBBhY3/Q9
 gm/w==
X-Gm-Message-State: AOAM533Ens4S4FSD0pDu4GSQvXzfJhSqxvLw4IKi7RQwzyg5wOW36Cuk
 vI3YF4bomNkLjtdOdomSh6UOtmtw5EI=
X-Google-Smtp-Source: ABdhPJwJfLQSB3557OwHCkaFMJQ9vfI0QzdOg0egl7bpENDA8srq73UyC15zNlrtFQUtU3WZ4l3ppw==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr11946118wrn.39.1605802642990; 
 Thu, 19 Nov 2020 08:17:22 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id n23sm506464wmk.24.2020.11.19.08.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:17:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] linux-user/mips64: Support o32 ABI syscalls
Date: Thu, 19 Nov 2020 17:17:08 +0100
Message-Id: <20201119161710.1985083-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119161710.1985083-1-f4bug@amsat.org>
References: <20201119161710.1985083-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

o32 ABI syscalls start at offset 4000.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/mips64/syscall_nr.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/mips64/syscall_nr.h b/linux-user/mips64/syscall_nr.h
index 672f2fa51cb..6579421fa63 100644
--- a/linux-user/mips64/syscall_nr.h
+++ b/linux-user/mips64/syscall_nr.h
@@ -1,4 +1,7 @@
-#ifdef TARGET_ABI_MIPSN32
+#if defined(TARGET_ABI_MIPSO32)
+#define TARGET_SYSCALL_OFFSET 4000
+#include "syscall_o32_nr.h"
+#elif defined(TARGET_ABI_MIPSN32)
 #define TARGET_SYSCALL_OFFSET 6000
 #include "syscall_n32_nr.h"
 #else
-- 
2.26.2


