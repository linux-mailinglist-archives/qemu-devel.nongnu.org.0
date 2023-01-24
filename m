Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8346C67A0CB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:03:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNcV-0001fd-EZ; Tue, 24 Jan 2023 13:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc8-0001Vd-RD
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:45 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNbz-000658-Pj
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:44 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so11597601wmq.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EduU7oyQ6B1wSk7o4iq1oV+aNe30CeGVDzVVE6Byo1U=;
 b=th3BYAJbe6fYKeL2p55WJDd6CRlD3ezY4JD7qmfPdLUGUvecTJVHWNOcH3gTdg58Gx
 Xv6QW95d9MgQegAk2d+Zj5WB6cum2FI/rGyGVXgm2q/WXQ5yQYQRSqLTkxpajRDJnxPo
 AiB3RYI92+lLbPB5LOdSs9xRvq9i3acVVst2J4xTcAmBmNLThJOH6HLlWhkDqnzjfJjG
 Nfjl98PV34LPKyLpdRqq5+jOJbJK3PLgXywRIG+q+qASvZGg/NuiYRoULRsUP+bn3sXk
 37nQ5ypyVg9+KRbyB+NZX3m4V1Jk202ZXYG1CsfCFmQO6se8yk4qayBUpaMafvTQs53a
 70Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EduU7oyQ6B1wSk7o4iq1oV+aNe30CeGVDzVVE6Byo1U=;
 b=VxxQ8wOxeD2/vgLDTyx0e4x5SYGl54fZjhUMlqlpKpDQjVL24dp2oVWfKKYLEzvYAp
 ynnBoLw3hxKKQT9bs8d8d0fjHMUYU4/qqilPyMxjujfkIc3VyEDlu2sLAYBmNos7gsvs
 skKkhxTSiHRl1VuhM+oqtq1ux5R3froo7S9ki9dqo8+LSLlr9Kw7cCqgirA+IzdarCU5
 VjRGrqbDd7mCJm30uuZf5zEdrFDL7qoZK3qj72p+O6JWyzzkCgwh24ASQm5TtRzwZ9Sb
 kq98KkWO4hthbctVnC8hS+4u2tAIs7BjO+benh2aHMwDuIbB4Pme4Vn84YWiJ8XF+pKk
 JPBw==
X-Gm-Message-State: AFqh2kqDp3go4UCqcSXRga/EjNkHocSMVAZbPL8ISg3n65vYS0Lav8cB
 quIgNvb6NMU5BxCTYWXJLQMccQ==
X-Google-Smtp-Source: AMrXdXs2cIu/rIm7JlnxNrfbSjyxf4NPMgU2sF5jxGPsGJzjBAwtZj4zU78feqsIKjK0nZ3vt/EtQA==
X-Received: by 2002:a05:600c:1c9c:b0:3d3:49db:9b25 with SMTP id
 k28-20020a05600c1c9c00b003d349db9b25mr25907435wms.26.1674583292242; 
 Tue, 24 Jan 2023 10:01:32 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c435200b003db06224953sm2876741wme.41.2023.01.24.10.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51C8D1FFBF;
 Tue, 24 Jan 2023 18:01:28 +0000 (GMT)
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
Subject: [PATCH v2 07/35] meson: replace Perl usage with Python
Date: Tue, 24 Jan 2023 18:00:59 +0000
Message-Id: <20230124180127.1881110-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's try to remove Perl usage during build time.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230110132700.833690-5-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qapi-schema/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 9dfe98bc9a..d85b14f28c 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -259,22 +259,23 @@ if build_docs
   # Fix possible inconsistency in line endings in generated output and
   # in the golden reference (which could otherwise cause test failures
   # on Windows hosts). Unfortunately diff --strip-trailing-cr
-  # is GNU-diff only. The odd-looking perl is because we must avoid
+  # is GNU-diff only. The odd-looking python is because we must avoid
   # using an explicit '\' character in the command arguments to
   # a custom_target(), as Meson will unhelpfully replace it with a '/'
   # (https://github.com/mesonbuild/meson/issues/1564)
+  remove_cr = [python, '-c', 'import sys;[sys.stdout.write(line.replace(chr(13), "")) for line in sys.stdin]']
   qapi_doc_out_nocr = custom_target('QAPI rST doc newline-sanitized',
                                     output: ['doc-good.txt.nocr'],
                                     input: qapi_doc_out[0],
                                     build_by_default: true,
-                                    command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                    command: [remove_cr, '@INPUT@'],
                                     capture: true)
 
   qapi_doc_ref_nocr = custom_target('QAPI rST doc reference newline-sanitized',
                                     output: ['doc-good.ref.nocr'],
                                     input: files('doc-good.txt'),
                                     build_by_default: true,
-                                    command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                    command: [remove_cr, '@INPUT@'],
                                     capture: true)
 
   test('QAPI rST doc', diff, args: ['-u', qapi_doc_ref_nocr[0], qapi_doc_out_nocr[0]],
-- 
2.34.1


