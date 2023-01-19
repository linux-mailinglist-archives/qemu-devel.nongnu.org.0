Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0966740A1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZOO-0005uw-Ps; Thu, 19 Jan 2023 13:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZOL-0005ud-S4
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:01 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZOI-0004HM-7H
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:01 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q10so2701063wrs.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0FrZ6m+/DDXlf1KBSDr4ILm73xZLFUqafMmPw3ilEY=;
 b=kxzb4qdUHGlACLRdMddcD09zO033jrQbHucuHZvR+BmQEzP+dWMD5eZ8yeEuoqEUpy
 e7xyAYJlfn/hRMVZ2LhURTajUsnVNgS5hSZzzTcbV5+PeLTc+r7TCSOyS5txT+F/Pqzl
 ZD45tjZWHil7mJzsoYMnwb1ZekOU6nNweErITFN8DwW6bEsYonm+OP7oQzp8njuPNreb
 9kZasjG0eDYbwMvfD99nzaAEvUHfilGuFBIvjH3f78eU1/HNytQRlipTmfR/9K3+6tlE
 ZAjNx1MP+otqHTJoUZjrFefvwE6ZbSKiVc835wpM8ojjvpbAFG7SfHVKA/h9MurIIxPo
 5aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0FrZ6m+/DDXlf1KBSDr4ILm73xZLFUqafMmPw3ilEY=;
 b=3Hif77ZGO56LELC+DHLWM3cqA1xghszdBgg6viGfnXCpAEZvgbbTWnk/7+SJj2MKDa
 eiTMJFcs2nCurGCHm4d1x71nAuDLSK4BCXNLEwGOnLwHda3+66La0ytrLohNsAy9QDdx
 nVq87D2PXUMk8W6KsSzY9dsDxpxYOhA9rtAJ7+TTwng6luEyn3jAa13VapATH+OW2rzb
 y2jrXLEL2gb7C77nrBNViRBNlqgZ5GFe+lVmSn9n15PSHTuRQ152ShzqSKnn4sH2cbmT
 VqzLzEFXNHlvZdM6XQHjDV5bYx3a7ihZDg+O3eKXfP3Ospgheez6RjPQ6xm3Y0qDUiBM
 6XAg==
X-Gm-Message-State: AFqh2koE6ubht2RzLF30HlCUVoU8oEkPeTfY//DzMUYVpG1tUmwtVO82
 dr8z0KGbJScaHYNzqOUIw1sV+w==
X-Google-Smtp-Source: AMrXdXs4W4MEuiuQf0iGanrxHZvQhh+TvB1uhRJT4xzTE9PmpAO6L8iNWP8ugJgDbYq8wbmkPZDXBQ==
X-Received: by 2002:a5d:5b0e:0:b0:2bb:e9e6:ac26 with SMTP id
 bx14-20020a5d5b0e000000b002bbe9e6ac26mr11656342wrb.57.1674151916509; 
 Thu, 19 Jan 2023 10:11:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfe9c5000000b002238ea5750csm19848704wrn.72.2023.01.19.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:11:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62F821FFC5;
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
Subject: [PATCH 15/18] tests/tcg: skip the vma-pthread test on CI
Date: Thu, 19 Jan 2023 18:04:16 +0000
Message-Id: <20230119180419.30304-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

We are getting a lot of failures that are not related to changes so
this could be a flaky test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/Makefile.target | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index e7213af492..ae8b3d7268 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -42,6 +42,15 @@ munmap-pthread: LDFLAGS+=-pthread
 vma-pthread: CFLAGS+=-pthread
 vma-pthread: LDFLAGS+=-pthread
 
+# The vma-pthread seems very sensitive on gitlab and we currently
+# don't know if its exposing a real bug or the test is flaky.
+ifneq ($(GITLAB_CI),)
+run-vma-pthread: vma-pthread
+	$(call skip-test, $<, "flaky on CI?")
+run-plugin-vma-pthread-with-%: vma-pthread
+	$(call skip-test, $<, "flaky on CI?")
+endif
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
-- 
2.34.1


