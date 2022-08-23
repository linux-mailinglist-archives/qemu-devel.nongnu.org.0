Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4CC59E603
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:29:31 +0200 (CEST)
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQVqM-0006ht-EH
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn4-0001yr-Ma
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:06 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn3-0000Rs-1w
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:06 -0400
Received: by mail-wr1-x434.google.com with SMTP id n7so17432616wrv.4
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=txbwSCFAF7nR6j5gec2vODGDsH6fbUsPSo0QWL6oB90=;
 b=GjiN85M+OumKDYa8A9nuh8zv1p39tOEtL67OrILic8bCmfFGNdxGjBrZIrmP71vtVx
 b+T6G9OOPDwo/LB89O10zjTzomZIvEC+yyfIGeKPqZCm52L1kA7kbOc7i8DwzZ6nVTVp
 uV0ZMPNgReFxnoU8cIYtPn61LLWEiDctsK5cNCyu7Bw28CAJccUtZpaekRIw0HlRCK8V
 CxoLlkVnv1WXpWSX/cUjwOgFA1L5DWCfPK/LzYI8NbnjQo3K5WmGquJKnoNuvysiOcdI
 CVQ9vqIbuB6Wmcsj7VH1kRlusbhVrZe7lbwgywxuiGAGsSJAOxIBiXcPzrpZd2d1ZPwR
 uIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=txbwSCFAF7nR6j5gec2vODGDsH6fbUsPSo0QWL6oB90=;
 b=035rZhgfkXQ5FY6TmKG0fJ3MAaSKoUKjMlf/jgizaNzcEXq5Nd6FAYhp6gRJ2cnlxr
 uM+PB/XFpdhtzq04fWCAmoXFNmH3PMaxeDN31HMszwi/4mGXB9JZcYD/w0Jd3ckJCqv1
 TLiuwqoq5c1d4XXuhlcYXo+UJCO6EjtPuND2uJPm0zvG1zMgjYo3L7s9pnIekJUoLDqF
 mEG39YudmtWYoFQiUNqpMea4r7iWz+6HhW/fdmG1vx7rbFZjp3YqOpn0P9If5kC/TB9g
 OX5kJAvuJM8hEkI+y9q6izEOKimRxBelUHPjGlvRlt2j4gJSh5Uor7bfemIGQSdmgaqQ
 Vq1Q==
X-Gm-Message-State: ACgBeo35vA/tRN/33nsBiD7n/CxurFBgvqGsC+eFV5C6v4idMj6sq7Cu
 DPQHE4cus8jSI8cy2oBp9TRzig==
X-Google-Smtp-Source: AA6agR7q1y7Y14MvQW2TcuamEs9dzRnJGpbYh+hsgmh8OkKD9guEsLtyIRXDmlSIt3WNxV+PDbL7Nw==
X-Received: by 2002:a05:6000:242:b0:225:30e0:ced4 with SMTP id
 m2-20020a056000024200b0022530e0ced4mr13633409wrz.114.1661268360422; 
 Tue, 23 Aug 2022 08:26:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0021ea1bcc300sm15025213wrb.56.2022.08.23.08.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 08:25:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A28781FFBA;
 Tue, 23 Aug 2022 16:25:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 2/6] tests/qtest/migration-test: Only wait for serial output
 where migration succeeds
Date: Tue, 23 Aug 2022 16:25:54 +0100
Message-Id: <20220823152558.301624-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220823152558.301624-1-alex.bennee@linaro.org>
References: <20220823152558.301624-1-alex.bennee@linaro.org>
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

From: Thomas Huth <thuth@redhat.com>

Waiting for the serial output can take a couple of seconds - and since
we're doing a lot of migration tests, this time easily sums up to
multiple minutes. But if a test is supposed to fail, it does not make
much sense to wait for the source to be in the right state first, so
we can skip the waiting here. This way we can speed up all tests where
the migration is supposed to fail. In the gitlab-CI gprov-gcov test,
each of the migration-tests now run two minutes faster!

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220819053802.296584-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220822165608.2980552-3-alex.bennee@linaro.org>

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 520a5f917c..7be321b62d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1307,7 +1307,9 @@ static void test_precopy_common(MigrateCommon *args)
     }
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    if (args->result == MIG_TEST_SUCCEED) {
+        wait_for_serial("src_serial");
+    }
 
     if (!args->connect_uri) {
         g_autofree char *local_connect_uri =
-- 
2.30.2


