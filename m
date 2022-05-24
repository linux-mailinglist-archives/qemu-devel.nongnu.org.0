Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8062532E25
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:01:23 +0200 (CEST)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWyI-0000ro-1l
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWen-0004DH-Ul
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWek-0005NG-T4
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id j25so1852119wrb.6
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73P2SMfBOog2gRv6U2nGWjPCxj4E1QB8i6yDPAw1Qyw=;
 b=MFaISvz2azzTtPrFFX4NyGWm4lxgOJI8TFsP2QrvLGim43R53CY5nEq2VdUCImsnK+
 N8C3lXlF3i4Jc/l6OUmKOjvsP/Mw8HZKk3/+YE0q/Chv+5+LdipxRjwIJ07pK5FvDkvP
 YT6PriNhmBkAOrmksjZGQXMlBbxTIFQON+2iHVoGyymIit4jPXZ7AvjHWJ0gex+5E/t8
 j//0JGKiaxv2kd7bJ200gqMG7i/KXDxiakFILYbzpGv3X2NQdWD8BCixaQ/iUWmIgrWI
 xyAPryr+wEfUo/cly5iwpmyfIlmkgeSC4BaZsB1gpB4b6EhfEWXWcHSVHJ3aUjpV5koh
 I26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73P2SMfBOog2gRv6U2nGWjPCxj4E1QB8i6yDPAw1Qyw=;
 b=MWPwf5Gw4N1iha5hcMUzDgAd3yvWO3g4SfnBdq7JdrRMF3Th5q+Cle1LvVT9UCI2fI
 FNoBPgkR1X/6q/DgWzY22kstD/IdsJ1M676z3LYqAL9jr6weNLA6PfEwImhTYRbi1tzl
 zrn6hVgpUVJe3WY1vt9Gsc+VIi+W8F8nHtCQdEPPCtqY4FZGFilff7V1zFAdwGvGrprb
 b71rySnd8FSaG4ogeDcUVqnwxjW/8JEUREyx55cPghtJfOt0zbmFZlGG6V4ef5Sfy5cs
 2w6FreC8sHLbD5pi9IVdgAelKyc2PYZwKPVkug03E4rsOfDG+kHAzL8e2EVEhm9/MQLu
 x0Cg==
X-Gm-Message-State: AOAM532xmwmALpyjjyGOYhFOhmv22KhXHsjLiMMOnqbXlTAr1Y51hD3T
 wtRSYh7RWhQyaU6bqWCrFvDy7g==
X-Google-Smtp-Source: ABdhPJwy0yeYF2denjcj9WMSTOOX6j1AmUsS7LFOB9fbLBnyZ9zxD8dAv79BFTZEm7+/CUGWtGKOtA==
X-Received: by 2002:adf:e791:0:b0:20e:677a:c449 with SMTP id
 n17-20020adfe791000000b0020e677ac449mr23630183wrm.610.1653406869512; 
 Tue, 24 May 2022 08:41:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l24-20020adfa398000000b0020fcaba73bcsm10312496wrb.104.2022.05.24.08.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09B7A1FFBF;
 Tue, 24 May 2022 16:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v2 07/15] tests/qtest: pass stdout/stderr down to subtests
Date: Tue, 24 May 2022 16:40:48 +0100
Message-Id: <20220524154056.2896913-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When trying to work out what the virtio-net-tests where doing it was
hard because the g_test_trap_subprocess redirects all output to
/dev/null. Lift this restriction by using the appropriate flags so you
can see something similar to what the vhost-user-blk tests show when
running.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220407150042.2338562-1-alex.bennee@linaro.org>

---
v2
  - keep dumping of CLI behind the g_test_verbose flag
---
 tests/qtest/qos-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index f97d0a08fd..7e1c8fc579 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -185,7 +185,8 @@ static void run_one_test(const void *arg)
 static void subprocess_run_one_test(const void *arg)
 {
     const gchar *path = arg;
-    g_test_trap_subprocess(path, 0, 0);
+    g_test_trap_subprocess(path, 0,
+                           G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
 }
 
-- 
2.30.2


