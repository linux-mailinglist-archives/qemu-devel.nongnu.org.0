Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471EB457147
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:57:18 +0100 (CET)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5KG-0001gU-VE
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:57:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mo5Eo-00037M-7S
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:51:38 -0500
Received: from [2a00:1450:4864:20::42d] (port=44982
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mo5Em-0006Ft-Fl
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:51:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n29so18547449wra.11
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=szUAPFGBvZnTdl62g3KF4aXspJL5YUpZ4qjN2UnzAC8=;
 b=EFVSHhMKHzX7tbibsT5MAdkOBkz9+rcNYeSZ7XNIa5zFGCzMAfABIW616HRv6mEwZE
 Hn21O3iFR0u/szHUaQcvLXnQT6eNEjdrsHTbpIT6e1AWfRdkfLo3bcDwnqY9LhPClcTN
 GON5J0bmIjs0HpjSOMQq9QdrG/f18LQiiYIXSx8UvHEPR/6Mq5YhpM1WkQRt7k5Qz5Ac
 +op9Ewwdwn7/tnr7WC9LEuM440PfNo7FT+jWauSljm7UZE+tjBGfZNpxuf/w00PiUQgi
 WB9RxepS8eLxRjVPOz04i2/5XrDfGDCnVrgZmBnRYVhUi/LIPu6IS1ckPRPd/NHShrWq
 DfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=szUAPFGBvZnTdl62g3KF4aXspJL5YUpZ4qjN2UnzAC8=;
 b=glstiDY5EibLX9C3Jp0jU81FCIdO5ybi/O84gpIUs91wTw3qUyWziTRh3JIcsGbgZ5
 uPy3rPjiEwizhfFsydKhkui5UwnGbvjD7AV8lkiQ2JqOzNRynId4adIAHutD1NhuqtQf
 1EtigqCYM6wWGvgB5zD7Q2KjUYteMuO8rltzbNTmNumICS6bOzSzDFFK+dqM425JOIA2
 1KJZ1Zjh7a0F0KkxvgKdctIQMn183EavLZt7YiyN7SjcAHVxsgfR4r0n++gti6MjWxQF
 bN2o0wLaeiFwShARGkNPVJUSnAYiFx+0RkmdQFInP8JtKDxHAjtl1WBDvojlQBw4V6HO
 gPeA==
X-Gm-Message-State: AOAM532g8+rPRQkrRCyMNqFDPeP7VfowB7Ltf/igcj1K/ATCt5pMSN5f
 9bE4/0eDhZojrrGvzbJAhuWLsw==
X-Google-Smtp-Source: ABdhPJzugB7rkp/d9DAlQe95IjdWXdZ165xMkECOpafOXnfH+NMY9Aedtll3WlwTHFGJK0nDcjFbvw==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr8277502wrq.354.1637333494737; 
 Fri, 19 Nov 2021 06:51:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u15sm3748122wmq.13.2021.11.19.06.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:51:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E89091FF96;
 Fri, 19 Nov 2021 14:51:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] gdbstub: handle a potentially racing TaskState
Date: Fri, 19 Nov 2021 14:51:24 +0000
Message-Id: <20211119145124.942390-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When dealing with multi-threaded userspace programs there is a race
condition with the addition of cpu->opaque (aka TaskState). This is
due to cpu_copy calling cpu_create which updates the global vCPU list.
However the task state isn't set until later. This shouldn't be a
problem because the new thread can't have executed anything yet but
the gdbstub code does liberally iterate through the CPU list in
various places.

This sticking plaster ensure the not yet fully realized vCPU is given
an pid of -1 which should be enough to ensure it doesn't show up
anywhere else.

In the longer term I think the code that manages the association
between vCPUs and attached GDB processes could do with a clean-up and
re-factor.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/730
---
 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 23baaef40e..141d7bc4ec 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -94,7 +94,7 @@ static inline int cpu_gdb_index(CPUState *cpu)
 {
 #if defined(CONFIG_USER_ONLY)
     TaskState *ts = (TaskState *) cpu->opaque;
-    return ts->ts_tid;
+    return ts ? ts->ts_tid : -1;
 #else
     return cpu->cpu_index + 1;
 #endif
-- 
2.30.2


