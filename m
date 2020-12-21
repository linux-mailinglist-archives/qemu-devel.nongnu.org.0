Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD22DFD15
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:56:23 +0100 (CET)
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMbm-0000fP-6o
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR3-0004p1-Jd
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:20 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQs-0007j9-Mc
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id k10so10101573wmi.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gYspYSdt30DXBHaBvvLQ4na6ygsYl7WA6Nt+loCvfEg=;
 b=ecuEK4db4N/XlKiaf0h3DbkhpZT3LM6mAsdkBRc0O19FMmAirCbxIprJo3lUld4DeH
 9tNa4AGvIbCg+RHx3EKpclCjZqKbpUhfbSg1qDMdheltmjLx3S2NgMpZVFoI8zsds2LG
 eZei5Dfa/C0V7EF9XqDcExDy3ZBMIg3y0SDap6IGP8/uxAHsKR7DZx+vL2ng/iANUTzK
 eVf8XoXVj0K55198cCAEUaODLMUcwANwVwRkgJPcjnw5RuHomm5ZHHSgQ5LyHQDu4zuU
 TRs2AoO+SAGbba+i68ZokYQF3kglTCu0T8Bx9Rr0/TqpQqdRzWVBO6eBx5dpWc/JW9pK
 D1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gYspYSdt30DXBHaBvvLQ4na6ygsYl7WA6Nt+loCvfEg=;
 b=ntrZgwy0XZ+lJ0pvnlQVV+VDpW4NQPGu1XsOcgI8yb7+L7Vy55tsBAFlCcq9uyHwWH
 OA0nccIO4LZV1ibIOdbN2VnpsUHzzqFnR+WeDVpfnIbU5n4N0nWoJwo6Q7fkfCad7YdZ
 5HIrE+BKlc0viWRJ9o7W8wueI4XOViVvFSgG052abMmqlKFfhlzTRag+cfAv9R9uoxOo
 vINzaB4eiQZidLhZUZuzhEDEBmEHrxiTLE7cLS2MS0lsgYqYZb5NObV8EuwhwVlsvo0N
 BAyPpxAXaGBUw9FKnldhKRzeSvzajh6TFTQQRRzsz1T0fu0vPBrzfsrJJOVrQl6xxbnf
 fBmA==
X-Gm-Message-State: AOAM532rJtLfj/TTfTqtACVRx2D6tMnjghfl8bk0IAhZJsPGxKOexvQj
 4uFPrJwOAmoK+dzBSCOu+xihSpK8Yms=
X-Google-Smtp-Source: ABdhPJyltpivtxizSGKFwYdujqjEm9OaM8qcqIozO4NLcTPkKeIXAdZvDxMX1p9RpE5qCXNSiPX30Q==
X-Received: by 2002:a05:600c:25c2:: with SMTP id
 2mr17485130wml.170.1608561905392; 
 Mon, 21 Dec 2020 06:45:05 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/55] check-block: enable iotests with cfi-icall
Date: Mon, 21 Dec 2020 15:44:10 +0100
Message-Id: <20201221144447.26161-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

cfi-icall is a form of Control-Flow Integrity for indirect function
calls implemented by llvm. It is enabled with a -fsanitize flag.

iotests are currently disabled when -fsanitize options is used, with the
exception of SafeStack.

This patch implements a generic filtering mechanism to allow iotests
with a set of known-to-be-safe -fsanitize option. Then marks SafeStack
and the new options used for cfi-icall safe for iotests

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20201204230615.2392-4-dbuono@linux.vnet.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-block.sh | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index f6b1bda7b9..fb4c1baae9 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -21,14 +21,18 @@ if grep -q "CONFIG_GPROF=y" config-host.mak 2>/dev/null ; then
     exit 0
 fi
 
-# Disable tests with any sanitizer except for SafeStack
-CFLAGS=$( grep "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null )
-SANITIZE_FLAGS=""
-#Remove all occurrencies of -fsanitize=safe-stack
-for i in ${CFLAGS}; do
-        if [ "${i}" != "-fsanitize=safe-stack" ]; then
-                SANITIZE_FLAGS="${SANITIZE_FLAGS} ${i}"
+# Disable tests with any sanitizer except for specific ones
+SANITIZE_FLAGS=$( grep "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null )
+ALLOWED_SANITIZE_FLAGS="safe-stack cfi-icall"
+#Remove all occurrencies of allowed Sanitize flags
+for j in ${ALLOWED_SANITIZE_FLAGS}; do
+    TMP_FLAGS=${SANITIZE_FLAGS}
+    SANITIZE_FLAGS=""
+    for i in ${TMP_FLAGS}; do
+        if ! echo ${i} | grep -q "${j}" 2>/dev/null; then
+            SANITIZE_FLAGS="${SANITIZE_FLAGS} ${i}"
         fi
+    done
 done
 if echo ${SANITIZE_FLAGS} | grep -q "\-fsanitize" 2>/dev/null; then
     # Have a sanitize flag that is not allowed, stop
-- 
2.29.2



