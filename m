Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9B488A89
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:26:47 +0100 (CET)
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b1q-0007ZK-UU
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:26:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auw-0005OL-6w
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:38 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=42914
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auu-00076L-Ui
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:37 -0500
Received: by mail-io1-xd2d.google.com with SMTP id o7so14344097ioo.9
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uqy0flKsbKkUSoZqssjXKCl5UFRKmvmV8nOqjaZTBpE=;
 b=b9jx0XmJ9ZNnO8eaGPsQ+8ttWuB4QBKG7lVwSvfXO0WgAjDK1ZZFFYPENYa/tGyVa3
 19Uuw9ZTectCo99hpybcdsjblPgPD3R95Qkyr5sfVdwwOl80fnc9hqC/Ij0JeS3AgU0/
 X++lYVsd1By+uEs1SxkCo21i/hg6GPjUW8EiBsuCm8N3L4YvgzPtgsUkhOAVq9Pb30u/
 kd3SRi9OEgDvgSo1n3z6AZ9weRb4o2KfXPCYeO0WntIupfc88ngASe7SCkFJFXKAchhp
 e+h85I5wOkSRFdEKBHXf/0X+OtAn+zFCV1rl/TfJkeMNV26Pkd1JsinT3tdweLa7NlP9
 +JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqy0flKsbKkUSoZqssjXKCl5UFRKmvmV8nOqjaZTBpE=;
 b=aYpWt0ColynLUzdYHGHYyWl7G0qWca4wZegQvvVfeutMnxfkkPdvMiW1/asrHuEsKD
 BWHSg5L0TRmaRyeQluzY5RbvTx4VXi8JQ87SbDho+hl/fkwCyb66OxSaE5+nvrLgVa8F
 Uvw92Q9bIbl2UWESB6vQ5zRT1DbRgFk/3o/bhvGrSWlwToZuTa5qqPLxjYmN/hoWTIE7
 nHA/it1PeCreUn7ebkHZzGRcc1rBUpHeYTq+JRwiFFuF8Sm7UqkBeMorOz7gX69ESx+q
 O6TZzl6z+KtlVZaXo+hs5bq3+zuFf3anWmPvk8iCKMQj9etu5jKIGh4ku13zDrgVECJO
 zPdw==
X-Gm-Message-State: AOAM532K8pMycuFuWosUf+7P51gTx5gGpD2NJJ9po0EzwvgguVExA9nP
 FUkUUGx3cBGHHRpbfVPbvx4wNy4IhdshMyoT
X-Google-Smtp-Source: ABdhPJzve/tZK3fjbT4Zox+8MplHAElU+jI6lj8ifJ0jox5rVfZqqLIhIRHXccEXtXnoDs3Zobn9TA==
X-Received: by 2002:a05:6602:2ac2:: with SMTP id
 m2mr1222043iov.152.1641745175302; 
 Sun, 09 Jan 2022 08:19:35 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:34 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/30] bsd-user/arm/target_arch_cpu.h: Use force_sig_fault for
 EXCP_UDEF
Date: Sun,  9 Jan 2022 09:19:00 -0700
Message-Id: <20220109161923.85683-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use force_sig_fault to implement unknown opcode. This just uninlines
that function, so simplify things by using it. Fold in EXCP_NOCP and
EXCP_INVSTATE, as is done in linux-user.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 905f13aa1b9..996a361e3fe 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -51,18 +51,12 @@ static inline void target_cpu_loop(CPUARMState *env)
         process_queued_cpu_work(cs);
         switch (trapnr) {
         case EXCP_UDEF:
-            {
-                /* See arm/arm/undefined.c undefinedinstruction(); */
-                info.si_addr = env->regs[15];
-
-                /* illegal instruction */
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPC;
-                queue_signal(env, info.si_signo, &info);
-
-                /* TODO: What about instruction emulation? */
-            }
+        case EXCP_NOCP:
+        case EXCP_INVSTATE:
+            /*
+             * See arm/arm/undefined.c undefinedinstruction();
+             */
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->regs[15]);
             break;
         case EXCP_SWI:
             {
-- 
2.33.1


