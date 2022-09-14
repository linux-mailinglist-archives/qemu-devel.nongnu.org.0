Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD725B8CA1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:14:26 +0200 (CEST)
Received: from localhost ([::1]:39098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYV1t-0002R6-UU
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnt-0006Rp-Rz
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnr-0002mM-Bc
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso11094449wma.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XT2vSxrm0rHLngSQcFythecX2OgBlSa9qVvKO+2mI4o=;
 b=xyMBXQaAi2b5Q/qmH1Kh5+D/jPXq8r7Frkcca2ZGhy2V2UWC25ycVNTNYY74pY2EA4
 xHWJ6vroeX/uAOkd0yLTQhK/ITnbhYF7PYSyEPRBjA15hWq8es+AmhMVi/vINjdoeplH
 ni6XgOiQQlgVFDiNuC9tTiVOcEULHyoN0QikbSgeaU4KNXaFSLswTjXD9YQkgnWcpqCW
 f4q4MhzqdGpiGIFExUUeWXDZkOmfFXI/zAKcjaXjJvewNneQih4l4hWO2R/QELwbmORT
 ORvtJFkwq1fF67ZMMMa3zjebnBqCsdNNnRkZhF8jKIlTrHPr7FiCBRWnn5lgq5TRV0yI
 ThSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XT2vSxrm0rHLngSQcFythecX2OgBlSa9qVvKO+2mI4o=;
 b=BmbPqi6Na4Y3Q88nzhebbVMJf5PVWjbbldfhYdgU4kRGDec0DfSEL0ds8IHKCAESKE
 6fUseHp6aUFB/52Uw6Q+rLobWXr3yvCJazE1mklb/jIfZcF+Z1lq+8Zr5i7nXqqxRwu7
 uvoalt9cwPfH8ZzXIP2QP3RLZ6pO2o9U62YoCtiRPVe/FYeJ2efr3RhFM70vZWgKkqJf
 WmsT57kcg8zLHgdnF1N2EhD85rZCA5UsfWBa2gu3w3RMv8heMdsaQ3F+we4UEkXOm210
 vHj/c6deTMMY0gjG3h/fyUi7FLeRhnTWRbkbQ5khvCP5RE0W92WS5Up6I0J5Kv3JmMkW
 8nlQ==
X-Gm-Message-State: ACgBeo1WKjq3YwlH/wZr3LPM44/CZ5fxONRyKIbGZ6i3vzILyL6MmGsX
 4DGHCiRKUl+aimzBVTu/iEBh3Q==
X-Google-Smtp-Source: AA6agR7aMVgT4XADv/thicNiZwltKxpu6JhGZamzyp7L2ynBXzpbHNVALQa1aYqPLHihb93x9NMRCg==
X-Received: by 2002:a1c:f008:0:b0:3b4:9afb:7c16 with SMTP id
 a8-20020a1cf008000000b003b49afb7c16mr3629435wmb.44.1663171193844; 
 Wed, 14 Sep 2022 08:59:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b00228dff8d975sm13349019wri.109.2022.09.14.08.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8F301FFBC;
 Wed, 14 Sep 2022 16:59:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH v2 04/30] tests/avocado: add explicit timeout for s390 TCG
 tests
Date: Wed, 14 Sep 2022 16:59:24 +0100
Message-Id: <20220914155950.804707-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't want to rely on the soon to be reduced default time. These
tests are still slow for something we want to run in CI though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 67a24fe51c..4f07c27ac6 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -130,6 +130,8 @@ class BootLinuxS390X(LinuxTest):
     :avocado: tags=arch:s390x
     """
 
+    timeout = 240
+
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_s390_ccw_virtio_tcg(self):
         """
-- 
2.34.1


