Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD83D4CC8
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 11:10:17 +0200 (CEST)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7a9I-0005ZD-9Z
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 05:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m7a89-0004ob-Lj
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 05:09:05 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m7a88-0000UK-3O
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 05:09:05 -0400
Received: by mail-ej1-x635.google.com with SMTP id ga41so10412597ejc.10
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EkwdUKgj2Mz1ZLZ2MNRhZ9UMM4ZSQ09/Bhoi9EtkSUE=;
 b=TiOoZXoxXVpEddoX7Svk6Cd7BJ4G9o9bChKGNs7VBMAhB4JkoPOkih1nTIJ0GFQMd9
 AmZr7iNnr0/hHVtlxY3uNt0LX2pL/hKmWDnCPxk+lRENJLa4YlcRLfTS8lQWsZk4UAby
 iDdMrTzQYfQqHkgvfsWJNFosZnd4aVgklB54ozchfHc//QGL3HlkSqOIo54p+szkEqF5
 ffNjY0zcvxLlXY5LvAsa7i7X1NjK+9QYfKMrQ4aJxUfCMww2zYCFAbTBVeIy5sSiUopb
 nJPGaoZKz4IhCDyBQmLHnNlWr4yhBeWy3ve5gj7+0Cq/3miDfzQjCLdgCR/n0L9wPZBs
 OvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EkwdUKgj2Mz1ZLZ2MNRhZ9UMM4ZSQ09/Bhoi9EtkSUE=;
 b=FpnlmF2J2xnUGQz+f++mUqfddA5M9OLANYbxhczDvrsyE5jPulOfwFOZIx0Ffh3Ky7
 e8pnT6KcXY+0kdQiyGOA4uQLI2yTGq1FrQoeswS/BTV63DAjNuSktVMSEax6+1IDE+bh
 frrd+kt/aENfjY0gTZdKmdoP4usNb8xk3txLfqzznogmy8mI2Eioa36/9ruzugqxi4Ds
 B1/PQwMmMAgbsL50MLSOmUMC+v7j7vJQ6G6n3wGFYbmxEkReIDP44sjT1vv6mpla+6jG
 tA8vcypyt1DbmepiT/Qyqbz2wkXN4BSgauk9kTaiDy9vSfNFXUa2e2mJrNDWcuVmQiQT
 z2ug==
X-Gm-Message-State: AOAM532E0PynLHgtfsQCDcjCVCXowPzO5cQvm34baJ56xhtyLC5UPYPA
 gjuo+64D/ajZTUWX5VYL1EQmLZ1hmN4HBQ==
X-Google-Smtp-Source: ABdhPJyRRO5uwDawoiopHJroebq6U0qogsPjSHtiP1HMbvv0Uh518oao/PYCBlnh28gQtsdPhimP5A==
X-Received: by 2002:a17:906:fb12:: with SMTP id
 lz18mr12641086ejb.324.1627204141958; 
 Sun, 25 Jul 2021 02:09:01 -0700 (PDT)
Received: from localhost.localdomain (93-33-124-87.ip44.fastwebnet.it.
 [93.33.124.87])
 by smtp.gmail.com with ESMTPSA id bd24sm3136929edb.56.2021.07.25.02.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 02:09:01 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Added consistency checks for event injection
Date: Sun, 25 Jul 2021 11:08:55 +0200
Message-Id: <20210725090855.19713-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=laramglazier@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VMRUN exits with SVM_EXIT_ERR if either:
 * The event injected has a reserved type.
 * When the event injected is of type 3 (exception), and the vector that
 has been specified does not correspond to an exception.

This does not fix the entire exc_inj test in kvm-unit-tests.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index a61aa23017..70d5c2e35d 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -395,6 +395,9 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
             cpu_loop_exit(cs);
             break;
         case SVM_EVTINJ_TYPE_EXEPT:
+            if (vector == EXCP02_NMI || vector >= 31)  {
+                cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+            }
             cs->exception_index = vector;
             env->error_code = event_inj_err;
             env->exception_is_int = 0;
@@ -410,6 +413,9 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
             qemu_log_mask(CPU_LOG_TB_IN_ASM, "SOFT");
             cpu_loop_exit(cs);
             break;
+        default:
+            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+            break;
         }
         qemu_log_mask(CPU_LOG_TB_IN_ASM, " %#x %#x\n", cs->exception_index,
                       env->error_code);
-- 
2.25.1


