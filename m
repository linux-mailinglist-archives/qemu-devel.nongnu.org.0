Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5403B67C9D0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:25:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LR-0002Wf-Fz; Thu, 26 Jan 2023 06:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LL-0001tr-BL
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:59 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LJ-0003YR-7R
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so3035211wml.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQnMQzqF2kKBRCOQGOWvpk+nNmjkwpud5iW4vZ0K0N4=;
 b=NpiQlfJxZODD3rSRPel5BmIOnFNRxFn7DQDUfnHPkIPuJQEsCGbs+j0NY+CKzXyHbW
 5QAT/QFh1sjwoyl29dhqUyZQIaCJ0GZgSoDQ9EgZwJ+BSVFz96p2TnXbxFfyFpdy5vNL
 XcUze4Ym+MxxZ+0l3BZBgKvNI89cR6fDdDs78vOINFJdgJjke4zxXKhJkw0fnEDEwVrd
 A3VYQRUToQYWwbbEKzWqJl3br5JdU4zhhmAaPIru0VmJFMAHckXyFlKa/bGJ251WBSgI
 3/0BASV5ZXZjCpvGcNv2qPOovlMVhbD04sFOr1DlulYQESRndiPpjFF2GD1ih10iikGX
 hZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQnMQzqF2kKBRCOQGOWvpk+nNmjkwpud5iW4vZ0K0N4=;
 b=wpTnD4GPlGosGVz3P2bij4kwSWUPs7WwO6Thl5A+HZWw9X002rhBgoI+JWCwuMMSIF
 Lz+pG8cgRdj5Gp0RHFyUm+wJ0GCnJe8ZC2qLibzQOerarJcnhbZUY2jGWDwH8uZQ2LqE
 mWm1Cc1QCpplnmY+fmABEv+AV7tzXwoUMlpArK2BcbpfHrlAnbZ/I2h+TdyDE20MIa79
 opB+HOAzYATiGMLK5OY/RmPbc8h7JiQSxQ5WKgv3wSaebP4igtg6pMY3aQTG2tjbwAtG
 exvu56F+bkERZf/TwTXuLf/xhvy/u/D8xc1ASph9daKsB4XQjasJQc4hWPUEeAiZpeI/
 8edw==
X-Gm-Message-State: AFqh2krMWZlHbUR1lDwcv9QI/DeuJzaQ0i+YzOoB6PHZPzz8KfcUNwc0
 i+jFU0SzjEV2YoZ0tIeiJ7sZ/Q==
X-Google-Smtp-Source: AMrXdXuvgBUXYnmWdDCziezk2/4Z90p79Gk0A2SQ1EP6P1uoNxtOOOpacJyKi9zuDbVMaLgEFiOwDw==
X-Received: by 2002:a05:600c:1d22:b0:3da:f66c:795d with SMTP id
 l34-20020a05600c1d2200b003daf66c795dmr35832248wms.9.1674732176434; 
 Thu, 26 Jan 2023 03:22:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adff005000000b002bddd75a83fsm1073930wro.8.2023.01.26.03.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A4E2C1FFBE;
 Thu, 26 Jan 2023 11:22:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 08/35] docs: drop texinfo options
Date: Thu, 26 Jan 2023 11:22:23 +0000
Message-Id: <20230126112250.2584701-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Message-Id: <20230124180127.1881110-9-alex.bennee@linaro.org>

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


