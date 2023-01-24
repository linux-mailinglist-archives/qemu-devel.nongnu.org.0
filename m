Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6631967A110
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:18:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNr3-0004AE-TR; Tue, 24 Jan 2023 13:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNr0-00040J-Ku
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:17:06 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNqu-00010c-Bs
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:17:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id bk16so14733754wrb.11
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/UyIbw54Jv29a7KUCWJxnQFDE+FNN9JXtEF/gI8c00=;
 b=OJl/dE7rbslOE2S4kw6wE4c4wbJNMh+7/qh44e5tomZE2Cv9IrcLJCIAtDMEL5F0Iw
 jSJuDL40zI7xb6cDxLrGlPGRw6q5ubuOPeNDaY7p/SCSAWIVWbIiL0k2KI8tcpfJS4Kt
 dQ+nsFwwe35dFqIUh9gFxQ+OLd1vUB8pF4q0/aP6Q4D1PDgRwjQhVRc+e+fMbwxyhSKg
 7JFf+O5H610XLNM0pwExFzGizHudhXx8i7qGugIaGH8YovaAeP46A4MxaJgEFxJZehuR
 VEgd7ca/srVssizHb8/74IObwMQXYnncBiQEK20p0rzSnfIIcceoSd/bp4Z9/dzQXVh8
 PdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/UyIbw54Jv29a7KUCWJxnQFDE+FNN9JXtEF/gI8c00=;
 b=WI/gF8FQd3kOqVbe68i/UbJtBTmacSiZilY/wq8FtywujGEKeRrpsVudz4JIlZnNRR
 F3esGVpsO/8rcMhwyGFkskTfG03+jxWS0I/zQuyGZnFaock9zNRGZTnYDuwx0IFZt7bY
 gbc4O6JurwrJLuLi3K0LAxOEXGKn+6e10ioww6RbtPQMYZ7WGEJWElqTavzIwUrWdIbD
 Rn8VwlYvRRgTqQb5GjMYc/UZuMCvUK8TDfAlI3HApMCtxfpq8MiUnlYtMgMSW6lAP6Kt
 rlGgNnodmvhFz/rZwX/vp3k8W8GY3vDPwN1u8vr91fHad2FRQM63j0JtFJ4qKgQHQ8rX
 dg7A==
X-Gm-Message-State: AFqh2krjiYJ+7EvMOZRtKZAp/mguEtuuYG96MUe7zOsh1H/XtOq4Mxar
 TfScyA+FR4l/JVuHiaLaYPxnMg==
X-Google-Smtp-Source: AMrXdXvF4PbzcSRthRL2lSvDqf1jJIDBsEzM9Bve+RJfDWCiUAwL/8W/b6PrWWGVCRGGQqfEWPVl5A==
X-Received: by 2002:a05:6000:16ce:b0:2bd:d9cc:920a with SMTP id
 h14-20020a05600016ce00b002bdd9cc920amr31023317wrf.45.1674584217417; 
 Tue, 24 Jan 2023 10:16:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n21-20020adf8b15000000b0028965dc7c6bsm2365227wra.73.2023.01.24.10.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:16:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D2EF1FFC5;
 Tue, 24 Jan 2023 18:01:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 15/35] tests/tcg: skip the vma-pthread test on CI
Date: Tue, 24 Jan 2023 18:01:07 +0000
Message-Id: <20230124180127.1881110-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


