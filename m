Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A353AC76
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:08:33 +0200 (CEST)
Received: from localhost ([::1]:46164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSlk-0003aM-NL
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj5-0000r9-G5
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:49 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj3-0004wj-Ol
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:46 -0400
Received: by mail-ej1-x62d.google.com with SMTP id fu3so3885470ejc.7
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pjpFLG6tHPamIBD0PW02KIyxp9DcV2gsGA9WnWVGoZg=;
 b=Dqy0IHSjG2PFgkVMP+ufKDtQjT5ePWVgoSw5dXP81OrvwmjMfQWoEo0NiEmGTPCncY
 iXlcY1wdbkrsCt64BDAcj7Egybz1Mwzg0AfKcLHhdviiWwqE7MlUqX5NCkUY1K60MigU
 vvTsfhDwREarrDwN+sI13EeBrZlOP1rKZqlBaxbjqcrsyvhmwUL81HtGs8QJfw7u7PwA
 ls55y1bKSt+6qm/aaQNYuY7Fy9yo/qf+E35nPe8ktk0iGb7uzqaVWjlB0BwrH7ldiqBw
 ELdi+ViM0HpHw8zzLYjYBVvoPTVeSZemGkUGBi3Fme5TG0lgIOU5/piL7GYloqqdrLUU
 Mwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pjpFLG6tHPamIBD0PW02KIyxp9DcV2gsGA9WnWVGoZg=;
 b=AaVrYCE74ELCLKF1huAhhNJrIyBMjLnl2UOiNZSQjzmUpTFx59Umo9A/us6j46ThL6
 X6ri6jJ+tRHdGkR1lf5ZRm6sTY0t0aWi1acJtJObpMHgEnYFGzqiubLClMpfyyLpLhbu
 WMFTfaHcAEo6HpbfEsLzww0+U71ZoO9N3ePmGNpQZeIZjJtAta/4UnmUvCMtZmybZd5a
 PNovBPXrphj+gvkwTU8Efflm+oG0CsvmWOLPYvnq71JWkIsuzqMWI9Tew6z5N4fSPOF7
 iiLJ17YFhSEiWJS4Xdc+CbEmQNHq2aV7aVk5XUGshW7fIeYeYHMJPXX1m92DoBwGRYS0
 851g==
X-Gm-Message-State: AOAM5310xpgTMFC51ptaguK9WPvPzuDA4EwX70lTQDlI44AYqqRnXaEd
 e9KAteotTZWabEFtOaHn+0C1bw==
X-Google-Smtp-Source: ABdhPJwP0peFCpI8R0j/UFh5GP4cEzIVkrjG6k0gD5ISZOoHRr2vqT5nq+mA3bITM7bB4cwtWA1vnQ==
X-Received: by 2002:a17:907:968e:b0:6f4:d80f:f0c3 with SMTP id
 hd14-20020a170907968e00b006f4d80ff0c3mr644804ejc.145.1654106744157; 
 Wed, 01 Jun 2022 11:05:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bk2-20020a170906b0c200b006fef557bb7asm936976ejb.80.2022.06.01.11.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 061931FFBB;
 Wed,  1 Jun 2022 19:05:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/33] gitlab-ci: add meson JUnit test result into report
Date: Wed,  1 Jun 2022 19:05:07 +0100
Message-Id: <20220601180537.2329566-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This allows the gitlab UI to show the test results in different ways,
see doc:

  https://docs.gitlab.com/ee/ci/unit_test_reports.html#how-it-works

Previous we only reports avocado test results (.avocado_test_job_template),
with this change, the qemu/meson tests are also covered.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220525173411.612224-1-marcandre.lureau@redhat.com>
[AJB: expand the commit description]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220527153603.887929-4-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index dc6d67aacf..b381345dbc 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -44,6 +44,8 @@
     expire_in: 7 days
     paths:
       - build/meson-logs/testlog.txt
+    reports:
+      junit: build/meson-logs/testlog.junit.xml
 
 .avocado_test_job_template:
   extends: .common_test_job_template
-- 
2.30.2


