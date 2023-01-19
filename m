Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D530767408E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:07:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHG-0003Ne-N6; Thu, 19 Jan 2023 13:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH4-0003Is-En
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH0-00011U-Of
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e3so2637186wru.13
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KS77SMPj4oKmkGa5jb8BcpyB1iTizAYKK45SCLEMfy8=;
 b=uvcmXOWT7cRwqTJdvlzGiiZLZHJ5fMCUbT9Y1uK+MSPObCg45R5VwXxR21666pUV7W
 tc2tmzecoCKu2afCW7vmAKE680/JL7/SZi6wxzaDaf6FI+eBHkyLmtPpnT4peLHVIF14
 Mr80PGon15IH0cslMo4MPRGjBQDDvfvD+0iu3s6OwLoWw2fX+fRMMd1qDgy5PvFsXEDN
 834kaFzBCFM10IR5RxbCqZVyPPfYgMxauLz5AyEki0gGkVNcWI1m9RiUGRMIlP4vf92h
 EkD4/k3nrnU1VmYOwgcKT8Wg5MUil5kvtYL3M/hlCb1xUpe8Grj0pxeO6E3XsDsi8EyX
 ohBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KS77SMPj4oKmkGa5jb8BcpyB1iTizAYKK45SCLEMfy8=;
 b=XLMI3LpXpVXxZdtz25Jlvk9KWt9qqu4J0M6uLwEuR+0duFYA5IloylN4DnMbP8TccK
 CPv170c9gFAu5rXeJ9ZLt9XNv4mnbD3A6fjdWR0Rrm2gYhkZLpbcZ6BoLCfeilpMBmP7
 tjvqSCgxz9CE40PltRqXMRgfFfNRJvWALf/jh6n7hsmV4MXtlbq8ZxEtREAwnbBaA9On
 FDBBn3+YC/ZDCG22rrJhvJUQKwJZzSaFQiFYYhsYtRbofd/WVdRkZwZyQxDAvhCkp4rh
 JRTqBeWb9Zpf1rPsnsAqsVqN/0zuC12VtRI5gEWO9lQhYD2mfF2BZ66wUDhwR1SJFIZ8
 AfLw==
X-Gm-Message-State: AFqh2kpHG3eQEWfIaEivPQfpirsSifzK0TkJanVApRAPtA0RFyvYIG9L
 g1kbeA/LUo6Um58tysbvfYOxMg==
X-Google-Smtp-Source: AMrXdXsM+gZFqKfpEvx8Z41UXque5RWcWYU4E6sKeddoieW/4dZnHT3tJFXdhULcSI6uc/VDpDQyaw==
X-Received: by 2002:a05:6000:689:b0:2bd:ffad:1bce with SMTP id
 bo9-20020a056000068900b002bdffad1bcemr11580952wrb.59.1674151464844; 
 Thu, 19 Jan 2023 10:04:24 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b00268aae5fb5bsm34846300wre.3.2023.01.19.10.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 437551FFC0;
 Thu, 19 Jan 2023 18:04:20 +0000 (GMT)
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
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 08/18] docs: drop texinfo options
Date: Thu, 19 Jan 2023 18:04:09 +0000
Message-Id: <20230119180419.30304-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


