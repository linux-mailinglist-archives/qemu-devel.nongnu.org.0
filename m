Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98436C8376
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:39:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pflNN-0002Kc-Jy; Fri, 24 Mar 2023 13:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pflNK-0002Ip-NK
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:38:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pflNI-00085f-00
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:38:49 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso3651729wms.1
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679679526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoiV30Nkpx06vK0UYiymovKzUSWplN8GwM9A5dmvvOQ=;
 b=FLYgNBZd6JwUu9eTEmS7+uuAyXFEyI5xNiV4+BWImxRQdLs1dCwcuMh6pLWpW/444f
 FkDJtsGqLVuopHbKtP1Kn6Ns2YlVNGuqQZ0vOlgidqBKPytO3HI8vbtLJif0VtxtdX/8
 C1ATF9B3bxqELmFCGBC8Jp8Ed2WjmBMexEkr2vr+T6/+bhhvh+3+TEdCL06/3jSaFi1V
 x18ZAqubAoqcZNa8xaV9Gm/YrU5JJJC/Lq1SlrgtE3HvzvCajHJyj6+aAUl/ypBwOIUY
 HNMnIxIXbHiD/rJAFc7wyAfnhUziFaJaEfkG5w4yYwTszwzdGGfoSH1scFdz2eII5UE5
 2ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679679526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZoiV30Nkpx06vK0UYiymovKzUSWplN8GwM9A5dmvvOQ=;
 b=iryvJfsCDtNbAJEaayYl9Soam8rjsCcV1vWmEevyKPpI9rW81q7Snk0ig+e+n560vt
 okkAGu4FndL68clq+O94vTLhjIwnac36SmLcC99ob8rBOeEA18kMtcoGZ7cdNmx/tq1L
 VT4qCIObwqxhB8nALlXQC/wzAzyscB3JGa7uJSuK8zfblecDknpn7B1l4lpvfx/v0vPK
 JZcHJkYZcodzB/KCCKiw9xS05g3bB+CwX+mbgGu1DUNo2SUGDHeYZU/Af+B3hsJAWEB5
 npHFmr5s0++VlHOeP7OF6x5xddsnZYepj0gFLmQBdOCPcPTl3Uxmhoibu9hq5DB3CpOY
 FrPg==
X-Gm-Message-State: AO0yUKXrGdd1v9ltDncfX6RepGKXlMiFqYyrQLXcuznIH707UQNeNnPc
 Ty9GmWhjserGeELe1uDkHu9CJQ==
X-Google-Smtp-Source: AK7set+ZdnH5TECeSK8LbP/gk4fz7ps2hw7mHYYagraWU6yV1uK3DJfwPP0N8NXe8tXd0Yhfb6YWgQ==
X-Received: by 2002:a7b:ce16:0:b0:3ed:9b20:c7c1 with SMTP id
 m22-20020a7bce16000000b003ed9b20c7c1mr2811131wmc.20.1679679526233; 
 Fri, 24 Mar 2023 10:38:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003ede03e4369sm401192wms.33.2023.03.24.10.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 10:38:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 71E2B1FFB7;
 Fri, 24 Mar 2023 17:38:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH] MAINTAINERS: add a section for policy documents
Date: Fri, 24 Mar 2023 17:38:36 +0000
Message-Id: <20230324173836.1821275-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

We don't update these often but if your the sort of person who enjoys
debating and tuning project policies you could now add yourself as a
reviewer here so you don't miss the next debate over tabs vs spaces
;-)

Who's with me?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Kashyap Chamarthy <kchamart@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b56ccdd92..992deb2667 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -64,6 +64,16 @@ L: qemu-devel@nongnu.org
 F: *
 F: */
 
+Project policy and developer guides
+R: Alex Bennée <alex.bennee@linaro.org>
+W: https://www.qemu.org/docs/master/devel/index.html
+S: Odd Fixes
+F: docs/devel/style.rst
+F: docs/devel/code-of-conduct.rst
+F: docs/devel/conflict-resolution.rst
+F: docs/devel/submitting-a-patch.rst
+F: docs/devel/submitting-a-pull-request.rst
+
 Responsible Disclosure, Reporting Security Issues
 -------------------------------------------------
 W: https://wiki.qemu.org/SecurityProcess
-- 
2.39.2


