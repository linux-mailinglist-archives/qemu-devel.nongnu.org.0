Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F2461C99
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:19:01 +0100 (CET)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkIu-0004hE-O5
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:19:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF4-0002UO-Ig
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:02 -0500
Received: from [2a00:1450:4864:20::333] (port=34451
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF2-0001UA-2r
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:02 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so6308984wmi.1
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+l21wdy++j9QmwvxPd2IqpwqliVMr1XUKlqo6h12D4=;
 b=DRQn2yd5NGsW0YIqsADrsxZlhGReayCc+sMSS6Vwo1t4//eNJa6hianzHRF6QSM5E1
 WL7ru5ouYW3EWvHO1pb/yvqP+irqS6dPL4Ji5hXzleecsVFP3j6C5dwn3TXNY17ZwmDu
 v1mHxQaC+/gQTzqt8IVBEgej6r63dWlHJFQoUQVRII5ii+kdFcs81J+/BhWGLuu7z9b2
 LAvhNJ6D6puYt9l0cZyLTEUj/MlsaesM54hHJee1Bpm1l9gZW+DzKczw+dRFqlSSeihX
 2dMw4JilL/87tK+sNnnrh4xho50sQy9BLp8NRnCwrmJBcsAYY5zH09QGq+Yq7m2Q4tTX
 TR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+l21wdy++j9QmwvxPd2IqpwqliVMr1XUKlqo6h12D4=;
 b=IHzeZeLXsbgxFK0808GtSzl1X+R3+kA7Rd7bLxjQCC8pZ4iGIQMsTIimQ9GZn//tGO
 DZBQUlojLziPuYHVWggwbYSHWo08ApMnhhGHfRdGhnMJb67wLoWAXuQ7RDQ9GWX7wk8/
 qFCV9PWRS929Hebx0LiQzOv+eJ+a0xsezUDd+0scIaFwrNjb4nMrBG43zV3bzRVydE+u
 xuzm9SlHizUflTgGLth2+khPvnEcSCfY6LBP2qpS56gTGYhi6GZfeZ1sbru/xvUER4eS
 IWbJb4G3to0j8la2GnnBffYXwgxMJILBzBWpkRBVUOOhNKVXQe9Zr7afJPApXl3Zw33E
 aWew==
X-Gm-Message-State: AOAM533pA90XBPh4ae5D4MpETlODyijJAqeO1KeCPI24xFXaZR2UHYVh
 vdHmQS+3BPtBH9u7uQpquSiZ5Q==
X-Google-Smtp-Source: ABdhPJwQHbevS0FPib5ZdUmWJQn7bZfecONQzInAks6GDe19XFuFhbOaR13amsFD9p7/MjwWhBleQw==
X-Received: by 2002:a1c:a58d:: with SMTP id o135mr37524229wme.93.1638206098815; 
 Mon, 29 Nov 2021 09:14:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t8sm17726614wmq.32.2021.11.29.09.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:14:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38DC01FF9C;
 Mon, 29 Nov 2021 17:14:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	peter.maydell@linaro.org
Subject: [PULL 5/8] gdbstub: handle a potentially racing TaskState
Date: Mon, 29 Nov 2021 17:14:46 +0000
Message-Id: <20211129171449.4176301-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129171449.4176301-1-alex.bennee@linaro.org>
References: <20211129171449.4176301-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/730
Message-Id: <20211129140932.4115115-6-alex.bennee@linaro.org>

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


