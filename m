Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA64A4A0497
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:51:19 +0100 (CET)
Received: from localhost ([::1]:42446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDb1S-0002kt-Oo
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf9-0000RS-OR
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:15 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=40851
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf8-0001ZZ-0O
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:15 -0500
Received: by mail-io1-xd2a.google.com with SMTP id d188so9675804iof.7
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WzkIKVsgbL3BkTFsfAwelEbf+OyNiGDSqNoHVUm1RWE=;
 b=27G8bB0YIjGVrKBfMwY4oJ0vdwIkw9oQF8IAfEAi6BGxS8b5M7cmdxsWT+71l7TC2E
 pZ/EHyS8YB0v6CITgmmtLzkKL8qoiXCbmzZtuE4G4SUIjwuL81ikhbiY554P1JjRG2uO
 N+yK/dBEab6B+Yw1mtsS+FikraCdOJNzZHL9bSTObsCEQmcvPSFJcBXB19EI7SjnJpVy
 xVwUrd7YpghutUoh0nUrwUMTgmblOZYqUbHOYc9TjbzcOMbLkaqbYyQu+Ajln3LuWxd5
 ckUUS4LPwPTHUQorDOhAOO7gk3QmmVer0TtDW4p916aQ5itw2qXCFfdE36K4SpfNgFvv
 P4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WzkIKVsgbL3BkTFsfAwelEbf+OyNiGDSqNoHVUm1RWE=;
 b=PWWKPiZxNT3z8j0yfyEMA9D/WkJpoiZsyBqZaPCjqwi00B40ibxWygJszrhOOk669h
 AIhaaDwPavYTj3azgqZQSKTJwjGTjBuqvpadsQHxqqJG0NXjkYaOfKVE5vaxi94vzgKg
 x9nL48eb6hTzorniu9ExcTGXn+3+ZXxtQmnw9Nwal28qo/7GwqqGK3PWQ4uPQj5gVQtf
 cIRzpOacRITnLBoyO1IhapWxs6mNgFXz6a4QF8tbaE8Kia+86ZGxnbPIVPdOSwz1mJqh
 IOVWL5TRLbBVf98yk3elFQFxVyUljRoVucEuWPB7ROnfcs9GniVuE49X6GKDxAf70W3J
 ZPJA==
X-Gm-Message-State: AOAM532b7ZWzuRXhKaLxvMl68cxFsRXODZuW5XTq1JzBOxnLfaQWKsos
 VKfOH98CxDSGx67mKZy1ulwi4jfEhkJj8w==
X-Google-Smtp-Source: ABdhPJyxHXuleZSh+P15PraIDHtKIlV3QF1qUEjp5hYsmkPU06tHzPXgdFLnuIFAViAKPoWW8N6cxw==
X-Received: by 2002:a02:c944:: with SMTP id u4mr6342350jao.42.1643412492833;
 Fri, 28 Jan 2022 15:28:12 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:12 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/40] bsd-user/signal.c: implement cpu_loop_exit_sigbus
Date: Fri, 28 Jan 2022 16:27:36 -0700
Message-Id: <20220128232805.86191-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First attempt at implementing cpu_loop_exit_sigbus, mostly copied from
linux-user version of this function.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 12de0e2dea4..844dfa19095 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -80,7 +80,13 @@ void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
 void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
                           MMUAccessType access_type, uintptr_t ra)
 {
-    qemu_log_mask(LOG_UNIMP, "No signal support for SIGBUS\n");
-    /* unreachable */
-    abort();
+    const struct TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+
+    if (tcg_ops->record_sigbus) {
+        tcg_ops->record_sigbus(cpu, addr, access_type, ra);
+    }
+
+    force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);
+    cpu->exception_index = EXCP_INTERRUPT;
+    cpu_loop_exit_restore(cpu, ra);
 }
-- 
2.33.1


