Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0869542B303
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:00:12 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUUx-0001ze-JU
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHf-0004Ne-JC
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:23 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHd-0004rc-Sb
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:23 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so1137715pji.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QuBUrcbK5IHnv9/MH2TrxQjSj4HGL7JlA8tE+X8E85A=;
 b=mYtXtChwnidyDxI4ys9d3Xb3PTuFjN+a+uIkfDedrkG3Lq66AdMwU/PCvYPM81dljp
 ONhLos2j27nQhlbnxXq+hNCFjLFxVZF1zosfczieYT9+4JYNfOmkwHycSi+xpITVFQLm
 w+65ra0g2eWPbJs308eeKm1ivCOI4JzNLUFlBfr7T9vc5I2ncJias9ub8xgCsnCzbjt9
 oUjdom8VpBYZfoOeoJGEwRc9eqUPSa5N64M67zDJ/evMDyiy0SpWxg1u9S990hRlOdve
 LhHzbVyoRSdX0yK1ufjhAoGYd6eTchgGe+ZcgQgzaBlEDnpzC/5EsdiaJkYYya8MX1Lu
 nblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuBUrcbK5IHnv9/MH2TrxQjSj4HGL7JlA8tE+X8E85A=;
 b=4fq4ky3zlcbu3UDPgwU3ARSN1d35CWpjTr7kxcwIubJqy53MYPdrJcOfgy8ov/b7G5
 qUYz/6A/syDglYOr1LFzG8A2MXyx7x0Xr8JlouKJFP4ikkyUciGPQShhVkHcprToNhM/
 AU+25b8mK8z9NBS6dorsZOxyyXmYsT896wocaLEz3ta8XM6so5cc0bX4xGViOzGSnxCs
 YYZpO7docdjrsAki/foiCixJ9rmzFucliRfiMQNZtLqmJn30zg2NLBqxkpW3G1N4CFGf
 KXBQ6JFr2RRmwh1JWo7tVJMxnSJ3stYwrXKJdzjtbNgNK6rFRmBu7RZRON3atOyx4tqY
 v0JA==
X-Gm-Message-State: AOAM530g6pnrjYlNmatfNUXWsRnWcq6TAI2dy3gx2jqkI1m18HawDCXy
 LvNLbs23Er1SWBr/yt9SUn8PGYn4K9YGyg==
X-Google-Smtp-Source: ABdhPJxjkP3gGvzXM3IvgYqFNwY9oail1GkZN0fo209ko6sGzmlYqmjxazoZH39YNQn45vloKBwocA==
X-Received: by 2002:a17:90a:b288:: with SMTP id
 c8mr10226282pjr.67.1634093180431; 
 Tue, 12 Oct 2021 19:46:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/48] linux-user/hppa: Remove POWERPC_EXCP_ALIGN handling
Date: Tue, 12 Oct 2021 19:45:30 -0700
Message-Id: <20211013024607.731881-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/cpu_loop.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 840b23736b..483e669300 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -162,14 +162,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "External interrupt while in user mode. "
                       "Aborting\n");
             break;
-        case POWERPC_EXCP_ALIGN:    /* Alignment exception                   */
-            /* XXX: check this */
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->nip;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
         case POWERPC_EXCP_HV_EMU:   /* HV emulation                          */
             /* XXX: check this */
-- 
2.25.1


