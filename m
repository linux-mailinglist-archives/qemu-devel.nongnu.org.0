Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AAE6137D6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:24:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUiC-0004LJ-It; Mon, 31 Oct 2022 09:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhu-00030k-Lv
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhn-0005OT-4f
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h9so15999331wrt.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baZobELH2M8taPkObe/3HF/fRCV7/Gji1EVnzYPj3qQ=;
 b=xqkvW1DkAVeeqXaODqDx+46P0xzXrzw7o1zKGeZGT7dvHObCwMPR++69hxzS2unzCk
 rbWRmf4e1HNCmMKw8YQUnEWs6wVoiF3BepnYKuIk9NyMZkAvSf61XFgnJtbM5+YmyWkC
 wfspvD649OZWlITCaU6lTdzeXrYAzaj+pJqMMfr8C7YK30bozBhLSTwWRZr3wH2fdJht
 SY7QNnYQtEG2HW3ZiBz1wz+pezWChU6ManfUSvV5EmrMku3RqGd9QkBd0g5nTtNPyPDj
 5WEeTUfYRbNqkXy26QorlB1M0Of3JeQq2cYvBaiIbYGnIiWbwDDUXciAKoaQG228Cy21
 g7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baZobELH2M8taPkObe/3HF/fRCV7/Gji1EVnzYPj3qQ=;
 b=LM5kxduM89i41KRD1vq0JYqag6pwkAa+TJ7Y0sBqAKHsvyo6acHS1+hdkO/EsXOnMB
 gkKByxQjsAk3LPzMK4XOugyXGcc7TB7IsyzNspM7RxESKvApHaMDDQBLpZ/5SPXZy51B
 vS4+uffYpknXBNC/5k8QU2mpnujw2o3Pskot/5naMqur22HPyRLhO0bi0Sb0Smd2Ch42
 9S7qIBBh356mmGWyoacE11Vcs+O0oeDUX619WsFKFJsIwHXqvI/HAMggcD20jbS7E+7a
 CI/ltLwPxWXUnrbvIqALV8jfuWJSU4Ki4peAqzsUJHjDze7M4LHIAew1xED7o2xG5wLf
 gC6w==
X-Gm-Message-State: ACrzQf3VKM7oSoJBqCCk1ZVWHemXjp3xMLwxQaccpm5ZTj7pqQRaXNTn
 TtIWG+tQ+4QjNueeZV6BGt0LIw==
X-Google-Smtp-Source: AMsMyM6XHqYWX84Jq5XRucYA6iyOsFgrcWQsoffETiPs8Z4wjoLYI5EykA1Oc0WaBfLGvnAFLr2zjg==
X-Received: by 2002:a5d:51cb:0:b0:236:6a62:4bc8 with SMTP id
 n11-20020a5d51cb000000b002366a624bc8mr8064730wrv.583.1667222391868; 
 Mon, 31 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n4-20020adfe344000000b002365f326037sm8592334wrj.63.2022.10.31.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BC0A1FFCD;
 Mon, 31 Oct 2022 13:10:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PULL 23/31] tests/tcg: re-enable threadcount for sh4
Date: Mon, 31 Oct 2022 13:10:02 +0000
Message-Id: <20221031131010.682984-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

This test was marked as broken due to bug #856 which was fixed by
ab419fd8a0 (target/sh4: Fix TB_FLAG_UNALIGN). Local testing shows this
is solid now so lets re-enable the test.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20221027183637.2772968-23-alex.bennee@linaro.org>

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 32b019bdf1..47c39a44b6 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -12,9 +12,3 @@ run-signals: signals
 	$(call skip-test, $<, "BROKEN")
 run-plugin-signals-with-%:
 	$(call skip-test, $<, "BROKEN")
-
-# This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
-run-threadcount:
-	$(call skip-test, $<, "BROKEN")
-run-plugin-threadcount-with-%:
-	$(call skip-test, $<, "BROKEN")
-- 
2.34.1


