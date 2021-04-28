Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E877F36E003
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:57:52 +0200 (CEST)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqJk-0004wV-07
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpxA-00062w-KS
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:32 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwx-0004hn-4h
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:32 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o16so19828288plg.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l7ra7tjj6v+dYlp5urbxYkFtecDFMqZC4ZEp4+L75zo=;
 b=jF1o/Cn6g8VCzBum5GEST1yVDzKT/3JyK+5/1FysoPwoFvugM7OSwuVPiOyXTeHfTW
 ZJNctfFFiQ4D/G5bdtpm4j/D80SjdQpiWnOOE/HYxmqfe9LN/MpoF91RbnjsBSQ5n4T0
 6EeRqADtjuWSTTX8IuY8nJ3tnw1lbwptEUQFwHkETkkuWcEqkB5tVPFODLngRZoT3pYr
 /lxesj/1QDEgqtVIKjDeR2HRUIomQEAXkTqXY8RG59XR1E9OpC+aTv/9TpELFA+noAdU
 lCyPUK80riodLQl1VqU8moLS1Ybf0YU97ayU0IkSNabjS0a8vapMlvY4eVEOI+JCX1IZ
 aOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7ra7tjj6v+dYlp5urbxYkFtecDFMqZC4ZEp4+L75zo=;
 b=gAwYK6qXDam9o8QSJeknV0aLHlVAfkTD+Nug7Il8n8qJ/uNBbCYYc4ay/FmaTFZWt4
 oSS1UlhvAmzkDL5YeWUiXaAc6AQZXYj0EyVhJa9/5zBSZrYlcVaV1rlB6CImrwB2bi20
 TU/VqPKMDFzPXfWbzYKA7X9zjD1YiGj2TFRK3vPSxqaX6xaIqaGPonPjGAHLjJoW7pw/
 R5e8z/TtLouY/LMLCiycoDrfq9xS4+7J5MG05qdbontosqJBxJorqOQ1x8mOEoxtzf4F
 /fSuF7m67ryDrb9VAm3fgId33OmkoLM0pCnAwzwFdM4GemgGGw1PJY3f7MlgmIVjZjnw
 5owQ==
X-Gm-Message-State: AOAM532oXpTMkAZ5B6UPIZt9kFEaKF2nhAnrrUf1QK9A92doHWetsp1b
 bPvsn0LJpIGTEhB5/30MTQTAUv7bPemq/A==
X-Google-Smtp-Source: ABdhPJzSxu/qLK9eaqbMxyhJc4Cgkj2k7w5qwvcIsZrDUM52x36ucQUEUdvgBB0WLeWCA1LZ13WGYA==
X-Received: by 2002:a17:90a:a60b:: with SMTP id
 c11mr34329783pjq.125.1619638457786; 
 Wed, 28 Apr 2021 12:34:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/15] linux-user/s390x: Add build asserts for sigset sizes
Date: Wed, 28 Apr 2021 12:34:06 -0700
Message-Id: <20210428193408.233706-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

At point of usage, it's not immediately obvious that
we don't need a loop to copy these arrays.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 81ba59b46a..839a7ae4b3 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -141,6 +141,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
         return;
     }
 
+    /* Make sure that we're initializing all of oldmask. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(frame->sc.oldmask) != 1);
     __put_user(set->sig[0], &frame->sc.oldmask[0]);
 
     save_sigregs(env, &frame->sregs);
@@ -266,6 +268,9 @@ long do_sigreturn(CPUS390XState *env)
         force_sig(TARGET_SIGSEGV);
         return -TARGET_QEMU_ESIGRETURN;
     }
+
+    /* Make sure that we're initializing all of target_set. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(target_set.sig) != 1);
     __get_user(target_set.sig[0], &frame->sc.oldmask[0]);
 
     target_to_host_sigset_internal(&set, &target_set);
-- 
2.25.1


