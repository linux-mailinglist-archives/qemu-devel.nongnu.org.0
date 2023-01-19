Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641DF67409D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZOQ-0005vr-Ho; Thu, 19 Jan 2023 13:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZON-0005uu-33
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:03 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZOK-0004JR-6M
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id r9so2687902wrw.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O11vIssB0c/YQGszKfyHBYwLF94tVnKcI4eAkWMf9bM=;
 b=WZWlox0R3p/s7s+bmjW1SNYTCHayfD1vWSS9zyBZMGjR6AGlWDfF/4GbN/f84r3H/K
 RuDV5UKbkl/0Rq87I8FdMWHUI77m4VfkWdd32xOPuk73057G2JmLKKA5/kbu1S2b0qAQ
 NoUZlKrOBB8+oxWshnfpAQwO/uZEwIaGz3G90T2i9Mt6W4gZqrRNem1yfDwdVfD+0yaE
 IDGDUndZ9ZZGGkJPVonMA37HM0JIs5kNgPQlOnqnU7NVz3WFfpwjZuTdPnGwfZQ/9WTT
 YWI8swXdznveB0wF+OrExIotFgUHI3OSem9Yn7to4mJ+tGXrh6WUA7HnLIKbWdYFzHW2
 Yt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O11vIssB0c/YQGszKfyHBYwLF94tVnKcI4eAkWMf9bM=;
 b=fQV7tvBCNKM9kHQIdI6x05q2FzoaR3YLU/QLk3D1Is45WO/xxLY2k3DbNn8FlxfYxu
 ZopEzeSlJV8h7t8jCT4dmklcY50XL/YczFEW1g3Eg4t3KACGeBc8fQ0+SdZwf85oWHOu
 CUZ81z6WofJHkw227YWhTvZren0pofrlfp3zxOmVC3cxQjC0nlRPiva8tOka0d8sLOcE
 Iaj/McNgLQaBbFwRY2Eu9NTHyduQf7HBUpAJI6413BJuYDh+E9JFLWlQ2LIp2EVDty3Y
 71cvbg3xx4rHyXixf4OeVT1QhR6ukB1JgRFhTy2QGQb0gBHgYSHEiAr00pBYt86jxepc
 MayQ==
X-Gm-Message-State: AFqh2ko2YQWXzTvSn2JlkYla2NXITit/yWQXJMjqVx7fHo7rvZqWD0ti
 ms7uKujlXpmJyEMKtAVEJajkgA==
X-Google-Smtp-Source: AMrXdXucyFVqCAzaYQh7MnGH1G8uxXdiowv15g+C46sKZu5KFdV85v6P3nb7mkpWiutd3HmtIbv60Q==
X-Received: by 2002:a5d:4152:0:b0:2a6:37a6:a071 with SMTP id
 c18-20020a5d4152000000b002a637a6a071mr17572019wrq.21.1674151918726; 
 Thu, 19 Jan 2023 10:11:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adffcc6000000b002bbdcd15e44sm30206662wrs.37.2023.01.19.10.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:11:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B0D01FFC6;
 Thu, 19 Jan 2023 18:04:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 16/18] tests/tcg: Use SIGKILL for timeout
Date: Thu, 19 Jan 2023 18:04:17 +0000
Message-Id: <20230119180419.30304-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

linux-user blocks all signals while attempting to handle guest
signals (e.g. ABRT), which means that the default TERM sent by timeout
has no effect -- KILL instead.

When a guest aborts (possible nios2 guest bug), sending SIGABRT to
itself, I have caught one thread waiting in start_exclusive, and all
of the others blocked in exclusive_idle. I look at that and think
there's a bug in our start_exclusive locking, but I can't prove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230117035701.168514-2-richard.henderson@linaro.org>
[AJB: expanded commit message from cover letter]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile.target | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 14bc013181..a3b0aaf8af 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -54,10 +54,10 @@ cc-option = if $(call cc-test, $1); then \
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifeq ($(filter %-softmmu, $(TARGET)),)
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
+run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2 > $1.out, \
 	TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 else
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2, \
+run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2, \
         TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 endif
 
-- 
2.34.1


