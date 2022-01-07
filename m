Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08310487E89
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:51:10 +0100 (CET)
Received: from localhost ([::1]:42668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5x8e-0004a2-F2
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:51:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr8-0005H9-Ci
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:02 -0500
Received: from [2607:f8b0:4864:20::629] (port=45974
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr4-0007rB-Qu
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:01 -0500
Received: by mail-pl1-x629.google.com with SMTP id s15so5798903plg.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cnMeOOraRx16biZwob4YbW7EgejpJCPvW6/8VciOXdw=;
 b=kyaRAgQXiyyfIucWjuzbblrCRLD55HuseGXdt4uRjjnbA4m7zeJm9afBwDqu5zz5K2
 WWuDMQySO4d6ax9EdreMzyANaG/WMOkKpp4xkG4gzZ+SAts9cF547/W68DDP3h3471KV
 xCnyyQVXeyG6/u02h1SKLot+Ni1HJqP/jm1Wq47T04Jmhc/lu1UO2YpfxxU3g7XW8eZL
 qEaqgxFvpv4W81nseiq/4hY5VMkY5/96l8EPDNZoFw/PYWF4Qio9APCsMHBmN0tAJdcQ
 s0dvZMYwKjMmwOWpvfAngDHD2LfA59g5HATOsvBDDGKaVvpgxLyjY37i30j1rzjCGQWv
 I5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cnMeOOraRx16biZwob4YbW7EgejpJCPvW6/8VciOXdw=;
 b=wju+2194XV+EgljQFr4m3XKu5FGpgPwLudFzxFUWpMugdaVNOBt1vq1fmKrJmRUoA5
 WLoJMUR0zhtyEzv5mC1Rh9R2sEIp/NQsD/TVaAzKfz2/aYzs4ioohPJtiITnuLwJOLPO
 tR4pyH8VRGyhmwuP/nj0DYnUScwScOYw+wxbOjZg9MqPKvqfCkYMup4ibaHD421nW0X8
 ME7Ov/dlv7M8tRVWUv9uhOuyr4stPBT0jV7PySIN2u1lQsTz2ixNFuZZc1SWctIg6h9o
 ofJy5KxHqhrqA4pY0HcQeC4kLrVLRs3Z6OH1okpQQFPN1dC5ZW3rxd1fAKQ1b8ec/iAa
 P+JA==
X-Gm-Message-State: AOAM533mdrKjGh8FGzVofDkQRDgNCv9ToDfhoFyv5l1srclJWPHisehx
 81FfkUklQ6fv0XOZA5uEBPICWD7xVzdUmQ==
X-Google-Smtp-Source: ABdhPJxvFSTBo+zUVyJY+CIOOoYZayrqPQ6fd3J/jNVt5frpWK5AKR1NxZPYlbYyMQ38LBXfqkQ8hQ==
X-Received: by 2002:a17:90b:1e07:: with SMTP id
 pg7mr17726418pjb.109.1641591177362; 
 Fri, 07 Jan 2022 13:32:57 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/24] linux-user/s390x: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:40 -0800
Message-Id: <20220107213243.212806-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/cpu_loop.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index ad0c3cd263..7901dfe6f5 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -58,7 +58,6 @@ void cpu_loop(CPUS390XState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, n, sig;
-    target_siginfo_t info;
     target_ulong addr;
     abi_long ret;
 
@@ -158,11 +157,7 @@ void cpu_loop(CPUS390XState *env)
              */
             env->psw.addr += env->int_pgm_ilen;
         do_signal:
-            info.si_signo = sig;
-            info.si_errno = 0;
-            info.si_code = n;
-            info._sifields._sigfault._addr = addr;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(sig, n, addr);
             break;
 
         case EXCP_ATOMIC:
-- 
2.25.1


