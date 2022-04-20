Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2F508F86
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:34:36 +0200 (CEST)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF9w-0003UE-0s
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj2-000619-AJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:48 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj0-0001KP-Lh
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:48 -0400
Received: by mail-pg1-x535.google.com with SMTP id r83so2341579pgr.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUqBSat00byLemeTfD7/Iumu+QHfeVxNUfYZbny+2jE=;
 b=prQmANPm6S7etniKW2gdS+qVcyfqxy5syT0HPryuxuPo2TWrYmgADWAWFaUjQoaglu
 XcJwpQRG2td4uLmIsEJX/f51V3y0kN+FihM8sOw3AuAFi8f2dNQQpyB21jt0/yHJW1rs
 PPRqijV4YbtGDb5OdtBseHhBHXwTNtS4q6ts6a4I5RzO583k4NU4SJDxu5LaykLxCgml
 bEdfmDARgBnfjqSan/AiTWCw1XFJw0H1sMhDnZj0Kj6phmZp1484J3GyiYnlFFufNPB9
 JOhm8SCx/pSka8kkKXQNOE6U5CAdvw6oijiXEbYv3512WTVbymZOwwsHdDak1TiwQ9YM
 LOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUqBSat00byLemeTfD7/Iumu+QHfeVxNUfYZbny+2jE=;
 b=vsV0hZaJiOU23mMPkIrzuEOaJ+OldzNap3yrOpwOf3UCzeftIjT8XoMjmfktUeVm/D
 bk0VezMELQ2y03gJxTwWMScHFblwTMBX+VpUXW26LSfqdBGb/RANaYbFDzEJVglRfYif
 hQW6vv2XUl1cHQXUd7o/Z3oAm5YgAsRO9mX3sHSzaxAC2zGDxH2zuW5FCMwM75ZKqkfj
 biltatjprg9EpoAHFw3ol7z29E2hMqrVlnzuPHZzJ+w6JFek0/Z9u0WJqTG+AHCmnEkD
 Rgh3NTGAWXbQCkzMy3W5hhRu7+KDsNu+4o2zdMVzbQWf+GGvReXfCr+nE4+guBMw3XnQ
 J7rg==
X-Gm-Message-State: AOAM531bOdDcs1t6kNVtnkQ64ShYARmHKuEbMgQ7EbUWHlkPpb0WdHwp
 ErrXxrzaQhqCmLr7rcvG60POIPV1+TtVqw==
X-Google-Smtp-Source: ABdhPJwOXHwFI463e9P462OKguM+4MZmZimI96BLcDxC6zvfEJ6QEcwuLCCs+Fo3DXuMpJy6PHZ4Dg==
X-Received: by 2002:a05:6a00:2444:b0:4fd:db81:cbdd with SMTP id
 d4-20020a056a00244400b004fddb81cbddmr24580821pfj.32.1650478005282; 
 Wed, 20 Apr 2022 11:06:45 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/39] include/exec/log: Do not reference QemuLogFile directly
Date: Wed, 20 Apr 2022 11:06:03 -0700
Message-Id: <20220420180618.1183855-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_log_trylock/unlock instead of the raw rcu_read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220417183019.755276-25-richard.henderson@linaro.org>
---
 include/exec/log.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index ad0a40cfeb..4a7375a45f 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -15,15 +15,10 @@
  */
 static inline void log_cpu_state(CPUState *cpu, int flags)
 {
-    QemuLogFile *logfile;
-
-    if (qemu_log_enabled()) {
-        rcu_read_lock();
-        logfile = qatomic_rcu_read(&qemu_logfile);
-        if (logfile) {
-            cpu_dump_state(cpu, logfile->fd, flags);
-        }
-        rcu_read_unlock();
+    FILE *f = qemu_log_trylock();
+    if (f) {
+        cpu_dump_state(cpu, f, flags);
+        qemu_log_unlock(f);
     }
 }
 
-- 
2.34.1


