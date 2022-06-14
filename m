Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1254A342
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 02:49:44 +0200 (CEST)
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0ukZ-0001B3-DJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 20:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udS-0008Q4-4H
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udP-000524-Hr
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x17so9077773wrg.6
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 17:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q0c1kKvZZ6jdaZbdHgPYukR8D8RtKbZc2WlNf6Bh1Lo=;
 b=L11vzqdvT0ngQIHAZELmxv+GuFcnfbahc9s0cznN34VMBfwHI1tj/Q6sI042YFtTQ4
 vaYe+o6Ravi6mD+cBH0AIdiZ6jc/Nj54SiU/tqA9bkO/6x2bzia8IfMCvXckOEoD0DSf
 +bcpHf7RNGTKYkDaxcML3KthnhGS6PKTEHCNMb8rKc5GznZO4yzosAiA/YgvJzkO95+t
 1HcS/j/QT7TgbJa1bmKERqSjnwr/cZGTMyJu2r1ZOUj+dIhpDfXsQlc1Cr+upk2Af8eZ
 HZW01+2oZoGTe4wzqSNUp2DOUoD2S0tr67kXKn7kEnnnO/pNK5zb6caiCzYOcsunTUOF
 tkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q0c1kKvZZ6jdaZbdHgPYukR8D8RtKbZc2WlNf6Bh1Lo=;
 b=BduMJHTkeYT3hP5g/JTiintBA8wKQ0ujP3x5sXvTEFA/DJnNVqP/LILu48Usg7kqHX
 7TltJFxm4tM6L16QgAc4TxGmsBT/0LgrKsVK3NGacot4oRHii5DPIf8gFFnLUI5an0O2
 F1uvWSSoQUDOcvMuGJOkAZY0YyFCx9wz09ugEhfmPFeeRMC9LLAO1QDRCDzleWk8iCv+
 316sJt7hwRu/d2/n+ZlPQy/RtLiJtp3UP76YakGaBuZsI4AhOZw14jNFXN6XWC/P5fJ6
 PNquvGKXXxtAfokHcv2msET7PfSwrKMMQtCsN62tdU2sWuj0qG95mVq08OiJdzlqytS+
 a30w==
X-Gm-Message-State: AJIora94Kf+Zv9CdFg63tL98XgEF6Ht55GgocREqph6C/fpOXfHhB4k/
 Y7kTAMaVnX/CdDlbB4PoWPvAag==
X-Google-Smtp-Source: AGRyM1vlKxqxz0sy7ruO5KoYywGoIFtTyoaIznguzlyQRSNmHq1I5GTR+ZknzpSrgwxlmRVE6n1j3w==
X-Received: by 2002:adf:f646:0:b0:210:32ea:e679 with SMTP id
 x6-20020adff646000000b0021032eae679mr2041126wrp.395.1655167338784; 
 Mon, 13 Jun 2022 17:42:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a7bc850000000b0039c96b97359sm4398288wml.37.2022.06.13.17.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:42:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 854881FFBE;
 Tue, 14 Jun 2022 01:42:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 6/7] gitlab: compare CIRRUS_nn vars against 'null' not ""
Date: Tue, 14 Jun 2022 01:42:08 +0100
Message-Id: <20220614004209.1970284-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614004209.1970284-1-alex.bennee@linaro.org>
References: <20220614004209.1970284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

The GitLab variable comparisons don't have shell like semantics where
an unset variable compares equal to empty string. We need to explicitly
test against 'null' to detect an unset variable.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220608160651.248781-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220613171258.1905715-7-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index f334f3ded7..69b36c148a 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -13,7 +13,7 @@
     #############################################################
 
     # Cirrus jobs can't run unless the creds / target repo are set
-    - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == "" || $CIRRUS_API_TOKEN == "")'
+    - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == null || $CIRRUS_API_TOKEN == null)'
       when: never
 
     # Publishing jobs should only run on the default branch in upstream
-- 
2.30.2


