Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C47036DFEF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:53:00 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqF1-0007LK-CH
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpx4-0005wb-HD
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:27 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwv-0004fP-87
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:26 -0400
Received: by mail-pj1-x1034.google.com with SMTP id lr7so15201704pjb.2
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cm5TMYYSdbHhrEfgw+Q+FUKj8miS2gdnBD1hAWEVD3E=;
 b=X0KPTs/JjEjv/hdhe+C0sEdi+C4DTA3noNV8I7esXJEmsML3YRfbWScBmz0QigNdKg
 KmrbIeXkRJm2k+sVk12FXLfD3dkWbD8dmrx7QqyHuZ6Ieq+3IlWJ9RTSMhvwq5J/ME5s
 AaYYmaaiLovRhL94HHs4KAy+ntM50TE39qd8jFPsDOg+WwreOSGLYIfsL8T9/RewUkNq
 v6Ahv2PehCFrCGhTYz8zPYUCUDNJ4uOgWixx7xZuo5D4hQy2JpXj/ZAcngjjajsmjJP/
 gqIUM4y3cZ2/N6QPbGDcTgT0kLzE80IJSybdk5RLlyOYnost0oTBEgmj7ybaNpe+xMHH
 JJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cm5TMYYSdbHhrEfgw+Q+FUKj8miS2gdnBD1hAWEVD3E=;
 b=UwHniMyTw5sz3NjDCNG9kPco9pDYd9vH03y0X9BUEYZFJ3S6os9KwpwhCyMwM8RrB2
 kCkODzhGsSKM5y1EPWaw7aCZYds0wJo1PXCO49/CPDJhL/Dbap5uH4USKOHpuug14x2l
 M3wxlMkEf2Kpf445ErnSWJTi+jYPcr/qGmdxBI0w6xVbeZZhmNX3VoNXXhyh1TKPUN7C
 dZhhfcIJQoJ2dmgfK/6LtuZHKvy+hULH3c3LsSo0BH9OGT1kZraQfn98YkhnxKCl0DN8
 RzH1iQIA1OrTd8m2TOL/jb3QqGGrUxM0d+jWJw2cB3PcmqKb5b+4tMMpQXPJu+Ay9/FS
 u19w==
X-Gm-Message-State: AOAM531XOme2EIZiHUKyw9j0BiM3baxxlZjVWwnDLsxSQHgGr34FBPG8
 i5+P3IWRTdTLno2HR2Nr7jPGAehltOvZEA==
X-Google-Smtp-Source: ABdhPJyiqLG+JplrlyNivE9cPsI1+Iun3CixsFKP4BQhqYHiHMeS0MKyEtPYoevZ/OWqnE2vC5rDOQ==
X-Received: by 2002:a17:90b:e95:: with SMTP id
 fv21mr19337108pjb.107.1619638455801; 
 Wed, 28 Apr 2021 12:34:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/15] linux-user/s390x: Set psw.mask properly for the
 signal handler
Date: Wed, 28 Apr 2021 12:34:03 -0700
Message-Id: <20210428193408.233706-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that PSW_ADDR_{64,32} are called PSW_MASK_{EA,BA}
in the kernel source.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 64a9eab097..17f617c655 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -162,6 +162,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
+    /* Force default amode and default user address space control. */
+    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
+                  | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
@@ -215,6 +218,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
+    /* Force default amode and default user address space control. */
+    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
+                  | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
-- 
2.25.1


