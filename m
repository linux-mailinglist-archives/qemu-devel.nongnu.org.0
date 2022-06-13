Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D405499AB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:19:23 +0200 (CEST)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0nij-0000zu-Ke
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncn-0001Jz-NI
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:14 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncm-0006xI-8Q
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:13 -0400
Received: by mail-ej1-x631.google.com with SMTP id n10so12428662ejk.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmch1Xztp+sXlhSsR6daB9b/LdHkQtMGhG2GCOi2Ah4=;
 b=dwR82LRBfPWIQ58hVIH7St2nUZUrkZoAN19jd6GaGf6vA0+1pdAeMCmZkIXtXLjDY1
 1oGsCk3YZDdbfJapjKM89Ge/9H895E4gLkIwbcGPJmH025wET6BuH0FSC2BqoCfQv/Tn
 KlOmIyXzcnFDVjPoh+wNWeBckoSCkJu3Tsucw2b0/hBNMgG6wZ4hdBprmGfZzOzfP0Bf
 e5G72RQU4Pb+R8BERPDC2Tmot/mpj2DtnaA23e0N9IvdASGllSiHLIwJwmgXYCIKlx03
 L2mQd+7I2QX+z3DxSKgZS+j54kv3gmJP/fZkD7DoTb1rBY7vx1TuZNCQ2fJ3R4p390TL
 OD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jmch1Xztp+sXlhSsR6daB9b/LdHkQtMGhG2GCOi2Ah4=;
 b=hdcOyKMt7wj/lz0xkC6QIbcUL1cc/XBNwR91OIEUfwVOHDtWR0Ij5FwrXpDiac7u2H
 yBzYw22BTKDZJvRJJnrnok8BT28VI9hiYpAJH6HAMrLSC1as1hZyTDxmFDXS8tkRWzJp
 wHHc775EebNOmew2Qy1mVDQ4GAzY4NZrabuYJvzCm1bQTA+jzvukVHQPcudNW5N4FSo2
 56pecX/Pxn1Gz37jhf5qHbTkjnvpXfrdF1CgFHcKzDvhR2wjTNVPFpOQ50qJHvulgPHQ
 OBb3ljYiSfZ9FTUMVrt/F4O2WW+Sd+7o/zNBaasfxyGsgUhRmqQ6Q1rkAkQwX7JlwCZ6
 04tg==
X-Gm-Message-State: AOAM531pbsfTZQa30dFqklqXAm45oVzrj0dIM0udamhtSys+8tJh2sxW
 b/+Q9hGyYiNucy29qufb8/r0Og==
X-Google-Smtp-Source: ABdhPJyR/7iwUdoZC3NUAPWAiYs5rghQfPhnsqeKrb4pREUdLrn65VvctEiZ3Sh7BKGWt749fgloMw==
X-Received: by 2002:a17:906:74c7:b0:711:fa45:4f88 with SMTP id
 z7-20020a17090674c700b00711fa454f88mr714625ejl.347.1655140390113; 
 Mon, 13 Jun 2022 10:13:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a1709064d9600b00705cd37fd5asm4050405eju.72.2022.06.13.10.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:13:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7AC901FFBE;
 Mon, 13 Jun 2022 18:12:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 6/7] gitlab: compare CIRRUS_nn vars against 'null' not ""
Date: Mon, 13 Jun 2022 18:12:57 +0100
Message-Id: <20220613171258.1905715-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613171258.1905715-1-alex.bennee@linaro.org>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
---
 .gitlab-ci.d/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


