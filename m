Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80D039BC97
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:09:44 +0200 (CEST)
Received: from localhost ([::1]:33688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCOF-00017v-LJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8k-0003TB-Mm
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8h-0000DH-In
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id q5so9825067wrm.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HwjS13hI3FClI76JoclT19qTXBq1v/r670a52v458qs=;
 b=wGtFvCu/mJEFs8jdHdb5UJW1O0+frpqTH0dgI5ZU2ZUrJdVQb36LLNss1hTciHhA63
 GMvCx0iB64yVt/oXBPVS5khvecTWwC6wUKn62mjdnmnLSOc8v9bPwTtB87C3ES3YCUrx
 gVVNNehqrfMfSLc8qB5+GM+7hFfLISKeCWeuKOBRuyKIBJFWrGStyI+oL2C6syZNGELc
 AEcPf0goktZ0cActcS3jK1UMq4Ho68WUvApPNl+s16pwlDvDApt/thEqLKrxwCOFysQc
 Hy9kbyN7HowNcsu6Dwc5nwt22Lqzt63q/xFLQGs6nPZTMBv9cQ5SwUv9e22rfwwH1des
 oStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HwjS13hI3FClI76JoclT19qTXBq1v/r670a52v458qs=;
 b=LJ7cNmChfzvedT9JfdnWx/LkJXMtakjUTo5ikrLWqlU8vKcYWBPCheXD3fL1e9SMf8
 uYX9UKBYaFt0Q6WE3b+UiOXSxEH4UMA5ksFg4bPd1Xt5798UDWdyQCxp+v7Zpfws6ukW
 Ztc1f/AvsxjqnSizP6yjRd//pu+IS4/GzjCp4zwACnkissfITnyHnYMBqzvBcf749p/G
 nUJmBXGLCn8TSnlxZqScMaoIowaqjtqs5MHnLxZwUijBzF96jRNr5hMLAcHsQEUtGm4t
 4e5R3q9vRK73IBlI1CLL4MqrURbZHIiGv1mS0JEAQ1TXkaAb7LeUoIQxQUqSl9pu3aCl
 24hg==
X-Gm-Message-State: AOAM530JEY5ZBqF3kLr9dg7OA1dZmzMeDe3pAvUyJAl2F2ki1AGkZIHJ
 Gy174Mjzrq4ER+yOaer4WjSGCw==
X-Google-Smtp-Source: ABdhPJzjepIt/J7YHuqVe79mWTwXeFRfd8c8T7lujXxe5Q6sKu9p+ekkhDZna1cx7Uz4Ti2v362jTQ==
X-Received: by 2002:adf:bc07:: with SMTP id s7mr4668803wrg.301.1622822018180; 
 Fri, 04 Jun 2021 08:53:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x125sm2617808wmg.37.2021.06.04.08.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC58020024;
 Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 97/99] tests/qtest: make xlnx-can-test conditional on
 being configured
Date: Fri,  4 Jun 2021 16:53:10 +0100
Message-Id: <20210604155312.15902-98-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will soon be possible to build an qemu-system-aarch64 system that
doesn't have this.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2c7415d616..772e62920c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -179,11 +179,11 @@ qtests_arm = \
 qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
    'bios-tables-test',
-   'xlnx-can-test',
    'migration-test']
 
 qtests_s390x = \
-- 
2.20.1


