Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E520D6EC8C2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:24:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsPW-0007A9-UE; Mon, 24 Apr 2023 05:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPU-00078C-Lk
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:00 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPN-0004l7-W3
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so27504425e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328172; x=1684920172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otnCERiARxYXOemsNhRIhm75Bahsw6pevrZV+yYHYSs=;
 b=fZ1tKN7AopRMvdYhFsS3on9/JutW6D0Z+5zwsY0TDfTv0Bs8HW7BbMG28cgvlGphj6
 qVXtFkQQgY9h/2J47hirzInnIOOjLRS/zejUJuaC14pYsAc9alammyOQDDLhVX1uI730
 o3aGpm6YSq+IXrLpGlvXiq3ykAIUoUQZsANOhK0NqE+LhJUqfnWW3reBM4usuAJVpKfy
 cFvuKq4GvgsIQutwEIU7rfgheoD9ZmpIEVz9k7twM+gi0sW2hYSYUgahuIo4/EWsehAD
 S+JIPgOjFn6UXM1QxASpez75bOyXc7izIK2FQaDuYwUDnSMdu9hzQdbgapA7E9X6Ri1a
 K1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328172; x=1684920172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otnCERiARxYXOemsNhRIhm75Bahsw6pevrZV+yYHYSs=;
 b=QIDmNy+QUbcwiCj0pohwLWuVUJGdsG7SkIeg/xfWem6pvq7YJtMFwKeLcB3qBSYIaX
 02evjFilqyikX9zUofgnvC1FmCE++7nDjINEhYY31SFADcoIRqjJ2iBSM1uedf53tBIk
 RLj4Qb5j3CWcT7TEeRlNrcUzGh/E5RaJMicEzADpUBjOC5VMCADkp0/3HDiTvFN4prtU
 PiRj4vbyf+VXl1BT5P7MHzQAOUQGQwIwTWhtj6UZ9tTeu8TYuhvNhZlJoBXtGvofumxm
 bcICEF6/IBpo64I/irdA5Cm1ZL290lv2GEjCJVayhJHwlLP0Cu71NzbYfWsgGXUbiT7X
 l9aw==
X-Gm-Message-State: AAQBX9f+43tYWZBK0AN2XDQmY6+wOfS/RYguIiG37pRLtYd/CWimrbZC
 OF5oKFplxkWIWpbZs8Z9mHxJ0w==
X-Google-Smtp-Source: AKy350bOcx0s6giNPUAVFoQk1boqvGOYTmHZ0y9XJB3hPpKNCNb/VcQBP8zUkGBuJ7EoN7gVa3+80A==
X-Received: by 2002:a5d:6582:0:b0:2ef:bbe1:5f85 with SMTP id
 q2-20020a5d6582000000b002efbbe15f85mr9057065wru.9.1682328172335; 
 Mon, 24 Apr 2023 02:22:52 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfe947000000b003011baf89b3sm10371203wrn.40.2023.04.24.02.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E53E91FFBC;
 Mon, 24 Apr 2023 10:22:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 04/18] gitlab-ci: Avoid to re-run "configure" in the
 device-crash-test jobs
Date: Mon, 24 Apr 2023 10:22:35 +0100
Message-Id: <20230424092249.58552-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

After "make check-venv" had been added to these jobs, they started
to re-run "configure" each time since our logic in the makefile
thinks that some files are out of date here. Avoid it with the same
trick that we are using in buildtest-template.yml already by disabling
the up-to-date check via NINJA=":".

Fixes: 1d8cf47e5b ("tests: run 'device-crash-test' from tests/venv")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230414145845.456145-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index ba6f551752..333eea9dd3 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -102,7 +102,7 @@ crash-test-debian:
     IMAGE: debian-amd64
   script:
     - cd build
-    - make check-venv
+    - make NINJA=":" check-venv
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
 
 build-system-fedora:
@@ -145,7 +145,7 @@ crash-test-fedora:
     IMAGE: fedora
   script:
     - cd build
-    - make check-venv
+    - make NINJA=":" check-venv
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-ppc
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
 
-- 
2.39.2


