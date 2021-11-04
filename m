Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345044454FC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:16:38 +0100 (CET)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midXh-0002Ac-AI
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO5-0007nN-BO
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:45 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:36738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO2-00016a-70
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:41 -0400
Received: by mail-io1-xd33.google.com with SMTP id e144so7023177iof.3
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZNPpOkk6VPcljeu7Kbkpd5a4MaTSH5kT5BRcPYHMyg=;
 b=zhoQTsjivEs4/Afvof/7U5V2sMoO7bk2skxkaDGTxvBJIe3+vCn7GGMBD0knhd9aM9
 VbcxJHfNotdW+VcejNXjqiFcrE680cAyMAia4lDjg5PY+e+qMscAsUewltsZK0BVwgYy
 keUsdypTvBM/x+ABui0wffMro+hyT18p+6Fy0Dl5l8X0LrrO09xzqqczpPo8HKzmvIBU
 PGGPPFl5ehGviMramLO21rPCfqNRhgb9Gv4DejNJmCI63cKerF4M12lMQ+SJvchxeDqp
 Ii3zVSwYBKswgZft6CyWcOi3LBDQYqI14QQAjYOgynOY9NGyQgbA2WD91WtyHvR/PbHc
 wAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ZNPpOkk6VPcljeu7Kbkpd5a4MaTSH5kT5BRcPYHMyg=;
 b=QCYodwk4WXasUbJuZmqre0WIVt73MpSDXp+yhvr/yqUwiUsr2iH8roaDWb4J/c16BM
 dPUV5HiqTIw7CnB4gsujZtPIlpKbYJIs3ksAQaZpNq4Jh4HaDwgTEFVV4LC8xuW5V6r6
 B3kS3xs2HlScKR6YXcTXR9vdUDMuxj99DXQR7w3hzUi0Tc08+Wni6WcBvh0B4efwryqs
 wQ7PD9rqGDyu4ImRhtKsbSLB2y0vege9CBhkNr5BhBZ7Dlyaa9kk40vnRXXK7tvq3LKQ
 G9V7/JTJHarWz1SHkL4oezJsvNlUljnyiNEJglUdZfHZsgA+0gixjQA9BfjRx+/JzSJe
 Mf4g==
X-Gm-Message-State: AOAM533paEimEkBMolo+lG/rCbQCn84T0P5+umNQmhJ1eKjDR2yUfUtZ
 4xDJggPvzBygmEQOqUDtN0uF1+anJxlK6A==
X-Google-Smtp-Source: ABdhPJwya05Z+S9mWZkbL5Z5WxNczRZiIgvrNqVOwI8zdtkyh61MIZRIorioA7cCubwc+WX3lXT86w==
X-Received: by 2002:a5d:9d85:: with SMTP id ay5mr26324871iob.203.1636034796892; 
 Thu, 04 Nov 2021 07:06:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:36 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/29] bsd-user/x86_64/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Thu,  4 Nov 2021 08:05:36 -0600
Message-Id: <20211104140536.42573-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 55f742b0a8..e84aff948c 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -30,14 +30,7 @@
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-typedef struct target_ucontext {
-    target_sigset_t   uc_sigmask;
-    target_mcontext_t uc_mcontext;
-    abi_ulong         uc_link;
-    target_stack_t    uc_stack;
-    int32_t           uc_flags;
-    int32_t         __spare__[4];
-} target_ucontext_t;
+#include "target_os_ucontext.h"
 
 struct target_sigframe {
     abi_ulong   sf_signum;
-- 
2.33.0


