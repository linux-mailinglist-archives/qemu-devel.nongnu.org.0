Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7475A67A0D6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:05:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNcN-0001bs-8R; Tue, 24 Jan 2023 13:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc7-0001VC-IC
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:44 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNbz-00065K-On
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:43 -0500
Received: by mail-wm1-x32f.google.com with SMTP id g10so12107457wmo.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KS77SMPj4oKmkGa5jb8BcpyB1iTizAYKK45SCLEMfy8=;
 b=c/oSE6GrfvxkxwHqz1gbb+Vc00dpK28qiYlwkApq6htOgVoVFvsLNocAlttuNanGcO
 VqnpA0Wr9Lo99XojkylCE8Ov0dyjn7pKeevIL6yGqGEHaJUXwmUR39Xfydh5erKlF1Sz
 UX/BVQpKmyBiPy2iwdyndele5maJ2Xn8mkovQqHk2zrZpusarz9t6d1hmhJBQRPnlXjs
 rSAMmn3ds5tixxgAjAaIgJrg8Cp2Da6DV6RBxTJS7uHw5M52TrY/q8kbcGLq6K5u6+M/
 M5HFxs3WAJVVKXrw+OdT1Gc+epGdHZIMoeTrxlZMtneDQfqt9zImVYBu5kvPDsg6QJKF
 WeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KS77SMPj4oKmkGa5jb8BcpyB1iTizAYKK45SCLEMfy8=;
 b=lJeofoMHNz7d8DQwbBCLLrfEYqQOWXgzuH3nSZ2ZJ75khFXeO8haVk9wClivB+CvWy
 Wi7ycDbFgPDhYxv36JvRijL/rU4UXzkNRfWmQ74jEVRp8+bgwhaI+kX+iHBjlU4FmFNX
 AGmRmgzvcSVYAExwY6LuFY4D7B+Qtk1OEMQI8dauHPO5PxF2lZeLZknjFw/NTDFFZ/ay
 EL97E+rD5yb0afQB89Hu03LCOzFp3A8v1FaPlj8cRLTaH4R6gjbh4zyDbDmpdOlJdhZ+
 /FFzcKE4vj94qsDvp/IDt6Xwz9vII8kUynvaSnQ07o+CfCt/qsQjJ3aQsIwhxtXvRzfd
 atlQ==
X-Gm-Message-State: AFqh2krXnAfaFZIbzHlM8DqLtgJH+j3Qg6DGJxV+ZCswg2pPYPKUKb+i
 TFFuXXOuSsuEutsP5hKH3iZ45w==
X-Google-Smtp-Source: AMrXdXu5Cmp1n7t7/w1kJ6bZRuJUyQ5Cxa4y18r0AI3wvroEEjVw1I0a83aBRnjVOwz58lfeNXO48Q==
X-Received: by 2002:a1c:7414:0:b0:3d9:779e:9788 with SMTP id
 p20-20020a1c7414000000b003d9779e9788mr25718424wmc.37.1674583292963; 
 Tue, 24 Jan 2023 10:01:32 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4150000000b002be2279f100sm2418627wrq.96.2023.01.24.10.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 694371FFC0;
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
Subject: [PATCH v2 08/35] docs: drop texinfo options
Date: Tue, 24 Jan 2023 18:01:00 +0000
Message-Id: <20230124180127.1881110-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It looks like this is no longer wanted, we only build the html output.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230110132700.833690-6-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/conf.py | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index e33cf3d381..73a287a4f2 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -297,19 +297,6 @@
 ]
 man_make_section_directory = False
 
-# -- Options for Texinfo output -------------------------------------------
-
-# Grouping the document tree into Texinfo files. List of tuples
-# (source start file, target name, title, author,
-#  dir menu entry, description, category)
-texinfo_documents = [
-    (master_doc, 'QEMU', u'QEMU Documentation',
-     author, 'QEMU', 'One line description of project.',
-     'Miscellaneous'),
-]
-
-
-
 # We use paths starting from qemu_docdir here so that you can run
 # sphinx-build from anywhere and the kerneldoc extension can still
 # find everything.
-- 
2.34.1


