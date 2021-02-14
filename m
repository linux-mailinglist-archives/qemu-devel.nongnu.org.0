Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3731B211
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:44:10 +0100 (CET)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMNN-0001na-0j
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLjP-0001qh-Ky
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:51 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLjK-0004k2-OR
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:47 -0500
Received: by mail-wm1-x331.google.com with SMTP id z63so542794wmg.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nxDyeAiOtIOg4Km2cDeEloX2dq5583+sbAG5kYYYpp4=;
 b=TTE9v9cheqbi2RayUNZBxdQ2jER0Al+UnOiCj1qBGiJ9Nov59nxUfCE0FSBi+nUXST
 5HVuYTvGuxVq05WUh6xRNGMjvEN+Ixp7Cb8BxbfZ+N3P06qHU9Q5AAFlrxHN3a4Ai+hC
 aLSPo/hlLyi7ajF+RYMT2WIr+ydEmJxWTP10KeD59qQw8A+sDKXpYKPFg5DsXsW6E0Un
 LVUiqUojizOVzhRYSU0SUKJGvi5bp3HbD0mu05mQgHzdVaM4UHNmI2zuR6IwvXjPWCLa
 o5VIJAJkclVChLiDYFH+NqXSYpMowvv4ThCLqf/yCu78J75jcNNzQqexUSSQIofMjkNF
 2M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nxDyeAiOtIOg4Km2cDeEloX2dq5583+sbAG5kYYYpp4=;
 b=GrjaGrWxmu1mGFd1JMnlSIVq2X5jRiZoPftLYo6mksRK6GslsiN/wJwQYZG7frAyeY
 7glSW6gZpGm3r6U5yOT/yDqhg53XlXtp1UJm8X4Nv7hEMpcIPuBZafDYxooZvKgnm6bY
 Fc+FYHpRHru5wy0+1H6bfMKU1Iu8sJWQoCSCtyoKf6aej3i6XsDG8QcgSuWH5VeU6Oef
 aw1kHL/u1QDMWOqs+ggkKbIZyG8CWutj+BCO67ewm5gd7lJYRok1l/f2qhYaj3g5W3pk
 7Q0evwBcmoyojmXvgazV+8qtDZyvNhOy6B+1hspe7qTCDg5ifQY/twe7TCQCPPANWvIK
 ZdSg==
X-Gm-Message-State: AOAM532DMzTJftdNPZwu5kHbJUrFH3eUGnZ8U1q73qQDUqv8CZpgAnyN
 6U+cJS8cZNoVFM7PMSl3MxfYqDfSmVk=
X-Google-Smtp-Source: ABdhPJxUclavaG0LtBxINpiDTHxYhynxi+8BK1s32M1v1VN8vz2FcRjWhZiY0rwM+HFp7p9CgdmTRg==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr11012859wmi.69.1613325765349; 
 Sun, 14 Feb 2021 10:02:45 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y15sm20280181wrm.93.2021.02.14.10.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:02:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 42/42] gitlab-ci: Add job to run integration tests for the
 r5900o32el target
Date: Sun, 14 Feb 2021 18:59:12 +0100
Message-Id: <20210214175912.732946-43-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Run some integration tests for the r5900o32el-linux-user target.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7d7559416e3..ba2c9ac0b4d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -634,6 +634,16 @@ build-r5900-user:
     paths:
       - build
 
+acceptance-r5900-user:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-r5900-user
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-- 
2.26.2


