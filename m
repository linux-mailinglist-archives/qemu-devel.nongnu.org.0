Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E9E508FEC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:03:35 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFby-0003oo-OP
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEqq-0008HA-Rs
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:14:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEqp-0002Kh-7F
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:14:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id w4so3353020wrg.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w651074G3f1WZYU3q1ZjQ2Z9Zm2fWDXDBNF64Y1s+1U=;
 b=pna+0FD3xwMGSu9QFpU37exJ6kitznhy+6OMh6dYLh+qSXuJOBstW3ZVQL/hDG6pMX
 7y13ckq8h6R3aJU1vcScWvWVD6T0MkQrUbL/sOk/K8AaBmoovHdQLQVzczJUw4sQcexy
 fFaweJlSn0/3+sdnyLtzn1endute6TdSNzdOq9GIgWR6NrreXSb2/fQfRq4KmwK0/GUu
 CmoNc+Mvyn4C6cHPSXl8TEZTBdD8K6+rrIJf1fjyqGstVh6caFBbWf6JMCmEiDbGU1JP
 eLCRfTxyNXvCSVvtbEhIFDE0Q9aOBZbnjmIBvHfxlOP1ZFr3F5ihtFkLKLkQHd/+kuu6
 8Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w651074G3f1WZYU3q1ZjQ2Z9Zm2fWDXDBNF64Y1s+1U=;
 b=5EAJf5udAghFvu80QULjEmoDTm9DxpWdWRlXanXhtoReCaqSN0GpS7ftjqxc4cohH9
 I21LgEfuO2kmFCDHjy3aqN4+pEwKveiiWY3hig78bQ/O+rNwXNbH2V+NaQbz7r/V4TdR
 iObYYi2vQ6U5VjObr61iWF8dbeKIqJVvBXM/ZjEY7KHdcT3ypx/DD6xxVrnP/vIK8AZ1
 Yh2q1+UmjCcRY+MWKljptaRvPJoprKJHzdcohWsk0KWv2TqIWHtrYrBj5k/W7PlsSkws
 Afzhx2s0gDToU6kXHycVJzhVUF0R04d5cKvx77xZw0CFJZYM9eYybZUNd5DjqEcclDNB
 h4qA==
X-Gm-Message-State: AOAM530f91wiP6LK6AoYquqgcE+QvE/dhmuGWm1CaWq2AhLZEtfpWKvn
 sv6mtc4YNisRQYUbpZ+skdSw/w==
X-Google-Smtp-Source: ABdhPJyrYKnbgQa/W33MqKZruZYWZWwKDmXMjJBNMGw8qAnk17XakWxfhk3VkbWCiWb5CjYAI5xmZw==
X-Received: by 2002:adf:fecb:0:b0:207:a0d9:8c4d with SMTP id
 q11-20020adffecb000000b00207a0d98c4dmr16481421wrs.157.1650478488296; 
 Wed, 20 Apr 2022 11:14:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 10-20020a5d47aa000000b0020a8b965b3dsm610108wrb.14.2022.04.20.11.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:14:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94DA41FFCF;
 Wed, 20 Apr 2022 19:08:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 24/25] target/i386: fix byte swap issue with XMM register access
Date: Wed, 20 Apr 2022 19:08:31 +0100
Message-Id: <20220420180832.3812543-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During the conversion to the gdb_get_reg128 helpers the high and low
parts of the XMM register where inadvertently swapped. This causes
reads of the register to report the incorrect value to gdb.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/971
Fixes: b7b8756a9c (target/i386: use gdb_get_reg helpers)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-stable@nongnu.org
Message-Id: <20220419091020.3008144-25-alex.bennee@linaro.org>

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 098a2ad15a..c3a2cf6f28 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -129,8 +129,8 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         n -= IDX_XMM_REGS;
         if (n < CPU_NB_REGS32 || TARGET_LONG_BITS == 64) {
             return gdb_get_reg128(mem_buf,
-                                  env->xmm_regs[n].ZMM_Q(0),
-                                  env->xmm_regs[n].ZMM_Q(1));
+                                  env->xmm_regs[n].ZMM_Q(1),
+                                  env->xmm_regs[n].ZMM_Q(0));
         }
     } else {
         switch (n) {
-- 
2.30.2


