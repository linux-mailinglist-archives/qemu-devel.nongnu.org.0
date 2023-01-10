Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3E3664AAE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:34:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb6-0003Vz-SE; Tue, 10 Jan 2023 12:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb2-0003Q6-5x
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:36 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIay-0001FA-HB
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:35 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso10710362wmq.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KS77SMPj4oKmkGa5jb8BcpyB1iTizAYKK45SCLEMfy8=;
 b=MSxc2lEm3y/sj0EFcT+UZGb7aRRGFbdfUxSTq98zahaqKi+iB3DdOXE8uRbu7Sbcj6
 d08PlTYHZcc4oEnwPEWNXshy/QPZqqgcEYKIxHelpy7mz7hnqqZDoomZqK6AZuFXBxrS
 eJegnEen1pv1MoSBvNvgG9zobMfNJXWIqiFAGfWQTLLIIiYcqPlA+7qHG2iqcwUZUtTJ
 hnsKQJEIhbsS/G1vFi8uBmx5VFn+YSpb6BdJxJxC+Tv9VsOOMsgUVEtB/yrBxk48PyGT
 g0Zf0OljUxKS470R3Cb+yoldPBUjiAQ97V8ZxX5H3bivl9EaW4ano3s/Dpv/IVgNyqDP
 FtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KS77SMPj4oKmkGa5jb8BcpyB1iTizAYKK45SCLEMfy8=;
 b=6fl5VLA+6I/HZJVd8cMK6nQZpYSkIo8LHFeCo88KF4jgSCxPWrw+VHZxtZ8Ol2cfVw
 tX72CYKm+fFUCPQ5yCP8pEPBxY/2KkUgCD0xbbQcfvXoWRCe2sXCjmzk1ZpxM5FxaA+4
 ZYANghTnJp2yQb2X7sPqVnYq1JsfTC7ljmUZDGMTtLTYeoTqFWwTvx1nP9Xz7Dfunjqb
 ARtauUV+EDUyD92Y3ngqxTd7AK5urP66iQXFqpCUhVdkvDnAR4+TO0rbervt/qEmqHGA
 N0HiAhlXmLAOkmbkjFox+GGqmLHsLDgYWmTz94xq22bWl9CIg81i6sRPAN0XGQlxJeKr
 6tcg==
X-Gm-Message-State: AFqh2kqIa+vTetzXdJPABthDa6h1j6cN+v6nBc90SnQYCanDR5PpSv9Y
 t4+letDj9k2JPJNxbg4WQ3+OoA==
X-Google-Smtp-Source: AMrXdXuC43opkob9bAeEj/9Efdeshe1/3ObQSSwvwoXHrRwm9U/YAPGc0cGCbyCs0NP+KPoF8FARyA==
X-Received: by 2002:a05:600c:4920:b0:3d3:39a9:e659 with SMTP id
 f32-20020a05600c492000b003d339a9e659mr52944263wmp.21.1673372371139; 
 Tue, 10 Jan 2023 09:39:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003cf4eac8e80sm18814426wmm.23.2023.01.10.09.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0BAE1FFC1;
 Tue, 10 Jan 2023 17:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 09/26] docs: drop texinfo options
Date: Tue, 10 Jan 2023 17:39:05 +0000
Message-Id: <20230110173922.265055-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


